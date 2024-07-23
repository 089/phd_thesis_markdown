PY=python
PANDOC=pandoc

# BASEDIR ends with "/"
BASEDIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
INPUTDIR=${BASEDIR}source
OUTPUTDIR=${BASEDIR}output
TEMPLATEDIR=${INPUTDIR}/templates
STYLEDIR=${BASEDIR}style
SCRATCHDIR=${BASEDIR}/scratch

BIBFILE=${INPUTDIR}/references.bib

DOCNAME=thesis
NOW=$(shell date +%Y-%m-%d+%H%M%S)

help:
	@echo ''
	@echo 'Makefile for the Markdown ${DOCNAME}'
	@echo ''
	@echo 'Usage:'
	@echo '   make install                     install pandoc plugins'
	@echo '   make html                        generate a web version'
	@echo '   make pdf                         generate a PDF file'
	@echo '   make docx                        generate a Docx file'
	@echo '   make tex                         generate a Latex file'
	@echo ''
	@echo ''
	@echo 'get local templates with: pandoc -D latex/html/etc'
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates'

ifeq (${OS},Windows_NT) 
	detected_OS=Windows
else
	detected_OS=$(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

UNAME := $(shell uname)
ifeq (${UNAME}, Linux)
install:
	bash ${BASEDIR}/install_linux.sh
else ifeq ($(shell uname), Darwin)
install:
	bash ${BASEDIR}/install_mac.sh
endif


# convert dia files to png automatically
# use the filename with the extension .png in your markdown text/code
dia:
	cd ${INPUTDIR}/figures/dia/ && dia -t png *.dia


convert: dia


pdf: convert
	pandoc  \
		--output "${OUTPUTDIR}/${DOCNAME}.pdf" \
		--template="${STYLEDIR}/template.tex" \
		--include-in-header="${STYLEDIR}/preamble.tex" \
		--variable=fontsize:12pt \
		--variable=papersize:a4paper \
		--variable=documentclass:report \
		--variable=lang:de \
		--pdf-engine=xelatex \
		"${INPUTDIR}"/*.md \
		"${INPUTDIR}/metadata.yml" \
		--lua-filter=filters/figure-short-captions.lua \
		--lua-filter=filters/table-short-captions.lua \
		--filter=pandoc-crossref \
		--bibliography="${BIBFILE}" \
		--citeproc \
		--csl="${STYLEDIR}/ref_format.csl" \
		--number-sections \
		--verbose \
		2>pandoc.pdf.log

tex: convert
	pandoc  \
		--output "${OUTPUTDIR}/${DOCNAME}.tex" \
		--template="${STYLEDIR}/template.tex" \
		--include-in-header="${STYLEDIR}/preamble.tex" \
		--variable=fontsize:12pt \
		--variable=papersize:a4paper \
		--variable=documentclass:report \
		--variable=lang:de \
		--pdf-engine=xelatex \
		"${INPUTDIR}"/*.md \
		"${INPUTDIR}/metadata.yml" \
		--lua-filter=filters/figure-short-captions.lua \
		--lua-filter=filters/table-short-captions.lua \
		--filter=pandoc-crossref \
		--bibliography="${BIBFILE}" \
		--citeproc \
		--csl="${STYLEDIR}/ref_format.csl" \
		--number-sections \
		--verbose \
		2>pandoc.tex.log

html: convert
	pandoc  \
		--output "${OUTPUTDIR}/${DOCNAME}.html" \
		--template="${STYLEDIR}/template.html" \
		--include-in-header="${STYLEDIR}/style.css" \
		--variable=lang:de \
		--toc \
		"${INPUTDIR}"/*.md \
		"${INPUTDIR}/metadata.yml" \
		--lua-filter=filters/figure-short-captions.lua \
		--lua-filter=filters/table-short-captions.lua \
		--filter=pandoc-crossref \
		--bibliography="${BIBFILE}" \
		--citeproc \
		--csl="${STYLEDIR}/ref_format.csl" \
		--number-sections \
		--verbose \
		2>pandoc.html.log
	rm -rf "${OUTPUTDIR}/source"
	mkdir "${OUTPUTDIR}/source"
	cp -r "${INPUTDIR}/figures" "${OUTPUTDIR}/source/figures"

docx: convert
	pandoc  \
		--output "${OUTPUTDIR}/${DOCNAME}.docx" \
		--variable=lang:de \
		--toc \
		"${INPUTDIR}"/*.md \
		"${INPUTDIR}/metadata.yml" \
		--lua-filter=filters/figure-short-captions.lua \
		--lua-filter=filters/table-short-captions.lua \
		--filter=pandoc-crossref \
		--bibliography="${BIBFILE}" \
		--citeproc \
		--csl="${STYLEDIR}/ref_format.csl" \
		--number-sections \
		--verbose \
		2>pandoc.docx.log


epub: convert
	pandoc  \
		--output "${OUTPUTDIR}/${DOCNAME}.html" \
		--template="${STYLEDIR}/template-default.epub3" \
		--variable=lang:de \
		--toc \
		"${INPUTDIR}"/*.md \
		"${INPUTDIR}/metadata.yml" \
		--lua-filter=filters/figure-short-captions.lua \
		--lua-filter=filters/table-short-captions.lua \
		--filter=pandoc-crossref \
		--bibliography="${BIBFILE}" \
		--citeproc \
		--csl="${STYLEDIR}/ref_format.csl" \
		--number-sections \
		--css "${STYLEDIR}/epub-mobileread.css" \
		--epub-cover-image="${STYLEDIR}/cover.png" \
		--verbose \
		2>pandoc.epub.log
	rm -rf "${OUTPUTDIR}/source"
	mkdir "${OUTPUTDIR}/source"
	cp -r "${INPUTDIR}/figures" "${OUTPUTDIR}/source/figures"


all: pdf tex html docx epub


# copies the current version of your thesis in different file formats
# to your server (e.g. www.uberspace.de)
# * pdf
# * epub
# * html including figures using rsync
upload: pdf epub html
	scp "${OUTPUTDIR}/${DOCNAME}.pdf" "username@server.de:/thesis/${NOW}_${DOCNAME}.pdf"
	scp "${OUTPUTDIR}/${DOCNAME}.epub" "username@server.de:/thesis/${NOW}_${DOCNAME}.epub"
	scp "${OUTPUTDIR}/${DOCNAME}.html" "username@server.de:/thesis/${NOW}_${DOCNAME}.html"
	rsync -rtvhze ssh output/source username@server.de:/thesis/

.PHONY: help pdf docx html tex epub upload

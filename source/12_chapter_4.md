# Untersuchung mit Abbildung {#sec:research-figure}

## Einleitung

Das ist die Einleitung. Sed vulputate tortor at nisl blandit interdum. Cras sagittis massa ex, quis eleifend purus condimentum congue. Maecenas tristique, justo vitae efficitur mollis, mi nulla varius elit, in consequat ligula nulla ut augue. Phasellus diam sapien, placerat sit amet tempor non, lobortis tempus ante.

## Methode

Donec imperdiet, lectus vestibulum sagittis tempus, turpis dolor euismod justo, vel tempus neque libero sit amet tortor. Nam cursus commodo tincidunt.

### Unterabschnitt 1

Das ist der erste Teil der Methodik. Duis tempor sapien sed tellus ultrices blandit. Sed porta mauris tortor, eu vulputate arcu dapibus ac. Curabitur sodales at felis efficitur sollicitudin. Quisque at neque sollicitudin, mollis arcu vitae, faucibus tellus.

### Unterabschnitt 2

Das ist der zweite Teil der Methodik. Sed ut ipsum ultrices, interdum ipsum vel, lobortis diam. Curabitur sit amet massa quis tortor molestie dapibus a at libero. Mauris mollis magna quis ante vulputate consequat. Integer leo turpis, suscipit ac venenatis pellentesque, efficitur non sem. Pellentesque eget vulputate turpis. Etiam id nibh at elit fermentum interdum.

<!--
Kommentare können so hinzugefügt werden.
-->

## Ergebnisse

Das sind die Ergebnisse. In vitae odio at libero elementum fermentum vel iaculis enim. Nullam finibus sapien in congue condimentum. Curabitur et ligula et ipsum mollis fringilla.

## Auseinandersetzung

<!--
Figures can be either referenced using @fig:mylabel. See https://lierdakil.github.io/pandoc-crossref/
-->

Abbildung @fig:my_fig zeigt wie man eine Abbildung einfügen kann. Donec ut lacinia nibh. Nam tincidunt augue et tristique cursus. Vestibulum sagittis odio nisl, a malesuada turpis blandit quis. Cras ultrices metus tempor laoreet sodales. Nam molestie ipsum ac imperdiet laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.

<!--
Bilder können mit der folgenden Syntax eingefügt werden:
![main_text_caption](source/figures/my_image.pdf ){#fig:mylabel width=50% short-caption="short caption"}

Details zu den Attributen wie width und height gibt es unter:
http://pandoc.org/MANUAL.html#extension-link_attributes
-->

![In den Medien werden für Hacker häufig Symbolbilder wie dieses verwendet. Foto: [pixabay.com](https://pixabay.com/photo-2883632/), Nutzer: [geralt](https://pixabay.com/de/users/geralt-9301/) Lizenz: [Creative Commons CC0](https://creativecommons.org/publicdomain/zero/1.0/deed.de) \label{mein_label}](source/figures/beispielbild.jpg){#fig:my_fig width=100% short-caption="Figure short caption"}

## Schlussfolgerung

Das ist die Schlussfolgerung des Kapitels. Quisque nec purus a quam consectetur volutpat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In lorem justo, convallis quis lacinia eget, laoreet eu metus. Fusce blandit tellus tellus. Curabitur nec cursus odio. Quisque tristique eros nulla, vitae finibus lorem aliquam quis. Interdum et malesuada fames ac ante ipsum primis in faucibus.

<!--
Below is an example that does not utilize the shortcaption feature, as it already fits neatly on a line. Note that multiple file formats are acceptable for sources (jpg, tiff, pdf, etc.)
-->

![This is not a boat](source/figures/full_caption_example.jpg){#fig:other_fig width=100%}

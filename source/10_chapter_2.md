# Literaturübersicht mit Mathe {#sec:lit-review}

<!--
Nach dem einführenden Kapitel ist es üblich, dass ein Kapitel folgt,
das die Literatur begutachtet und in die Methodik einführt wird,
die während der gesamten Arbeit verwendet wird.
-->

## Einleitung

Das ist die Einleitung. Duis in neque felis. In hac habitasse platea dictumst. Cras eget rutrum elit. Pellentesque tristique venenatis pellentesque. Cras eu dignissim quam, vel sodales felis. Vestibulum efficitur justo a nibh cursus eleifend. Integer ultrices lorem at nunc efficitur lobortis.

## Der Mittelteil

Das ist die Literaturübersicht. Nullam quam odio, volutpat ac ornare quis, vestibulum nec nulla. Aenean nec dapibus in mL/min^-1^. Mathematical formula can be inserted using Latex:

$$f(x) = ax^3 + bx^2 + cx + d$$ {#eq:my_equation}

Nunc eleifend, ex a luctus porttitor, felis ex suscipit tellus, ut sollicitudin sapien purus in libero. Nulla blandit eget urna vel tempus. Praesent fringilla dui sapien, sit amet egestas leo sollicitudin at.

Later on in the text, you can reference [@eq:my_equation] and its mind-blowing ramifications. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed faucibus pulvinar volutpat. Ut semper fringilla erat non dapibus. Nunc vitae felis eget purus placerat finibus laoreet ut nibh.

## A complicated math equation
The following raw text in markdown behind [@eq:my_complicated_equation] shows that you can fall back on \LaTeX if it is more convenient for you. Note that this will only be rendered in `thesis.pdf`

$$
\begin{aligned}
    \hat{\theta}_g = \argmin_{\theta_g} \Big\{ - &\sum^{N}_{n=1}\Big( 1-\mathbb{1}[f(\pmb x^{(n)})]\Big)\log f\Big(\pmb x^{(n)} \\ 
    &+ g(\pmb x^{(n)};\theta_g)\Big) + \lambda|g(\pmb x^{(n)};\theta_g)|_2 \Big\} \ ,
\end{aligned}
$$ {#eq:my_complicated_equation}


## Fazit

Das ist das Fazit. Donec pulvinar molestie urna eu faucibus. In tristique ut neque vel eleifend. Morbi ut massa vitae diam gravida iaculis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.

<!-- Eine ungeordnete Liste -->

- erstes Element der Liste
- zweites Element der Liste
- drittes Element der Liste

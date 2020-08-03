# Image minimale contenant Pelican
FROM vorakl/alpine-pelican

# Ajout du site
ADD . /site

# Installation du thème Elegant
RUN pelican-themes -i /site/pelican-themes/elegant

# On expose les ports
EXPOSE 8000
EXPOSE 80
EXPOSE 443

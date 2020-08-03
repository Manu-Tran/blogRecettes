# Image minimale contenant Pelican
FROM vorakl/alpine-pelican

RUN mkdir -p /themes
WORKDIR /themes

# Ajout du thème
ADD pelican-themes .

# Installation du thème Elegant
RUN pelican-themes -i /themes/elegant

# Ajout du site
ADD . /site

# On expose les ports
EXPOSE 8000
EXPOSE 80
EXPOSE 443

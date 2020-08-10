# Image minimale contenant Pelican
FROM vorakl/alpine-pelican

# Ajout du site
COPY . /site

# Patch du thème
RUN cp -f /site/custom-templates/* /site/pelican-themes/elegant/templates/

# On expose les ports
EXPOSE 8000
EXPOSE 80
EXPOSE 443

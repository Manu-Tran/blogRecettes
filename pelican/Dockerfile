# Image minimale contenant Pelican
FROM williamjackson/pelican:latest

# Ajout du site
COPY . /site

# Patch du thème
# RUN cp -rf /site/custom-templates/* /site/pelican-themes/elegant/templates/
COPY custom-templates /site/pelican-themes/elegant/templates

# On expose les ports
EXPOSE 8000
EXPOSE 80
EXPOSE 443

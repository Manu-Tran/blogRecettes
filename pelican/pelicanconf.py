#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

STATIC_PATHS = [
    'img',
    'recettes/images',
]
EXTRA_PATH_METADATA = {
    'img/favicon.ico': {'path': 'favicon.ico'},  # and this
}

AUTHOR = 'CGNan'
SITENAME = 'Blog de Recette du CGNan'
SITEURL = ''
THEME = 'elegant'
PATH = 'content'
TIMEZONE = 'Europe/Paris'

DEFAULT_LANG = 'fr'

# Clean URL
TAGS_URL = "tags"
CATEGORIES_URL = "categories"
ARCHIVES_URL = "archives"
ARTICLE_URL = "{slug}"
PAGE_URL = "{slug}"
PAGE_SAVE_AS = "{slug}.html"
SEARCH_URL = "search"

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (('Pelican', 'http://getpelican.com/'),
         ('Python.org', 'http://python.org/'),
         ('Jinja2', 'http://jinja.pocoo.org/'),
         ('You can modify those links in your config file', '#'),)

# # Social widget
# SOCIAL = (('You can add links in your config file', '#'),
#           ('Another social link', '#'),)

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

# Plugins
PLUGIN_PATHS = ['./pelican-plugins']
PLUGINS = ['tipue_search']
DIRECT_TEMPLATES = ['search']

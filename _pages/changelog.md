---
layout: page
published: true
title: Project Changelog
description: "A description for the about page which appears in SEO."
author: justinhartman
lang: en_GB
# Sidebar Navigation Settings.
menu: Changelog # Set to false to hide from the menu completely.
weight: 4 # Lower weights rise to the top of the side navigation menu.
# Override global color scheme for this page. 
# https://getmdl.io/customize/index.html
mdl_colors: yellow-green
search: true # 'false' hides this page from search results.
# Add the category this page should belong to.
# When set, the permalink is made up of /:category/:title (e.g. /pages/about)
category: pages
# This sets a Hero image which displays above the first line of content.
# Images should be 666px width and 350px height. If you need to change this you
# will need to edit the code in '_layouts/page.html'.
# Make "image:false" if you don't want an image to display.
image: https://picsum.photos/666/350.jpg
# Settings for @jekyll-paginate-v2
# https://github.com/sverrirs/jekyll-paginate-v2
pagination:
    enabled: true
# Sitemap Settings.
sitemap:
    changefreq: monthly
    priority: 1.0
---
## 📝 Package Changelog

Below is a detailed Changelog, along with specific tasks completed, for each
version released to date for the Jekyll Heroku Starter Kit.

### 🚀 Version 2.0.0 (08/07/2020)

This release migrates the boilerplate template from Jekyll 3.8 to version 4.1.
It also includes a new Materialize theme which has replaced the original 
`jekyll-theme-minimal` theme due to the fact it has not been migrated to work 
with Jekyll 4 yet.

- [🔆 #new](#new)
    - New [Material Design Lite][mdl] theme based on 
      [jekyll-materialdocs][theme].
    - New Blog/News template created in `/_layouts/news.html` folder with four 
      demo news posts. All posts are located in the `/_posts/` folder.
    - New content pages created for demo purposes. These include:
        + `/_pages/news.md`
        + `/_pages/changelog.md`
        + `/_pages/about.md`
    - Favicons added for easy replacement.
- [👍 #enhancement](#enhancement)
    - New release under `MIT` license now from the original `AGPL-3.0`.
    - Upgraded Jekyll site to run version `4.1.1`.
    - Upgraded `ruby` to `2.6.3`.
    - Upgraded `bundler` from `1.17.2` to `2.1.4`.

### 🧪 Version 1.3.0 (07/07/2020)

This is the final release for the Jekyll 3 series. Later releases will all 
only work with Jekyll 4. If you are using a theme that only supports Jekyll 3 
then use this release instead. You can download this release or pull directly 
from the [Jekyll 3 branch][jekyll-v3]. Please note there will be no further 
updates to [this version 3 branch][jekyll-v3] and is merely an archive.

- [🐛 #bugfix](#bugfix)
    - Fixed OS Command Injection in Rake 
      [CVE-2020-8130](https://github.com/advisories/GHSA-jppv-gw3r-w3q8).
    - Fixed Directory traversal in Rack::Directory app bundled with Rack 
      [CVE-2020-8161](https://github.com/advisories/GHSA-5f9h-9pjv-v6j7).
    - Fixed Percent-encoded cookies can be used to overwrite existing prefixed 
      cookie names 
      [CVE-2020-8184](https://github.com/advisories/GHSA-j6w9-fv6q-3q52).
- [👍 #enhancement](#enhancement)
    - Updated `jekyll` to `3.7.8`.
    - Updated `bundler` to `1.17.2`.
    - Updated `ruby` to `2.6.3`.
    - Updated `README.md` and `index.md`.

### ⌛️ Version 1.2.0 (27/05/2018)

- [🔆 #new](#new)
    - Configured and added the settings for `@jekyll-paginate-v2` to 
      `_config.yml`
    - Configured and added the settings for `@jekyll-paginate-v2` to `index.md`
    - Configured and added the settings for `@jekyll-last-modified-at` to 
      `index.md`
- [🐛 #bugfix](#bugfix)
    - Removed `last_modified_at:` setting out of `sitemp.xsl`.
    - Disabled `@jekyll-paginate-v2` as it messes up homepage layout. Template
      files need to be edited for this plugin to work.

[theme]: https://github.com/chromatical/jekyll-materialdocs
[jekyll-v3]: https://github.com/justinhartman/jekyll-heroku-starter-kit/tree/jekyll-v3
[mdl]: https://getmdl.io/

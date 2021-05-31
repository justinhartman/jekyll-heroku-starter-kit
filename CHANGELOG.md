# Changelog for the Jekyll Heroku Starter Kit

Below is a detailed Changelog, along with specific tasks completed, for each
version released to date for the Jekyll Heroku Starter Kit.

## 🚀 Version 2.0.2 (31/05/2021)

- [👍 #enhancement](#enhancement)
    - Hyperlinked the company name in the footer with new CSS style
    - Added historical releases to [Changelog](/pages/changelog.html) page
    - Upgraded Jekyll from `4.1.1` to `4.2.0`
    - Upgraded `ruby` from `2.6.3` to `2.7.3`
    - Upgraded `bundler` from `2.1.4` to `2.2.3`
    - Security fix upgrades to remaining `Gemfile` packages
    - Updated content on README and Home pages
    - Fixed navigation link indentation in `head.html` template
- [🐛 #bugfix](#bugfix)
    - Fixes issue #4 by referencing `manifest.json` instead of `site.webmanifest`
    - Fixes issue #6 where Heroku build fails on updated `Gemfile`

## 🚀 Version 2.0.1 (09/07/2020)

- [👍 #enhancement](#enhancement)
    - Post links in `news.html` now use `absolute_url` so they aren't relative.
    - Updated `humans.md`.
    - Changed URLs in documentation.
    - Updated documentation with build log and other info.
- [🐛 #bugfix](#bugfix)
    - Fixed issue #2 where Heroku server crashed on build.

## 🚀 Version 2.0.0 (08/07/2020)

This release migrates the boilerplate template from Jekyll 3.8 to version 4.1.
It also includes a new Material Design Lite theme which has replaced the 
original `jekyll-theme-minimal` theme due to the fact this old one has not 
been migrated to work with Jekyll 4.

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
    - This release is published under an `MIT` license from the original 
      `AGPL-3.0` of previous versions.
    - Upgraded Jekyll site to run version `4.1.1`.
    - Upgraded `ruby` to `2.6.3`.
    - Upgraded `bundler` from `1.17.2` to `2.1.4`.

## 🧪 Version 1.3.0 (07/07/2020)

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

## ⌛️ Version 1.2.0 (27/05/2018)

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

## ⌛️ Version 1.1.0 (27/05/2018)

- [🔆 #new](#new)
    - Configured and added the settings for `@jekyll-seo-tag` to `_config.yml`
    - Configured and added the settings for `@jekyll-seo-tag` to `index.md`
    - Configured and added the settings for `@jekyll-sitemap` to `index.md`
    - Defined collections for use in `_config.yml`
    - Added customised `sitemap.xml` and a `sitemap.xsl` template file
      `<https://jekyll-heroku-starter-kit.herokuapp.com/sitemap.xml>`.
    - Added customised `feed.xml` and a `feed.xslt.xml` template file.
      `<https://jekyll-heroku-starter-kit.herokuapp.com/feed.xml>`.
    - New `humans.md` file that outputs a file to
      `<https://jekyll-heroku-starter-kit.herokuapp.com/humans.txt>`.
- [👍 #enhancement](#enhancement)
    - Updated `README.md` and `index.md`.
    - Various enhancements with `static.json` edits.
    - Major enhancement to the `Procfile`.
- [🐛 #bugfix](#bugfix)
    - Fixed a build bug with the Gem dependencies.
    - Update `_config.yml` by removing a duplicate `logo` key.
    - Fixed bug where neither `sitemap.xml` nor `feed.xml` were rendering.

## ⌛️ Version 1.0.1 (26/05/2018)

Minor edits; don't affect functionality.

- [🔆 #new](#new)
    - New settings added to VS Code Workspace file.
- [🐛 #bugfix](#bugfix)
    - Fixed broken link in `README.md`.
    - Removed unnecessary whitespace in `README.md` and `index.md`.

## ⌛️ Version 1.0.0 (26/05/2018)

First _production-ready_ release. Works out the box.

- [🔆 #new](#new)
    - Added the following files required by Heroku:
        - `config.ru`
        - `Procfile`
    - Added `Gemfile` to install Jekyll.
    - New `static.json` for the Heroku buildpack.
    - New `Rakefile` for the Heroku buildpack.
    - `index.md` that contains the contents of the `README.md` for the 
      main site.
    - Added a default minimal site theme (jekyll-theme-minimal).
- [👍 #enhancement](#enhancement)
    - Updated all the `*.md` files from the @justinhartman/.github project.
    - Updated `.gitignore` to exclude all project build files.
    - Added some Visual Studio Code settings to the workspace file.
    - Completed the contents for the `README.md` file with full setup and 
      install instructions.

## ⌛️ Version 0.0.1 (26/05/2018)

- [🔆 #new](#new)
    - Initial Commit

[blog]: https://blog.heroku.com/using-http-headers-to-secure-your-site
[theme]: https://github.com/chromatical/jekyll-materialdocs
[jekyll-v3]: https://github.com/justinhartman/jekyll-heroku-starter-kit/tree/jekyll-v3
[mdl]: https://getmdl.io/

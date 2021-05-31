---
layout: page
published: true
# @jekyll-seo-tag
# Settings for @jekyll-seo-tag - https://github.com/jekyll/jekyll-seo-tag
title: Jekyll Heroku Starter Kit
description: A boilerplate template to set up Jekyll 4 on a free 
             Heroku server. Included are additional Jekyll plugins to 
             showcase the full capabailities and it comes with an elegantly
             designed and crafted Material Design Lite theme. 
author: justinhartman
lang: en_GB
# Materialize Theme Settings
# Settings for MDL theme - https://github.com/chromatical/jekyll-materialdocs
menu: Home # Use this as the menu item text instead of title, set to false
           # to remove completely from menu.
tab: false # 'true' opens this page in a new tab.
#parent: index.md # Will make this menu item a child of the index.md item.
weight: 0 # Lower weights rise to the top of the side navigation menu.
#mdl_colors: deep_orange-blue # Override global color scheme for this page.
search: true # 'false' hides this page from search results.
image: https://picsum.photos/id/580/1200/630.jpg
# Settings for @jekyll-sitemap - https://github.com/jekyll/jekyll-sitemap
sitemap:
    changefreq: weekly
    priority: 1.0
# Settings for @jekyll-last-modified-at
# https://github.com/gjtorikian/jekyll-last-modified-at
# Comment out if you want Jekyll to automatically set the last_modified date.
last_modified_at: 2021-05-31 11:13:22 +02:00
# @jekyll-redirect-from - https://github.com/jekyll/jekyll-redirect-from
# Uncomment below to setup redirects from old pages to new ones. Useful when 
# changing page URLs; else, not needed.
# redirect_from:
#   - /post/123456789/
#   - /post/123456789/my-amazing-post/
# Settings for @jekyll-paginate-v2
# https://github.com/sverrirs/jekyll-paginate-v2
pagination:
  enabled: true
---
## 1. Overview

A boilerplate template to set up [Jekyll 4][jekyll] on a free 
[Heroku][heroku-main] server. Included are additional Jekyll plugins to 
showcase the full capabilities and it comes with an elegantly designed and 
crafted [Material Design Lite][mdl] theme. 

_If you are looking for version 3 of Jekyll instead of version 4, view 
[this release][1.3.0] which contains the boilerplate for Jekyll version 3._

Here's what you get in this package.

### 1.1. Features

- Latest Jekyll site running version `4.2.0`.
- All the required Ruby files to run a Jekyll website on Heroku in minutes.
- [jekyll-materialdocs][jekyll-materialdocs] - a beautiful 
  [Material Design Lite][mdl] theme elegantly crafted, installed and 
  configured.
- `static.json` - used by the Heroku static buildpack.
- `Rakefile` - the Heroku Ruby buildpack runs `rake assets:precompile`
  when it’s available.
- `config.ru` - the config file which enables this gem to serve your app on
  Heroku using [RackJekyll][rack].
- `humans.md` file which outputs a human-readable file to [/humans.txt][humans]
- Various plugins which enhance the functionality of Jekyll _(see below for 
  all the details)_.

### 1.2. Plugins

These plugins are installed by default:

- [jekyll-feed][jekyll-feed]
    - Generates an XML Feed at 
        <https://justinhartman.co/jekyll-heroku-starter-kit/feed.xml>
- [jekyll-seo-tag][jekyll-seo-tag]
    - View the config settings in `_config.yml` and `index.md`.
- [jekyll-sitemap][jekyll-sitemap]
    - Generates a XML Sitemap at 
        <https://justinhartman.co/jekyll-heroku-starter-kit/sitemap.xml>
    - Generates a `robots.txt` file at 
        <https://justinhartman.co/jekyll-heroku-starter-kit/robots.txt>
    - View the config settings in `index.md`.
- [jekyll-paginate-v2][jekyll-paginate-v2]
    - View the config settings in `_config.yml` and `index.md`.
- [jekyll-include-cache][jekyll-include-cache]
- [jekyll-last-modified-at][jekyll-last-modified-at]
    - View the config settings in `index.md`.
- [jekyll-redirect-from][jekyll-redirect-from]
    - View the config settings in `index.md`.

View the `_config.yml` and `index.md` files for all the settings which are
pre-configured for you. All plugins are easily labelled and well documented.

## 2. Getting Started

These instructions will get your copy of the project up and running on your
local machine for development and testing purposes. [See deployment][deploy]
for notes on how to deploy the project on a live system.

### 2.1. Prerequisites

The following prerequisites need to be installed on your machine for this to
work.

1. [Heroku Toolbelt][toolbelt] - the CLI interface to Heroku.
1. A package manager for your Operating System:
    - macOS: [Homebrew][brew]
    - Windows: [Chocolatey][choc]
    - Linux: `apt-get` or `yum` (distro dependent)
1. [Ruby][ruby]
1. [Bundler][bundler] - to manage Ruby gems (see below).

Once you have installed `ruby`, installing `bundler` is pretty straightforward.
Simply run this command in a terminal window.

```console
$ gem install bundler
```

## 3. Installing

### 3.1. Clone the Repository

The first step is to clone this repository to a location on your computer. For
this example, we will assume that your default install location is a folder
called `jekyll-heroku-starter-kit`.

```console
$ git clone https://github.com/justinhartman/jekyll-heroku-starter-kit
```

The above command will checkout the source code to the folder
`jekyll-heroku-starter-kit/`. You can change the default location by specifying
a folder name in the checkout command with:

```console
$ git clone https://github.com/justinhartman/jekyll-heroku-starter-kit custom-folder
```

### 3.2. Creating the Heroku App

Running the `heroku apps:create` command will create a new app on Heroku and
add a reference to a git repository on Heroku itself.

```console
$ cd jekyll-heroku-starter-kit/
$ heroku apps:create jekyll-heroku-starter-kit
Creating ⬢ jekyll-heroku-starter-kit... done
https://jekyll-heroku-starter-kit.herokuapp.com/ | https://git.heroku.com/jekyll-heroku-starter-kit.git
```

You can check that the new Heroku repo has been added to your `git` repo with
the following command.

```console
$ git config --list
remote.heroku.url=https://git.heroku.com/jekyll-heroku-starter-kit.git
remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
remote.origin.url=https://github.com/justinhartman/jekyll-heroku-starter-kit.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
```

### 3.3. Install the required Gems

The `Gemfile` in this repository contains everything needed to setup Jekyll and
get your app ready for publishing to Heroku. Run the following command to
install all the required dependencies.

```console
$ bundle install --path vendor/bundle
```

### 3.4. Adding Heroku Buildpacks

We need to install a few buildpacks to tell Heroku how to handle the app. You
need to install the following by executing these commands:

```console
$ heroku buildpacks:add heroku/ruby
$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-static
```

### 3.5. Running Jekyll Locally

Once done with the above you should test your Jekyll installation to ensure
that you can run the site on your machine. This is very important before 
deploying your app to Heroku.

Run the `jekyll serve` command to test your app.

```console
$ bundle exec jekyll serve
Configuration file: /jekyll-heroku-starter-kit/_config.yml
Invalid theme folder: _includes
            Source: /jekyll-heroku-starter-kit
       Destination: /jekyll-heroku-starter-kit/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
         AutoPages: Disabled/Not configured in site.config.
        Pagination: Disabled in site.config.
                    done in 1.238 seconds.
 Auto-regeneration: enabled for '/jekyll-heroku-starter-kit'
    Server address: http://127.0.0.1:4000
  Server running... press ctrl-c to stop.
```

By visiting [http://127.0.0.1:4000][localhost] you should see your newly
built Jekyll site. This is an example of what you should be seeing.

![Jekyll Site][livesite]{: .responsive-img}

## 4. Deployment

With everything completed in the steps above you can now deploy to Heroku. 
Execute the following commands to deploy a build to heroku.

```console
$ cd jekyll-heroku-starter-kit/
$ git push heroku master
```

This will generate a build log that should resemble the below success.

```console
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 4 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 1.02 KiB | 1.02 MiB/s, done.
Total 4 (delta 2), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Ruby app detected
remote: -----> Installing bundler 2.0.2
remote: -----> Removing BUNDLED WITH version in the Gemfile.lock
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.6.3
remote: -----> Installing dependencies using bundler 2.0.2
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Bundle complete! 13 Gemfile dependencies, 40 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into `./vendor/bundle`
remote:        Bundle completed (0.46s)
remote:        Cleaning up the bundler cache.
remote: -----> Writing config/database.yml to read from DATABASE_URL
remote: -----> Detecting rake tasks
remote: -----> Precompiling assets
remote: -----> Static HTML app detected
remote: -----> Installed directory to /app/bin
remote: -----> Discovering process types
remote:        Procfile declares types -> LANG, RACK_ENV, addons, console, rake, web
remote: -----> Compressing...
remote:        Done: 54.1M
remote: -----> Launching...
remote:        Released v31
remote:        https://jekyll-heroku-starter-kit.herokuapp.com/ deployed to Heroku
remote: Verifying deploy... done.
```

Visit your Heroku URL ([view demo here][example]) and you should see the same 
site you built on your local machine, now published on Heroku.

## 5. Built With

- [Jekyll 4.2.0][jekyll]
- [Heroku][heroku-main]
- [ruby 2.7.1][ruby]
- [Homebrew 2.4.0][brew]
- [Bundler version 2.2.9][bundler]

## 6. Contributing

Please read the [CONTRIBUTING.md][CONTRIBUTING] file for details on how you
can get involved in the project as well as the process for submitting bugs
and pull requests.

## 7. Code of Conduct

Please read the [CODE_OF_CONDUCT.md][COC] file for the guidelines that govern
the community.

## 8. Versioning

We use [Semantic Versioning][semver] for software versions of this project.
For a list of all the versions available, see the [tags][tags] and
[releases][releases] on this repository.

## 9. Changelog

View the [CHANGELOG.md][changelog] file for a detailed list of changes,
along with specific tasks completed for each version released to date.

## 10. Authors

- Justin Hartman - [@justinhartman][author-1]

Also see the list of [contributors][contribs] who have participated in this
project.

## 11. License

This project is licensed under the `MIT` License. See the [LICENSE][license] 
file for full details.

## 12. Acknowledgements

Special thanks go out to the following people and projects who have helped in
some way to make this project a reality.

- [22 Digital][22] for the awesome development work on the theme.
- [Material Design Lite][mdl] for the design framework used in the theme.
- [James King][james] for the the [MaterialDocs][jekyll-materialdocs] theme 
  which inspired this theme.
- [Jekyll Pygments Themes][pygments-themes] for the `github.css` theme styling.
- [Picsum][picsum] for their amazing Lorem Picsum photos used in the site.
- [Pravatar][pravatar] for the profile images used for the authors data.
- [@justinhartman/.github][.github] for the awesome Github project templates.
- [Andy Croll][andy] for his article on serving a Jekyll site on Heroku.
- [Heroku][heroku] for their article on running Jekyll on their platform.

[deploy]: #4-deployment
[CONTRIBUTING]: CONTRIBUTING.md
[COC]: CODE_OF_CONDUCT.md
[license]: LICENSE
[changelog]: CHANGELOG.md
[semver]: http://semver.org
[tags]: https://github.com/justinhartman/jekyll-heroku-starter-kit/tags
[releases]: https://github.com/justinhartman/jekyll-heroku-starter-kit/releases
[contribs]: https://github.com/justinhartman/jekyll-heroku-starter-kit/contributors
[author-1]: https://github.com/justinhartman
[.github]: https://github.com/justinhartman/.github
[toolbelt]: https://devcenter.heroku.com/articles/heroku-cli
[brew]: http://brew.sh/
[choc]: https://chocolatey.org/
[ruby]: https://www.ruby-lang.org/en/documentation/installation/
[bundler]: https://bundler.io/
[jekyll-feed]: https://github.com/jekyll/jekyll-feed
[jekyll-seo-tag]: https://github.com/jekyll/jekyll-seo-tag
[jekyll-sitemap]: https://github.com/jekyll/jekyll-sitemap
[jekyll-paginate-v2]: https://github.com/sverrirs/jekyll-paginate-v2
[jekyll-include-cache]: https://github.com/benbalter/jekyll-include-cache
[jekyll-last-modified-at]: https://github.com/gjtorikian/jekyll-last-modified-at
[jekyll-redirect-from]: https://github.com/jekyll/jekyll-redirect-from
[jekyll-materialdocs]: https://github.com/chromatical/jekyll-materialdocs
[james]: https://github.com/chromatical
[rack]: https://github.com/adaoraul/rack-jekyll
[andy]: https://andycroll.com/ruby/serving-a-jekyll-blog-using-heroku/
[heroku]: https://blog.heroku.com/jekyll-on-heroku
[jekyll]: https://jekyllrb.com/
[heroku-main]: https://www.heroku.com/
[humans]: https://justinhartman.co/jekyll-heroku-starter-kit/humans.txt
[localhost]: http://127.0.0.1:4000
[livesite]: /assets/images/website.png
[blogsite]: /assets/images/news.png
[example]: https://justinhartman.co/jekyll-heroku-starter-kit
[mdl]: https://getmdl.io/
[22]: https://22digital.ltd
[pygments-themes]: https://github.com/jwarby/jekyll-pygments-themes
[jekyll-v3]: https://github.com/justinhartman/jekyll-heroku-starter-kit/tree/jekyll-v3
[1.3.0]: https://github.com/justinhartman/jekyll-heroku-starter-kit/releases/tag/1.3.0
[picsum]: https://picsum.photos
[pravatar]: https://pravatar.cc

---
layout: default
published: true
# Settings for @jekyll-seo-tag
title: Jekyll Heroku Starter Kit
description: "This project will setup a minimum boilerplate template for running a Jekyll site on Heroku."
image: /assets/post-pic.jpg
author: justinhartman
lang: en_ZA
# Settings for @jekyll-sitemap
# sitemap: false # Set to false if you want to prevent the post from appearing.
sitemap:
    changefreq: weekly
    priority: 1.0
# Settings for @jekyll-last-modified-at
# Delete if you want Jekyll to automatically set the last_modified date.
last_modified_at: 2018-27-05 03:54:10 +02:00
# Settings for @jekyll-redirect-from
# Change the below to setup redirects from old pages. Useful when changing page
# URLs.
# redirect_from:
#   - /post/123456789/
#   - /post/123456789/my-amazing-post/
# Settings for @jekyll-paginate-v2
pagination:
  enabled: true
# Set categories for the site and URL structure
categories:
  - blog
---
## 1. Features

This project will setup a minimum boilerplate template for running a Jekyll
site on Heroku. With this, there are some additional Jekyll plugins installed
for ease of use along with a default, minimal theme.

Here's what you get.

### 1.1. General

- All required files to run a Jekyll site in minutes on Heroku.
- [jekyll-theme-minimal][jekyll-theme-minimal] - Default minimal theme installed.
- `static.json` - used by the Heroku static buildpack.
- `Rakefile` - the Heroku Ruby buildpack runs `rake assets:precompile`
  when it’s available.
- `config.ru` - the config file that enables this gem to serve your app on
  Heroku using [RackJekyll][rack].
- New `humans.md` file that outputs a file to:
  <https://jekyll-heroku-starter-kit.herokuapp.com/humans.txt>

### 1.2. Plugins

These plugins are installed by default:

- [jekyll-feed][jekyll-feed]
  - Generates an XML Feed at <https://jekyll-heroku-starter-kit.herokuapp.com/feed.xml>
- [jekyll-seo-tag][jekyll-seo-tag]
  - See config settings in `_config.yml` and `index.md`.
- [jekyll-sitemap][jekyll-sitemap]
  - Generates a XML Sitemap at <https://jekyll-heroku-starter-kit.herokuapp.com/sitemap.xml>
  - Generates a `robots.txt` file at <https://jekyll-heroku-starter-kit.herokuapp.com/robots.txt>
  - See config settings in `index.md`.
- [jekyll-paginate-v2][jekyll-paginate-v2]
  - See config settings in `_config.yml` and `index.md`.
- [jekyll-include-cache][jekyll-include-cache]
- [jekyll-last-modified-at][jekyll-last-modified-at]
  - See config settings in `index.md`.
- [jekyll-redirect-from][jekyll-redirect-from]
  - See config settings in `index.md`.

See the `_config.yml` and `index.md` files for all the settings which have been
pre-configured for you, to enable the usage of these plugins. They are all well
labelled and documented.

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

```terminal
$ gem install bundler
```

## 3. Installing

### 3.1. Clone the Repository

The first step is to clone this repository to a location on your computer. For
this example we will assume that your default install location is a folder
called `jekyll-heroku-starter-kit`.

```terminal
$ git clone https://github.com/justinhartman/jekyll-heroku-starter-kit
```

The above command will checkout the source code to the folder
`jekyll-heroku-starter-kit/`. You can change the default location by specifying
a folder name in the checkout command with:

```terminal
$ git clone https://github.com/justinhartman/jekyll-heroku-starter-kit custom-folder
```

### 3.2. Creating the Heroku App

Running the `heroku apps:create` command will create a new app on Heroku and
add a reference to a git repository on Heroku itself.

```terminal
$ cd jekyll-heroku-starter-kit/
$ heroku apps:create jekyll-heroku-starter-kit
Creating ⬢ jekyll-heroku-starter-kit... done
https://jekyll-heroku-starter-kit.herokuapp.com/ | https://git.heroku.com/jekyll-heroku-starter-kit.git
```

You can check that the new Heroku repo has been added to your `git` repo with
the following command.

```terminal
$ git config --list
remote.heroku.url=https://git.heroku.com/jekyll-heroku-starter-kit.git
remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
remote.origin.url=https://github.com/justinhartman/jekyll-heroku-starter-kit.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
```

### 3.3. Install required Gems

The `Gemfile` in this repository contains everything needed to setup Jekyll and
get your app ready for publishing to Heroku. Run the following command to
install all the required dependencies.

```terminal
$ bundle install --path vendor/bundle
```

### 3.4. Adding Heroku Buildpacks

We need to install a few buildpacks to tell Heroku how to handle the app. You
need to install the following by executing these commands:

```terminal
$ heroku buildpacks:add heroku/ruby
$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-static
```

### 3.5. Running Jekyll Locally

Once done with the above you should test your Jekyll installation to ensure
that you are able to run the site on your machine. This is very important
before deploying your app to Heroku.

Run the `jekyll serve` command to test your app.

```terminal
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

![Jekyll Site][livesite]

## 4. Deployment

With everything setup in the steps above you can now deploy to Heroku. Simply
execute the following commands to deploy a build to heroku.

```terminal
$ cd jekyll-heroku-starter-kit/
$ git push heroku master
```

This will generate a build log that should resemble the below success.

```console
Enumerating objects: 18, done.
Counting objects: 100% (18/18), done.
Delta compression using up to 4 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 153.31 KiB | 10.95 MiB/s, done.
Total 10 (delta 7), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Ruby app detected
remote: -----> Installing bundler 1.17.3
remote: -----> Removing BUNDLED WITH version in the Gemfile.lock
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.6.3
remote: -----> Installing dependencies using bundler 1.17.3
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Fetching gem metadata from https://rubygems.org/.........
remote:        Fetching rake 13.0.1
remote:        Installing rake 13.0.1
remote:        Fetching public_suffix 4.0.5
remote:        Using bundler 1.17.3
remote:        Fetching colorator 1.1.0
remote:        Fetching concurrent-ruby 1.1.6
remote:        Installing public_suffix 4.0.5
remote:        Installing colorator 1.1.0
remote:        Fetching eventmachine 1.2.7
remote:        Installing concurrent-ruby 1.1.6
remote:        Installing eventmachine 1.2.7 with native extensions
remote:        Fetching http_parser.rb 0.6.0
remote:        Installing http_parser.rb 0.6.0 with native extensions
remote:        Fetching ffi 1.13.1
remote:        Installing ffi 1.13.1 with native extensions
remote:        Fetching forwardable-extended 2.6.0
remote:        Installing forwardable-extended 2.6.0
remote:        Fetching rb-fsevent 0.10.4
remote:        Installing rb-fsevent 0.10.4
remote:        Fetching kramdown 1.17.0
remote:        Installing kramdown 1.17.0
remote:        Fetching liquid 4.0.3
remote:        Installing liquid 4.0.3
remote:        Fetching mercenary 0.3.6
remote:        Installing mercenary 0.3.6
remote:        Fetching rouge 3.20.0
remote:        Installing rouge 3.20.0
remote:        Fetching safe_yaml 1.0.5
remote:        Installing safe_yaml 1.0.5
remote:        Fetching posix-spawn 0.3.14
remote:        Installing posix-spawn 0.3.14 with native extensions
remote:        Fetching rack 1.6.13
remote:        Installing rack 1.6.13
remote:        Fetching addressable 2.7.0
remote:        Installing addressable 2.7.0
remote:        Fetching i18n 0.9.5
remote:        Installing i18n 0.9.5
remote:        Fetching pathutil 0.16.2
remote:        Fetching rb-inotify 0.10.1
remote:        Installing pathutil 0.16.2
remote:        Installing rb-inotify 0.10.1
remote:        Fetching sass-listen 4.0.0
remote:        Fetching listen 3.2.1
remote:        Installing listen 3.2.1
remote:        Installing sass-listen 4.0.0
remote:        Fetching jekyll-watch 2.2.1
remote:        Fetching sass 3.7.4
remote:        Installing jekyll-watch 2.2.1
remote:        Installing sass 3.7.4
remote:        Fetching jekyll-sass-converter 1.5.2
remote:        Installing jekyll-sass-converter 1.5.2
remote:        Fetching em-websocket 0.5.1
remote:        Installing em-websocket 0.5.1
remote:        Fetching jekyll 3.8.7
remote:        Installing jekyll 3.8.7
remote:        Fetching jekyll-feed 0.14.0
remote:        Fetching jekyll-include-cache 0.2.0
remote:        Fetching jekyll-last-modified-at 1.3.0
remote:        Installing jekyll-include-cache 0.2.0
remote:        Installing jekyll-feed 0.14.0
remote:        Installing jekyll-last-modified-at 1.3.0
remote:        Fetching jekyll-redirect-from 0.16.0
remote:        Fetching jekyll-paginate-v2 3.0.0
remote:        Fetching jekyll-seo-tag 2.6.1
remote:        Installing jekyll-paginate-v2 3.0.0
remote:        Installing jekyll-redirect-from 0.16.0
remote:        Installing jekyll-seo-tag 2.6.1
remote:        Fetching jekyll-sitemap 1.4.0
remote:        Fetching rack-jekyll 0.5.0
remote:        Installing jekyll-sitemap 1.4.0
remote:        Fetching jekyll-theme-minimal 0.1.1
remote:        Installing rack-jekyll 0.5.0
remote:        Installing jekyll-theme-minimal 0.1.1
remote:        Bundle complete! 12 Gemfile dependencies, 37 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into `./vendor/bundle`
remote:        Bundle completed (23.64s)
remote:        Cleaning up the bundler cache.
remote: -----> Writing config/database.yml to read from DATABASE_URL
remote: -----> Detecting rake tasks
remote: -----> Precompiling assets
remote:        Running: rake assets:precompile
remote:        Configuration file: /tmp/build_7c043d4debd1a9e02e7244a541fc709d/_config.yml
remote:                    Source: /tmp/build_7c043d4debd1a9e02e7244a541fc709d
remote:               Destination: /tmp/build_7c043d4debd1a9e02e7244a541fc709d/_site
remote:         Incremental build: disabled. Enable with --incremental
remote:              Generating...
remote:               Jekyll Feed: Generating feed for posts
remote:                 AutoPages: Disabled/Not configured in site.config.
remote:                Pagination: Disabled in site.config.
remote:                            done in 0.483 seconds.
remote:         Auto-regeneration: disabled. Use --watch to enable.
remote:        Asset precompilation completed (1.37s)
remote:
remote: -----> Static HTML app detected
remote:   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
remote:                                  Dload  Upload   Total   Spent    Left  Speed
remote: 100  838k  100  838k    0     0  8360k      0 --:--:-- --:--:-- --:--:-- 8386k
remote: -----> Installed directory to /app/bin
remote: -----> Discovering process types
remote:        Procfile declares types -> LANG, RACK_ENV, addons, console, rake, web
remote:
remote: -----> Compressing...
remote:        Done: 21.2M
remote: -----> Launching...
remote:        Released v29
remote:        https://jekyll-heroku-starter-kit.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/jekyll-heroku-starter-kit.git
   fa218a6..07b8c9a  master -> master
```

Visit your Heroku URL (e.g. [https://jekyll-heroku-starter-kit.herokuapp.com][example])
and you should see the same site you built on your local machine, now published
on Heroku.

## 5. Built With

- [Jekyll 3.8.7][jekyll]
- [Heroku][heroku-main]
- [ruby 2.6.3][ruby]
- [Homebrew 2.4.0][brew]
- [Bundler version 1.17.2][bundler]

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

## 9. Change-Log

View the [CHANGELOG.md][changelog] file for a detailed list of changes,
along with specific tasks completed for each version released to date.

## 10. Authors

- Justin Hartman - [@justinhartman][author-1]

Also see the list of [contributors][contribs] who have participated in this
project.

## 11. License

This project is licensed under the AGPL-3.0 License. See the
[LICENSE][license] file for full details.

## 12. Acknowledgements

Special thanks go out to the following people and projects who have helped in
some way to make this project a reality.

- [@justinhartman/.github][.github] - for the awesome Github project templates.
- [Andy Croll][andy] - for his post on serving a Jekyll site on Heroku.
- [Heroku][heroku] - for their post on running Jekyll on their platform.

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
[jekyll-theme-minimal]: https://github.com/pages-themes/minimal
[rack]: https://github.com/adaoraul/rack-jekyll
[andy]: https://andycroll.com/ruby/serving-a-jekyll-blog-using-heroku/
[heroku]: https://blog.heroku.com/jekyll-on-heroku
[jekyll]: https://jekyllrb.com/
[heroku-main]: https://www.heroku.com/
[localhost]: http://127.0.0.1:4000
[livesite]: /config/livesite.jpg
[example]: https://jekyll-heroku-starter-kit.herokuapp.com

---
title: Jekyll Heroku Starter Kit
layout: default
---
## Features

This project will setup a minimum boilerplate template for running a Jekyll
site on Heroku. With this, there are some additional Jekyll plugins installed
for ease of use along with a default, minimal theme.

### General

- All required files to run a Jekyll site in minutes on Heroku.
- [jekyll-theme-minimal][jekyll-theme-minimal] - Default minimal theme installed.
- `static.json` - used by the Heroku static buildpack.
- `Rakefile` - the Heroku Ruby buildpack runs `rake assets:precompile`
  when it’s available.
- `config.ru` - the config file that enables this gem to serve your app on
  Heroku using [RackJekyll][rack].

### Plugins

These plugins are installed by default:

- [jemoji][jemoji]
- [jekyll-mentions][jekyll-mentions]
- [jekyll-feed][jekyll-feed]
  - Generates an XML Feed at `http://yourdomain.com/feed.xml`
- [jekyll-seo-tag][jekyll-seo-tag]
- [jekyll-sitemap][jekyll-sitemap]
  - Generates a XML Sitemap at `http://yourdomain.com/sitemap.xml`
  - Generates a `robots.txt` file at `http://yourdomain.com/robots.txt`
- [jekyll-paginate-v2][jekyll-paginate-v2]
- [jekyll-include-cache][jekyll-include-cache]
- [jekyll-last-modified-at][jekyll-last-modified-at]
- [jekyll-redirect-from][jekyll-redirect-from]

See the `_config.yml` and `index.md` files for various settings which have been
pre-configured to work with some of these plugins.

## Getting Started

These instructions will get your copy of the project up and running on your
local machine for development and testing purposes. [See deployment][deploy]
for notes on how to deploy the project on a live system.

### Prerequisites

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

## Installing

### Clone the Repository

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

### Creating the Heroku App

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

### Install required Gems

The `Gemfile` in this repository contains everything needed to setup Jekyll and
get your app ready for publishing to Heroku. Run the following command to
install all the required dependencies.

```terminal
$ bundle install --path vendor/bundle
```

### Adding Heroku Buildpacks

We need to install a few buildpacks to tell Heroku how to handle the app. You
need to install the following by executing these commands:

```terminal
$ heroku buildpacks:add heroku/ruby
$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-static
```

### Running Jekyll Locally

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

## Deployment

With everything setup in the steps above you can now deploy to Heroku. Simply
execute the following commands to deploy a build to heroku.

```terminal
$ cd jekyll-heroku-starter-kit/
$ git push heroku master
```

This will generate a build log that should resemble to below success.

```console
Counting objects: 6, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 5.06 KiB | 647.00 KiB/s, done.
Total 6 (delta 3), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Ruby app detected
remote: -----> Compiling Ruby/Rack
remote: -----> Using Ruby version: ruby-2.3.3
remote: -----> Installing dependencies using bundler 1.15.2
remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
remote:        Warning: the running version of Bundler (1.15.2) is older than the version that created the lockfile (1.16.1). We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
remote:        Fetching gem metadata from https://rubygems.org/..........
remote:        Fetching version metadata from https://rubygems.org/..
remote:        Fetching dependency metadata from https://rubygems.org/.
remote:        Using rake 12.3.1
remote:        Using public_suffix 3.0.2
remote:        Using bundler 1.15.2
remote:        Using colorator 1.1.0
remote:        Using concurrent-ruby 1.0.5
remote:        Using eventmachine 1.2.7
remote:        Using http_parser.rb 0.6.0
remote:        Using ffi 1.9.23
remote:        Using forwardable-extended 2.6.0
remote:        Using rb-fsevent 0.10.3
remote:        Using ruby_dep 1.5.0
remote:        Using kramdown 1.16.2
remote:        Using liquid 4.0.0
remote:        Using mercenary 0.3.6
remote:        Using rouge 3.1.1
remote:        Using safe_yaml 1.0.4
remote:        Fetching posix-spawn 0.3.13
remote:        Using rack 1.6.10
remote:        Using i18n 0.9.5
remote:        Using addressable 2.5.2
remote:        Using rb-inotify 0.9.10
remote:        Using em-websocket 0.5.1
remote:        Using pathutil 0.16.1
remote:        Using sass-listen 4.0.0
remote:        Using listen 3.1.5
remote:        Using sass 3.5.6
remote:        Using jekyll-watch 2.0.0
remote:        Using jekyll-sass-converter 1.5.2
remote:        Using jekyll 3.8.2
remote:        Fetching jekyll-feed 0.9.3
remote:        Fetching jekyll-include-cache 0.1.0
remote:        Installing posix-spawn 0.3.13 with native extensions
remote:        Installing jekyll-include-cache 0.1.0
remote:        Installing jekyll-feed 0.9.3
remote:        Fetching jekyll-paginate-v2 1.9.4
remote:        Using jekyll-redirect-from 0.13.0
remote:        Using jekyll-seo-tag 2.5.0
remote:        Fetching jekyll-sitemap 1.2.0
remote:        Installing jekyll-paginate-v2 1.9.4
remote:        Installing jekyll-sitemap 1.2.0
remote:        Using rack-jekyll 0.5.0
remote:        Using jekyll-theme-minimal 0.1.1
remote:        Fetching jekyll-last-modified-at 1.0.1
remote:        Installing jekyll-last-modified-at 1.0.1
remote:        Bundle complete! 12 Gemfile dependencies, 38 gems now installed.
remote:        Gems in the groups development and test were not installed.
remote:        Bundled gems are installed into ./vendor/bundle.
remote:        Bundle completed (4.39s)
remote:        Cleaning up the bundler cache.
remote:        Warning: the running version of Bundler (1.15.2) is older than the version that created the lockfile (1.16.1). We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
remote:        The latest bundler is 1.16.2, but you are currently running 1.15.2.
remote:        To update, run `gem install bundler`
remote: -----> Detecting rake tasks
remote: -----> Precompiling assets
remote:        Running: rake assets:precompile
remote:        Configuration file: /tmp/build_02fecdee16af99fdfb60e024ca330ed4/_config.yml
remote:        Invalid theme folder: _includes
remote:                    Source: /tmp/build_02fecdee16af99fdfb60e024ca330ed4
remote:               Destination: /tmp/build_02fecdee16af99fdfb60e024ca330ed4/_site
remote:         Incremental build: disabled. Enable with --incremental
remote:              Generating...
remote:                 AutoPages: Disabled/Not configured in site.config.
remote:                Pagination: Disabled in site.config.
remote:                            done in 0.556 seconds.
remote:         Auto-regeneration: disabled. Use --watch to enable.
remote:        Asset precompilation completed (1.28s)
remote:
remote: -----> Static HTML app detected
remote:   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
remote:                                  Dload  Upload   Total   Spent    Left  Speed
remote: 100  838k  100  838k    0     0  6185k      0 --:--:-- --:--:-- --:--:-- 6212k
remote: -----> Installed directory to /app/bin
remote: -----> Discovering process types
remote:        Procfile declares types -> web
remote:
remote: -----> Compressing...
remote:        Done: 25M
remote: -----> Launching...
remote:        Released v12
remote:        https://jekyll-heroku-starter-kit.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/jekyll-heroku-starter-kit.git
   4c1eff6..65eeca2  master -> master
```

Visit your Heroku URL (e.g. [https://jekyll-heroku-starter-kit.herokuapp.com][example])
and you should see the same site you built on your local machine, now published
on Heroku.

## Built With

- [Jekyll 3.8.2][jekyll]
- [Heroku][heroku-main]
- [ruby 2.3.3p222][ruby]
- [Homebrew 1.6.3-56-g5e77335][brew]
- [Visual Studio Code][vscode]
- [Bundler version 1.16.1][bundler]

## Contributing

Please read the [CONTRIBUTING.md][CONTRIBUTING] file for details on how you
can get involved in the project as well as the process for submitting bugs
and pull requests.

## Code of Conduct

Please read the [CODE_OF_CONDUCT.md][COC] file for the guidelines that govern
the community.

## Versioning

We use [Semantic Versioning][semver] for software versions of this project.
For a list of all the versions available, see the [tags][tags] and
[releases][releases] on this repository.

## Change-Log

View the [CHANGELOG.md][changelog] file for a detailed list of changes,
along with specific tasks completed for each version released to date.

## Authors

- Justin Hartman - [@justinhartman][author-1]

Also see the list of [contributors][contribs] who have participated in this
project.

## License

This project is licensed under the AGPL-3.0 License. See the
[LICENSE][license] file for full details.

## Acknowledgements

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
[jemoji]: https://github.com/jekyll/jemoji
[jekyll-mentions]: https://github.com/jekyll/jekyll-mentions
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
[vscode]: https://code.visualstudio.com/
[localhost]: http://127.0.0.1:4000
[livesite]: https://ws1.sinaimg.cn/large/006tKfTcgy1frp6xdrivvj30uj0onaeq.jpg
[example]: https://jekyll-heroku-starter-kit.herokuapp.com

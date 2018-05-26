# Change-Log for the Jekyll Heroku Starter Kit

Below is a detailed change-log, along with specific tasks completed, for each
version released to date for the Jekyll Heroku Starter Kit.

## Version 1.1.0 (27/05/2018)

- [#new](#new)
  - Added security headers for the Ruby Static Buildpack [^note-id]
- [#enhancement](#enhancement)
  - Updated `README.md` and `index.md`.
  - Various enhancements with `static.json` edits.

## Version 1.0.1 (26/05/2018)

Minor edits; don't affect functionality.

- [#new](#new)
  - New settings added to VS Code Workspace file.
- [#bugfix](#bugfix)
  - Fixed broken link in `README.md`.
  - Removed unnecessary whitespace in `README.md` and `index.md`.

## Version 1.0.0 (26/05/2018)

First _production-ready_ release. Works out the box.

- [#new](#new)
  - Added the following files required by Heroku:
    - `config.ru`
    - `Procfile`
  - Added `Gemfile` to install Jekyll.
  - New `static.json` for the Heroku buildpack.
  - New `Rakefile` for the Heroku buildpack.
  - `index.md` that contains the contents of the `README.md` for the main site.
  - Added a default minimal site theme (jekyll-theme-minimal).
- [#enhancement](#enhancement)
  - Updated all the `*.md` files from the @justinhartman/.github project.
  - Updated `.gitignore` to exclude all project build files.
  - Added some Visual Studio Code settings to the workspace file.
  - Completed the contents for the `README.md` file with full setup and install
    instructions.

## Version 0.0.1 (26/05/2018)

- [#new](#new)
  - Initial Commit

[^note-id]: These Headers come from the Heroku [Using HTTP Headers to Secure Your Site][blog] blog post.

[blog]: https://blog.heroku.com/using-http-headers-to-secure-your-site

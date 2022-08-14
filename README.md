# Mike Fanger's Dotfiles

I :heart: dotfiles.

## About

Dotfiles are what power your system. These are mine. They're mostly for OS X
since that's what I use. All of the dotfile management is done with
[rcm](https://github.com/thoughtbot/rcm) and packages are managed with homebrew.

## Whats in it?

All of the things that I use on a daily basis. Most of it is based on the
highly opinionated way that I work. Most of the fun stuff is in [bin](https://github.com/mvf4z7/dotfiles/tree/master/bin).

Other highlights include:

* Defaults for git.
* Version management for elixir, erlang, golang, and node (via. asdf)
* Lots of aliases for common commands.

## Install

Running `./bootstrap.sh` will install all dependencies and create symlinks to
all of the dotfiles. I try to make sure its up to date but every now and then
there is a missing dependency. If you need to add new dotfiles or symlinks in
the future then you can simply run `rcup` in the dotfiles dir.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mvf4z7/dotfiles/main/bootstrap.sh)"
```

## Thanks

I originally created my dotfiles based on [Chris Keathleys](https://github.com/keathley/dotfiles) fantastic dotfiles repo.


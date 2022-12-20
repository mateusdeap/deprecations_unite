# DeprecationsUnite

The aim of this tool is to simply make it easier to merge many deprecation lists into one.

**NOTE:** I wrote this to work specifically with [next_rails](https://github.com/fastruby/next_rails) deprecation lists. This is not a generic tool, although
I do think this will be able to merge any json files you pass to it, but that is unintended behavior.

## Requirements

You need to have Elixir 1.13 installed.

## Installation

This is a CLI program and is available in hex.pm. All you need to run is:

```bash
mix escript.install hex deprecations_unite
```
### If you use asdf
In case you use asdf to manage your installed elixir version, make sure to run `asdf reshim elixir` after installing this script.

## Usage

Simply call `deprecations_unite` and give it the relative path to where your deprecation lists are:

```bash
$ deprecations_unite --path [PATH_TO_DEPRECATION_LISTS]
```

The path should be a string literal and it will accept globbing. I guess that is the only way this works, currently:

```bash
$ deprecations_unite --path "lib/deprecations*.json"
```

This will generate a file named `deprecations.json` in your current working directory.

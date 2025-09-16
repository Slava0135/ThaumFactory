# Contributing

## Development tools

It is recommended to use [VSCode](https://code.visualstudio.com) editor with [Lua plugin by sumneko](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).

## Setup

### Clone the repository

Use your code editor or terminal:

```sh
git clone --recurse-submodules https://github.com/Slava0135/ThaumFactory 
```

### Create symbolic link (shortcut) to mod directory

For better development experience it is very recommended linking base mode directory with Factorio mod folder. This way game always loads the mod in its current state without requiring manual copying and pasting.

For Linux users:

```sh
ln -sfT "$(pwd)" ~/.factorio/mods/thaumfactory
```

For Mac users:

```sh
TODO (probably should be the same as Linux)
```

For Windows users:

```text
TODO
```

## General advice

### (IMPORTANT) Do not make large changes before discussing them first

If you are interested in adding a large mechanic/feature or changing large amounts of code/art, __create a feature request first__, to make sure you're not wasting your time on it.

### Always test your changes

Do not submit something without at least running the game to see if it works.

### Do not make formatting or cleanup Pull Requests

Yes, there are occurrences of trailing spaces, extra newlines, empty indents, and other tiny errors.

If the PR doesn't actually change anything useful, it won't be merged.

## Writing code

Check [official modding documentation](https://lua-api.factorio.com/latest/).

## Assets

It is recommended to __not__ use existing art, with exceptions to sound, icons etc.

Check the license, make sure that material can be copied, redistributed and adapted without restrictions (`CC0-1.0`, `CC-BY-3.0`, `CC-BY-4.0`, `CC BY-SA 3.0`, `CC BY-SA 4.0`).

When creating new art, make sure to specify license too!

All attributions must go to `attribution.md` file in the corresponding directory.

## Localization

Check [localization tutorial](https://wiki.factorio.com/Tutorial:Localisation).

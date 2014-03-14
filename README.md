#Neobundle-Packages
> Bringing vim packages to 2014 with the aid of NeoBundle

## Goal

The goal of this project is to gather a list of jsons for installable packages in NeoBundle.

**Shougou** has created a [neobundle-vim-recipes](https://github.com/Shougo/neobundle-vim-recipes) repository
which unifies NeoBundle recipes, but they are in a vim-format, and I want it to be JSON.

Also I recently read an article by **Genki Sugimoto** on the subject of using YAML recipes for NeoBundle. I loved this,
but still want to use the common JSON format.
[Manage Vim Plugins the Beautiful Way using Yaml](http://genkisugimoto.com/blog/manage-vim-plugins-via-yaml/)

Also - I want a format that could in the future be the database of vim plugins (similar to NPM which
is my aspiration for this).

My main focus in creating JSON NeoBundle recipes is 2 things:
1. An easy-parseable and modern format.
2. Utilizing the **lazy** loading feature in NeoBundle, which is crucial when you have many installed plugins.

*(I have 68 packages and that number is growing)*

## Usages

## Future

- A growing list of supported plugins
- A growing conventions that a plugin list database should be created (vim.org is kinda 1999)
- Support on the side of developers exporting their plugins using `(Plug)` or `global commands`.

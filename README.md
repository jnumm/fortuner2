fortuner2
=========

`fortuner2` shows a fortune as a notification. Requires the `fortune`
program (usually in package `fortune-mod`), `notify-send` from
`libnotify` or `libnotify-bin` and `gettext.sh` & `gettext` commands
from GNU `gettext`.

It has about the same functionality as `fortuner`, but the implementation
is lighter. `fortuner` is a C++ application and `fortuner2` is a shell
script.

Installation
------------

1.  Install the dependencies.

    `# aptitude install fortune-mod libnotify-bin gettext-base`

2.  Acquire the source code.
    `$ git clone https://github.com/jnumm/fortuner2`

3.  Build.
    `$ make`

4.  Run.
    `$ ./fortuner2`

Packages
--------
If you're looking for installable packages, there are packages for
Ubuntu/Debian in
[jsonic’s PPA](https://launchpad.net/~jsonic/+archive/ppa/)
and Arch Linux in the [AUR](https://aur.archlinux.org/packages/fortuner2/).

If you would like to package fortuner for your distribution, please go ahead!
You may find the packaging files created by upstream useful:
* [deb](http://bazaar.launchpad.net/~jsonic/+junk/fortuner2-ppa/files)
* [rpm](https://github.com/jnumm/fortuner2/blob/rpm/fortuner2.spec)
* [Arch](https://github.com/jnumm/fortuner2/tree/arch-pkg)

I18n
----
Available translations are compiled and installed by default.

This software is localized with GNU Gettext.
If you would like to translate fortuner2 to your language you'll have to
provide a .po file. Please also provide translation for Name and Comment
strings in fortuner2.desktop. You can also provide a translated man page.

Bugs
----
Please report bugs to fortuner2
[GitHub issue tracker](https://github.com/jnumm/fortuner2/issues) or
directly to the author [Juhani Numminen](mailto:juhaninumminen0@gmail.com).

License
-------
© 2012–2014 Juhani Numminen.

fortuner2 is licensed under GNU GPL v3+
(see [COPYING](https://github.com/jnumm/fortuner2/blob/master/COPYING)
for the full text of the license).

The file fortuner2.appdata.xml is dedicated to public domain with CC0-1.0.

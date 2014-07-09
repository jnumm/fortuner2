fortuner2
=========

`fortuner2` shows a fortune as a notification. Requires the `fortune`
program (usually in package `fortune-mod`), `notify-send` from
`libnotify` or `libnotify-bin` and `gettext.sh` & `gettext` commands
from GNU `gettext`.

`desktop-file-install` will be used during the installation if it’s
detected but is not required.

It has about the same functionality as `fortuner`, but the implementation
is lighter. `fortuner` is a C++ application and `fortuner2` is a shell
script.

Installation
------------

1.  Install the requirements. An example for Debian GNU/Linux:

    `# aptitude install fortune-mod libnotify-bin gettext-base`

2.  Clone the repository (get sources):

    `$ git clone git://github.com/jnumm/fortuner2.git`

3.  Create fortuner script from the template. (You can pass extra
    parameters to make, e.g. PREFIX):

    `$ make`

4.  (Optional) To install (if you don't want to install to system root,
    append DESTDIR= parameter):

    `# make install`

4.  Now you can run Fortuner:

    `$ ./fortuner2`

Packages
--------
If you're looking for installable packages, there are packages for
Ubuntu/Debian in
[Juhani Numminen's Launchpad PPA](https://launchpad.net/~jsonic/+archive/ppa/)
(the packages will be published for the development version of Ubuntu,
currently “utopic”) and Arch Linux in the
[AUR](https://aur.archlinux.org/packages/fortuner2/).

If you would like to package fortuner for your distribution, please go ahead!
You may find the packaging files created by upstream useful:
* [deb](http://bazaar.launchpad.net/~jsonic/+junk/fortuner2-ppa/files)
* [rpm](https://github.com/jnumm/fortuner2/blob/rpm/fortuner2.spec)
* [Arch](https://github.com/jnumm/fortuner2/tree/arch-pkg)

I18n
----
Available translations are compiled and installed by default. To prevent
this, append `TRANSLATED=` to `make` and `make install`.

If you would like to translate fortuner2 to your language you'll have to
provide a .po file. Please also provide translation for Name and Comment
strings in fortuner2.desktop. You can also provide man page translations.

Bugs
----
Please report bugs to fortuner2
[GitHub issue tracker](https://github.com/jnumm/fortuner2/issues) or
directly to the author [Juhani Numminen](mailto:juhaninumminen0@gmail.com).

License
-------
© 2012–2014 Juhani Numminen.

fortuner2 is licensed under GNU GPL v3
(see [COPYING](https://github.com/jnumm/fortuner2/blob/master/COPYING)).

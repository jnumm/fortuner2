fortuner2
=========

`fortuner2` shows a fortune as a notification. Requires the `fortune`
program (usually in package `fortune-mod`), `notify-send` from
`libnotify` or `libnotify-bin` and `gettext.sh` & `gettext` commands
from GNU `gettext`. Also for installation you will need
`desktop-file-install`.

It has about the same functionality as `fortuner`, but the implementation
is lighter. `fortuner` is a C++ application and `fortuner2` is a shell
script.

The script runs at least in `bash`, `dash`, `mksh` and `zsh` shells.

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
If you're looking for installable packages, there exists a package for
Ubuntu/Debian in
[Juhani Numminen's Launchpad PPA](https://launchpad.net/~jsonic/+archive/ppa/)
(The packages will be published for the development version of Ubuntu,
currently `raring`.

If you would like to package fortuner for your distribution, please have
a look on
[DEB](http://bazaar.launchpad.net/~jsonic/+junk/fortuner2-ppa/files) and
[RPM](https://github.com/jnumm/fortuner2/blob/rpm/fortuner2.spec)
packaging files that are maintained by upstream.

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
fortuner2 is licensed under GNU GPL v3
(see [COPYING](https://github.com/jnumm/fortuner2/blob/master/COPYING)).

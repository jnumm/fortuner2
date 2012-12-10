fortuner2
=========

`fortuner2` shows a fortune as a notification. Requires the `fortune`
program (usually in package `fortune-mod`), `notify-send` from
`libnotify` or `libnotify-bin` and `gettext.sh` & `gettext` commands
from GNU `gettext`.

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

Bugs
----
Please report bugs to fortuner2
[GitHub issue tracker](https://github.com/jnumm/fortuner2/issues) or
directly to the author [Juhani Numminen](mailto:juhaninumminen0@gmail.com).

License
-------
fortuner2 is licensed under GNU GPL v3
(see [COPYING](https://github.com/jnumm/fortuner2/blob/master/COPYING)).

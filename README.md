fortuner2
=========

`fortuner2` shows a fortune as a notification. Requires the `fortune`
program (usually in package `fortune-mod`) and `notify-send` from
`libnotify` or `libnotify-bin`.

It has about the same functionality as `fortuner`, but the implementation
is lighter. `fortuner` is a C++ application and `fortuner2` is a shell
script.

The script runs at least in `bash`, `dash` and `zsh`.

Installation
------------

1.  Install the requirements. An example for Debian GNU/Linux:

    `# aptitude install fortune-mod libnotify-bin`

2.  Clone the repository (get sources):

    `$ git clone git://github.com/jnumm/fortuner2.git`

3.  Now you can run Fortuner:

    `$ ./fortuner2`

Bugs
----
Please report bugs to our
[GitHub issue tracker](https://github.com/jnumm/fortuner2/issues).

License
-------
fortuner2 is licensed under GNU GPL v3
(see [COPYING](https://github.com/jnumm/fortuner2/blob/master/COPYING)).

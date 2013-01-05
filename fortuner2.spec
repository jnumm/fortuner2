# RPM spec file for fortuner2.
# It's written by upstream and aims to be distro-neutral.
# It should be updated at every release.
Name:           fortuner2
Version:        0.4.0
Release:        1
Summary:        Shows fortunes as notifications
# Red Hat group
Group:          Amusements/Games
# OpenSUSE group
#Group:          Amusements/Toys/Other
# Mandriva group
#Group:          Toys
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-buildroot
License:        GPLv3+
URL:            https://github.com/jnumm/fortuner2
Source0:        https://github.com/jnumm/%{name}/archive/%{version}/%{name}-%{version}.tar.gz
BuildArch:      noarch
BuildRequires:  desktop-file-utils
BuildRequires:  gettext
Requires:       /usr/bin/fortune
Requires:       /usr/bin/gettext.sh
Requires:       /usr/bin/notify-send

%description
fortuner2 displays a notification containing a random adage. The adages
come from fortune program.

It uses notify-send to deliver the adages to the notification daemon
which in turn shows them to the user.

It has about the same functionality as fortuner, but the implementation
is lighter. fortuner is a C++ application and fortuner2 is a shell
script.

%prep
%setup -q

%build
make %{?_smp_mflags} PREFIX=%{_prefix} SYSCONFDIR=%{_sysconfdir}

%install
rm -rf %{buildroot}
make PREFIX=%{_prefix} SYSCONFDIR=%{_sysconfdir} DESTDIR=%{buildroot} install
desktop-file-validate %{buildroot}/%{_datadir}/applications/%{name}.desktop
%find_lang %{name}

%files -f %{name}.lang
%doc README.md COPYING
%{_bindir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*
%{_mandir}/man6/%{name}.6.gz

%post
/bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null || :

%postun
if [ $1 -eq 0 ] ; then
    /bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null
    /usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
fi

%posttrans
/usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :

%changelog
* Sat Jan 05 2013 Juhani Numminen <juhaninumminen0@gmail.com> - 0.4.0-1
- Update to 0.4.0
  + Configuration file support
- Define SYSCONFDIR in make commands

* Tue Dec 25 2012 Juhani Numminen <juhaninumminen0@gmail.com> - 0.3.0-1
- Update to 0.3.0
  + Use --app-name only if notify-send is new enough
  + Icons
- Add icon cache scriptlets
- Add spacing to the changelog to improve readability

* Mon Dec 24 2012 Juhani Numminen <juhaninumminen0@gmail.com> - 0.2.2-2
- Use _prefix macro instead of /usr and _mandir instead of _datadir/man
- Give install after variable overrides in install step
- Add OpenSUSE Group tag alternative

* Sat Dec 22 2012 Juhani Numminen <juhaninumminen0@gmail.com> - 0.2.2-1
- Initial RPM release

# RPM spec file for fortuner2.
# It's written by upstream and aims to be distro-neutral.
# It should be updated at every release.
Name:           fortuner2
Version:        0.2.2
Release:        2
Summary:        Shows fortunes as notifications
# Red Hat group
Group:          Amusements/Games
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
make %{?_smp_mflags} PREFIX=%{_prefix}

%install
rm -rf %{buildroot}
make PREFIX=%{_prefix} DESTDIR=%{buildroot} install
desktop-file-validate %{buildroot}/%{_datadir}/applications/%{name}.desktop
%find_lang %{name}

%files -f %{name}.lang
%doc README.md COPYING
%{_bindir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_mandir}/man6/%{name}.6.gz

%changelog
* Mon Dec 22 2012 Juhani Numminen <juhaninumminen0@gmail.com> - 0.2.2-2
- Use _prefix macro instead of /usr and _mandir instead of _datadir/man
- Give install after variable overrides in install step
* Sat Dec 22 2012 Juhani Numminen <juhaninumminen0@gmail.com> - 0.2.2-1
- Initial RPM release

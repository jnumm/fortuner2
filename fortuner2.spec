# RPM spec file for fortuner2.
# It's written by upstream and tries to be usable for many distros and
# should be updated at every release.

# Installation directories for the Makefile of the package.
%global fortuner2_directories prefix=%{_prefix} sysconfdir=%{_sysconfdir}

Name:          fortuner2
Version:       2014.11.1
Release:       0.1%{?dist}
Summary:       Shows fortunes as notifications
License:       GPLv3+

%if 0%{?mdkver}
Group:         Toys
%else
%if 0%{?suse_version}
Group:         Amusements/Toys/Other
%else
Group:         Amusements/Games
%endif
%endif

URL:           https://github.com/jnumm/fortuner2
Source:        https://github.com/jnumm/%{name}/archive/%{version}/%{name}-%{version}.tar.gz
BuildArch:     noarch
BuildRequires: desktop-file-utils
BuildRequires: gettext
Requires:      fortune-mod
Requires:      gettext
Requires:      libnotify

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
make %{?_smp_mflags} %{fortuner2_directories}

%install
make install DESTDIR=%{buildroot} %{fortuner2_directories}
%find_lang %{name}

%files -f %{name}.lang
%doc README.md COPYING doc/fortuner2.conf.ex
%{_bindir}/*
%{_datadir}/appdata/*
%{_datadir}/applications/*
%{_datadir}/icons/hicolor/*
%{_mandir}/man6/*

%post
/bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null || :

%postun
if [ $1 -eq 0 ] ; then
    /bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null
    /usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
fi

%posttrans
/usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :

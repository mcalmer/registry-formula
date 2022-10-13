#
# spec file for package registry-formula
#
# Copyright (c) 2022 SUSE LLC
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via https://bugs.opensuse.org/
#


%define fname registry
%define fdir  %{_datadir}/salt-formulas

Name:           registry-formula
Version:        0.9.0
Release:        0
Summary:        Container Registry Formula
License:        Apache-2.0
URL:            https://github.com/mcalmer/registry-formula/
Source:         %{name}-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch

%description
Formula used to setup and configure a container registry

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}%{fdir}/states/%{fname}
mkdir -p %{buildroot}%{fdir}/metadata/%{fname}
cp -R %{fname}/* %{buildroot}%{fdir}/states/%{fname}
cp -R metadata/* %{buildroot}%{fdir}/metadata/%{fname}
cp pillar.example %{buildroot}%{fdir}/metadata/%{fname}/

%files
%license LICENSE
%doc docs/README.rst
%{fdir}

%changelog

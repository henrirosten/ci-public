# SPDX-FileCopyrightText: 2023 Technology Innovation Institute (TII)
#
# SPDX-License-Identifier: Apache-2.0
{
  pkgs ? import <nixpkgs> {},
  pythonPackages ? pkgs.python3Packages,
}:

pythonPackages.buildPythonPackage rec {
  pname = "csvdiff";
  version = "0.0.1";
  format = "setuptools";

  src = ./.;

  postPatch = ''
    substituteInPlace setup.py \
      --replace "version=0.0.0," "version='${version}',"
  '';

  propagatedBuildInputs = [ 
    pythonPackages.pandas
    pythonPackages.colorlog
    pythonPackages.wheel
  ];
}
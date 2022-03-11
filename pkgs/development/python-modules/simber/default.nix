{ lib, buildPythonPackage, fetchFromGitHub, colorama, pytestCheckHook }:

buildPythonPackage rec {
  pname = "simber";
  version = "0.2.4";

  src = fetchFromGitHub {
    owner = "deepjyoti30";
    repo = pname;
    rev = version;
    sha256 = "sha256-P4bhxu9Di4E2Zkd0vIkyDi1S6Y0V/EQSMF4ftWoiXKE=";
  };

  propagatedBuildInputs = [ colorama ];

  checkInputs = [ pytestCheckHook ];
  pythonImportsCheck = [ "simber" ];

  meta = with lib; {
    description = "Simple, minimal and powerful logger for Python";
    homepage = "https://github.com/deepjyoti30/simber";
    license = licenses.mit;
    maintainers = with maintainers; [ j0hax ];
  };
}

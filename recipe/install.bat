@echo off

:: Install
%PYTHON% -m pip install qcs_api_client_common ^
  --no-build-isolation ^
  --no-deps ^
  --no-index ^
  --only-binary :all: ^
  --find-links=wheels ^
  --prefix %PREFIX%

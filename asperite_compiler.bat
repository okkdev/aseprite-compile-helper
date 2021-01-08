@echo off

title Aseprite Compile Helper

set deps=%CD%\deps

echo ========== Downloading latest Aseprite Source Code... ========== 

%deps%\git\cmd\git clone https://github.com/aseprite/aseprite.git aseprite

cd aseprite

rem Trick to get latest release tag
for /f %%i in ('%deps%\git\cmd\git rev-list --tags --max-count=1') do set rev=%%i
for /f %%i in ('%deps%\git\cmd\git describe --tags %rev%') do set latest=%%i

%deps%\git\cmd\git checkout tags/%latest%
%deps%\git\cmd\git submodule update --init --recursive

cd ..

echo ========== Setting Build Vars... ========== 

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -arch=x64

echo ========== Creating Cmake Build... ========== 

mkdir aseprite\build
cd aseprite\build

%deps%\cmake\bin\cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=%deps%\skia -DSKIA_LIBRARY_DIR=%deps%\skia\out\Release-x64 -DSKIA_LIBRARY=%deps%\skia\out\Release-x64\skia.lib -G Ninja ..

echo ========== Creating Ninja Build... ========== 

%deps%\ninja\ninja aseprite

echo ========== Cleaning up... ==========

move bin ..\..\aseprite-%latest%

cd ..\..

rmdir /s /q aseprite

echo ========== Done! ========== 

start aseprite-%latest%
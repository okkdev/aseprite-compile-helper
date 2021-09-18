# Aseprite Compile Helper

Pulls the latest Aseprite source code and compiles it.

## Requirements

To compile Aseprite you need [Visual Studio Community 2019 + Windows 10.0.18362.0 SDK](https://visualstudio.microsoft.com/downloads/).

Install the "Desktop development with C++".

![Desktop development with C++](https://i.imgur.com/lnW0x5L.png)

## Usage

Download the [latest release](https://github.com/okkdev/aseprite-compile-helper/releases/latest).

Run the `aseprite-compiler.bat`.

## Adding dependencies

If you want to add the dependencies yourself, you can just extract the compiled releases into the corresponding folders in the `deps` folder.

- `cmake`
  - [Windows win64-x64 ZIP](https://cmake.org/download/)
- `git`
  - [64-bit Git for Windows Portable](https://git-scm.com/download/win)
- `ninja`
  - [Binary](https://ninja-build.org/)
- `skia`
  - [Skia-Windows-Release-x64.zip](https://github.com/aseprite/skia/releases/latest)

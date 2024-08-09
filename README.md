# Desk-Penguin
 [PenguinMod](https://penguinmod.com) native offline desktop app for Linux and Windows
# Dependencies
- unzip
- zip
- npm (v20 or newer)
- git
- curl

This can only be built on Linux. If you want to do this on Windows, you will have to use something
like WSL (Windows Subsystem for Linux).<br><br>
MacOS is not supported as I can't test the packages on that!! (certified Apple moment)

# How to use
Just open your terminal in the folder of the repositry and run the script with
```
./build-app.sh
```
Thats it! During the process it will ask you if you want to create zip files for the builds.
You can answer with Y or N (Y = Yes and N = No)

# Limitations
Because this is unofficial and it uses a unmodified version of the PenguinMod editor, I can't
add a built in pacakger, or remove the "projects page" and so on. I would have to fork PenguinMod
and keep that fork up to date, which I sadly can't dedicate time to

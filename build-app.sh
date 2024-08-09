echo "Clearing"
clear
rm -rf app/build
rm -rf linux-base
rm -rf windows-base
rm -rf penguinmod-linux.zip
rm -rf penguinmod-windows.zip

echo "Downloading Electron - Linux"
#Getting the electron package from the PenguinMod servers
#Linux
curl --output linux.zip https://packagerdata.turbowarp.org/electron-v22.3.27-linux-x64.zip
unzip linux.zip -d linux-base
rm -rf linux.zip
rm -rf linux-base/resources/default_app.asar
echo "Downloading Electron - Windows"
#Windows
curl --output windows.zip https://packagerdata.turbowarp.org/electron-v22.3.27-win32-ia32.zip
unzip windows.zip -d windows-base
rm -rf windows.zip
rm -rf windows-base/resources/default_app.asar

echo "Downloading PenguinMod"
export NODE_OPTIONS=--openssl-legacy-provider
git clone https://github.com/PenguinMod/penguinmod.github.io.git
cd penguinmod.github.io
git pull
npm install --force
echo "Building PenguinMod"
npm run --silent build
sleep 5s
cp -R build ../app
cd ..
cp -R app linux-base/resources/
cp -R app windows-base/resources/
mv linux-base/electron linux-base/penguinmod-desktop
mv windows-base/electron.exe windows-base/penguinmod-desktop.exe
read -p "Do you want to zip the packages? (Y/N)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    zip -r penguinmod-linux.zip linux-base
    zip -r penguinmod-windows.zip windows-base
fi

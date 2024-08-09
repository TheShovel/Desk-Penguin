clear
rm -rf app/build
rm -rf linux-base
rm -rf windows-base

#Getting the electron package from the PenguinMod servers
#Linux
curl --output linux.zip https://packagerdata.turbowarp.org/electron-v22.3.27-linux-x64.zip
unzip linux.zip -d linux-base
rm -rf linux.zip
rm -rf linux-base/resources/default_app.asar

#Windows
curl --output windows.zip https://packagerdata.turbowarp.org/electron-v22.3.27-win32-ia32.zip
unzip windows.zip -d windows-base
rm -rf windows.zip
rm -rf windows-base/resources/default_app.asar

export NODE_OPTIONS=--openssl-legacy-provider
git clone https://github.com/PenguinMod/penguinmod.github.io.git
cd penguinmod.github.io
git pull
npm install --force --loglevel "error"
npm run --silent build
cp -R build ../app
cd ..
cp -R app linux-base/resources/
cp -R app windows-base/resources/

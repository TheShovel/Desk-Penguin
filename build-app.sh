echo "Clearing"
clear
rm -rf app/build
rm -rf linux-base
rm -rf windows-base
rm -rf penguinmod-linux.zip
rm -rf penguinmod-windows.zip

echo "Downloading Electron - Linux"

#Linux
curl -L https://github.com/electron/electron/releases/download/v31.3.1/electron-v31.3.1-linux-x64.zip > linux.zip
unzip linux.zip -d linux-base
rm -rf linux.zip
rm -rf linux-base/resources/default_app.asar
echo "Downloading Electron - Windows"
#Windows
curl -L https://github.com/electron/electron/releases/download/v31.3.1/electron-v31.3.1-win32-ia32.zip > windows.zip
unzip windows.zip -d windows-base
rm -rf windows.zip
rm -rf windows-base/resources/default_app.asar

echo "Downloading PenguinMod"
export NODE_OPTIONS=--openssl-legacy-provider
git clone https://github.com/PenguinMod/penguinmod.github.io.git
cd penguinmod.github.io
git pull
npm install --force

#VM
echo "Adding VM"
git clone https://github.com/PenguinMod/PenguinMod-Vm.git
cd PenguinMod-Vm
git pull
npm install --force
cd ..
cp -R PenguinMod-Vm node_modules
rm -rf node_modules/scratch-vm
mv node_modules/PenguinMod-Vm node_modules/scratch-vm

#BLOCKS
echo "Adding Blocks"
git clone https://github.com/PenguinMod/PenguinMod-Blocks.git
cd PenguinMod-Blocks
git pull
npm install --force
cd ..
cp -R PenguinMod-Blocks node_modules
rm -rf node_modules/scratch-blocks
mv node_modules/PenguinMod-Blocks node_modules/scratch-blocks

#RENDERER
echo "Adding Renderer"
git clone https://github.com/PenguinMod/PenguinMod-Render.git
cd PenguinMod-Render
git pull
npm install --force
cd ..
cp -R PenguinMod-Render node_modules
rm -rf node_modules/scratch-render
mv node_modules/PenguinMod-Render node_modules/scratch-render

#PAINT
echo "Adding Paint"
git clone https://github.com/PenguinMod/PenguinMod-Paint.git
cd PenguinMod-Paint
git pull
npm install --force
cd ..
cp -R PenguinMod-Paint node_modules
rm -rf node_modules/scratch-paint
mv node_modules/PenguinMod-Paint node_modules/scratch-paint

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

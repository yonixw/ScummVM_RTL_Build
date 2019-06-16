# Using Bluestack 4

## Graphics

In both Windows and Mac you need to enable better graphics in the settings to avoid render problems in the game.

### Windows
Change to DirectX *(Restart emulator to apply)*
![](/images/win_bs_g.png)

### Mac
Check "Use advanced graphics engine mode" *(Restart emulator to apply)*
![](/images/mac_bs_g.png)

## Copy files into the emulator
You cannot access your computer files directly from the ScummVM app. You need to import them into the emulated sdcard. Some games has a lot of files to import into the emulator. Take this steps:

* Zip the files outside Bluestacks
* Put the zip in the shared folder, by OS:
  *  **Note:** The shared folder is accesible only by the built in file manager app.
  *  For Windows: `C:\ProgramData\BlueStacks\Engine\UserData\SharedFolder\`
  *  For Mac:`~/Library/BlueStacks/SharedFolder` or `/Users/**USERNAME***/Library/BlueStacks/SharedFolder` 
* Download any app that can copy files and extract zips and install it in Bluestacks
  *  I recommend *ES File Explorer*. Download the apk [here](/resources/es_file_explorer.apk)
* Use the built in *Media manager* or *Library* app:
   * Click the *Explore* section
   * Click on the *"windows"* folder and then the *"BstSharedFolder"* folder.

You should see the files you put in the shared folder. Long click on the zip and you should see some sharing options if your app support it.

![](/images/share_zip.png)

If you installed *ES File Explorer*:
1) The (right) share options lets you copy the zip to another folder, choose any.
2) Exit the app and open the *ES File Explorer* app
3) Navigate to the folder from step 1
4) Long click the zip and choose *"Extract To"* in the *More* menu.
5) Choose target folder or make new.

![](/images/share_zip_extract.png)

Now all files should be accessible through the ScummVM app where you extracted them (in step 5).

## Menu open (F5)

Click F5 to show the menu where you can save, load and stop games. For anything else, you can press the [Ab] icon on the top left in the ScummVM app to use in-game keyboard.
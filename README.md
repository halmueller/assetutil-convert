#  assetutil-convert

Assetutil-convert is a utility to read the output of the `assetutil --info` command and convert it to CSV.
This CSV summary lets you understand what's inside your `Assets.car` file.

To extract `Assets.car`, you'll need the IPA (archive file) that is distributed by the App Store. You can use the "Apple Configurator" 
utility to do that. This
[article by Alexey Alter-Pesotskiy](https://testableapple.com/note-8/) explains how to grab an app's IPA.

Once you have the IPA, change its extension to `.zip`. Unpack the Zip file and you'll have a folder
with your app and some metadata. Inside the `Payload` folder is your app's binary. Right click and 
choose "Show Package Contents". `Assets.car` is at the top of the folder that opens. That's the file we're going to analyze.

Note that `Assets.car` contains every asset for every size and resolution of iOS device, 
because "Apple Configurator" downloads a universal binary. The report does not
represent what's being downloaded for a particular user, after thinning.

Build this project. Then under Xcode's "Product" menu, choose "Show Build Folder in Finder". 
From the Terminal, you want to do something like this:

`assetutil --info Assets.car | assetutil-convert > assets.csv`

You can drag from the Finder onto Terminal to get the long Derived Data path into the window, or 
you can just move the `assetutil-convert` binary somewhere convenient.

The output looks something like this:

```
Type,Name,"Rendition Name",Scale,PixelWidth,PixelHeight,Idiom,Size
"Icon Image","AppIcon","29.png",1,29,29,phone,334
"Icon Image","AppIcon","57.png",1,57,57,phone,334
"Icon Image","AppIcon","20.png",1,20,20,pad,334
"Icon Image","AppIcon","29.png",1,29,29,pad,334
"Icon Image","AppIcon","40.png",1,40,40,pad,334
"Icon Image","AppIcon","50.png",1,50,50,pad,334
"Icon Image","AppIcon","72.png",1,72,72,pad,334
"Icon Image","AppIcon","76.png",1,76,76,pad,334
"Icon Image","AppIcon","1024.png",1,1024,1024,marketing,18182
"Icon Image","AppIcon","40.png",2,40,40,phone,338
"Icon Image","AppIcon","58.png",2,58,58,phone,334
"Icon Image","AppIcon","80.png",2,80,80,phone,334
"Icon Image","AppIcon","114.png",2,114,114,phone,334
"Icon Image","AppIcon","120.png",2,120,120,phone,334
"Icon Image","AppIcon","180.png",2,180,180,phone,3960
"Icon Image","AppIcon","40.png",2,40,40,pad,338
"Icon Image","AppIcon","58.png",2,58,58,pad,338
"Icon Image","AppIcon","80.png",2,80,80,pad,338
"Icon Image","AppIcon","100.png",2,100,100,pad,338
"Icon Image","AppIcon","144.png",2,144,144,pad,338
"Icon Image","AppIcon","152.png",2,152,152,pad,334
"Icon Image","AppIcon","167.png",2,167,167,pad,334
"Icon Image","AppIcon","60.png",3,60,60,phone,338
"Icon Image","AppIcon","87.png",3,87,87,phone,334
"Icon Image","AppIcon","120.png",3,120,120,phone,334
"Icon Image","AppIcon","180.png",3,180,180,phone,334
"Image","BlueBackArrow","Back.pdf",1,11,18,universal,334
"Image","BlueBackArrow","Back.pdf",2,22,35,universal,334
"Image","BlueBackArrow","Back.pdf",3,33,53,universal,334
...
```

[Asset Catalog Tinkerer](https://github.com/insidegui/AssetCatalogTinkerer) is also worth a look. That
tool lets you see each of the images contained in `Assets.car`.

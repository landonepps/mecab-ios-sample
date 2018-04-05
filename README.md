# mecab-ios-sample
Sample Swift project for MeCab. Updated for iOS 11.

Use the following command to get the mecab-ios submodule as well.

`git clone --recurse-submodules https://github.com/landonepps/mecab-ios-sample.git`

## Setting up your own project

1. Make a new Xcode Swift project and make it a git repository (or let Xcode do it for you).

2. Add `mecab-ios` as a submodule by executing the following command in your project's repository:

`git submodule add https://github.com/landonepps/mecab-ios.git`

3. Select `Add Files to "ProjectName"...` from the Xcode menu and choose `mecab.xcodeproj` in the mecab-ios folder created by adding the submodule. This will import the project and all the necessary files.

4. Drag `mecabrc` from this repository's top directory into your project. Make sure to select `Copy items if needed`. Drag `Mecab.h`, `Mecab.m`, `Node.h`, and `Node.m` from the `mecab-ios-sample` folder in this repository into your project. Make `Copy items if needed` is still selected. Click `Create Bridging Header` when prompted.

5. Open newly created bridging header (`ProjectName-Bridging-Header.h`) and add the following:
```
#import "Mecab.h"
#import "Node.h"
```

6. Open the `mecab-ios` folder in your project's folder and drag the `ipadic` folder into your project. It doesn't matter if you have `Copy items if needed` selected.

7. Click on your project file, go to the target's `General` tab, and add `mecab.framework` in the `Embedded Binaries` section.

8. Go into your target's `Build Phases`, look under `Compile Sources` and add `-fno-objc-arc` to `Compiler Flags` for both `Mecab.h` and `Node.h`. You can do this by double clicking on the files and typing into the box that appears.

9. Still in `Build Phases`, add the following under `Link Binary With Libraries`:

 * libiconv.tbd (this may be listed under 'iOS 11.2' or a similar folder)
 * libstdc++.tbd (this may be listed under 'iOS 11.2' or a similar folder)
 
10. Finally, open the `Build Settings` tab, and add `mecab-ios/**` under "Header Search Paths".

11. You can now access the Obj-C Mecab class in Swift via `let mecab = Mecab()`.

11. Clean and build.

These instrucations are based on the ones from https://github.com/lxmmxl56/iPhone-libmecab

Special thanks to [Joseph Toronto on Stack Overflow](http://stackoverflow.com/a/37891729/3295398) for coming up with these steps.

# mecab-ios-sample
Sample Swift project for MeCab. Updated for iOS 11.

Use the following command to get the mecab-ios submodule as well.

`git clone --recurse-submodules https://github.com/landonepps/mecab-ios-sample.git`

## Setting up your own project

1. Make a new Xcode Swift project and make it a git repository (or let Xcode do it for you).

2. (optional) If you want to use jumandic instead of ipadic, run these git commands to automatically un-gzip sys.dic. (GitHub has a 100MB file limit)

```
git config filter.compress.clean gzip
git config filter.compress.smudge gzip -d
```

3. Add `mecab-ios` as a submodule by executing the following command in your project's repository:

`git submodule add https://github.com/landonepps/mecab-ios.git`

4. Select `Add Files to "ProjectName"...` from the Xcode menu and choose `mecab.xcodeproj` in the mecab-ios folder created by adding the submodule. This will import the project and all the necessary files.

5. Drag `mecabrc` from the top directory of this repository's into your project. Make sure to select `Copy items if needed`. Drag `Mecab.h`, `Mecab.m`, `Node.h`, and `Node.m` from the `mecab-ios-sample` folder in this repository into your project. Make sure `Copy items if needed` is still selected. Click `Create Bridging Header` when prompted.

6. Open newly created bridging header (`ProjectName-Bridging-Header.h`) and add the following:
```
#import "Mecab.h"
#import "Node.h"
```

7. Open the `mecab-ios` folder in your project's folder and drag the `ipadic` folder into your project. It doesn't matter if you have `Copy items if needed` selected.

8. Click on your project file, go to the target's `General` tab, and add `mecab.framework` in the `Embedded Binaries` section.

9. Still in `Build Phases`, add the following under `Link Binary With Libraries`:

 * libiconv.tbd
 * libstdc++.tbd

10. Finally, open the `Build Settings` tab, and add `mecab-ios/**` under "Header Search Paths".

11. You can now access the Obj-C Mecab class in Swift via `let mecab = Mecab()`.

12. Clean and build.

These instrucations are based on the ones from https://github.com/lxmmxl56/iPhone-libmecab

Special thanks to [Joseph Toronto on Stack Overflow](http://stackoverflow.com/a/37891729/3295398) for coming up with these steps.

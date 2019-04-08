# mecab-ios-sample
Sample Swift project for MeCab. Updated for iOS 12.

Use the following commands to clone and get the mecab-ios submodule as well:

`git clone --recurse-submodules https://github.com/landonepps/mecab-ios-sample.git`

## Setting up your own project

1. Create a new Xcode Swift project and make it a git repository (or let Xcode do it for you).

2. Add `mecab-ios` as a submodule by executing the following command in your project's repository:

`git submodule add https://github.com/landonepps/mecab-ios.git`

3. Select `Add Files to "ProjectName"...` from the Xcode menu and choose `mecab.xcodeproj` in the `mecab-ios` folder created by adding the submodule. This will import the project and all the necessary files.

4. Drag `mecabrc` from the top directory of this repository into your project. Make sure to select `Copy items if needed`.

5. Open the `mecab-ios` folder in your project's folder and drag the `ipadic` folder into your project. It doesn't matter if you have `Copy items if needed` selected.

6. Click on your project file, go to the target's `General` tab, and add `mecab.framework` in the `Embedded Binaries` section near the bottom.

7.  Make sure to `import mecab` wherever you need to use it.

8.  You can now call MeCab's C functions directly from Swift -- e.g. `let mecab = mecab_new2("-d \(Bundle.main.resourcePath!)")`.

9.  Calling these functions directly is not ideal, so feel free to use the Swift wrappers that I wrote: `Tokenizer.swift` and `Token.swift`.

10. Clean and build.

These instrucations are based on the ones from https://github.com/lxmmxl56/iPhone-libmecab

Special thanks to [Joseph Toronto on Stack Overflow](http://stackoverflow.com/a/37891729/3295398) for coming up with the original steps.

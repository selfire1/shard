# Shard: Search Obsidian OS-wide 🔎
A messy way to search [Obsidian](obsidian.md) from anywhere in your OS. 

<img src="https://i.imgur.com/ENbE2ER.png" width="500">

This AppleScript-based solution is rather messy still but works so far. If possible for me I intend to make it work a bit smoother in the future.

⚠️ **Limitations:** This version only work in one folder. It does not search sub-folders (yet).

## Setting up the Script
Download the AppleScript from [just above](https://github.com/selfire1/shard/blob/main/search.scpt).

In the first couple of lines there is minor personalisation required:
* Edit this path to point to your Obsidian Vault: `set chosenFolder to "Macintosh HD:Users:Path:to:Vault" as alias`
* Replace "Vault" with the name of your Vault right here: `set vaultName to "Vault"`

## How to use it
### Quick + dirty: using Alfred
Using [Alfred](https://www.alfredapp.com/), you can simply search for the file name of the script, press enter and start it from anywhere.

### Via Hotkey: Hammerspoon
[Hammerspoon](https://www.hammerspoon.org/) is a powerful MacOS automation bridge, written lua. Don't worry, you don't even need to know any lua to trigger Shard Search with a hotkey from anywhere.

1. Download Hammerspoon via it's website.
2. Open the Hammerspoon application. It will prompt you to create a `init.lua` file.
3. Replace the `init.lua` with the file from above. It is supposed to live in `~/.hammerspoon/init.lua`

#### Personalise the script
* Open the  with a text editor (like [Atom](https://atom.io/))
* Modify the hotkey if you'd like to: `hs.hotkey.bind({"cmd", "alt"}, "O"` (default is `cmd + alt + o`)
* Edit this path to point to your Obsidian Vault: `set chosenFolder to "Macintosh HD:Users:Path:to:Vault" as alias`
* Replace "Vault" with the name of your Vault right here: `set vaultName to "Vault"`

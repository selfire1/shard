-- Bind this hotkey to however you would like.
hs.hotkey.bind({"cmd", "alt"}, "O",
function()
 hs.osascript.applescript(
 [[
 -- Edit the path to your vault:
set chosenFolder to "Macintosh HD:Users:Path:to:vault" as alias

-- Enter the name of your vault:
set vaultName to "NameOfYourVault"

tell application "Finder"
	set file_list to name of every file of entire contents of chosenFolder
end tell


set theChosenFile to choose from list file_list with prompt "Select your file:" default items {"Start here.md"}
if the theChosenFile is false then
	error number -128
end if


set theChosenFile to encodeText((theChosenFile as string), true, false)
set vaultName to encodeText((vaultName as string), true, false)


do shell script "open obsidian://vault/" & vaultName & "/" & theChosenFile

on encodeText(theText, encodeCommonSpecialCharacters, encodeExtendedSpecialCharacters)
	set theStandardCharacters to "abcdefghijklmnopqrstuvwxyz0123456789"
	set theCommonSpecialCharacterList to "$+!'/?;&@=#%><{}\"~`^\\|*"
	set theExtendedSpecialCharacterList to ".-_:"
	set theAcceptableCharacters to theStandardCharacters
	if encodeCommonSpecialCharacters is false then set theAcceptableCharacters to theAcceptableCharacters & theCommonSpecialCharacterList
	if encodeExtendedSpecialCharacters is false then set theAcceptableCharacters to theAcceptableCharacters & theExtendedSpecialCharacterList
	set theEncodedText to ""
	repeat with theCurrentCharacter in theText
		if theCurrentCharacter is in theAcceptableCharacters then
			set theEncodedText to (theEncodedText & theCurrentCharacter)
		else
			set theEncodedText to (theEncodedText & encodeCharacter(theCurrentCharacter)) as string
		end if
	end repeat
	return theEncodedText
end encodeText

on encodeCharacter(theCharacter)
	set theASCIINumber to (the ASCII number theCharacter)
	set theHexList to {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
	set theFirstItem to item ((theASCIINumber div 16) + 1) of theHexList
	set theSecondItem to item ((theASCIINumber mod 16) + 1) of theHexList
	return ("%" & theFirstItem & theSecondItem) as string
end encodeCharacter

 ]]
)
end)

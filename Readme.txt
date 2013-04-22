PNDTools
Copyright 2011-2013 Janek Schäfer (foxblock)
Source code licensed under the GPLv3
---
Source code: https://github.com/foxblock/PNDTools
Discussion, bug reports, etc.: http://boards.openpandora.org/index.php/topic/3756-pndtools
Official download: http://foxblock.pirategames.co.uk/programs/pndtools/PNDTools.zip
Contact: foxblock AT gmail DOT com
---
A program to open and create PND files for the OpenPandora on Windows.

How to open a PND file:
1. Click File->Open PND... and select a PND file
2. The file's metatdata (icon and PXML file) and contents will be extracted, this may take a while
3. Metadata will end up in the "meta" folder inside the PNDTools folder
4. Other file contents will end up in the "temp2" folder inside the PNDTools folder
5. You can also monitor the file's content via the tree structure on the main window
6. You can edit the PXML file via the built-in editor by clicking "Edit PXML"

How to create a PND file:
1. Add files to the PND by dragging and dropping files and folders to the tree structure (top of main window)
2. Alternatively click the "Add file..." or "Add folder..." buttons and select files/folders
	- Checking the "Recursive" check box will add folders "recursively", which includes files and folders inside folders inside...
3. Select an icon, which will represent your application (this is optional, but highly recommended)
4. Add a PXML file, which contains information about version, author, etc. (this is mandatory)
	- if you don't have one ready, you can create one using the built in editor or let PNDTools guide you through the process with a simplyfied dialogue
5. Click "Create PND..." at the bottom of the window
6. You are DONE, congrats!

In case something goes wrong (and the log does not print anything useful): 
If you are having trouble creating (or opening) the PND because chmod.exe or mksquashfs.exe keep failing for some reason (and the cmd window does not stay open to show the error), here is what might help to find the error (most likely not fix it though):
Since opening and creating the filesystem is silent you won't be able to see any error occurring there (only the fact that something went wrong). Hence PNDTools provides some batch scripts, which can be used instead of the direct exe call (of mksquashfs, etc.) to keep a terminal of the process (and all messages, errors, etc.) open.
In the PNDTools options (File->Options...) change the paths of chmod and mksquash (or unsquash, 7zip) exes to the .bat files of the same name (so just exchange .exe for .bat).
Set parameters in the Options window will have no effect then, but you can customize the .bat files to your liking,

Notes about the manual PXML editor:
- Creating a new PXML file will only add mandatory data by default, this for example does not include an icon or screenshots, both of which are highly recommended if you want your application to be recognized by users
- You can add these (and other elements) by using the buttons at the bottom of the editor window.
- Make sure you replace default values with your own (most importantly package and application id)
- Optional attributes are displayed with a dark grey key text (instead of a black one), leaving the value field blank will not add those
- Optional boolean values will be set using a check box with three states: checked, unchecked and filled, in which case the attribute will not be added to the final PXML file
- Note that besides input checks (some attributes only allow certain characters), this editor will not do much validation and therefore is NOT recommended for novice users

Notes about the options:
- "Smart file adding" : Will display a popup asking for an action when it detects a special file (icon, pxml, pnd) being dropped on the main window
- "Show file icons" : Proper file icons will be loaded when adding files, which slows down adding files (loading the icons throw Windows will make PNDTools hang for a few seconds after adding a file type for the first time). Disabling it will display a generic folder icon for folders and a blank file icon for any type of file
- "Use binary file size units" : 1KiB = 1024 Bytes vs. 1KB = 1000 Bytes (only affects display)
- "Show messages..." : Affects which messages will appear in the log or as a popup dialogue.
- Paths: Customize the tool paths (see above for an example where this might be useful)
- Parameters: Customize the parameters which will be passed to the tools (only apply when used with executables)

Advanced notes:
- Documentation on PXMLForm taken from: http://pandorawiki.org/PXML_specification
- calling chmod 755 on every file before creating the PND is required since Linux requires folders and executables to have certain file attricutes Windows lacks. Calling it recursively on every file (even ones that don't require this) does not do any harm, but is indeed the lazy way out...


Thanks for using PNDTools!
Please send me any feedback you have :)
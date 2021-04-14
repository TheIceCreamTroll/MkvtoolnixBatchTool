# MkvtoolnixBatchTool

## Description
Windows Batch script to automate batch processing using mkvtoolnix.

## Dependencies
- [MKVToolNix](https://www.fosshub.com/MKVToolNix.html)

## Usage
0. Download MKVToolNix.
1. Open `mkvtoolnix-gui.exe`.
2. Add any of the MKV files to be processed (drag-and-drop works just fine).
3. Perform your changes within the GUI (disable tracks, rename tracks, set default tracks, etc.).
4. Go to `Menu Bar > Multiplexer > Create option file`, and save it as 'options.json' in the same directory where all MKV files to be processed are. You can then close the GUI.
5. Find the `mkvmerge.exe` executable within MKVToolNix and get its path (`Shift + Right-Click > Copy as path` from Windows File Explorer).
6. Download [MkvtoolnixBatchTool.bat](https://raw.githubusercontent.com/TheIceCreamTroll/mkvtoolnix-batch/master/MkvtoolnixBatchTool.bat) from this repository and put it in the directory where all MKV files and the JSON are.
7. Edit `MkvtoolnixBatchTool.bat` and replace `"C:\...\mkvmerge.exe"` with your path to `mkvmerge.exe` from step 5.
8. Run `MkvtoolnixBatchTool.bat` by double-clicking it.
9. Done!

## License
Code licensed under GNU General Public License v3.0.
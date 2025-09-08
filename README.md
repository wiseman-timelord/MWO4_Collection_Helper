# MWO4_Helper
Status: Alpha

### Description:
Its a script to fix issues with my Oblivion Mod Collection, typically the folder structure is incorrect, because the mods were not created when a Vortex was invented. 

### Clarification:
1. Sets working directory to script location. (because we are running it as admin)
2. Prints MWO4 header.
3. Checks for admin rights; exits if not admin. (so there are no issues with moving files)
4. Verifies .\data folder exists; exits if missing. (incase its in the wrong folder)
5. Deletes .\Data\OBSE\Plugins\OBSE_Kyoma_MenuQue.dll if present. (because this is a dummy file that causese issues)
6. Moves Travelers’ Cloaks ESP from nested folder to .\Data. (fix wrong folder structure)
7. Moves Version.dll from .\Data to root. (fix wrong folder structure)
8. Reports whether all 4 Elys Silent Voice files are in .\Data\obse\plugins. (fix wrong folder structure)
9. Pauses before exiting.

## Instructions:
1. Ensure your computer has `Scripting Host` as `Enabled`. If you cant run scripts, then try a tool like `XP-AntiSpy` to `Enable` it.
2. You are intended to Install/Update the collection first, so that it has the mods with the vanilla errors.
3. Copy/Extract the `MWO4_Helper.bat` script directly into the `~\Oblivion` folder.
4. Run the `MWO4_Helper.bat` script as admin, and let it do its thing.
5. Check the results (as it pauses at the end). If errors occur, they will likely be straight forward to fix.

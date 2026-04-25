# codport-shell
A system flexible installer tool
# Commands
**cp-pkg [package name]**
Run package
**cp-on [package name] [argument1]**
Run package with an argument
**cp-install [package name] [url for text file]**
Install package manually
**cp-fetch [package name]**
Install package from CP database
**cp-delete [package name]**
Delete package
**cp-update**
Update Codport
**cp-configure**
Configure Codport Settings & MetaData
**cp-list**
List Installed Codport Packages 
**cp-make  [filename without extension]**
Install .tar.gz file containing txt package instructions
**cp-add [set name]**
Install .tar.gz file containing txt package instructions, from the hosted sets of multiple packages
# CP Database
Supported packages:
python(equivalent to python3 installer)
pyrun(equivalent to python3 runner)
nodeget(equivalent to all NodeJS installing methods)
node(equivalent to the NodeJS compiler)
minecraft(Minecraft Java Edition)
mcpe(Minecraft Bedrock Edition)
chrome(Google Chrome Opener)
pydoc(Python Module Documentation)
tar(Unzip Tar files!)
**And Many More Here and On The Way!**
# Creating downloadable tar.gz packages
Fill with package instructions as .txt files, other files are moved in a special folder(~/bin/cod-[name]/exec).
Compress tar.gz, but make sure users do not rename the file, as the source folder is based on the filename(without extension)
Or you can run **cp-build [filename without extension]** to to make a tar.gz from a .txt file!

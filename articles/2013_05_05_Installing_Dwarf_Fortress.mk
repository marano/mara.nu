## Dwarf Fortress 0.34.11 and Dwarf Therapist on Mountain Lion

There are varies ways to run Dwarf Fortress on a Mac. The easy one, is to get the Mac version from the [download page](http://www.bay12games.com/dwarves/). The problem with that method is that Dwarf Therapist, an indispensable tool for playing Dwarf Fortress, won't work with the its lates version 0.34.11. So the best way to play it is via wine, that won't make it any worse and the game will run fine without requiring configuration tweaking, something that you need to do even with the Mac version. By the way, if you download the Mac version, don't forget to change `PRINT_MODE: 2D` to `PRINT_MODE: STANDARD`, and `TRUETYPE: YES` to `TRUETYPE: NO`, in `data/init.txt`.

Alternatively, you may install it using the [WineBottler](http://winebottler.kronenberg.org/). For instructions see it [here](http://dwarffortresswiki.org/index.php/DF2012:Utilities#Dwarf_Therapist_and_Dwarf_Fortress_on_Mac_using_Wine).

I had some problems with the WineBottler and, being a developer, I prefer to use the command line. This tutorial assumes you know how to use a terminal for simple operations. And it will be easier if you already have homebrew installed.

A pro tip before you start: if you know how to use git, creat a git repository the first time you extract the Dwarf Fortress directory, and commit each time you merge another folders with it. It can make your life a lot easier if something goes wrong, and it's a nice way to keep the game files changes.

1. Homebrew. If you already have it skip to step 2. 

        ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

    1.2 Installing command line tools. Grab and install Command Line Tools (OS X Mountain Lion) from [here](https://developer.apple.com/downloads/index.action). You might need to setup an apple developer account.

2. Mountain lion doesn't ship with X11, so you need to download Quartz from [here](http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg).

3. Wine, winetricks and mono.

        brew install wine
        brew install winetricks
        winetricks mono210

4. Download Dwarf Fortress windows version from [here](http://www.bay12games.com/dwarves/df_34_11_win.zip). Unzip it, and copy it to `~/.wine/drive_c/Program Files`. This will be the Dwarf Fortress Directory.

5. Grab Dwarf Therapist from [here](https://code.google.com/p/dwarftherapist/downloads/detail?name=DwarfTherapist-0.6.12.zip&can=2&q=). Unzip it, and copy it to `~/.wine/drive_c/Program Files`.

6. Choose a tile set or skip it if you don't want one or you plan to install a Major mod.

    * Ironhand [Thread](http://dffd.wimbli.com/file.php?id=6307) [Download](http://dffd.wimbli.com/download.php?id=6307&f=Ironhand+0.73.zip)
    * Phoebus [Thread](http://www.bay12forums.com/smf/index.php?topic=57557.0) [Download](http://dffd.wimbli.com/download.php?id=2430&f=Phoebus_34_11v00.zip)
    * Mayday [Site](http://artgoblin.pl/df.php) [Download](http://artgoblin.pl/upload/DFG/dfg_34_11_win.zip) (Not compatible with the Modest mod.)

    Extract the tile set and copy it to the Dwarf Fortress directory. You can use ditto, for example:

        ditto Phoebus_34_11v00 ~/.wine/drive_c/Program\ Files/df_34_11

    If you installed the Phoebus tile set, then copy the files of `data/init/phoebus/init.txt` and `data/init/phoebus/d_init.txt` to `data/init`. You might need to override these files when coping.

7. Modest mod. You may skip it if you like. Or you can choose another mod from [here](http://dwarffortresswiki.org/index.php/DF2012:List_of_mods), check for compatibility with tile set. From the Modest Mod ([thread](http://www.bay12forums.com/smf/index.php?topic=105871.0)) description:

    > The Modest Mod is a collection of vital bugfixes and tweaks that everyone should be able to use comfortably and without reservation. This mod doesn't add anything new. It doesn't do anything controversial.

    * [Standard version](http://dffd.wimbli.com/download.php?id=6028&f=Modest+Mod.zip)
    * [Phoebus version](http://dffd.wimbli.com/file.php?id=6843)
    * [Ironhand version](http://dffd.wimbli.com/download.php?id=6844&f=Modest+Mod+-+Ironhand.zip)

    Extract it, and copy its content to the Dwarf Fortress directory.

***Done!***

To start game, run from the Dwarf Fortress directory:

    wine Dwarf\ Fortress.exe

And then, to start Dwarf Therapist, run from its folder:

    wine DwarfTherapist.exe

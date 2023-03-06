---
title: "EasyRPG Player"
---

<div class="info" markdown="1">

## How to set up EasyRPG Player for the Web

EasyRPG Player supports running games directly inside your web browser.

If you want to test it you can play with a [Demo of our TestGame](/play/).

You may also try [a real game (Ib)](/play/?game=ib).

### How it works

Web requests are asynchronous. This means that all assets like pictures and music 
must be fetched asynchronously. When the Player wants to display a new graphic 
it will appear on the desktop versions (Windows, Linux, Android, ...) 
immediately but on the web it will be invisible while the file is downloaded. 
Once the downloaded finishes it is replaced with the real image.

In contrast to images and music some files are important to continue execution. 
When a map file is pending the Player will halt until the file is downloaded. 
The first halt is while the Logo is displayed on startup, it downloads the 
database and the maptree here. Download of map files is blocking, too. But this 
is usually not noticeable because the download is executed while the fade out 
animation plays (it will stay black when the map downloading takes longer then 
this).

### Hosting your own games

Hosting your own games is quite simple. Just follow these steps.

#### Deploying the Player on your server

For deploying of the EasyRPG Player any website works. There are already many 
EasyRPG Player powered games on popular gaming sites such as itch.io. Please 
refer to the documentation of your hoster how to deploy the files.

[Download this archive](https://ci.easyrpg.org/job/player-js/lastSuccessfulBuild/artifact/player-js.tar.gz)
and extract it on your server.

You will get the following files and folder:

  * index.html
  * index.wasm
  * index.js
  * games/

If you want to _try it locally_ you need a HTTP server. Just opening the 
``index.html`` in your browser will not work. If you don't have a local 
webserver the simplest way is installing Python and running ``python -m http.server``. Then open ``http://localhost:8000/`` in your browser and navigate 
to your directory.

#### Deploying a game on your server

Because RPG Maker games refer to files without extension and querying the server 
for every supported extension would be slow, you need to run a small tool to 
generate a file called ``index.json`` (containing a game file list index with 
extensions) for every game before uploading. The tool is called ``gencache``.

You can get the tool here:

  * [gencache for Windows](https://ci.easyrpg.org/job/tools-win32/lastSuccessfulBuild/artifact/bin/gencache.exe)
  * [gencache for Linux](https://ci.easyrpg.org/job/tools-linux/lastSuccessfulBuild/artifact/gencache.tar.gz)
  * [gencache for macOS](https://ci.easyrpg.org/job/tools-macos/lastSuccessfulBuild/artifact/bin/gencache)

Place the gencache executable in a game working folder (the folder containing 
RPG_RT.* files) to generate the ``index.json``. Move the ``gencache`` executable 
to the all game folders you want to upload and run ``gencache`` again. Once 
finished you can delete ``gencache`` from any game folder to reduce the upload 
size.

Your games are expected in subdirectories of the ``games`` directory. The 
default game executed is the one in ``games/default``. You can create further 
games by just by putting them in subdirectories of the ``games`` directory.

Now access the ``index.html`` file and your default game should start. To play a 
different game pass ``?game=folder_name`` as part of the URL (query string) to 
your index file.

### Troubleshooting

#### My spritesheets look corrupted

The web player has only a limited automatic engine detection. You must add 
``engine=rpg2k3e`` to the query string of the URL to enforce spritesheet 
support.

### Special files

EasyRPG Player processes the following files on game startup. Just put them in 
the game directory and rerun ``gencache``.

#### ExFont.png

The ExFont consists special symbols that can be used in message boxes. If your 
game uses a custom ExFont you can provide it here.

#### easyrpg.soundfont

If you are unhappy with the default MIDI acoustics (powered by FmMidi) you can 
alternatively provide a soundfont in SF2 format. Please use a small file. Some 
soundfonts have hundreds of megabytes in size.

</div>

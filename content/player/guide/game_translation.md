---
title: "EasyRPG Player"
---

<div class="info" markdown="1">

## Translating games

### Motivation

Translating RPG Maker games is quite complicated and there are two possibilities:

In the first variant, the translation is realised by adding branches in the code. However, this only works for message boxes, not for database entries such as items. In addition, only translations that are compatible with the respective character set of the game can be offered (English and Japanese work, but Japanese and Russian not).

The second variant is more flexible, but much more difficult to maintain: the entire game is simply copied and the strings translated accordingly. Updates are cumbersome because the event code must be updated in all game translations.

There are countless tools that automate variant two by extracting the strings and then integrating them back into the game files.

The translation function in EasyRPG Player is similar to variant two, but is easier to maintain because the player can process the translation files directly.

### First Steps

First create a new folder called ``Language`` in your game folder. In this folder you can create further subfolders (one for each translation). The folder name does not matter. In the following we will call the folder ``LANGUAGE_NAME``.

In the folder ``LANGUAGE_NAME`` you must first create a file named ``Meta.ini`` with the following content:

~~~ ini
[Language]
Name=Name of the Language Here
Description=Short Description, e.g. the Author
Code=The language code (IETF tag), e.g. "de_DE" for German
Term=Translation of the word "Language" in the target language
~~~

You may alter the texts to the right of the "is equal to" (=).

``Name`` and ``Description`` are shown on the title screen of your game.

The ``Code`` is required for proper text rendering and displaying the correct name input scene. Currently the Player has special support for the following codes but we recommend that the code is always given so that old translations can also benefit from updates.

| Code      | Language                                |
|-----------|-----------------------------------------|
| ``ja_JP`` | Japanese                                |
| ``ko_KR`` | Korean                                  |
| ``ru_RU`` | Russian                                 |
| ``zh_CN`` | Chinese (Simplified)                    |
| ``zh_TW`` | Chinese (Traditional)                   |

The value after ``Term`` is shown on the title screen for the "Language" menu entry when this translation is active.

Now give it a try: When you run your game, you will see a new "Language" entry on the title screen. In this submenu you will find your entries from the ``Meta.ini``. If this works, you can now start translating.

### Generating language files

You will need the tool ``lcftrans``:

  * [lcftrans for Windows](https://ci.easyrpg.org/job/tools-win32/lastSuccessfulBuild/artifact/bin/lcftrans.exe)
  * [lcftrans for Linux](https://ci.easyrpg.org/job/tools-linux/lastSuccessfulBuild/artifact/lcftrans.tar.gz)
  * [lcftrans for macOS](https://ci.easyrpg.org/job/tools-macos/lastSuccessfulBuild/artifact/bin/lcftrans)

Place the tool in a place where you can find it again :). For this guide we assume that it is in ``LANGUAGE_NAME``.

``lcftrans`` is a command line tool. It cannot be executed by double-clicking.

Under Windows navigate to ``LANGUAGE_NAME`` with the Windows Explorer and open a command line with "File → Open Windows Powershell".

Under Linux or macOS, first open the console/terminal and then navigate to the folder ``LANGUAGE_NAME`` using ``cd``.

``lcftrans`` has three modes: create (``-c``), update (``-u``) and match (``-m``). For new projects you have to create the translations once and afterwards you must update them when you have added new texts to your game. **If you use the create mode again, all changes will be lost!**

Execute the following command in your console (assuming ``lcftrans`` is in the current directory):

~~~ powershell
.\lcftrans -c ../../ # Windows
~~~
~~~ shell
./lcftrans -c ../../ # Linux and macOS
~~~

After execution you will see a lot of po-files in the folder. These contain all the strings that can be translated:

  * ``RPG_RT.ldb.po``: Contains all database terms except event commands
  * ``RPG_RT.ldb.common.po``: Contains all messages found in Common Events
  * ``RPG_RT.ldb.battle.po``: Contains all messages found in Battle Events
  * ``RPG_RT.lmt.po``: Contains all map names. Translating them is only required when using the Teleport event command because it displays the map names.
  * ``Map####.po``: Contains all messages found on the corresponding map

### Translating text

These po-files are text files. You can edit them with any text editor, however we recommend special tools like [PoEdit](https://poedit.net/).

If you use a plain text editor, note that your translations must be in ``msgstr`` and do not forget the ``\n`` at the end of each line.

### Translating assets

Many games also contain text on graphics, and a few even have voiceover.

These assets can also be translated. All you have to do is mirror the corresponding path in the translation folder.

For example, the translated version of ``Picture/Intro.png`` is located in ``Language/LANGUAGE_NAME/Picture/Intro.png``.

EasyRPG Player already supports the display of many languages, but you can also use your own font. To do so, place the files ``Font.ttf`` or ``Font2.ttf`` in ``Language/LANGUAGE_NAME/Font`` (besides ``ttf``, other formats such as ``fon`` or ``bdf`` are also supported). Which of the two files is used depends on the font setting of the system graphic.

If the game already provides custom fonts and they are unsuitable for your translation add ``Font=Builtin`` to the ``Meta.ini`` to force the usage of the font bundled with EasyRPG Player.

### Updating translations

If you have added new texts to your game, you must run the update mode of ``lcftrans``:

~~~ powershell
.\lcftrans -u ../../  # Windows
~~~
~~~ shell
./lcftrans -u ../../  # Linux and macOS
~~~

The po-files are now updated. Strings that no longer exist are removed and new ones are added.

If ``lcftrans`` cannot match a translated string, it is written to a ``FILENAME.stale.po`` file. If you no longer need these translations, you can delete these files.

### Games that were also published in multiple languages

In some cases, the game is already available in multiple languages by directly translating the strings in the database and on the map.

It is difficult to maintain several projects of the same game, especially when making updates.

If you want to move such games to ``lcftrans``, you can use the _match mode_.

In this mode  ``lcftrans`` can generate po-files containing both the source and the translation string.

Be warned that this will not work when the database items are out of sync, e.g. if the original has more items or skill than the translation. The same applies to messages: When original or translation have a different number of messages, the matching will probably fail.

First generate the po-files of the original and of the translated game as explained above.

Assuming the po-files of the original, untranslated game are in ``original`` and the po-files of the translation are in ``translation`` you can invoke:

~~~ powershell
.\lcftrans -m translation original # Windows
~~~
~~~ shell
./lcftrans -m translation original # Linux and macOS
~~~

Afterwards you will see that the strings from the translation were added to the original.

Do not forget to check the matching for correctness. This feature will save a lot of time but the result will contain errors!

### Translating the default terms

The default language of the game is displayed on the title screen as "Default language". These values can also be translated. To do this, create a new folder called ``default`` in the ``Language`` folder. Create a ``Meta.ini`` there as described above. The values of ``Name``, ``Description`` and ``Term`` are then applied to the default language. However, all other options and also the replacement of assets are not supported.

### Special commands

You can use the special commands within your translation. The commands must appear isolated on one line.

Use ``<easyrpg:new_page>`` in your translation to force a page break. The message output will wait for user input and display an animated arrow. This command only works if it is in the middle of a message. It has no effect on the first and last line.

Use ``<easyrpg:delete_page>`` in the first line of a translation to completely remove the message box. This is useful when the translation is shorter than the original.

### Troubleshooting

#### The strings in the translation file look corrupted or I get a "Parse Error".

Probably ``lcftrans`` has detected the language incorrectly. You can also force the language. Append one of the following numbers at the end of the ``lcftrans`` commandline:

| Code | Language                                |
|-----:|-----------------------------------------|
| 932  | Japanese                                |
| 936  | Chinese (Simplified)                    |
| 949  | Korean                                  |
| 950  | Chinese (Traditional)                   |
| 1250 | Central European (Polish, Czech, ...)   |
| 1251 | Eastern European (Cyrillic)             |
| 1252 | Western European (English, German, ...) |

If you want to translate an English game and you still get a parse error, try 932. This is necessary because some game databases still contain Japanese texts.

</div>

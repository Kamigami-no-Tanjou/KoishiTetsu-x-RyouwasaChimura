[djs-shield]: https://img.shields.io/badge/Discord%20API-discord.js-blue.svg
[flask-shield]: https://img.shields.io/badge/Python%20framework-Flask-purple.svg
[lua-shield]: https://img.shields.io/badge/Lua-5.4.4-darkblue.svg
[DB-shield]: https://img.shields.io/badge/Database-MySQL-darkgreen.svg
[license-shield]: https://img.shields.io/badge/License-MIT-white.svg
[discord-shield]: https://discord.com/api/guilds/861918152669396992/widget.png

[discord.js]: https://discord.js.org/#/
[flask]: https://flask.palletsprojects.com/en/2.1.x/
[lua]: https://www.lua.org/
[DB]: https://www.mysql.com/fr/
[license]: https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE
[discord]: https://discord.gg/g6XuGQTKZd
[main]: https://github.com/Kamigami-no-Tanjou/Koishi-Tetsu-v3/blob/main/JDA_CLIENT/app/src/main/java/JDA_CLIENT/Main.java
[devportal]: https://discord.com/developers/
[architecture]: https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/ArchitectureImplementation.md

[ ![djs-shield][] ][discord.js]
[ ![flask-shield][] ][flask]
[ ![lua-shield][] ][lua]
[ ![DB-shield][] ][DB]

[ ![license-shield][] ][license]
[ ![discord-shield][] ][discord]

# KoishiTetsu-x-RyouwasaChimura
The goal of this bot is to take care of all the basic moderation tasks not already handled by
discord commands, as well as taking care of a few specific functions that are mostly issued from
my desires.

The bot will follow the structure defined in the [Architecture Implementation][architecture]
markdown file of this repository

## Layers
According to the previously cited document, this bot's implementation is constituted of several
layers, which I'll list from the lowest to the highest.
1. The database
2. The entities
3. The use cases
4. The controllers
5. The endpoints
6. The processors and presenters

The database is made with MySQL, while the entities and use cases are made with Lua, the
controllers and endpoints with Python, and finally the processors and presenters in
Javascript.

## How to use this repository?
First, since there is no release yet, you should start by cloning or forking it if you plan on
making your own version.

Once done, and before to make it run, you will have to create your discord bot application, and
make sure it handles slash commands.

The next step will be to recreate the Database, using the scripts in /DBScripts **in the right
order.** You can name it as you wish, but you will need to have MySQL installed on your device
and to use it via a user that has sufficient permissions.

Then you will have to recreate the following configuration files, that are not included within
the repository for safety reasons (aka. not exposing my DB connection informations & my
discord application token).

#### /config.conf
This file has to be put at the root of the project. For now it only tells the program whether it
is running as a test or a production version.

This is what it contains :
```
<Running version>
```
You'll have to replace the `<Running version>` tag by `TEST` or `PROD`.

#### /Chimura/dbAuth.conf & /Chimura/dbAuthTest.conf
Those two files contains authentication information to your database. `dbAuth` will be used
when launching as a production version (cf `config.conf`), while `dbAuthTest` will be used
when launching as a test version. That allows you to freely make tests that could compromise
your database's data with no fear, hence it allows you to connect the bot to two different
databases.

Their structure is the exact same and is the following :
```
<Database name>
<Username>
<Password>
```
As in the config file, you will have to change the tags with the corresponding values that
matches your own configuration.

#### /Tetsu/token.conf & /Tetsu/testToken.conf
As indicated by their names, these files must contain your discord application token. Just
like `dbAuth` and `dbAuthTest`, one will be used in test mode and the other one in production
version.

That allows you to basically have two instances of your bot running at the same time
(practical when you already have a production version running, but still want to make
upgrades without interrupting the service).

This is what they look like : (don't mind the json-ish appearance while not being a .json file)
```json
{
    "token": <Application token>
}
```
Aaaand... that's it. I mean, what else did you expect to find out there?

Anyway, these two files will be read by the Main.js when booting the bot, to determine where
its instance should connect.

### Dependencies
Ah, dependencies... Well, yes, there are dependencies needed for this program to work. Here's
the list and how you should install these. (This will only be documented for Ubuntu-like
distros, 'cause this is what I personally use and I'm a bit lazy to just go through the whole
process once more for several other platforms.)

#### Lua dependencies:
Let's start with Lua! There are only two dependencies to count here, which are the following:
- lunajson, used to make json strings out of Lua tables and reverse
- LuaSQL.mysql, used to connect and make transactions with the MySQL database.

Here's how to install them:
```bash
lunajson :
$ luarocks install lunajson
LuaSQL.mysql :
$ luarocks install luasql-mysql
```
Simple, right? Well, actually no. Problems you might face are that you might not have luarocks
installed, even though it should come with Lua. You will also need to have the mysql C driver
installed on your machine (to know more about that, just run the second command and search
for what you've obtained on the web).

#### Python dependencies:
Then comes the blue and yellow snake. Only three libraries will be needed there. And they all
should be install via python pip installer.

Here's the list:
- flask
- flask_restful
- flask_cors

#### Javascript "dependencies":
I'm calling these dependencies just to put them in the same bag as the other languages, even
if it's not quite the same story.

Anyway, for the Javascript part to run, you will need node.js and discord.js.

To install node, simply type the following command in your terminal:
```bash
$ sudo apt-get install nodejs
```
Then, (still within your terminal) you'll have to navigate through to the /Tetsu directory,
in which you will need to use the command:
```bash
$ npm install discord.js
```
to install the discord.js module. You won't have to initialize the repository, since I will
have already done it, though I'm not going to push the `node_modules` directory, which is why
you will have to install modules on your own.

### Starting procedure
For now, as I am still quite far from having a viable production version, I didn't make a bash
script to launch the bot all at once yet. That is planned though, but for now you will have to
manually start the Main.py (in `/Chimura`), after what you'll have to start the Tetsu repo
(using `npm start` command within `/Tetsu`).

## Legal terms
As every project available to public in this organization, it is licensed under MIT copyright.
More info by clicking the License shield at the top.

Copyright © 2022 Kamigami no Tanjou

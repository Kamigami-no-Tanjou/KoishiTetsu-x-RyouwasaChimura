# Architecture and interaction of the different layers within the project 'Koishi Tetsu v4 x Chimura Ryouwasa'

## 1 - Followed architecture:
![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.O4pMWCi5kZi20SNOR6V33QHaFP%26pid%3DApi&f=1 "Clean architecture scheme") <br>
In order to lead this project to its fullfilment, I decided to follow the Clean Architecture... or kind of. So let's see how it is going to be.

### 1.1 - Rapid overview
The project, or perhaps its architecture could be visualized through this very simple text diagram:
```
DISCORD <======> FRONT (JS) <======> GATEWAY (PYTHON) <======> BACK (LUA) <======> DATABASE (MYSQL)
```
where Discord is obviously the client, what users will see, and the more we go towards the right, the deeper we dig through the different layers of the project. As you might have seen, the "front" part, which will directly interact with the discord API via the discord.js module, will be written in Javascript. The "gateway" will be written in Python. It is pretty much the core of the program, as it will relay the demands from the users (front) to the database by executing Lua scripts, and give their outputs back. Then we have the "back", in Lua which will treat the demands, and deal with the database when necessary. The database is going to be made using MySQL for practicality reasons.

## 2 - The concrete application:
### 2.1 - The Database:
So, the database will be the place where every data that NEEDS to be stored will be stored. It aims not to store any data that isn't needed to, in order to be respectful to the private life of every user, especially when taking into consideration the fact that users may not always get to choose which bot they will have to deal with (because they don't own all the servers - or guilds should I say - they're on).<br>
It is important to mention that because it somehow has a bit of an influence on the way to design it, hence we can't simply just store everything as if it was ours.

According to the bots main targeted functions, the tables of the database are grouped within three different categories, more or less independant one to another:
- The Moderation category, which will gather all the primordial functions of the bot. While the two others might be pretty removable, this one ISN'T ; simply because there's no bot if it's not there...
- The Command category. That might sound odd, but in itself, the bot could still run smoothly without that part. However, users wouldn't be able to use it because it would just stay idle when receiving the calls...
- The RolePlayingGame category. This one is very specific though, and having it or not would probably not change the daily life of every user by an inch. Though for some others, it could simply be a game changer when it comes to choosing which bot they should use on their server. So let's just try not to do a terrible job here.

The below class diagram demonstrate how things will be agenced in the database, and defines a bit the process we will have to go through when making the use cases. <br>
![](https://media.discordapp.net/attachments/861943124355055667/1005514914493911161/unknown.png?width=1228&height=663 "Database class diagram")

### 2.2 - The Back-end:
The back-end will cover the two inner layers of the clean architecture, that is to say the Entities and the Use cases.

The Entities layer will be constituted of DAO classes, reflecting the content of the database, as well as some Service scripts that will provide for every and each of the DAO classes, functions such as `retrieve`, `insertOrUpdate`, `delete`, etc... These are meant to be called staticly, and will take care of verifying, in each and every of their functions, that the changes that will be made to the DAO objects respect the database cosntraints and rules.

Then, the Use cases layer is all about actual use cases... as its name may indicate. It is the layer that will carry out all the treatments requested explicitly by the users. They will of course use the Service scripts to access and modify the database ; and as well as those, they will be scripts, triggered by the Python gateway.

Here's the organization we are going to follow to keep things sorted:
```
Back-end
 |- Domain
 |   |- Entities
 |   |   |- Class1.lua => A file containing a signle Lua class.
 |   |   |- ...
 |   |
 |   |- Services
 |       |- Class1Service.lua => A file containing all the DB services for Class1 class.
 |       |- ...
 |
 |- Application
     |- Class1UseCases
     |   |- UpdateClass1UseCase.lua => The use case in which we will make the changes.
     |   |- GetClass1UseCase.lua => The use case in which we will retrieve Class1 infos.
     |   |- ...
     |
     |- ...
```
It is very important to keep things this way, otherwise we will simply get lost in the making and we will spend way too much time trying to look for what we want to edit.

### 2.3 - The Gateway:
As described earlier, the gateway is made with Python, and uses the Flask Restful framework to design a RESTful API that is then called by the client (in Javascript), providing it access to the data inside the database. It is the proper core of the program, as it is the only one that will have to keep on runing permanently to catch the events generated by the client and ask the back-end to process the treatments associated with the event received.

Although I described this part as the core of the program, I didn't included it in the back-end, for the one and simple reason that it will NOT have to think. Its only purpose is to receive events, and return their result, without even having a look at what it actually recieved, nor what it is answering. The HTTP code to return itself will be provided by the called use case.

That being said, the gateway will be separated in different parts:
- The controllers, classes representing a type of data, that will possess http-like methods, such as `get()`, `post()`, `put()` and `delete()`. At the end of every one of them will be a line of code that will add the route they will serve.
- The main script, which will be the API's starting point. For each new controller, it will have to be edited to add it to the routes 'list' before to start everything up.

So, just like we did for the back-end, let's do a quick recap of how it is going to be agenced within the repository:
```
Gateway
 |- Controllers
 |   |- DataType1Controller.py
 |   |- ...
 |
 |- Main.py
```
### 2.4 - The Front-end:
The front-end, or more precisely, the Discord client will be written in Javascript. It will use node.js, and its module discord.js.

It is the one part I am the most unsure of how I should realize. There will of course be the starting point, that will primarily add all the commands to all the servers it serves, but then I'm not too much of a fan of the 'all-in-one' policy when it comes to code. So I would like to divide the parts in separate .js files that I would call thanks to the EcmaScript6 import and export syntax. 

Perhaps that's the idea I'll be following... And taking it all into consideration, I think the most appropriate solution is to go with the following structure:
- At first, there is the starting point, the one that will receive all the events.
- Then the events will trigger Processors' functions, which will call the API (notably using `fetch`)
- And finally the Presenters, called by the Processors' functions within the fetch statement, which will be used to display output correctly to the UI.

Which gives the following repo organization:
```
Front-end
 |- Processors
 |   |- Process1Process.js
 |   |- ...
 |
 |- Presenters
 |   |- Presenter1Presenter.js
 |   |- ...
 |
 |- Main.js
```

## 3 - Conclusion:
### 3.1 - Global application diagram
![](https://cdn.discordapp.com/attachments/861943124355055667/1005900938621485157/Architecture_diagram.png "Global application diagram")

### 3.2 - Global repository organization
Alright, now's the time to put everything together and look at what the result is!
```
KTxRC (project root)
 |- DBScripts
 |   |- S01_Goal_Range_Date.sql
 |   |- ...
 |
 |- Back-end
 |   |- Domain
 |   |   |- Entities
 |   |   |   |- Class1.lua
 |   |   |   |- ...
 |   |   |
 |   |   |- Services
 |   |       |- Class1Service.lua
 |   |       |- ...
 |   |
 |   |- Application
 |       |- Class1UseCases
 |       |   |- UpdateClass1UseCase.lua
 |       |   |- GetClass1UseCase.lua
 |       |   |- ...
 |       |
 |       |- ...
 |
 |- Gateway
 |   |- Controllers
 |   |   |- DataType1Controller.py
 |   |   |- ...
 |   |
 |   |- Main.py
 |
 |- Front-end
 |   |- Processors
 |   |   |- Process1Process.js
 |   |   |- ...
 |   |
 |   |- Presenters
 |   |   |- Presenter1Presenter.js
 |   |   |- ...
 |   |
 |   |- Main.js
 |
 |- Run.sh (ultimately)
 |- README.md
 |- ArchitectureImplementation.md (this document)
 |- LICENCE (MIT)
 |- ...
```
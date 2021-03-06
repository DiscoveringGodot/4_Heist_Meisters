﻿﻿# Discovering Godot - The Game Engine You've Been Waiting For
##
Section 4 - Heist Meisters

This is GameDev.tv's guide to the free and open source Godot game engine.  Learn the free to use, free to modify, free to create engine with one of the most successful online game develeopment educational groups out there.

You're welcome to download, fork or do whatever else legal with all the files! The real value is in our huge, high-quality online tutorials that accompany this repo.


## In This Section

reate a tense and dramatic top-down stealth game while you learn more advanced Godot techniques!
(Our ref: HM_GDT)


## How To Build / Compile
This is a Godot project. If you're familiar with source control, then "clone this repo". Otherwise download the contents and place them in your projects folder, then import the project in Godot's launcher.

This branch is the course branch, each commit corresponds to a lecture in the course. The current state is our latest progress.


## Lecture List
Here are the lectures of the course for this section...


### 1 Designing Heist Meisters
#### In this video (objectives)…
1 Discuss the game we're making
2 Examine the features we'll need to create

#### After watching (learning outcomes)…
Plan out the central mechanics and feeling of our tense, top-down stealth game!


### 2 Installing Assets for Heist Meisters
#### In this video (objectives)…

1 Where to find the assets
2 Where to find additional Assets
3 a Quick overview of what's included

#### After watching (learning outcomes)…
Install the assets we'll need for our game

### 3 Making a Character Scene
#### In this video (objectives)…

1 Create a Character scene and script as templates

#### After watching (learning outcomes)…
Understand how to use template scenes and scripts in your games

### 4 The Player Character
#### In this video (objectives)…

1 Create a Player scene that inherits from the Character scene
2 Create a Player script that extends the Character script
3 make the player character move and look at the mouse position

#### After watching (learning outcomes)…
Inheriting scenes and extending scripts

### 5 Turning a Tilemap into an Autotile
#### In this video (objectives)…

1 Set up an Autotile to make levels creation easy
2 Add collision to our Autotile
3 Create a basic test level

#### After watching (learning outcomes)…
Autotiles, Bitmasking and Auto-Collision

### 6 Adding Floors
#### In this video (objectives)…

1 Set up a quick and easy tilemap for floors
2 Add floros to our level

#### After watching (learning outcomes)…
How to work with Tilemaps and Autotiles at the same time

### 7 Light2D Nodes
#### In this video (objectives)…

1 Set up a ``Light2D`` node
2 Set up Occlusion is autotiles and characters
2 Enable shadows

#### After watching (learning outcomes)…
How to bring dynamic lighting and shadows into a 2D game

### 8 Making a Security Camera
#### In this video (objectives)…

1 Create a Security Camera
2 Correctly set up the Torch node for it
3 Add physics layers

#### After watching (learning outcomes)…
Get the security camera in game ready for the player detection system!


### 9 Player Detection Part 1 - Field of View
#### In this video (objectives)…

1 Set up FOV
2 Calculate the npc's direction
3 Get the direction to the Player
4 Determine if the NPC can see the Player

#### After watching (learning outcomes)…
Get the first phase of player detection set up!


### 10 Player Detection Part 2 - Line of Sight
#### In this video (objectives)…

1 Draw a ray from the NPC to the Player
2 Check what's intersecting the ray
3 Check if the Player is in Range

#### After watching (learning outcomes)…
Finish off Player detection with Line of Sight and detection range


### 11 Adding Guards
#### In this video (objectives)…

1 Create a Guard Scene that extends the PlayerDetection.gd script
2 Fix the Torch scenes
3 Populate/Recreate our level

#### After watching (learning outcomes)…
Get some Guards!


### 12 Moving Guards Part 1- Navigation2D
#### In this video (objectives)…

1 Setting up ``Navigation2D``
2 Creating a ``NavigationPolygonInstance``
3 Using ``Position2D`` nodes to mark destinations

#### After watching (learning outcomes)…
Get pathfinding set up for HeistMeisters!


### 13 Moving Guards Part 2- get_simple_path()
#### In this video (objectives)…

1 Using ``get_simple_path``
2 Making sure that pathfinding works no matter wher we put our destinations
3 Have the guard move along a pathfinding
4 Have the guard wait at their destinations
5 Troubleshooting guards getting stuck

#### After watching (learning outcomes)…
Have pathfinding and guard movement fully implemented


### 14 Adding Furniture With a Tilesheet
#### In this video (objectives)…

1 Setting up a Tilesheet
2 Adding Collision and Occlusion to tiles
3 Rotating Tiles

#### After watching (learning outcomes)…
Install furniture in out level


### 15 Nightvision Mode
#### In this video (objectives)…

1 Set up Nightvision
2 Use an Enum to list possible vision modes
3 Use ``call_group()`` to change vision modes

#### After watching (learning outcomes)…
Enable nightvision mode through enums and the amazing power of groups!


### 16 Turning Off the Lights In Nightvision
#### In this video (objectives)…

1 Set up an NPC Group
2 Use ``call_group()`` to have all NPCs switch torches on or off as needed

#### After watching (learning outcomes)…
Make all torches switch off when the Player is using Nightvision


### 17 Making a Simple Door
#### In this video (objectives)…

1 Use an ``Input_event()`` function to detect if a player is clicking on a door
2 Only allow players to open a door if in range
3 Set up different logic for NPCs and players using doors
4 Add sound effects to doors

#### After watching (learning outcomes)…
Create simple doors that open if the player is in range and clicks on them!


### 18 Beautiful Security - Using Themes
#### In this video (objectives)…

1 Create a Numberpad as a ``Popup`` Node
2 Use ``Container`` nodes to organise the Numberpad
3 Use Grid Container to organise the buttons
4 Beautify the Numperpad with a Theme

#### After watching (learning outcomes)…
Learn the wonder of Themes in Godot!


### 19 Making a Locked Door Part 1
#### In this video (objectives)…

1 Fix the bug that causes all doors to open when the level loads
2 Create Locked door that inherits the Door scene and extends the Door scripts
3 Have the Numberpad popup when the player clicks on a locked door

#### After watching (learning outcomes)…
Simple debugging techniques and how to show and hide ``Popup`` nodes


### 20 Making a Locked Door Part 2 - Wiring the Lock
#### In this video (objectives)…

1 Use a ``for`` loop to get all the children of ButtonGrid
2 Connect all the buttons to the script with a signal
3 Use the text label of each button as an argument
4 Display the Player's button input
5 Check if the Player's guess is correct

#### After watching (learning outcomes)…
Wire up the Numberpad to the Locked Door


### 21 Making a Locked Door Part 3 - Finishing Off Locked Doors
#### In this video (objectives)…

1 Have the Locked Door open when the combination is Correct
2 Add sounds to our numberpad

#### After watching (learning outcomes)…
Make locked doors fully functional and polished!


### 22 Generating Combinations
#### In this video (objectives)…

1 Create a node responsible for generating all combinations on a level
2 use ``return`` to send the combination to whatever function asked for it

#### After watching (learning outcomes)…
Take advantage of Godot's Object Orientation to make a node that generates all combinations!


### 23 Computers and Combinations
#### In this video (objectives)…

1 Create a Computer Scene
2 Using ``find_node()`` to get a node by name
4 Ask CombinationGenerator for a random combinations
5 Display that combination to the Player in a ``Popup``

#### After watching (learning outcomes)…
Using a returned value from one script to change the contents of another


### 24 Linking Computers and Locked Doors
#### In this video (objectives)…

1 Link computers to individual or multiple locked doors
2 Allow locked doors to open if the player approaches a specific side


#### After watching (learning outcomes)…
Use signals with an argument to set the combination of one or more locked doors at a time


### 25 Labels, Locks and Nightvision
#### In this video (objectives)…

1 Label Computers and Locked Doors
2 Rotate labels automatically
3 Only show labels in Nightvision mode

#### After watching (learning outcomes)…
Turn Nightvision Mode into a strategic layer but revealing helpful information to the player


### 26 TextureProgress Nodes
#### In this video (objectives)…

1 How to use ``TextureProgres`` nodes
2 How to change values in the inspector and have them reflected in an already running game

#### After watching (learning outcomes)…
Unleash the power of ``TextureProgress`` nodes!


### 27 Making NPCs Suspicious
#### In this video (objectives)…

1 Using ``TextureProgress`` as game logic
2 Adding stealth to our stealth game!
3 Quitting the game

#### After watching (learning outcomes)…
Update the GUI when the NPCs see the player!


### 28 Sneaking Around In A Box
#### In this video (objectives)…

1 Implement a disguise system
2 change ``collision_layer`` information in script
3 save and load occlusion

#### After watching (learning outcomes)…
Fulfil your dream of hiding in a box!


### 29 Making Disguises Risky
#### In this video (objectives)…

1 Limit the number of disguises
2 Slow the player down when wearing a disguise
3 Have a time limit on disguises

#### After watching (learning outcomes)…
Display a certain number of decimal places in a text field and add a cost to disguises


### 30 Boxes and ItemList
#### In this video (objectives)…

1 Display the number of disguises left as a number of icons
2 Update the GUI with very little code

#### After watching (learning outcomes)…
Use ``ItemList`` nodes to make polished GUI elements easily


### 31 Grabbing the Loot
#### In this video (objectives)…

1 Have loot that the player can pick up
2 Create an exit that works if the player has loot
2 Craft an Object Oriented inventory system

#### After watching (learning outcomes)…
Create an inventory system in the SceneTree


### 32 Making a GUI for the Loot
#### In this video (objectives)…

1 Create a GUI element that only appears when it's needed
2 Show the player that they're collected loot

#### After watching (learning outcomes)…
Finish the GUI system!


### 33 Polishing the Game
#### In this video (objectives)…

1 Load a scene as a singleton
2 Create Game Over and Victory screens

#### After watching (learning outcomes)…
Add polish to our game with consistent background music and the ability to retry or quit the game.


### 34 Preparing the Tutorial Level
#### In this video (objectives)…

1 Designing a Tutorial
2 Creating a level for a tutorial

#### After watching (learning outcomes)…
Lay the foundations of our game's tutorial


### 35 Adding Objective Markers
#### In this video (objectives)…

1 Create a visual objective marker
2 Move that visual marker to a new position when needed

#### After watching (learning outcomes)…
Understand how and when to use ``Tween`` nodes and use a parent node as an array


### 36 Finishing the Tutorial
#### In this video (objectives)…

1 Adding text to objectives in the tutorial
2 Using a JSON file to update the objectives

#### After watching (learning outcomes)…
Finish the tutorial by revisiting JSON files


### 37 The Final Polishing of Heist Meisters!
#### In this video (objectives)…

1 Plug the tutorial into the game
2 Fix the tutorial GUI position changing
3 Animate the tutorial GUI

#### After watching (learning outcomes)…
Finish Heist Meisters!


### 38 Wrapping up Heist Meisters
#### In this video (objectives)…

1 Recap some of what we've learned
2 Look at where this project could go from here

#### After watching (learning outcomes)…
Look at what we've learned to make this projevt happen and where we could go from here

﻿﻿# Discovering Godot - The Game Engine You've Been Waiting For
##
Section 4 - Heist Meisters

This is GameDev.tv's guide to the free and open source Godot game engine.  Learn the free to use, free to modify, free to create engine with one of the most successful online game develeopment educational groups out there.

You're welcome to download, fork or do whatever else legal with all the files! The real value is in our huge, high-quality online tutorials that accompany this repo.



## In This Section

Create a fun word game based on Madlibs while you get to grips with GDScript and the foundations of scripting.   
(Our ref: HM_GDT)



## How To Build / Compile

This is a Godot project. If you're familiar with source control, then "clone this repo". Otherwise download the contents and place them in an empty folder that's in a convenient place.  Open Godot, ``Import Project`` and navigate to the folder you just made.  select ``project.godot`` and you're good to go.

No compiling necessary!  This is Godot, after all.



This branch is the course branch, each commit corresponds to a lecture in the course. The current state is our latest progress.



## Lecture List


Here are the lectures of the course for this section...



### 1 Designing Heist Meisters
#### In this video (objecties)…
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

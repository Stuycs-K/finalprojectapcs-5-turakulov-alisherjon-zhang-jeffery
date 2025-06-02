# Dev Log:

This document must be updated daily every time you finish a work session.

## Alisherjon Turakulov CHANGE THE NAME FOOL!

### 2025-05-23 - Create Processing sketch and entity class with Jeffery, start Enemy solo
start processing sketch called CatDefense, pair program the abstract Entity class, then work on Enemy subclass individually. declutter on UML layout, add map class.    
Time: ~60 minutes

### 2025-05-25 - Work on Enemy class
rewrite sketch code that got erased by restore. Write Enemy extends line, damage variable, constructor with default values, and method headers. Start writing attack method checking for position vector variables. Work on fixing error in identifying position variable name. Set up amy devlog with work from friday.    
Time: ~40 minutes;

### 2025-05-26 - Work on Enemy attract and move with Cat
Write move and attract methods similar to OrbGravity attraction, add if statements to change attraction based on distance and reduce flinging. Create a partial Cat class to test attraction on Enemies. Write display method for Enemy.  
Time: ~90 minutes;  

### 2025-05-27 - Work on Map and Wall classes
Write the map class constructor to intitalize map array, randomly place a number of walls, and add wall entities with corresponding positions to the arraylist of walls. Also write Wall class, with constructor and damage intitialization.  
Time: ~90 minutes;  
  
### 2025-05-28 - Tweak enemy movement; add enemy wave spawning; add wall obstructing enemies  
Write Enemy spawning system based on wave variable in CatDefense class, change Enemy movement to rely on a constant velocity toward Cat. Begin implementation of enemy movement obsturction when enemies step on a cell with a wall (according to the map array).    
Time: ~90 minutes;  
  
### 2025-05-29 - Enemy-Wall interactions; Enemy/Wall removal; Wave system and incrementation of Enemies 
Fix the array index lookup for Enemy-Wall obstructions, write wall-enemy takeDamage() and removal, as well as removal and additon of Enemies based on hp and wave.  
Time: ~90 minutes;  
  
### 2025-06-01 - Enemy spawn per wave, Cat movement, spawn randomization
Use spawned variable to make sure each wave spawns a larger total enemies than the last; Increase the rate of spawning each wave; write Cat movement, and placeholder code checking for the isCatnip usage by the player.  
Time: ~40 minutes;  

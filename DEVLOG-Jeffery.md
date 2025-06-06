# Dev Log:

This document must be updated daily every time you finish a work session.

## Jeffery Zhang

### 2025-05-23 - Create Entity class with Alisherjon and started Player class solo
Started off with both of us working on the entity class in separate ways (mine was mostly just a placeholder) and worked on our own parts for the child classes of entity. Most of the time was us talking about how to approach the work flow and the constructor for the player class was nearly done but didn't get to push.

Time: ~40 minutes

### 2025-05-26 - Progress on Player class
Using the already completed version of the Entity class that Alisherjon made, I began to recode the constructor to align with his Entity class. After that, I completed the movements of it once again making sure it works with his Entity class, and realized that we needed two more classes for the rest of the Player methods. I commented out the necessity for those two, thought a bit on how to approach the classes, and set up the devlog.

Time: ~60 minutes

### 2025-05-27 - Shooting for Player Class
Before working on the shooting, I implemented the movement into the sketch and modified it to have less stutter. The shooting for player was made by creating a Bullets class, which primarily consisted of its constructor and a move method that moved the bullets by themself. Bullets (implemented as an arraylist) and its methods were used in the reload and shoot methods of player, and they were also implemented in the main sketch, which finished off the visualization portion of the bullets.

Time: ~70 minutes

### 2025-05-28 - Damage and Shop
Damage from bullets was implemented through the main sketch along with placeholders for when the enemy dies (color change for now). The implementation of shop added te new addition of the currency field for Player, which is dubbed as souls. Souls are earnt through defeating enemies or waves, and the increase in shop upgrade prices are exponential. Shop upgrades currently only consist of weapon and defense, which correspond to damage and maxHP respectively.

Time: ~50 minutes

### 2025-05-29 - Shop UI and other visuals
Fixed Shop UI functionality in regards to the range of mouseclick in shop and how simply hovering over the button range would purchase the upgrade nonstop. Improved the visuals of it manually such as adding textstroke and reformatting text. Implemented images for cat and shop to be changed later with custom art when everything is deemed functional.

Time: ~80 minutes

### 2025-05-30 - Added QoL features
Implemented boundaries that send player back into the space and hold to shoot in place of click to shoot. Added UIs for player consisting of main fields HP, ammo, and currency. Added hovering UIS for enemies (soon to be HP bar/dmg points). Made shots only work with left mouse button to reserve right mouse button presses for elsewhere. Started working on aesthetic of game since mostly functional already.

Time: ~40 minutes

### 2025-06-01 - Sprites and fixes
Drew and implemented sprites for shop, cat, walls, shopkeeper, and map (Drawing these took most of the work time). Merged with main and got hit with a huge issue with fps caused by map which should be fixed. Added comments to certain code to make reading easier. Tried to adjust wall collision but wasn't successful. Readjusted wave UI and added a FPS counter (primarily for bugtesting fps issues).

Time: ~160 minutes

### 2025-06-02 - Animation sprites, intermission
Implemented and animated the idle cat sprites. Drew and implemented bullet sprite. Ported all images and sprites into data folder. Began and finished the intermission system that occurs every 5 waves, allowing the player to upgrade their stats (and maybe buy certain things) through shop. Tried to implement the randomization of shop spawning at the start of intermission but didn't finish.

Time: ~140 minutes

### 2025-06-03 - Shop random spawn, inventory system
Implemented shop spawn in random location around map when intermission occurs. Implemented ammobox system for reloading to increase difficulty of game since infinite reloading is too easy and boring. Implemented sprites for ammobox and medkit (medkit not implemented yet). Began implementing an inventory system that consists of up to two slots of items that the player can use (items currently are ammobox, medkit, and catnip).

Time: ~90 minutes

### 2025-06-04 - Shop UI Revamp and Medkit item
Medkit item was implemented. It heals the cat if player is in close proximity otherwise when used it heals the player (always to max health). Began revamping the shop's UI and changed the text. The shop's UI was revamped up to interacting with the options shown on the UI such as going to the items section. Animated and implemented a soul icon that keeps track of where you are on the UI.

Time: ~120 minutes

### 2025-06-05 - Shop functionalities finished
Finished coding the new version of shop inspired from Deltarune's shop UI functionality. There are two sections of shop that can be entered: items and upgrades. The cost of each are to the right of them, and there will be descriptions for each that will be implemented later. The shopkeeper is also kind of animated through updating the Y position continuously with sine waves.

Time: ~90 minutes


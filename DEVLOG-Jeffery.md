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

### 2025-05-29 -

### 2025-05-30 -

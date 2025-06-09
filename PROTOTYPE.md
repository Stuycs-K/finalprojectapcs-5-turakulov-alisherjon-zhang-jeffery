
# Technical Details:

(CHANGE THIS!!!!!)

A description of your technical design. This should include: 
   
How you will be using the topics covered in class in the project.

- PERIOD 5
- Alisherjon Turakulov + Jeffery Zhang
- Cat Protégés
- Our project is a game that is a two-dimensional shooter consisting of wave defense gameplay. Each wave consists of spawned enemies and the player is defending a cat in the middle of the map. The enemies spawn with random stats with an upperbound and lowerbound for randomization that depends on what wave the player is on. The wave progresses when all enemies in the map die. After every X waves a shop will appear somewhere on the map for X seconds for the player to upgrade their equipment if they step into the region of the shop. The map itself consists of wall obstacles where some can be damaged by attacks to create debris that slow down the enemies. The game ends when the lowerbound of stat randomization reaches the upperbound.
- Expanded Description
   - After 1.5 weeks we should have the wave system along with the map created with a two-dimensional array, entities from a list of enemy class each with x,y,dx,dy fields for movement, along with a basic system of player shooting and movements composed of similar fields/physics as the Orb class from our Orb Physics classwork (also applies to enemies).
   - It would be awesome to have the cat move around the map where it can climb obstacles and such, therefore increasing the difficulty of the game because the player will have a harder time protecting it from the entities. The player will also be able to lure the cat into safe spots with catnip which hopefully is allowed.
     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.  

Diagram V1:  
```mermaid
classDiagram
direction RL
		class Entity{
    <<Abstract>>
	    int: hp, maxHP, mass
	    PVector: position, velocity, acceleration
	    String name
	    move()*
	    display()*
	    applyForce( f: PVector )*
	    attractTo( other: Entity)* PVector
	  }
	  
	  class Game{
		  ArrayList<Entity> Enemies, Walls, Projectiles, Shops
		  Entity: Cat, Player
		  int[][] map
		  int wave
		  steup() void
		  draw() void
		  mouseClicked() void
		}
		
	  Entity <|--  Player : inheritance
	  Entity <|-- Enemy
	  Entity <|-- Projectile
	  Entity <|-- Shop
	  Entity <|-- Wall
	  Entity <|-- Cat
	  
    class Player{
		  int: catnip, weapon, defense, ammo
		  boolean useCatnip
		  reload() void
		  keyPressed() void
		  useCatnip() void
		  shoot() void
	  }
   class Enemy{
		int damage
		attack( other: Entity ) void
	  }
	  class Projectile{
	     int damage
	     applyDamage( other: Entity) void
		}
		class Shop{
		   int: costDefence, costWeapon
		   upgradeDefense()
		   upgradeWeapon() 
		}
      class Wall{
		   int damage
		   applyDamage( other: Entity ) void
		}

		Game "1" --o "1" Player : aggregation
	        Game "1" --o "0...n"Enemy
		Game "1" --o "0...n"Projectile
		Game "1" --o "2" Shop
		Game "1" --o "0...n" Wall
		Game "1" --o "1" Cat
```

Diagram V2:  

```mermaid
---
  config:
    class:
      hideEmptyMembersBox: true
---
classDiagram
direction LR


	class Entity{
		<<Abstract>>
		int: hp, maxHP
		float mass
		PVector: position, velocity, acceleration
		String name
		move()*
		display()*
		applyForce( f: PVector )*
		attractTo( other: Entity)* PVector
	}



	class Map{
		int[][] map
		void display()
	}


	  class Wall{
		   int damage
		   applyDamage( other: Entity ) void
		}

	Game "1" --o "1" Player
	Game "1" --o "0...n" Wall

	Entity <|-- Projectile
	Entity <|--  Shop 
	Entity <|-- Player
	Entity <|-- Cat
	Entity <|-- Enemy
	Entity <|-- Wall
	class Shop{
		int: costDefence, costWeapon
		upgradeDefense()
		upgradeWeapon() 
	}

    	class Player{
		  int: catnip, weapon, defense, ammo
		  boolean useCatnip
		  reload() void
		  keyPressed() void
		  useCatnip() void
		  shoot() void
	  }
  	 class Enemy{
		int damage
		attack( other: Entity ) void
	  }
	class Projectile{
		int damage
		applyDamage( other: Entity) void
	}
		


 style m1: stroke-width:0px,text-color:none,stroke:none,fill:none
   
 
		
  	class Game{
		  ArrayList<Entity> Enemies, Walls, Projectiles, Shops
		  Entity: Cat, Player
		  Map map;
		  int wave
		  setup() void
		  draw() void
		  mouseClicked() void
	}
		
		  Cat "1" o-- "1"Game
		
	       Enemy "1" o-- "1" Game
		Game "1" --o "0...n" Projectile
		Game "1" --o "2" Shop
		Map "1" o-- "1" Game
		
	
```

  Diagram V3:  
```mermaid
---
  config:
    class:
      hideEmptyMembersBox: true
---
classDiagram
direction LR


	class Entity{
		<<Abstract>>
		int: hp, maxHP
		float mass
		PVector: position, velocity, acceleration
		String name

		move() void
		display() void
		applyForce( f: PVector ) void
		attractTo( other: Entity) PVector
		moveTo(other: Entity) void
		attack(other: Entity) void
		heal(amt: int) void
		closeEnough(other: Entity) boolean
		closeEnough(other: PVector, radius: int) boolean
		closeEnough(other: Entity, radius: int) boolean
	}



	class Map{
		int[][] map
		ArrayList<Wall> Walls
		PImage: wallace, mappa, winS
		display() void
		displayEnd() void
		displayWin() void
	}


	  class Wall{
		   int damage
		   takeDamage() void
                   closeEnoughW(other: Entity) boolean
		}

	CatDefense "1" --o "1" Player
	CatDefense "1" --o "0...n" Wall

	Entity <|-- Bullets
	Entity <|--  Shop 
	Entity <|-- Player
	Entity <|-- Cat
	Entity <|-- Enemy
	Entity <|-- Wall
	 Enemy <|-- Boss
	class Shop{
	  int: costDefence, costWeapon, costBox, costMed
	  int: trackUI, trackUII, trackUIU
	  int: curFrame, countFrame, delayFrame, totalFrame
	  boolean: base,items,upgrades, isOpen
	  Player p
          PImage: shop, shopGuy, bgUI,
	  int: expDef, expWep
	  float: sinAng, sinAmp
	  PImage[] souls
	  
		
		upgradeDefense() void
		upgradeWeapon() void
		ammoBox() void
		medKit() void
		changePos() void
		textStroke() void
		keyPressed() void
		UI() void
		display() void
				
	}

    	class Player{
		  int: catnip, weapon, defense, ammo
	          int: maxAmmo,  remBox, remBoxL
                  int: medpacks, souls, lives
		  boolean: medkit, boxCheck, isCatnip
		  float: speed, bulletSpeed
		  boolean: up, down, left, right, shootHold
		  ArrayList<Bullets> bullets
		  ArrayList<String> inventory
		  Cat c
		  PImage: box, kit

		  reload() void
		  heal() void
		  move() void
		  UI() void
                  display() void
		  soulsDec(amount: int) void
		  getSouls() int
		  useCatnip() void
                  defIng(amt: int) void
		  wepInc(amt: int) void
		  applyForce(f: PVector) void
		  addItem(item: String) void
		  addBox() void
		  addMedkit() void
		  keyPressed() void
		  mousePressed() void
		  mouseReleased() void
		  keyReleased() void
		  useCatnip() void
		  shoot() void
	  }
  	 class Enemy{
		int damage
		attack( other: Entity ) void
		henchmanAttack(other: Entity) void
		 display() void
		henchmanDisplay() void
		move() void
		moveTo(other: Entity) void
		henchmanMoveTo(other: Entity) void
		UI() void
		spawnEnemies(type: String) void
		speak() void
			
		
	  }
	class Bullets{
		PVector: position, velocity
  		Player p
		float ang
		PImage bull
		move() void
		destroy() boolean
		display() void
		closeEnough(other: Entity, radius: int) boolean
		
	}
	class Cat{
		PImage[] catto
      		int: curFrame, countFrame, delayFrame, totalFrame
		display() void
		move() void
		moveTo(other: Entity) void
		
	}
	class Boss{
		attack(other: Entity) void
		UI() void
		display() void
		spawnEnemies(type: String) void
		speak() void
		move() void
		moveTo(target: Entity) void
		
		
		
	}
		


 style m1: stroke-width:0px,text-color:none,stroke:none,fill:none
   
 
		
  	class CatDefense{
		  ArrayList<Enemy> Enemies
		  ArrayList<Wall> Walls
		  ArrayList<Bullets> Bullets
                  Shop s
		  String[] types
		  Player p
		  Cat c
		  Map m
  		  int: spawnNum,spawned = 0, enemiesFolded = 0, wave = 1,tick=0
		  boolean: inter, invincible, bossBattle
		  Enemy Bob
		  setup() void
		  keyPressed() void
		  keyReleased() void
	 	  mousePressed() void
		  mouseReleased() void
		  draw() void
	}
		
		  Cat "1" o-- "1"CatDefense
		Boss "1" o-- "1" CatDefense
	       Enemy "1" o-- "1" CatDefense
		CatDefense "1" --o "0...n" Bullets
		CatDefense "1" --o "2" Shop
		Map "1" o-- "1" CatDefense
		
	
```  
Changes to UML :
- Store map array to a separate Map class
- Add Boss class
- Reorient diagram
- rename methods in Enemies to moveTo()
- add instance variables into classes such as shop and catdefense as needed for implementations  
    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.
This project will be broken down into three parts consisting of the NPCs along with the player, the map, and finally the wave defense system along with the shop.
The responsibility for parts will be split in half for each phase, where one of us will work on the player lets say and the other works on the entities for phase one. However, ~Especially~ for larger classes, e.g., Game, Player, Enemy we'll work together on different elements required to get our project in a functioning state.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)
- Phase 1 [NPC/Player]
- Entity Class
  - Fields & Constructor
  - movement
  - Player Child Class
    - Fields & Constructor
    - Shooting and reloading
    - ~Dropping catnip~ option in the shop; not buyable
  - Enemy Child Class
    - Fields & Constructor
    - close attacks
    - plausible type of attack



- Phase 2 [Map]
  - Constructor for Game
  - initialization of game via setup
    - Marked enemy spawns
    - Marked shop spawns
    - Marked player & cat spawn
    - Walls initialized randomly



- Phase 3 [Gameplay/QoL]
- Game Class
  - Fields & Constructors
  - wave incrementing
    - causes adjustments to other classes like enemy (stats)
  - Shop Class
    - upgrades for Defense
    - upgrades for Weapons
  - Wall Class
    - state that turns into debris that damages enemy
    - health
  -QoL TBD

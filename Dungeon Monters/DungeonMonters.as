﻿//Modified: 3/13/2015

package {
	//flash libs BZ
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent; //detect keyboard events
	import flash.ui.Keyboard; // using the keyboard controls
	import skyboy.CollisionDetection.PixelPerfect; // collision detection class
	import flash.ui.Mouse;
	//import flash.display.Loader;
	//import flash.net.URLRequest;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

 //used to remove the mouse cursor from screen
	
	public class DungeonMonters extends MovieClip {
		//world attributes
		//public var gravity:Number;
		//public var floor:int;
		//public var loader:Loader = new Loader();
		
		//characters/objects
		public var player:Player;
		public var platform:Platform;
		public var boundry:Boundry;
		
		//magic
		//public var blast:Blast;
		//public var blastHolder:Array;
		//public var blastDelay:int;
		//public var blastTime:int;
		
		//controls
		public var upKey:Boolean;
		public var downKey:Boolean;
		public var leftKey:Boolean;
		public var rightKey:Boolean;
		public var spaceBar:Boolean;
		
		//features
		//public var health:Health;
		//public var magic:Magic;
		
		//sound
		/*public var dungeon1Music:Dungeon1Music;
		public var musicPlayer:SoundChannel;
		public var soundPlayer:SoundChannel;
		public var musicPosition:Number;
		public var soundTransformer:SoundTransform;*/
		
		//options
		//public var soundOn:Boolean;
		//public var musicOn:Boolean;
		
		public function DungeonMonters() {
			// constructor code
			
			//add sound
			//soundOn = sound;
			//musicOn = music;
			
			PixelPerfect.registerRoot(this);
			
			//create player
			player = new Player();
			
			//add player to game on load
			this.addChildAt(player, 1);
			
			//create platform
			platform = new Platform();
			
			//add platform to game on load
			this.addChildAt(platform, 1);
			
			//create boundry
			boundry = new Boundry();
			
			//add boundry to game on load
			this.addChildAt(boundry, 5);
			
			//initialize all key registers to false
			upKey = false;
			downKey = false;
			leftKey = false;
			rightKey = false;
			
			//set height level
			//floor = 700;
			
			//initialize gravity value
			//gravity = 0.8;
			
			//create health and magic bars
			//health = new Health();
			//magic = new Magic();
			//this.addChild(health, 0);
			//this.addChild(magic, 0);		
			
			//check is sound is on
			/*if(musicOn){				
				dungeon1Music = new Dungeon1Music(); //new instance of music
				musicPlayer = dungeon1Music.play(); //set music player to instance.play()
				musicPlayer.addEventListener(Event.SOUND_COMPLETE, loopMusic, false, 0, true);
				musicPosition = musicPlayer.position;
				musicPlayer = dungeon1Music.play(musicPosition); 
				soundTransformer = new SoundTransform();
				soundTransformer.volume = 0.5;
				musicPlayer.soundTransform = soundTransformer;
			}//end if*/
			
			this.addEventListener(Event.ENTER_FRAME, controlGame, false, 0, true);
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
				
		}
		
		public function controlGame(event:Event):void{
			Mouse.hide(); //removes mouse cursor
			
			//platform motion
			//platform.movePlatform();
			
			//control checks
			// upward diagonal checks
			if(upKey && leftKey){
				
				player.movePlayer(-1);
			}
			if(upKey && rightKey){
				//move player diagonally right
				
				player.movePlayer(1);
			}
			
			//downward diagonal checks
			/*remove downward diagonal as it was
			if(downKey && leftKey){
				//move player diagonally down -> left
				player.movePlayer(-1, 1);
			}
			if(downKey && rightKey){
				//move player diagonally down -> right
				player.movePlayer(1, 1);
			}*/
			
			//basic movement checks
			else if(upKey){
				//move player up(jump)
				
				//load jump animation
			}
			else if(rightKey){
				//move player right
				player.movePlayer(1);
				//load walking right animation
				if(rightKey == true){
					//load animation swf
				}
				else{
					//remove loader for animated character
		
					//add loader for static character
					
				}
				
			}
			else if(leftKey){
				//move player left
				player.movePlayer(-1);
				//load walking left animation
				
			}
			
			/*remove down key
			else if(downKey){
				//move player down
				player.movePlayer(0, 1);
			}
			*/
			
			//handle magic blast attack
			/*if(spaceBar && blastDelay >= blastTime){
				blast = new Blast(player.x, player.y, player.width);
				this.addChild(blast);
				blastHolder.push(blast);
				blastDelay = 0;
			}*/
			
			//collision between player and platform handling
			if(PixelPerfect.test(player, platform)){
				//adjust player position based on collision
				if(rightKey == true){
					player.movePlayer(-1);
					trace("hit platform");
				}
				else if(leftKey == true){
					player.movePlayer(1);
					trace("hit platform");
				}
				else if(upKey == true){
					
					trace("hit platform");
				}
				/*remove down key
				else if(downKey == true){
					player.movePlayer(0, -1);
					trace("hit platform");
				}
				else if(downKey == true && rightKey == true){
					player.movePlayer(-1, -1);
					trace("hit platform");
				}
				else if(downKey == true && leftKey == true){
					player.movePlayer(1, -1);
					trace("hit platform");
				}
				*/
				else if(upKey == true && rightKey == true){
					
					player.movePlayer(-1);
					trace("hit platform");
				}
				else if(upKey == true && leftKey == true){
					
					player.movePlayer(1);
					trace("hit platform");
				}
			}
			
			//test collision between player and boundry
			if(PixelPerfect.test(player, boundry)){
				//adjust player position based on collision
				if(rightKey == true){
					player.movePlayer(-1);
					trace("hit boundry");
				}
				else if(leftKey == true){
					player.movePlayer(1);
					trace("hit boundry");
				}
				else if(upKey == true){
					trace("hit boundry");
				}
				/*remove down key
				else if(downKey == true){
					player.movePlayer(0, -1);
					trace("hit boundry");
				}
				else if(downKey == true && rightKey == true){
					player.movePlayer(-1, -1);
					trace("hit boundry");
				}
				else if(downKey == true && leftKey == true){
					player.movePlayer(1, -1);
					trace("hit boundry");
				}*/
				
				else if(upKey == true && rightKey == true){
					
					player.movePlayer(-1);
					trace("hit boundry");
				}
				else if(upKey == true && leftKey == true){
					
					player.movePlayer(1);
					trace("hit boundry");
				}
			}
		}//end controlGame
		
		public function onAdded(event:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyIsDown, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyIsUp, false, 0, true);
		}
		
		//function to check if key is pressed
		public function keyIsDown(event:KeyboardEvent):void{
			if(event.keyCode == 37){
				leftKey = true;
			}
			else if(event.keyCode == 38){
				upKey = true;
			}
			else if(event.keyCode == 39){
				rightKey = true;
			}
			else if(event.keyCode == 40){
				downKey = true;
			}
			else if(event.keyCode == 32){
				spaceBar = true;
			}
		}//end keyIsDown
		
		//function to check if key is released
		public function keyIsUp(event:KeyboardEvent):void{
			if(event.keyCode == 37){
				leftKey = false;
			}
			else if(event.keyCode == 38){
				upKey = false;
			}
			else if(event.keyCode == 39){
				rightKey = false;
			}
			else if(event.keyCode == 40){
				downKey = false;
			}
			else if(event.keyCode == 32){
				spaceBar = false;
			}
		}//end keyIsUp
		
		//function to add swf to game
		/*public function handle(event:Event):void{
			addChild(event.target.content);
		}*/
		
		//function to remove swf from game
		/*public function unloadSwf(event:Event):void{
			removeChild(event.target.content);
		}*/
		
		//function to perform jump action
		/*public function jump(ground:Boolean, floor:int):void{
			if(ground == true && player.y == floor){
				player.y -= 20;
				ground = false;
			}
			else if(ground == false && player.y != floor){
				player.y += gravity;
				if(player.y > floor){
					player.y = floor;
					ground = true;
				}
			}
		}//end jump()*/
		
		//function to loop music
		/*public function loopMusic(event:Event):void{
			musicPlayer = dungeon1Music.play();
			musicPlayer.addEventListener(Event.SOUND_COMPLETE, loopMusic, false, 0, true);
		}*/
	}
}

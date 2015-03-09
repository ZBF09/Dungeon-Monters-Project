package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent; //detect keyboard events
	import flash.ui.Keyboard; // using the keyboard controls
	import skyboy.CollisionDetection.PixelPerfect; // collision detection class
	import flash.ui.Mouse; //used to remove the mouse cursor from screen
	
	public class DungeonMonters extends MovieClip {
		//world attributes
		public var floor:int;
		
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
		
		//features
		//public var health:Health;
		//public var magic:Magic;
		
		public function DungeonMonters() {
			// constructor code
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
			
			//set floor
			floor = 680;
			
			//create health and magic bars
			//health = new Health();
			//magic = new Magic();
			//this.addChild(health, 0);
			//this.addChild(magic, 0);
			
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
				player.jump(true, floor);
				player.movePlayer(-1);
			}
			if(upKey && rightKey){
				//move player diagonally right
				player.jump(true, floor);
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
				player.jump(true, floor);
			}
			else if(rightKey){
				//move player right
				player.movePlayer(1);
			}
			else if(leftKey){
				//move player left
				player.movePlayer(-1);
			}
			
			/*remove down key
			else if(downKey){
				//move player down
				player.movePlayer(0, 1);
			}
			*/
			
			//handle magic blast attack
			/*if(spaceKey && blastDelay >= blastTime){
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
					player.jump(true, floor)
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
					player.jump(true, floor);
					player.movePlayer(-1);
					trace("hit platform");
				}
				else if(upKey == true && leftKey == true){
					player.jump(true, floor);
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
					player.jump(false, floor);
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
					player.jump(false, floor);
					player.movePlayer(-1);
					trace("hit boundry");
				}
				else if(upKey == true && leftKey == true){
					player.jump(false, floor);
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
		}//end keyIsUp
	}
}

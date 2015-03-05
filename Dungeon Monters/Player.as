//Modified: 2/25/2015
package  {
	
	import flash.display.MovieClip;
	
	
	public class Player extends MovieClip {
		
		//player attributes
		public var hp:int;
		public var maxHp:int;
		public var speed:int;
		public var mp:int;
		public var maxMp:int;
		public var jumpForce:int;
		
		//public var magicType:String;
		
		public function Player() {
			// constructor code
			//set player attributes
			hp = 100;
			mp = 100;
			maxMp = 100;
			maxHp = 100;
			speed = 10;
			jumpForce = 10
			//magicType = "None";
			this.x = 80; //character starting x position 
			this.y = 510; //character starting y position
		}
		
		//move player function
		public function movePlayer(xDistance:Number, yDistance:Number):void{
			
			this.x += speed*xDistance;
			this.y += 2*(jumpForce*yDistance);
			
		}//end movePlayer
		
		public function hit(attack:int):void{
			//when hit reduce health by attack value
			hp -= attack;
		}
	}
}

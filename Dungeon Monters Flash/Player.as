﻿//Modified: 3/9/2015
package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	
	
	public class Player extends MovieClip {
		
		//player attributes
		public var hp:int;
		public var maxHp:int;
		public var speed:int;
		//public var speedY:int;
		public var mp:int;
		public var maxMp:int;
		public var jumpForce:int;
		public var gravity:Number;
		
		//public var magicType:String;
		
		public function Player() {
			// constructor code
			//set player attributes
			hp = 100;
			mp = 100;
			maxMp = 100;
			maxHp = 100;
			speed = 10;
			jumpForce = 20;
			gravity = 0.8;
			//magicType = "None";
			this.x = 80; //character starting x position 
			this.y = 530; //character starting y position
		}
		
		//move player function
		public function movePlayer(xDistance:Number/*, yDistance:Number*/):void{
			
			this.x += speed*xDistance;
			//this.y += 2*(jumpForce*yDistance);
			
		}//end movePlayer
		
		//jump function
		/*public function jump(onGround:Boolean):void{
			if(onGround == true){
				this.y -= jumpForce;
				onGround = false;
			}
			//else if(onGround == false && this.y != 680){
				//this.y += gravity;
				//if(this.y > 680){
					//this.y = 680;
					//onGround = true;
				//}
			//}
		}//end jump*/
		
		/*public function applyGravity(onGround:Boolean):void{
			if(onGround == false && this.y != 530){
				this.y += gravity;
				if(this.y > 530){
					this.y = 530;
					onGround == true;
				}
			}
		}//end applyGravity()*/
		
		public function hit(attack:int):void{
			//when hit reduce health by attack value
			hp -= attack;
		}
	}
}

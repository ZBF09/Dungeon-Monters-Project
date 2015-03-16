// Modified: 3/13/2015
package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class DocumentClass extends MovieClip {
		
		//global scope variables (accesible by all functions)
		
		//public var mainMenu:MainMenu;
		public var dungeonMonters:DungeonMonters;
		//public var soundIsOn:Boolean;
		//public var musicIsOn:Boolean;
		//public var gameOver:GameOver;
		
		public function DocumentClass() {
			// constructor code
			//soundIsOn = true;
			//musicIsOn = true;
			//mainMenu = new MainMenu();
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
		}//end DocumentClass() constructor
		
		//startGame function
		public function startGame(event:Event):void{
			//remove main menu
			/*mainMenu.removeEventListener("STARTGAME", startGame);
			this.removeChild(mainMenu);
			mainMenu = null;*/
			
			//add the game
			dungeonMonters = new DungeonMonters();
			this.addChild(dungeonMonters);
			stage.stageFocusRect = false;
			stage.focus = dungeonMonters;
			dungeonMonters.addEventListener("GAMEOVER", endGame, false, 0, true);
		}//end startGame()
		
		//endGame function
		public function endGame(event:Event):void{
			dungeonMonters.removeEventListener("GAMEOVER", endGame);
			this.removeChild(dungeonMonters);
			dungeonMonters = null;
		}//end endGame()
		
		//onAdded function
		public function onAdded(event:Event):void{
			stage.stageFocusRect = false;
			stage.focus = dungeonMonters;
		}//end onAdded()
		
		//muteUnmuteSound function
		/*public function muteUnmuteSound(event:Event):void{
			//to mute the sound
			if(soundIsOn){ //if true switch to false
				soundIsOn = false;
			}
			else{ //else false switch to true
				soundIsOn = true;
			}
		}//end muteUnmuteSound()*/
		
		//muteUnmuteMusic function
		/*public function muteUnmuteMusic(event:Event):void{
			//to mute the music
			if(musicIsOn){ //if true switch to false
				musicIsOn = false;
			}
			else{//else false switch to true
				musicIsOn = true;
			}
		}//end muteUnmuteMusic()*/
	}
	
}

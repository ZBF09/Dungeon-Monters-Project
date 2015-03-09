package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class DocumentClass extends MovieClip {
		
		//public var mainMenu:MainMenu;
		public var dungeonMonters:DungeonMonters;
		//public var gameOver:GameOver;
		
		public function DocumentClass() {
			// constructor code
			//mainMenu = new MainMenu();
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		//start game function
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
			dungeonMonters.addEventListener("GAMEOVER", endGame);
		}
		
		//end game function
		public function endGame(event:Event):void{
			dungeonMonters.removeEventListener("GAMEOVER", endGame);
			this.removeChild(dungeonMonters);
			dungeonMonters = null;
		}
		
		
	}
	
}

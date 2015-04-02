//Modified: 3/3/2015
package  {
	
	import flash.display.MovieClip;
	
	
	public class Platform extends MovieClip {
		
		public var maxHeight:int;
		public var minHeight:int;
		public var speed:int;
		
		public function Platform() {
			// constructor code
			maxHeight = 440;
			minHeight = 460;
			speed = 2;
			this.x = 780;// platform x position
			this.y = 460;//platform y position
		}
		
		/*public function movePlatform(){
			//while platform is less then maxHeight
			while(true){
				if(this.y > maxHeight){
					this.y -= 2; //raise platform at a rate of 2
				}//end while < max
				
				if(this.y < minHeight){
					this.y += 2; //lower platform at a rate of 2
				}
			}//end infinite
		}*/
	}
	
}

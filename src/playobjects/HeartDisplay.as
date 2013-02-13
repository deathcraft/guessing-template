package src.playobjects {
		
	import flash.display.MovieClip;
	public class HeartDisplay extends MovieClip {
		
		private var _quant:int;
		private var _hearts:Array;

		public function HeartDisplay(quant:int, px:int, py:int) {
			_hearts = new Array();
			_quant = quant;
			trace("lifebarcr");
			this.x = px;
			this.y = py;
			for (var i:int = 0; i < _quant; i++)
			{
				_hearts[i] = new Heart();
				_hearts[i].x = x + 25 * i;
				addChild(_hearts[i]);
			}
		}
		
		public function remLife():void {
			
			removeChild(_hearts[_hearts.length-1]);
				_hearts.pop();
		}
		
		public function disable():void {
			for (var i:int = 0; i < _hearts.length; i++)
			{
				removeChild(_hearts[i]);
				_hearts[i] = null;
			}
		}

	}
	
}

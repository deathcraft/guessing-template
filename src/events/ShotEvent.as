package src.events {
	
	public class ShotEvent extends GameEvent {
		
		public static const SHOT_BEGIN:String = "shotBegins";
		
		public var evX:int = 0;
		public var evY:int = 0;
		
		public function ShotEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false,score:int = 0, px:int =0, py:int = 0) {
			super(type, bubbles, cancelable, score);
			evX = px;
			evY = py;
		}
		
		public override function clone( ):Event
		{
			return new ShotEvent(type, bubbles, cancelable, score, evX, evY);
		}


	}
}

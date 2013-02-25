package src.events
{
	import flash.events.*;

	public class GameEvent extends Event
	{
		public static const ALERT:String = "alert";
		public static const OBJECT_CLICKED:String = "objectClicked";
		
		public static const ANIM_ENDED:String = "animEnded";
		public static const SHOT_ENDED:String = "shotEnded";
		
		public var score:int;
		
		public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false,score:int = 0)
		{
			super(type, bubbles, cancelable);
			this.score = score;
		}

		public override function clone( ):Event
		{
			return new GameEvent(type, bubbles, cancelable, score);
		}

		public override function toString( ):String
		{
			return formatToString("GameOverEvent", "type", "bubbles",
			"cancelable", "eventPhase", "score");
		}

	}

}
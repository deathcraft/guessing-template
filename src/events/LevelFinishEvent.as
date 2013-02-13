package src.events
{
	import flash.events.*;

	public class LevelFinishEvent extends GameEvent
	{
		public static const LEVEL_END_WIN:String = "levelEndWin";
		public static const LEVEL_END_LOSE:String = "levelEndLoose";
		
		public var lvl:int;

		public function LevelFinishEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false,score:int = 0,lvl:int = 0)
		{
			super(type, bubbles, cancelable, score);
			this.lvl = lvl;
		}

		public override function clone( ):Event
		{
			return new LevelFinishEvent(type, bubbles, cancelable, score, lvl);
		}

		public override function toString( ):String
		{
			return formatToString("GameOverEvent", "type", "bubbles",
			"cancelable", "eventPhase", "score", "lvl");
		}

	}

}
package src.events
{
	
	public class GameOverEvent extends GameEvent
	{
		public static const LOSE:String = "loose";
		public static const WIN:String = "win";

		public function GameOverEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false,score:int = 0)
		{
			super(type, bubbles, cancelable, score);
	    }

	}

}
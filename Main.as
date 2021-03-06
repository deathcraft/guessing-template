package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.GameConsole;
	
	/**
	 * ...
	 * @author Vladimir Beletskiy
	 */
	public class Main extends Sprite 
	{
		private var gc:GameConsole;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			gc = new GameConsole();
			addChild(gc);
			gc.gameStart();
			gc.clearConsole();
		}
		
	}
	
}
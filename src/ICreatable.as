package  src {
	import flash.display.MovieClip;
	import src.playobjects.Bag;
	import flashx.textLayout.formats.BackgroundColor;
	
	public interface ICreatable {

		// Interface methods:
		function createGameObj(makeRandom:Boolean = true, num:int = 0):Bag;
		

	}
	
}

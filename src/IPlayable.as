package  src {
	
	public interface IPlayable {

		// Interface methods:
		function init():void;
		function newGame():void;
		function clearGame():void;
		function gameOver():int;
		function levelCreate(num:int):void;
		function clearLevel():void;

	}
	
}

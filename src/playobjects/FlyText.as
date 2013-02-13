package src.playobjects {
	import flash.display.MovieClip;
	import caurina.transitions.Tweener;
	import src.events.*;
	
	public class FlyText extends MovieClip {
		
		private var _messageText:GameText;
		private var _tx:int;
		private var _ty:int;

		public function FlyText(messageText:String = "none", tx:int = 0, ty:int = 0) {
			// constructor code
			setTarget(tx,ty);
			_messageText = new GameText(messageText, false);
			alpha = 0;
			addChild(_messageText);
		}
		
		public function fly():void {
			Tweener.addTween(this, {alpha:1, scaleX:2, scaleY:2, y:y -30, time:1,transition:"easeInQuad", onComplete:alphaTween_finished});
		}
		
		public function setMessage(messageText:String):void {
			_messageText.textMessage = messageText;
		}
		
		public function setTarget(tx:int, ty:int):void {
			_tx = tx;
			_ty = ty;
			
		}
		
		private function alphaTween_finished():void
		{
			Tweener.addTween(this, {alpha:0, x:_tx, y:_ty, time:1, transition:"easeInQuad", onComplete:flyTween_finished});
		}
		
		private function flyTween_finished():void
		{
			CONFIG::debug { trace("Im a text and Im here"); };
		}
	}
}

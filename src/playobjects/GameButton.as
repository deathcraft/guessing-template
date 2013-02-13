package src.playobjects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;

	public class GameButton extends MovieClip
	{

		private var _graphic:MovieClip;
		private var but:ButtonInteractivity;
		private var _action:Function;

		public function GameButton( buttonText:String = "", messageText:String = "", graphic:MovieClip = null, action:Function = null, darken:Boolean = false)
		{
			_action = action;
			if (darken) {
			var square:Sprite = new Sprite();
			addChild(square);
			square.graphics.beginFill(0x000000);
			square.graphics.drawRect(0,-600,760,1625);
			square.graphics.endFill();
			square.alpha = 0.5;
			}

			but = new ButtonInteractivity(buttonText);
			but.addEventListener(MouseEvent.MOUSE_DOWN, _action);
			addChild(but);
			if (graphic != null)
			{
				addChild(graphic);
			}
			var _messageText:GameText = new GameText(messageText,false);

			addChild(_messageText);
			_messageText.x = this.width / 2 - _messageText.width / 2;
			_messageText.y = -50;
			if (graphic != null)
			{
				graphic.x = this.width / 2 - graphic.width / 2;
				graphic.y =  -  graphic.height;
			}
			but.x = this.width / 2 - but.width / 2;

		}

		public function unregister():void
		{
			but.removeEventListener(MouseEvent.MOUSE_DOWN, _action);
		}

	}

}
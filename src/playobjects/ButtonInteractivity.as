package src.playobjects
{
	import flash.display.Sprite;
	import flash.text.TextField;
    import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	import flash.events.*;

	public class ButtonInteractivity extends Sprite
	{

		private var button:Sprite = new Sprite();

		public function ButtonInteractivity(msg:String)
		{
			drawButton(msg);
			addChild(button);
		}

		private function drawButton(msg:String):void
		{
			var _textField:TextField = new TextField();
			var butWidth:int = 170;
			var butHeight:int = 50;
			button.graphics.clear();
			button.graphics.beginFill(0x663333);
			// grey color;
			button.graphics.drawRoundRect(0, 0, butWidth, butHeight, 10, 10);
			// x, y, width, height, ellipseW, ellipseH;
			button.graphics.endFill();
			_textField.selectable = false;
			_textField.textColor = 0xFFFFFF;
			_textField.text = msg;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.x = butWidth/2 - _textField.width/2;
			_textField.y = butHeight/2 - _textField.height/2;
			button.addChild(_textField);
			
		}

	}
}
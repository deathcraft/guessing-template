package src.playobjects {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
    import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	import flash.filters.GlowFilter;
	import flash.events.Event;
	
	public class GameText extends MovieClip {
		
		private var _textField:TextField = new TextField();
		private var _glows:Boolean;
		private var _glowFlag:Boolean = true;
		private var _myGlow:GlowFilter;

		public function GameText(txt:String, glows:Boolean = false, align:String = TextFieldAutoSize.LEFT, color:int = 0x000000) {
			// constructor code
			_glows = glows;
			
			if (_glows) {
				
				_myGlow = new GlowFilter();
				_myGlow.blurX = 20;
				_myGlow.blurY = 20;
				_myGlow.strength = 2;
				_textField.filters = [_myGlow];
				addEventListener(Event.ENTER_FRAME, pulsate);
			}
			_textField.selectable = false;
			_textField.textColor = color;
			_textField.text = txt;
			_textField.autoSize = align;
			addChild(_textField);
		}
		
		public function set textMessage(value:String):void {
			_textField.text = value;
		}
		
		public function unregister():void {
			if (_glows) {
				_myGlow = null;
				_textField.filters = null;
				removeEventListener(Event.ENTER_FRAME, pulsate);
			}
			removeChild(_textField);
			_textField = null;
		}
		
		private function pulsate(event:Event):void
		{
			if (_glowFlag)
			{
				_myGlow.blurX++;
				_myGlow.blurY++;
			}
			else
			{
				_myGlow.blurX--;
				_myGlow.blurY--;
			}

			if (_myGlow.blurX == 30)
			{
				_glowFlag = false;
			}
			if (_myGlow.blurY == 10)
			{
				_glowFlag = true;
			}

			this.filters = [_myGlow];
		}
	}
}

package src.playobjects.items
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class Item extends MovieClip
	{
		
		protected var _value:int = 0;
		protected var sprite:Sprite;
		
		public function Item()
		{
			addGraphics();
		}
		
		public function action():void
		{
		
		}
		
		protected function addGraphics():void 
		{
			sprite = new Sprite();
			sprite.graphics.beginFill(0xFF794B);
			sprite.graphics.drawCircle(0, 0, 10);
			sprite.graphics.endFill();
			addChild(sprite);
		}
		
		public function get value():int
		{
			return _value;
		}
	
	}

}

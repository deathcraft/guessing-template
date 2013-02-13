package  src.playobjects.items{
	import flash.display.Sprite;
	import src.playobjects.items.Item;
	
	public class BadItem extends Item{

		public function BadItem() {
			// constructor code
		}
		
		override protected function addGraphics():void 
		{
			sprite = new Sprite();
			sprite.graphics.beginFill(0x000000);
			sprite.graphics.drawCircle(0, 0, 10);
			sprite.graphics.endFill();
			addChild(sprite);
		}

	}
	
}

package  src.playobjects {
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Heart extends Sprite {

		public function Heart() {
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xFF0000);
			sprite.graphics.drawCircle(10, 10, 10);
			sprite.graphics.endFill();
			addChild(sprite);
		}

	}
	
}

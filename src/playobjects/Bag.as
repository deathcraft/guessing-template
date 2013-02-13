package src.playobjects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import src.events.*;
	import src.Helper;
	import caurina.transitions.Tweener;
	import src.playobjects.items.*;
	import src.factories.ItemFactory;


	public class Bag extends MovieClip
	{

		private var myGlow:GlowFilter;
		private var _evades:Boolean;
		private var _item:Item;
		private var _basket:Sprite;
		private var _time:int = 1;

		public function Bag(evades:Boolean = false)
		{
			_evades = evades;
			_item = ItemFactory.createItem(true);
			_basket = new Sprite();
			_basket.graphics.beginFill(0xFF794B);
			_basket.graphics.drawCircle(0, 0, 30);
			_basket.graphics.endFill();
			addChild(_basket);
			myGlow = new GlowFilter();
			myGlow.blurX = 30;
			myGlow.blurY = 30;
			this.addEventListener(MouseEvent.MOUSE_DOWN, clicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, glow);
		}

		public function scoreValue():int
		{
			return _item.value;
		}

		public function isEvading():Boolean
		{
			if (_item.value == 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public function setEvading(val:Boolean):void
		{
			_item = new BadItem();

		}

		public function open():void
		{
			Tweener.addTween(_basket, {alpha:0, time:_time,transition:"linear"});
			this.addChild(_item);
		}

		private function tween_finished1():void
		{
			dispatchEvent(new GameEvent("shotEnded", true, false, scoreValue()));
		}
		private function playAnim():void {
			_item.alpha = 0;
			Tweener.addTween(_item, {alpha:1, time:_time,transition:"linear", onComplete:tween_finished1});
		}

		private function clicked(event:Event):void
		{
			open();
			playAnim();
			dispatchEvent(new GameEvent( "objectClicked", true ));
		}


		public function explode():void
		{
			open();
		}

		public function unregister():void
		{
			this.removeEventListener(MouseEvent.MOUSE_OVER, glow);
			this.removeEventListener(MouseEvent.MOUSE_OUT, stopGlow);
			this.removeEventListener(MouseEvent.MOUSE_DOWN, clicked);
		}

		
		private function glow(event:Event):void
		{
			this.filters = [myGlow];
			this.addEventListener(MouseEvent.MOUSE_OUT, stopGlow);
		}

		private function stopGlow(event:Event):void
		{
			this.filters = [];
			this.removeEventListener(MouseEvent.MOUSE_OUT, stopGlow);
		}
	}
}
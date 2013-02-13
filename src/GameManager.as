package src
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	import src.events.*;
	import src.playobjects.*;
	import src.factories.*;
	public class GameManager extends MovieClip implements IPlayable
	{

		private var _backGround:MovieClip;
		private var _flyText:FlyText;
		private var _score:int = 0;
		private var _lvl:int = 0;
		private var _bags:Array;
		
		private var _targetBag:Bag;
		private var _bagFactory:ICreatable;

		//Text vars
		private var _gt:GameText = new GameText("Choose a box",true);
		private var _scoreText:GameText = new GameText("Your score: 9999",false);
		private var _lvlText:GameText = new GameText("Level: 0",false,TextFieldAutoSize.LEFT);

		public function GameManager()
		{
			addEventListener(GameEvent.OBJECT_CLICKED, clickListener);
		}

		public function init():void
		{
			//Text vars add
			_gt.visible = true;
			_gt.x = stage.stageWidth / 2 - _gt.width / 2;
			_gt.y = 360;
			addChild(_gt);
			scoreUpdate(0);
			_scoreText.x = 10;
			_scoreText.y = 5;
			addChild(_scoreText);
			_lvlText.x = stage.stageWidth / 2 - _lvlText.width / 2 - 5;
			_lvlText.y = 5;
			addChild(_lvlText);
			_flyText = new FlyText("xxx",0,0);
			addChild(_flyText);
			newGame();

			addEventListener(GameEvent.SHOT_ENDED, explode);
			//addEventListener(ShotEvent.SHOT_BEGIN, shoot);
		}

		private function explode(e:GameEvent):void
		{
			CONFIG::debug { trace("time to explode bags"); };
			for (var i:int =0; i < _bags.length; i++)
			{
				Bag(_bags[i]).open();
			}
			this.setChildIndex(_flyText, this.numChildren - 1);

			if (_targetBag.isEvading())
			{
				_flyText.setMessage("-1 life");
				_flyText.x = stage.stageWidth / 2 - _flyText.width / 2;
				_flyText.y = 200;
				_flyText.setTarget(545,36);
				_flyText.fly();
				dispatchEvent(new LevelFinishEvent(LevelFinishEvent.LEVEL_END_LOSE, true, false, _targetBag.scoreValue()));
			}
			else
			{
				_flyText.setMessage(_targetBag.scoreValue().toString());
				scoreUpdate(_targetBag.scoreValue());
				_flyText.x = _targetBag.x - _flyText.width / 2;
				_flyText.y = _targetBag.y-10;
				_flyText.setTarget(81,26);
				_flyText.fly();
				dispatchEvent(new LevelFinishEvent(LevelFinishEvent.LEVEL_END_WIN, true, false, _targetBag.scoreValue()));
			}
		}

		public function newGame():void
		{
			_gt.visible = true;
			_lvl = 0;
			lvlUpdate();
			_score = 0;
			scoreUpdate(0);
			_bags = new Array();
			levelCreate(_lvl);
		}

		private function scoreUpdate(num:int):void
		{
			CONFIG::debug { trace("I update score for " + num); }
			_score +=  num;
			_scoreText.textMessage = "Your score: " + _score.toString();
		}

		private function lvlUpdate():void
		{
			_lvlText.textMessage = "Level: " + (_lvl + 1).toString();
		}

		public function clearGame():void
		{
			clearLevel();
			removeChild(_backGround);
			_backGround = null;
			removeChild(_gt);
			_gt = null;
			removeChild(_scoreText);
			_scoreText = null;
			removeChild(_lvlText);
			_lvlText = null;
		}
		
		
		public function clearLevel():void
		{
			CONFIG::debug { trace("clearing level"); }
			_gt.visible = false;
			for (var i:int =0; i < _bags.length; i++)
			{
				removeChild(_bags[i]);
				_bags[i] = null;
			}
			_bags = null;
		}

		public function levelCreate(num:int):void
		{
			_lvl = num;
			lvlUpdate();
			_bags = new Array();
			_gt.visible = true;

			for (var i:int = 0; i < 9; i++)
			{
				var basket:Bag = new Bag();
				if (i <= _lvl)
				{
					basket.setEvading(true);
				}
				_bags.push(basket);
			}


			_bags = Helper.shuffle(_bags);

			for (var i:int = 0; i < _bags.length; i++)
			{
				_bags[i].x = _bags[i].width/2 + stage.stageWidth/_bags.length * i + 10;
				_bags[i].y = stage.stageHeight/2;
				addChild(_bags[i]);
			}
			
			setChildIndex(_gt, this.numChildren-1)
		}


		public function gameOver():int
		{

			return _score;
		}

		private function clickListener(e:Event):void
		{
			_gt.visible = false;
			_targetBag = Bag(e.target);
			for (var i:int =0; i < _bags.length; i++)
			{
				Bag(_bags[i]).unregister();
			}
		}

	}

}
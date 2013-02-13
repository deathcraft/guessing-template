package src
{
	import flash.display.MovieClip;
	import src.events.*;
	import src.playobjects.*;
	import flash.ui.Mouse;
	import flash.events.Event;

	public class GameConsole extends MovieClip
	{

		private var _gameManager:IPlayable;
		private var _lvl:int = 0;
		private var _lives:int = GameConstants.LIVES_TOTAL;
		private var _hud:HeartDisplay;
		private var grBut:GameButton;
		private var grTxt:GameText;

		public function GameConsole()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void  {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addChild(this);
			//Main game class
			_gameManager = new GameManager();
			addChild(MovieClip(_gameManager));
			_gameManager.init();
			//Game state listeners
			this.addEventListener(GameOverEvent.LOSE, endGame);
			this.addEventListener(GameOverEvent.WIN, winGame);
			this.addEventListener(LevelFinishEvent.LEVEL_END_WIN, nextLevel);
			this.addEventListener(LevelFinishEvent.LEVEL_END_LOSE, restartLevel);
			//HUD with hearts
			createHUD();
		}
		
		private function reset():void {
			MovieClip(_gameManager).removeChild(_hud);
			_lvl = 0;
			_lives = GameConstants.LIVES_TOTAL;
			createHUD();
		}

		private function endGame(e:GameOverEvent):void
		{
			CONFIG::debug { trace("player lost the game"); }
			addMessageButton(looseHandler, "You have lost!");
		}

		private function looseHandler(e:Event):void
		{
			reset();
			_gameManager.clearLevel();
			_gameManager.newGame();
			MovieClip(_gameManager).removeChild(grBut);
			grBut.unregister();
			grBut = null;
		}

		private function winGame(e:GameOverEvent):void
		{
			addMessageButton(winHandler, "You've won. Your bonus: "  + Math.round(_gameManager.gameOver() * 0.5), "Play again");
			CONFIG::debug { trace("player won the game"); }
			grTxt = new GameText("Total score: " + Math.round(_gameManager.gameOver() * 1.5), true);
			grTxt.x = stage.stageWidth / 2 - grTxt.width / 2;
			grTxt.y = 280;
			MovieClip(_gameManager).addChild(grTxt);
		}

		private function winHandler(e:Event):void
		{
			reset();
			_gameManager.clearLevel();
			_gameManager.newGame();
			MovieClip(_gameManager).removeChild(grBut);
			MovieClip(_gameManager).removeChild(grTxt);
			grBut.unregister();
			grBut = null;
		}

		private function nextLevel(e:LevelFinishEvent):void
		{
			if (_lvl < GameConstants.LEVELS_TOTAL - 1)
			{
				addMessageButton(nextLevelHandler, "Play next level");
			}
			else
			{
				dispatchEvent(new GameOverEvent(GameOverEvent.WIN, true, false, e.score));
			}
		}

		private function restartLevel(e:LevelFinishEvent):void
		{
			CONFIG::debug { trace("player lost a life"); }
			_lives--;
			_hud.remLife();
			if (_lives < 1)
			{
				dispatchEvent(new GameOverEvent(GameOverEvent.LOSE, true, false, e.score));
			}
			else
			{
				addMessageButton(loseHandler, "You've lost 1 life!");
			}
		}

		private function loseHandler(e:Event):void 
		{
			 levelGen();
		}
		
		
		private function nextLevelHandler(e:Event):void
		{
			CONFIG::debug { trace("generating the new level " + _lvl); }
			_lvl++;
			levelGen();
		}
		
		private function levelGen():void {
			_gameManager.clearLevel();
			_gameManager.levelCreate(_lvl);
			MovieClip(_gameManager).removeChild(grBut);
			grBut.unregister();
			grBut = null;
		}
		
		private function addMessageButton(handler:Function, messageText:String, buttonText:String = "OK"):void 
		{
			grBut = new GameButton(buttonText, messageText, null, handler);
			grBut.x = stage.stageWidth / 2 - grBut.width / 2;
			grBut.y = 230;
			MovieClip(_gameManager).addChild(grBut);
		}
		
		private function createHUD():void 
		{
			_hud = new HeartDisplay(_lives,350,15);
			MovieClip(_gameManager).addChild(_hud);
		}
	}
}
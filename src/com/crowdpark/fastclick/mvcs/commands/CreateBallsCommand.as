package com.crowdpark.fastclick.mvcs.commands
{
	import utils.number.randomIntegerWithinRange;

	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import com.crowdpark.fastclick.mvcs.views.ball.ClickBall;

	import org.robotlegs.mvcs.Command;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author marcyohannes
	 */
	public class CreateBallsCommand extends Command
	{
		[Inject]
		public var fastClickModel : FastClickModel;
		private var _ballCreationTimer : Timer;

		override public function execute() : void
		{
			//var gameTimer : Timer = new Timer(fastClickModel.gametime);
			var gameTimer : Timer = new Timer(1000, fastClickModel.gametime);
			//gameTimer.addEventListener(TimerEvent.TIMER, onGameOver);
			gameTimer.addEventListener(TimerEvent.TIMER, dispatchUpdateTimeDisplay);
			gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onGameOver);
			gameTimer.start();
			createBalls();
		}

		private function dispatchUpdateTimeDisplay(event : TimerEvent) : void
		{
			
			trace("dispatchUpdateTimeDisplay "+Timer(event.target).currentCount);
			dispatch(new FastClickEvent(FastClickEvent.UPDATE_TIME_DISPLAY, Timer(event.target)));
		}

		private function startBallCreationTimer() : void
		{
			_ballCreationTimer = new Timer(randomIntegerWithinRange(500, 2000));
			_ballCreationTimer.addEventListener(TimerEvent.TIMER, createBalls);
			_ballCreationTimer.start();
		}

		private function onGameOver(event : TimerEvent) : void
		{
			_ballCreationTimer.stop();
			_ballCreationTimer.removeEventListener(TimerEvent.TIMER, createBalls);
			Timer(event.target).stop();
			Timer(event.target).removeEventListener(TimerEvent.TIMER, onGameOver);
			Timer(event.target).removeEventListener(TimerEvent.TIMER, dispatchUpdateTimeDisplay);
			dispatch(new FastClickEvent(FastClickEvent.CLEAN_UP));
			fastClickModel.addScoreToHighScoreList();
			fastClickModel.resetScore();
			dispatch(new FastClickEvent(FastClickEvent.CREATE_ENDSCREEN));
		}

		private function createBalls(event : TimerEvent = null) : void
		{
			if (event != null)
			{
				_ballCreationTimer.stop();
				_ballCreationTimer.removeEventListener(TimerEvent.TIMER, createBalls);
			}

			var currentBallNumber : uint = Math.ceil(Math.random() * fastClickModel.maxBalls);
			var fastClickBall : ClickBall;

			for (var i : uint = 0;i < currentBallNumber;i++)
			{
				fastClickBall = new ClickBall();
				fastClickBall.x = Math.random() * fastClickModel.width;
				fastClickBall.y = Math.random() * fastClickModel.height;
				contextView.addChild(fastClickBall);
			}
			startBallCreationTimer();
		}
	}
}

package com.crowdpark.fastclick.mvcs.views.ball
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.interfaces.ITarget;

	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import utils.number.randomIntegerWithinRange;

	/**
	 * @author marcyohannes
	 */
	public class ClickBall extends Sprite implements ITarget
	{
		private var clickTimer : Timer;

		public function ClickBall()
		{
			buttonMode = true;
			draw();
			startClickTimer();
		}

		public function startClickTimer() : void
		{
			clickTimer = new Timer(randomIntegerWithinRange(500, 1500));
			clickTimer.addEventListener(TimerEvent.TIMER, onTimeOver);
			clickTimer.start();
		}

		public function onTimeOver(event : TimerEvent) : void
		{
			stopClickTimer();
			dispatchEvent(new FastClickEvent(FastClickEvent.TIME_OVER));
		}

		public function draw() : void
		{
			graphics.clear();
			graphics.beginFill(Math.random() * uint.MAX_VALUE);
			graphics.drawCircle(0, 0, 15);
		}

		public function stopClickTimer() : void
		{
			clickTimer.removeEventListener(TimerEvent.TIMER, onTimeOver);
			clickTimer.stop();
		}
	}
}

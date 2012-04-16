package com.crowdpark.fastclick.mvcs.views.ball
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author marcyohannes
	 */
	public class ClickBallMediator extends Mediator
	{
		[Inject]
		public var fastClickModel : FastClickModel;
		[Inject]
		public var clickBallView : ClickBall;

		override public function onRegister() : void
		{
			addViewListener(MouseEvent.CLICK, onClick);
			addViewListener(FastClickEvent.TIME_OVER, onTimeOver);
			eventMap.mapListener(eventDispatcher, FastClickEvent.CLEAN_UP, cleanUp);
		}

		private function cleanUp(event : FastClickEvent) : void
		{
			eventMap.unmapListener(eventDispatcher, FastClickEvent.CLEAN_UP, cleanUp);
			clickBallView.stopClickTimer();
			contextView.removeChild(clickBallView);
		}

		private function onTimeOver(event : FastClickEvent) : void
		{
			removeViewListener(FastClickEvent.TIME_OVER, onTimeOver);
			contextView.removeChild(clickBallView);
		}

		private function onClick(event : MouseEvent) : void
		{
			removeViewListener(MouseEvent.CLICK, onClick);
			clickBallView.stopClickTimer();
			fastClickModel.addPoints();
			contextView.removeChild(clickBallView);
		}
	}
}
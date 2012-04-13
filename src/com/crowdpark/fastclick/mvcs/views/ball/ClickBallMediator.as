package com.crowdpark.fastclick.mvcs.views.ball
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.interfaces.ITarget;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;



	/**
	 * @author marcyohannes
	 */
	public class ClickBallMediator extends Mediator
	{
		[Inject]
		public var fastClickModel : FastClickModel;

		override public function onRegister() : void
		{
			addViewListener(MouseEvent.CLICK, onClick);
			addViewListener(FastClickEvent.TIME_OVER, onTimeOver);
		}

		private function onTimeOver(event : FastClickEvent) : void
		{
			removeViewListener(FastClickEvent.TIME_OVER, onTimeOver);
			contextView.removeChild(Sprite(event.currentTarget));
		}

		private function onClick(event : MouseEvent) : void
		{
			removeViewListener(MouseEvent.CLICK, onClick);
			ITarget(event.target).stopClickTimer();
			fastClickModel.remove(ITarget(event.target));
			contextView.removeChild(Sprite(event.target));
		}
	}
}
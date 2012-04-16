package com.crowdpark.fastclick.mvcs.views.startScreen
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author marcyohannes
	 */
	public class StartScreenMediator extends Mediator
	{
		[Inject]
		public var startScreenView : StartScreen;

		override public function onRegister() : void
		{
			addViewListener(MouseEvent.CLICK, onClick);
		}

		private function onClick(event : MouseEvent) : void
		{
			removeViewListener(MouseEvent.CLICK, onClick);
			contextView.removeChild(startScreenView);
			dispatch(new FastClickEvent(FastClickEvent.CREATE_DISPLAY));
		}
	}
}

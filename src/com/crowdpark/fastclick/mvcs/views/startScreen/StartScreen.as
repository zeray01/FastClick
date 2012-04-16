package com.crowdpark.fastclick.mvcs.views.startScreen
{
	import com.bit101.components.PushButton;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author marcyohannes
	 */
	public class StartScreen extends Sprite
	{
		private var _startButton : PushButton;

		public function StartScreen()
		{
			init();
		}

		private function init() : void
		{
			_startButton = new PushButton();
			_startButton.label = "Start";
			addChild(_startButton);
			_startButton.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function onClick(event : MouseEvent) : void
		{
			_startButton.removeEventListener(MouseEvent.CLICK, onClick);
			dispatchEvent(event);
		}
	}
}

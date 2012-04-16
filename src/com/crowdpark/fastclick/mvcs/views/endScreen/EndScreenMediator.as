package com.crowdpark.fastclick.mvcs.views.endScreen
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author marcyohannes
	 */
	public class EndScreenMediator extends Mediator
	{
		[Inject]
		public var endScreen : EndScreen;
		[Inject]
		public var fastClickModel : FastClickModel;

		override public function onRegister() : void
		{
			showHighScore();
			addViewListener(FastClickEvent.ENDBUTTON_CLICKED, onClick);
		}

		private function showHighScore() : void
		{
			var counter : uint;
			for (var i : uint = 0;i < fastClickModel.highScoreVector.length;i++)
			{
				counter = i + 1;
				endScreen.fillHighScoreTextField(counter + ".  " + fastClickModel.highScoreVector[i]);
			}
		}

		private function onClick(event : FastClickEvent) : void
		{
			removeViewListener(FastClickEvent.ENDBUTTON_CLICKED, onClick);
			contextView.removeChild(endScreen);
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}

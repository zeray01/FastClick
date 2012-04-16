package com.crowdpark.fastclick.mvcs.views.display
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import com.crowdpark.net.rpc.json.JsonRpcClient;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author marcyohannes
	 */
	public class DisplayMediator extends Mediator
	{
		[Inject]
		public var fastClickModel : FastClickModel;
		[Inject]
		public var displayView : Display;
		[Inject]
		public var testClient:JsonRpcClient;

		override public function onRegister() : void
		{
			eventMap.mapListener(eventDispatcher, FastClickEvent.POINTS_ADDED, updateScore);
			eventMap.mapListener(eventDispatcher, FastClickEvent.UPDATE_TIME_DISPLAY, updateTime);
			eventMap.mapListener(eventDispatcher, FastClickEvent.CLEAN_UP, cleanUp);
			displayView.timerTextFieldText = "" + fastClickModel.gametime;
			
		}

		private function cleanUp(event : FastClickEvent) : void
		{
			eventMap.unmapListener(eventDispatcher, FastClickEvent.POINTS_ADDED, updateScore);
			eventMap.unmapListener(eventDispatcher, FastClickEvent.UPDATE_TIME_DISPLAY, updateTime);
			eventMap.unmapListener(eventDispatcher, FastClickEvent.CLEAN_UP, cleanUp);
			contextView.removeChild(displayView);
		}

		private function updateTime(event : FastClickEvent) : void
		{
			var remainingGameTime : uint = fastClickModel.gametime - event.gameTimeTimer.currentCount;
			displayView.timerTextFieldText = "" + remainingGameTime;
		}

		private function updateScore(event : FastClickEvent) : void
		{
			var testObj:Object = {test:"test"};
			testClient.url = "www.google.de";
			testClient.send(testObj);
			displayView.scoreTextFieldText = String(fastClickModel.score);
		}
	}
}

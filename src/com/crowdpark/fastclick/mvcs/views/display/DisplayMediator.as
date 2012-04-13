package com.crowdpark.fastclick.mvcs.views.display
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import org.robotlegs.mvcs.Mediator;


	/**
	 * @author marcyohannes
	 */
	public class DisplayMediator extends Mediator
	{
		[Inject]
		public var fastClickModel : FastClickModel;
		
		[Inject]
		public var displayTextField:Display;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, FastClickEvent.ALL_TARGETS_CLICKED, updateText);
		}

		private function updateText(event:FastClickEvent) : void
		{
			displayTextField.text = String(fastClickModel.score);
		}
	}
}

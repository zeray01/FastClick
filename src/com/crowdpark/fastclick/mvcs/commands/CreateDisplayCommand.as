package com.crowdpark.fastclick.mvcs.commands
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import com.crowdpark.fastclick.mvcs.views.display.Display;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author marcyohannes
	 */
	public class CreateDisplayCommand extends Command
	{
		[Inject]
		public var fastClickModel : FastClickModel;

		override public function execute() : void
		{
			var display : Display = new Display();
			contextView.addChild(display);
			dispatch(new FastClickEvent(FastClickEvent.CREATE_TARGETS));
		}
	}
}

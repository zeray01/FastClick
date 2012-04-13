package com.crowdpark.fastclick.mvcs.commands
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.views.display.Display;
	import org.robotlegs.mvcs.Command;


	/**
	 * @author marcyohannes
	 */
	public class StartupCompleteCommand extends Command
	{
		override public function execute() : void
		{
			contextView.addChild(new Display());
			dispatch(new FastClickEvent(FastClickEvent.CREATE_TARGETS));
		}
	}
}

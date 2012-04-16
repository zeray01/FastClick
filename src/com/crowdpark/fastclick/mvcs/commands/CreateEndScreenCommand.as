package com.crowdpark.fastclick.mvcs.commands
{
	import com.crowdpark.fastclick.mvcs.views.endScreen.EndScreen;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author marcyohannes
	 */
	public class CreateEndScreenCommand extends Command
	{
		override public function execute() : void
		{
			var endScreen : EndScreen = new EndScreen();
			contextView.addChild(endScreen);
		}
	}
}

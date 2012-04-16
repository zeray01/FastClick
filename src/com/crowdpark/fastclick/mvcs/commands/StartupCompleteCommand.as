package com.crowdpark.fastclick.mvcs.commands
{
	import com.crowdpark.fastclick.mvcs.views.startScreen.StartScreen;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author marcyohannes
	 */
	public class StartupCompleteCommand extends Command
	{
		override public function execute() : void
		{
			var startScreen : StartScreen = new StartScreen();
			startScreen.x = 220;
			startScreen.y = 150;
			contextView.addChild(startScreen);
		}
	}
}

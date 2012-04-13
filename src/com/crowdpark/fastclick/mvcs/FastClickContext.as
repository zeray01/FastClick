package com.crowdpark.fastclick.mvcs
{
	import com.crowdpark.fastclick.mvcs.commands.AddPointsCommand;
	import com.crowdpark.fastclick.mvcs.commands.CreateBallsCommand;
	import com.crowdpark.fastclick.mvcs.commands.StartupCompleteCommand;
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import com.crowdpark.fastclick.mvcs.views.ball.ClickBall;
	import com.crowdpark.fastclick.mvcs.views.ball.ClickBallMediator;
	import com.crowdpark.fastclick.mvcs.views.display.Display;
	import com.crowdpark.fastclick.mvcs.views.display.DisplayMediator;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;



	/**
	 * @author marcyohannes
	 */
	public class FastClickContext extends Context
	{
		public function FastClickContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand);
			commandMap.mapEvent(FastClickEvent.CREATE_TARGETS, CreateBallsCommand);
			commandMap.mapEvent(FastClickEvent.ALL_TARGETS_CLICKED, AddPointsCommand);

			mediatorMap.mapView(ClickBall, ClickBallMediator);
			mediatorMap.mapView(Display, DisplayMediator);

			injector.mapSingleton(FastClickModel);

			super.startup();
		}
	}
}

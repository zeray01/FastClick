package com.crowdpark.fastclick.mvcs
{
	import com.crowdpark.fastclick.mvcs.commands.CreateBallsCommand;
	import com.crowdpark.fastclick.mvcs.commands.CreateDisplayCommand;
	import com.crowdpark.fastclick.mvcs.commands.CreateEndScreenCommand;
	import com.crowdpark.fastclick.mvcs.commands.StartupCompleteCommand;
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import com.crowdpark.fastclick.mvcs.views.ball.ClickBall;
	import com.crowdpark.fastclick.mvcs.views.ball.ClickBallMediator;
	import com.crowdpark.fastclick.mvcs.views.display.Display;
	import com.crowdpark.fastclick.mvcs.views.display.DisplayMediator;
	import com.crowdpark.fastclick.mvcs.views.endScreen.EndScreen;
	import com.crowdpark.fastclick.mvcs.views.endScreen.EndScreenMediator;
	import com.crowdpark.fastclick.mvcs.views.startScreen.StartScreen;
	import com.crowdpark.fastclick.mvcs.views.startScreen.StartScreenMediator;
	import com.crowdpark.net.rpc.json.JsonRpcClient;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

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
			commandMap.mapEvent(FastClickEvent.CREATE_DISPLAY, CreateDisplayCommand);
			commandMap.mapEvent(FastClickEvent.CREATE_TARGETS, CreateBallsCommand);
			commandMap.mapEvent(FastClickEvent.CREATE_ENDSCREEN, CreateEndScreenCommand);

			mediatorMap.mapView(ClickBall, ClickBallMediator);
			mediatorMap.mapView(Display, DisplayMediator);
			mediatorMap.mapView(StartScreen, StartScreenMediator);
			mediatorMap.mapView(EndScreen, EndScreenMediator);
			
			
			var jsonRpcClient:JsonRpcClient = new JsonRpcClient();
			injector.mapValue(JsonRpcClient, jsonRpcClient);
			injector.mapSingleton(FastClickModel);

			super.startup();
		}
	}
}

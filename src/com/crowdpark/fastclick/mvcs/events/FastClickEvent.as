package com.crowdpark.fastclick.mvcs.events
{
	import flash.events.Event;
	import flash.utils.Timer;

	/**
	 * @author marcyohannes
	 */
	public class FastClickEvent extends Event
	{
		public static const CREATE_TARGETS : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.CREATE_TARGETS";
		public static const TIME_OVER : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.TIME_OVER";
		public static const POINTS_ADDED : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.POINTS_ADDED";
		public static const CLEAN_UP : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.CLEAN_UP";
		public static const CREATE_DISPLAY : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.CREATE_DISPLAY";
		public static const CREATE_ENDSCREEN : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.CREATE_ENDSCREEN";
		public static const UPDATE_TIME_DISPLAY : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.UPDATE_TIME_DISPLAY";
		public static const ENDBUTTON_CLICKED : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.ENDBUTTON_CLICKED";
		private var _gameTimeTimer : Timer;

		public function FastClickEvent(type : String, aGameTimeTimer : Timer = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			_gameTimeTimer = aGameTimeTimer;
		}

		public function get gameTimeTimer() : Timer
		{
			return _gameTimeTimer;
		}
	}
}

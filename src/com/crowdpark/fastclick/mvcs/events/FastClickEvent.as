package com.crowdpark.fastclick.mvcs.events
{
	import com.crowdpark.fastclick.mvcs.interfaces.ITarget;
	import flash.events.Event;

	/**
	 * @author marcyohannes
	 */
	public class FastClickEvent extends Event
	{
		public static const CREATE_TARGETS : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.CREATE_TARGETS";
		public static const TIME_OVER : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.TIME_OVER";
		public static const ALL_TARGETS_CLICKED : String = "com.crowdpark.fastclick.mvcs.events.FastClickEvent.ALL_TARGETS_CLICKED";
		
		private var _clickTarget:ITarget;
		
		public function FastClickEvent(type : String, clickTarget:ITarget = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			_clickTarget = clickTarget;
		}

		public function get clickTarget() : ITarget
		{
			return _clickTarget;
		}
		
		
	}
}

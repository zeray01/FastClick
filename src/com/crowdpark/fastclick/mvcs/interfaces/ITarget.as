package com.crowdpark.fastclick.mvcs.interfaces
{
	import flash.events.TimerEvent;
	/**
	 * @author marcyohannes
	 */
	public interface ITarget
	{
		function draw():void;
		function startClickTimer():void; 
		function onTimeOver(event : TimerEvent) : void;
		function stopClickTimer() : void;
	}
}

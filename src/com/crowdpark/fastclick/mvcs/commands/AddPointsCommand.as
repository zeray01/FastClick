package com.crowdpark.fastclick.mvcs.commands
{
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author marcyohannes
	 */
	public class AddPointsCommand extends Command
	{
		[Inject]
		public var fastClickModel:FastClickModel;
		
		override public function execute() : void{
			fastClickModel.addPoints();
		}
	}
}

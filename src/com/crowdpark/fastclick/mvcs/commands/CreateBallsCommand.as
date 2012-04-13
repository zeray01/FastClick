package com.crowdpark.fastclick.mvcs.commands
{
	import com.crowdpark.fastclick.mvcs.model.FastClickModel;
	import com.crowdpark.fastclick.mvcs.views.ball.ClickBall;
	import org.robotlegs.mvcs.Command;


	/**
	 * @author marcyohannes
	 */
	public class CreateBallsCommand extends Command
	{
		[Inject]
		public var fastClickModel : FastClickModel;

		override public function execute() : void
		{
			var currentBallNumber : uint = Math.ceil(Math.random() * fastClickModel.maxBalls);
			var fastClickBall : ClickBall;

			for (var i : uint = 0;i < currentBallNumber;i++)
			{
				fastClickBall = new ClickBall();
				fastClickBall.x = Math.random() * fastClickModel.width;
				fastClickBall.y = Math.random() * fastClickModel.height;
				contextView.addChild(fastClickBall);

				fastClickModel.add = fastClickBall;
			}
		}
	}
}

package 
{
	import com.crowdpark.fastclick.mvcs.FastClickContext;

	import flash.display.Sprite;

	public class Main extends Sprite
	{
		private var _fastClickContext:FastClickContext;
		
		public function Main()
		{
			// Launch your application by right clicking within this class and select: Debug As > FDT SWF Application
			_fastClickContext = new FastClickContext(this);
		}
	}
}

package com.crowdpark.fastclick.mvcs.views.display
{
	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author marcyohannes
	 */
	public class Display extends Sprite
	{
		private var _scoreTextField : TextField;
		private var _timerTextField : TextField;

		public function Display()
		{
			init();
		}

		private function init() : void
		{
			var scoreDescriptionTextField:TextField = new TextField();
			scoreDescriptionTextField.text = "Score:";
			addChild(scoreDescriptionTextField);
			
			_scoreTextField = new TextField();
			_scoreTextField.text = "0";
			_scoreTextField.x = 50;
			addChild(_scoreTextField);
			
			var timeDescriptionTextField:TextField = new TextField();
			timeDescriptionTextField.text = "Time:";
			timeDescriptionTextField.x = 250;
			addChild(timeDescriptionTextField);
			
			_timerTextField = new TextField();
			_timerTextField.x = 300;
			addChild(_timerTextField);
		}

		public function set scoreTextFieldText(aText : String) : void
		{
			_scoreTextField.text = aText;
		}
		
		public function set timerTextFieldText(aText : String) : void
		{
			_timerTextField.text = aText;
		}
	}
}

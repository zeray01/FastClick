package com.crowdpark.fastclick.mvcs.views.display
{
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;
	import flash.text.TextField;
	import flash.display.Sprite;

	/**
	 * @author marcyohannes
	 */
	public class Display extends Sprite
	{
		private var _textField : TextField;
		private var _startButton : PushButton;
		private var _topPanel : Panel;

		public function Display()
		{
			init();
		}

		private function init() : void
		{
			_textField = new TextField();
			_textField.text = "0";
			addChild(_textField);
			
			_startButton = new PushButton();
			_startButton.label = "Start";
			this.addChild(_startButton);
			
			_topPanel = new Panel();
			_topPanel.x = 300;
			this.addChild(_topPanel);
		}

		public function set text(aText : String) : void
		{
			_textField.text = aText;
		}
	}
}

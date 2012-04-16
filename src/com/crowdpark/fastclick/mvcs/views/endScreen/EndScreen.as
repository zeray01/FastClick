package com.crowdpark.fastclick.mvcs.views.endScreen
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author marcyohannes
	 */
	public class EndScreen extends Sprite
	{
		private var _topPanel : Panel;
		private var _textFieldOffset : uint;
		private var _endButton : PushButton;

		public function EndScreen()
		{
			init();
		}

		private function init() : void
		{
			_topPanel = new Panel();
			_topPanel.height = 300;
			_topPanel.width = 300;
			_topPanel.x = 120;
			addChild(_topPanel);

			_textFieldOffset = 0;

			_endButton = new PushButton();
			_endButton.x = 220;
			_endButton.y = 350;
			_endButton.label = "Restart";
			addChild(_endButton);
			_endButton.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function incremenTextFieldOffset() : void
		{
			_textFieldOffset += 20;
		}

		public function fillHighScoreTextField(score : String) : void
		{
			var highScoreTextField : TextField = new TextField();
			highScoreTextField.x = 250;
			highScoreTextField.y = _textFieldOffset;
			addChild(highScoreTextField);
			highScoreTextField.text = score;
			incremenTextFieldOffset();
		}

		private function onClick(event : MouseEvent) : void
		{
			_endButton.removeEventListener(MouseEvent.CLICK, onClick);
			dispatchEvent(new FastClickEvent(FastClickEvent.ENDBUTTON_CLICKED));
		}
	}
}

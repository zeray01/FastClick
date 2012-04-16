package com.crowdpark.fastclick.mvcs.model
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author marcyohannes
	 */
	public class FastClickModel extends Actor
	{
		private var _maxBalls : uint;
		private var _width : uint;
		private var _height : uint;
		private var _points : uint;
		private var _score : uint;
		private var _gametime : uint;
		private var _highScoreVector : Vector.<uint>;

		public function FastClickModel()
		{
			initValues();
		}

		private function initValues() : void
		{
			_maxBalls = 4;
			_width = 500;
			_height = 350;
			_points = 100;
			_score = 0;
			//_gametime = 5000;
			_gametime = 10;
			_highScoreVector = new Vector.<uint>;
		}

		public function addPoints() : void
		{
			_score += _points;
			dispatch(new FastClickEvent(FastClickEvent.POINTS_ADDED));
		}

		public function resetScore() : void
		{
			_score = 0;
		}

		public function get maxBalls() : uint
		{
			return _maxBalls;
		}

		public function get width() : uint
		{
			return _width;
		}

		public function get height() : uint
		{
			return _height;
		}

		public function get score() : uint
		{
			return _score;
		}

		public function addScoreToHighScoreList() : void
		{
			_highScoreVector.push(score);
			_highScoreVector.sort(compare);
		}

		private function compare(x : uint, y : uint) : Number
		{
			if (x > y)
			{
				return -1;
			}
			else if (x < y)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}

		public function get highScoreVector() : Vector.<uint>
		{
			return _highScoreVector;
		}

		public function get gametime() : uint
		{
			return _gametime;
		}
	}
}

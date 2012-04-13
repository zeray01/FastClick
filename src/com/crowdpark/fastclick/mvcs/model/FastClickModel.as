package com.crowdpark.fastclick.mvcs.model
{
	import com.crowdpark.fastclick.mvcs.events.FastClickEvent;
	import com.crowdpark.fastclick.mvcs.interfaces.ITarget;
	import org.robotlegs.mvcs.Actor;


	/**
	 * @author marcyohannes
	 */
	public class FastClickModel extends Actor
	{
		private var _objectVector : Vector.<ITarget>;
		private var _maxBalls : uint;
		private var _width : uint;
		private var _height : uint;
		private var _points : uint;
		private var _score : uint;

		public function FastClickModel()
		{
			reset();
			initValues();
		}

		private function initValues() : void
		{
			_maxBalls = 10;
			_width = 500;
			_height = 350;
			_points = 100;
			_score = 0;
		}

		public function addPoints() : void
		{
			_score += _points;
		}

		public function reset() : void
		{
			_objectVector = new Vector.<ITarget>;
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

		public function remove(object : ITarget) : void
		{
			_objectVector.splice(_objectVector.indexOf(object), 1);
			if (_objectVector.length == 0)
			{
				dispatch(new FastClickEvent(FastClickEvent.ALL_TARGETS_CLICKED));
				dispatch(new FastClickEvent(FastClickEvent.CREATE_TARGETS));
			}
		}

		public function set add(object : ITarget) : void
		{
			_objectVector.push(object);
		}

		public function get score() : uint
		{
			return _score;
		}

		public function get length() : uint
		{
			return _objectVector.length;
		}
	}
}

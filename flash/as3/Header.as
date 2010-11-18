package {
	import flash.display.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Header extends MovieClip {
		private var logo_mc:MovieClip;
		
		public function Header(){
			logo_mc = this['logo_rotator_mc'];
			
			var tm:Timer = new Timer(3000,5);
			var ref:* = this;
			tm.addEventListener(TimerEvent.TIMER,function(){ref.rotate();})
			tm.start();
		}

		public function rotate() : void {
			trace('rotate');
			logo_mc.play();
		}
		
		public override function get width() : Number{
			return 400;
		}
	}
}
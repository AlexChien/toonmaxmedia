class com.toonmax.ui.Header extends MovieClip {
	private var logo_rotator_mc:MovieClip;
	
	public function Header(){
	}
	
	public function rotate(){
		/*trace('rotate');*/
		logo_rotator_mc.play();
	}
	
	public function get width(){
		return 400;
	}
}
import mx.utils.Delegate;
import com.koocaa.util.debug.Debugger;

class com.toonmax.ui.Nav extends MovieClip {
	private var urls:Array = [
		'aboutus.html', //关于我们
		'',	//主营业务
		'',	//新闻中心
		'',	//投资者关系
		'',	//品牌合作
		''	//招贤纳士
	];
	
	public function init(){
		var l = urls.length;
		for(var i=0;i<l;i++){
			var btn = (this['btn_'+(i+1)]);
			/*btn.url = urls[i];
			btn.enabled = btn.url != '';*/
			btn.onRelease = clickHandler;
		}
	}
	
	public function clickHandler(){
		var mc = this;
		trace(mc);
		getURL('http://localhost:3000/500.html','_blank');
	}
}
class Main extends hxd.App {
    var style = null;

    override function init() {
        var view = new SampleView(h2d.Tile.fromColor(0xFF,32,32), s2d);
        view.mybmp.alpha = 0.8;

		style = new h2d.domkit.Style();
		style.load(hxd.Res.style);
		style.addObject(view);
    }
    static function main() {
        #if hl
		hxd.res.Resource.LIVE_UPDATE = true;
		hxd.Res.initLocal();
		#else
		hxd.Res.initEmbed();
		#end
        
        new Main();
    }
}

@:uiComp("sample-view")
class SampleView extends h2d.Flow implements h2d.domkit.Object {
    static var SRC = 
        <sample-view layout="vertical" class="box"> 
            <text text={"Hello World"}/>
            <bitmap src={tile} public id="mybmp"/>
        </sample-view>

    public function new(tile:h2d.Tile,?parent) {
        super(parent);
        initComponent();
    }
}
class Main extends hxd.App {
    override function init() {
        var view = new SampleView(h2d.Tile.fromColor(0xFF,32,32), s2d);
        view.mybmp.alpha = 0.8;
    }
    static function main() {
        new Main();
    }
}

class SampleView extends h2d.Flow implements h2d.domkit.Object {
    static var SRC = 
        <sample-view layout="vertical"> 
            Hello World! 
            <bitmap src={tile} public id="mybmp"/>
        </sample-view>

    public function new(tile:h2d.Tile,?parent) {
        super(parent);
        initComponent();
    }
}
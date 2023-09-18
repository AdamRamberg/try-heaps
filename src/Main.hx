import Fiber.VirtualNode;

class Main extends hxd.App {
    override function init() {
        var fiber = new Fiber();
        fiber.render(new VirtualNode({ 
            style: { backgroundColor: 0x2A8240 },
            children: [
                new VirtualNode({ style: { backgroundColor: 0xFFFF00 } }),
                new VirtualNode({ style: { backgroundColor: 0x00FFFF } }),
                new VirtualNode({ style: { backgroundColor: 0xFF00FF } }),
            ]
        })
        , s2d);
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
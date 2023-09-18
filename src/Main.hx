import Fiber.FlowNode;
import Fiber.ViewNode;

class Main extends hxd.App {
    override function init() {
        var fiber = new Fiber();
        fiber.render(new ViewNode({ 
            style: { backgroundColor: 0x2A8240, width: 200, height: 200 },
            children: [
                new FlowNode({ 
                    children: [
                        new ViewNode({ style: { backgroundColor: 0xFFFF00 } }),
                        new ViewNode({ style: { backgroundColor: 0x00FFFF } }),
                        new ViewNode({ style: { backgroundColor: 0xFF00FF } }),
                        new ViewNode({ style: { backgroundColor: 0xFFFF00 } }),
                        new ViewNode({ style: { backgroundColor: 0x00FFFF } }),
                        new ViewNode({ style: { backgroundColor: 0xFF00FF } }),
                        new ViewNode({ style: { backgroundColor: 0xFFFF00 } }),
                        new ViewNode({ style: { backgroundColor: 0x00FFFF } }),
                        new ViewNode({ style: { backgroundColor: 0xFF00FF } }),
                        new ViewNode({ style: { backgroundColor: 0xFFFF00 } }),
                        new ViewNode({ style: { backgroundColor: 0x00FFFF } }),
                        new ViewNode({ style: { backgroundColor: 0xFF00FF } }),
                    ] 
                }),
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
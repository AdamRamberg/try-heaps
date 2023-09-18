class Fiber extends h2d.Object {
    public function new() {
        super(parent);        
    }

    var graphics: h2d.Graphics = null;

    public function render(app: VirtualNode, scene: h2d.Scene) {
        graphics = new h2d.Graphics(scene);
        renderNode(app);
    }

    var renderCount: Int = 0;
    function renderNode(node: VirtualNode) {
        graphics.beginFill(node?.props?.style?.backgroundColor ?? 0xFFFFFF);
        graphics.drawRect(10, 10 + renderCount * 10, 100 - renderCount * 10, 100 - renderCount * 10);
        graphics.endFill();
        renderCount++;
        
        if (node.props.children != null) {
            for (child in node.props.children) {
                renderNode(child);
            }
        }
    }
    // override function update(dt:Float) {
    //     super.update(dt);
    // }
}

@:structInit class Style {
    public var backgroundColor: Null<Int> = null;
}

@:structInit class VirtualNodeProps {
    public var children: Array<VirtualNode> = null;
    public var style: Style = null;
}

class VirtualNode {
    public var props: VirtualNodeProps = null;

    public function new(
        ?props: VirtualNodeProps
    ) {
        this.props = props;
    }
}

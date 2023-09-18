class Fiber extends h2d.Object {
    public function new() {
        super(parent);        
    }


    public function render(app: VirtualNode, scene: h2d.Scene) {
        renderNode(app, scene);
    }

    var renderCount: Int = 0;
    function renderNode(node: VirtualNode, parent: h2d.Object) {
        var graphicsNode = new h2d.Graphics(parent); // TODO: Only create new graphics node if style has an animation
        graphicsNode.beginFill(node?.props?.style?.backgroundColor ?? 0xFFFFFF);
        graphicsNode.drawRect(10, 10 + renderCount * 10, 100 - renderCount * 10, 100 - renderCount * 10);
        graphicsNode.endFill();
        renderCount++;
        
        if (node.props.children != null) {
            for (child in node.props.children) {
                renderNode(child, graphicsNode);
            }
        }
    }
    
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

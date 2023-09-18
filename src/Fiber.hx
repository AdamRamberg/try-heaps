import h2d.Flow;

class Fiber extends h2d.Object {
    public function new() {
        super(parent);        
    }


    public function render(app: VirtualNode, scene: h2d.Scene) {
        renderNode(app, scene);
    }

    var renderCount: Int = 0;
    function renderNode(node: VirtualNode, parent: h2d.Object) {
        var current = parent;
        if (node is ViewNode) {
            var viewNode = Std.downcast(node, ViewNode);
            var graphics = new h2d.Graphics(parent); // TODO: Only create new graphics node if style has an animation
            graphics.beginFill(viewNode?.props?.style?.backgroundColor ?? 0xFFFFFF);
            graphics.drawRect(10, 10 + renderCount * 10, viewNode?.props?.style?.width ?? 100, viewNode?.props?.style?.height ?? 100);
            graphics.endFill();     
            current = graphics;       
        }
        else if (node is FlowNode) {
            var flowNode = Std.downcast(node, ViewNode);
            var flow = new h2d.Flow(parent);
            // Just set random props for testing purposes...
            flow.horizontalAlign = FlowAlign.Middle;
            flow.multiline = true;
            flow.layout = FlowLayout.Horizontal;
            flow.maxWidth = 500;
            current = flow;
        }
        renderCount++;
        
        if (node.children != null) {
            for (child in node.children) {
                renderNode(child, current);
            }
        }
    }
    
}


class VirtualNode {
    public var children: Array<VirtualNode> = null;

    public function new(
        ?children: Array<VirtualNode>
    ) {
        this.children = children;
    }
}

@:structInit class Style {
    public var backgroundColor: Null<Int> = null;
    public var width: Int = 100;
    public var height: Int = 100;
}

@:structInit class ViewNodeProps {
    public var children: Array<VirtualNode> = null;
    public var style: Style = null;
}

class ViewNode extends VirtualNode {
    public var props: ViewNodeProps = null;
    public function new(
        ?props: ViewNodeProps
    ) {
        super(props.children);
        this.props = props;
    }
}

@:structInit class FlowNodeProps {
    public var children: Array<VirtualNode> = null;
}

class FlowNode extends VirtualNode {
    public function new(
        ?props: FlowNodeProps
    ) {
        super(props.children);
    }
}
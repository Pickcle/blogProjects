package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	[SWF(frameRate="30", width="700", height="700")]
	public class PositionConvert extends Sprite
	{
		private var bigShape:Rect;
		private var smallShape:Rect;
		
		public function PositionConvert()
		{
			init();
		}
		
		public function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			bigShape = new Rect(0xff0000, 600, 600, "bigShape");
			bigShape.x = 50;
			bigShape.y = 50;
			bigShape.addEventListener(MouseEvent.CLICK, onClickHandler1);
			stage.addChild(bigShape);
			
			smallShape = new Rect(0x00ff00, 300, 300, "smallShape");
			smallShape.x = 150;
			smallShape.y = 150;
			smallShape.addEventListener(MouseEvent.CLICK, onClickHandler2);
			bigShape.addChild(smallShape);
			
		}
		
		
		private function onClickHandler1(e:MouseEvent):void
		{
			var ary:Array = [];
			var point:Point = new Point(stage.mouseX, stage.mouseY);
			trace("e.target:" + e.target.name);
			trace("-----globalToLocal-----");
			trace("stageMouseX:" + point.x);
			trace("stageMouseY:" + point.y);
			trace("localX:" + smallShape.globalToLocal(point).x);
			trace("localY:" + smallShape.globalToLocal(point).y);
			trace("-----localToGlobal-----");
			point = new Point(e.localX, e.localY);
			trace("localX:" + point.x);
			trace("localY:" + point.y);
			trace("stageMouseX:" + smallShape.localToGlobal(point).x);
			trace("stageMouseY:" + smallShape.localToGlobal(point).y);
			
			var str:String = ary.join("\n");
			bigShape.showText(str);
			
			e.stopPropagation();
		}
		
		private function onClickHandler2(e:MouseEvent):void
		{
			e.stopPropagation();
			var stagePoint:Point = new Point(stage.mouseX, stage.mouseY);
			trace(stagePoint.x);									//350
			trace(stagePoint.y);									//350
			trace(stage.globalToLocal(stagePoint).x);				//350
			trace(stage.globalToLocal(stagePoint).y);				//350
			trace(smallShape.globalToLocal(stagePoint).x);			//150
			trace(smallShape.globalToLocal(stagePoint).y);			//150
			trace(bigShape.globalToLocal(stagePoint).x);			//300
			trace(bigShape.globalToLocal(stagePoint).y);			//300
			var localPoint:Point = new Point(e.localX, e.localY);	
			trace(localPoint.x);									//150
			trace(localPoint.y);									//150
			trace(stage.localToGlobal(localPoint).x);				//150
			trace(stage.localToGlobal(localPoint).y);				//150
			trace(smallShape.localToGlobal(localPoint).x);			//350
			trace(smallShape.localToGlobal(localPoint).y);			//350
			trace(bigShape.localToGlobal(localPoint).x);			//200
			trace(bigShape.localToGlobal(localPoint).y);			//200
		}
	}
}

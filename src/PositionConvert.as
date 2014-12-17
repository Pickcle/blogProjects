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
			e.stopPropagation();
			var ary:Array = [];
			var stagePoint:Point = new Point(stage.mouseX, stage.mouseY);
			ary.push("stage:(" + stagePoint.x + "," + stagePoint.y + ")");								
			ary.push("stage.globalToLocal:(" + stage.globalToLocal(stagePoint).x + "," + stage.globalToLocal(stagePoint).y + ")");								
			ary.push("small.globalToLocal:(" + smallShape.globalToLocal(stagePoint).x + "," + smallShape.globalToLocal(stagePoint).y + ")");								
			ary.push("big.globalToLocal:(" + bigShape.globalToLocal(stagePoint).x + "," + bigShape.globalToLocal(stagePoint).y + ")");								
			ary.push(" ");
			
			var localPoint:Point = new Point(e.localX, e.localY);	
			ary.push("local:(" + localPoint.x + "," + localPoint.y + ")");
			ary.push("stage.localToGlobal:(" + stage.localToGlobal(localPoint).x + "," + stage.localToGlobal(localPoint).y + ")");
			ary.push("small.localToGlobal:(" + smallShape.localToGlobal(localPoint).x + "," + smallShape.localToGlobal(localPoint).y + ")");
			ary.push("big.localToGlobal:(" + bigShape.localToGlobal(localPoint).x + "," + bigShape.localToGlobal(localPoint).y + ")");
			bigShape.showText(ary.join("\n"));
		}
		
		private function onClickHandler2(e:MouseEvent):void
		{
			e.stopPropagation();
			var ary:Array = [];
			var stagePoint:Point = new Point(stage.mouseX, stage.mouseY);
			ary.push("stage:(" + stagePoint.x + "," + stagePoint.y + ")");								
			ary.push("stage.globalToLocal:(" + stage.globalToLocal(stagePoint).x + "," + stage.globalToLocal(stagePoint).y + ")");								
			ary.push("small.globalToLocal:(" + smallShape.globalToLocal(stagePoint).x + "," + smallShape.globalToLocal(stagePoint).y + ")");								
			ary.push("big.globalToLocal:(" + bigShape.globalToLocal(stagePoint).x + "," + bigShape.globalToLocal(stagePoint).y + ")");									
			ary.push(" ");						
			
			var localPoint:Point = new Point(e.localX, e.localY);	
			ary.push("local:(" + localPoint.x + "," + localPoint.y + ")");
			ary.push("stage.localToGlobal:(" + stage.localToGlobal(localPoint).x + "," + stage.localToGlobal(localPoint).y + ")");
			ary.push("small.localToGlobal:(" + smallShape.localToGlobal(localPoint).x + "," + smallShape.localToGlobal(localPoint).y + ")");
			ary.push("big.localToGlobal:(" + bigShape.localToGlobal(localPoint).x + "," + bigShape.localToGlobal(localPoint).y + ")");
			smallShape.showText(ary.join("\n"));
		}
	}
}

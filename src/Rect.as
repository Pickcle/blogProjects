package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Rect extends Sprite
	{
		private var _textField:TextField;
		
		public function Rect(color:uint, width:Number, height:Number, name:String)
		{
			super();
			this.graphics.beginFill(color, 1);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.endFill();
//			this.addEventListener(MouseEvent.CLICK, onClickHandler);
			this.name = name;
			
			var tf:TextFormat = new TextFormat();
			tf.align = TextFieldAutoSize.LEFT;
			tf.size = 15;
			tf.color = 0x000000;
			
			_textField = new TextField();
			this.addChild(_textField);
			_textField.defaultTextFormat = tf;
			_textField.width = width;
			_textField.height = height;
			_textField.wordWrap = true;
			_textField.multiline = true;
			_textField.mouseEnabled = false;
			_textField.selectable = false;
		}
		
		/*private function onClickHandler(e:MouseEvent):void
		{
			var ary:Array = [];
			var point:Point = new Point(stage.mouseX, stage.mouseY);
			ary.push("e.target:" + e.target.name);
			ary.push("-----globalToLocal-----");
			ary.push("stageMouseX:" + point.x);
			ary.push("stageMouseY:" + point.y);
			ary.push("localX:" + globalToLocal(point).x);
			ary.push("localY:" + globalToLocal(point).y);
			ary.push("-----localToGlobal-----");
			point = new Point(e.localX, e.localY);
			ary.push("localX:" + point.x);
			ary.push("localY:" + point.y);
			ary.push("stageMouseX:" + localToGlobal(point).x);
			ary.push("stageMouseY:" + localToGlobal(point).y);
			
			var str:String = ary.join("\n");
			showText(str);
			
			e.stopPropagation();
		}*/
		
		public function showText(text:String):void
		{
			_textField.htmlText = text;
		}
		
	}
}
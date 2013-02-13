package src.playobjects
{
	import flash.display.*; 
	
	public class Particle extends MovieClip
	{	
		public var clip : MovieClip;
		
		public var xVel : Number = 0; 
		public var yVel : Number = 0;
		
		public var drag : Number = 1; 
		
		public var gravity : Number = 0; 
		
		public var shrink : Number = 1; 
		public var fade : Number = 0; 
		
		public function Particle(symbolclass : MovieClip, target : DisplayObjectContainer, 
								   xpos : Number, ypos : Number)
		{
			clip = symbolclass;
			clip.mouseEnabled = false;
			target.addChild(clip); 
			clip.x = xpos; 
			clip.y = ypos; 
		}
		
		public function update() : void
		{
			clip.x += xVel; 
			clip.y += yVel; 
			xVel *= drag; 
			yVel *= drag; 
			yVel += gravity; 
			clip.scaleX *= shrink;
			clip.scaleY *= shrink; 
			clip.alpha -=fade; 
		}
		
		public function destroy():void
		{
			clip.parent.removeChild(clip); 
		}
	}
}
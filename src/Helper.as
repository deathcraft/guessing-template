package  src {
	import flash.display.MovieClip;
	public class Helper {

		public function Helper() {
			// constructor code
		}
		
		public static function randomNumber(low:Number=0, high:Number=1):Number
		{
			return Math.floor(Math.random() * (1+high-low)) + low;
		}
		
		public static function shuffle(a:Array):Array
		{
			var N:int = a.length;

			for (var i:int = 0; i < N; i++)
			{// Exchange a[i] with random element in a[i..N-i]
				var r:int = i + randomNumber(0,N - i - 1);
				var temp:MovieClip = a[i];
				a[i] = a[r];
				a[r] = temp;
			}
			return a;
		}

	}
	
}

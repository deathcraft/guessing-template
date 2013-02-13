package src.factories
{
	import src.Helper;
	import src.playobjects.items.*;

	public class ItemFactory
	{
		public static function createItem(doRandom:Boolean, num:int = 0):Item
		{
			if (doRandom)
			{
				num = Helper.randomNumber(0,1);
			}
			switch (num)
			{
				case 0 :
					return new Item1();
					break;
				case 1 :
					return new Item2();
					break;		
			}
			return null;
		}
	}

}
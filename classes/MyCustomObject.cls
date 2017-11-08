public with sharing class MyCustomObject {
	public static Boolean disableTrigger
	{
		get
		{
			if(disableTrigger == null) return false;
			else return disableTrigger;
		}
		set
		{
			if(value == null) disableTrigger = false;
			else disableTrigger = value;
		}
	}

	public static void triggerHandler
		(map<Id,MyCustomObject__C > oldMap,
		 map<Id,MyCustomObject__C > newMap,
		 list<MyCustomObject__C > listNew,
		 Boolean boolIsBefore,
		 Boolean boolIsInsert,
		 Boolean boolIsUpdate,
		 Boolean boolIsDelete)
	{

		if(oldMap == NULL) oldMap = new map<Id,MyCustomObject__C>();
		if(newMap == NULL) newMap = new map<Id,MyCustomObject__C>();
		if(listNew == NULL) listNew = new list<MyCustomObject__C>();

		updateAndValidate(oldMap,newMap,listNew,boolIsBefore,boolIsInsert,boolIsUpdate,boolIsDelete);

		if(boolIsBefore)
		{
			if(boolIsInsert)
			{

			}
			if(boolIsUpdate)
			{

			}
			if(boolIsDelete)
			{

			} 
		}
		else //i.e. trigger.isAfter
		{

			if(boolIsInsert)
			{

			}
			if(boolIsUpdate)
			{
				
			}
			if(boolIsDelete)
			{

			}
		}
	}

	public static void updateAndValidate
		(map<Id,MyCustomObject__C> oldMap,
		 map<Id,MyCustomObject__C> newMap,
		 list<MyCustomObject__C> listNew,
		 Boolean boolIsBefore,
		 Boolean boolIsInsert,
		 Boolean boolIsUpdate,
		 Boolean boolIsDelete)
	{
		if(boolIsBefore) {
			
		}

		if(!boolIsBefore) {
			if(boolIsInsert) {
				
			}
		}
	}
}
trigger MyCustomTrigger on MyCustomObject__C (after delete, after insert, after update, before delete, before insert, before update)
{
    if(!MyCustomObject.disableTrigger)
    {
        MyCustomObject.triggerHandler
            (trigger.oldMap,
             trigger.newMap,
             trigger.new,
             trigger.isBefore,
             trigger.isInsert,
             trigger.isUpdate,
             trigger.isDelete);
    }
}
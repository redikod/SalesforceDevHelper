public with sharing class BulkDeleteSObjects_Controller 
{
    public List<SObjectWrapper> sObjectWrapperList {get; private set;}
    public String selectString {get; set;}

    public class SObjectWrapper
    {
        public SObject sObj {get; private set;}
        public Object name {get; private set;}
        public Boolean deleteThis {get; set;}
        
        public SObjectWrapper (SObject so)
        {
            this.sObj = so;
            try
            {
                this.name = this.sObj.get('Name');
            }catch(Exception e){}
        }
    }
    
    public BulkDeleteSObjects_Controller ()
    {
        this.sObjectWrapperList = new List<SObjectWrapper>();
    }
    
    public PageReference executeSelect()
    {
        try{
            loadData(Database.query(this.selectString));
        }catch(Exception e){logError(e.getMessage());}
        return null;
    }
    
    private void loadData(List<SObject> sObjs)
    {
        this.sObjectWrapperList = new List<SObjectWrapper>();
        for(SObject s: sObjs)
        {
            this.sObjectWrapperList.add(new SObjectWrapper(s));
        }
    }
    
    public PageReference deleteSelected()
    {
        try{
            List<SObject> sObjs = new List<SObject>();
            for(SObjectWrapper so: this.sObjectWrapperList)
            {
                if(so.deleteThis==true)
                    sObjs.add(so.sObj);
            }
            delete sObjs;
            executeSelect();
        }catch(Exception e){
            logError(e.getMessage());
        }
        return null;
    }
    
    private void logError(String errorString){
        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, errorString));
    }
    
}
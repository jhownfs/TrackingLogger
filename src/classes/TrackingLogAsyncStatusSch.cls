global with sharing class TrackingLogAsyncStatusSch implements Schedulable{

 /* 
   Context to Scheduler this class. For controler the time to execution, please
   searching the custom setting named "Tracking_log_setting"

   to execute this command in anonymous
   System.schedule('TrackingLogAsyncStatusSch1', '0 0 * * * ?', new TrackingLogAsyncStatusSch());
System.schedule('TrackingLogAsyncStatusSch2', '0 10 * * * ?', new TrackingLogAsyncStatusSch());
System.schedule('TrackingLogAsyncStatusSch3', '0 20 * * * ?', new TrackingLogAsyncStatusSch());
System.schedule('TrackingLogAsyncStatusSch4', '0 30 * * * ?', new TrackingLogAsyncStatusSch());
System.schedule('TrackingLogAsyncStatusSch5', '0 40 * * * ?', new TrackingLogAsyncStatusSch());
System.schedule('TrackingLogAsyncStatusSch6', '0 50 * * * ?', new TrackingLogAsyncStatusSch());

 */
  
  global void execute(SchedulableContext sch){
     
    list<Tracking_LOG__c> lsttracking = [SELECT id, Status__c, CreatedDate
                                          FROM Tracking_LOG__c
                                          WHERE status__c = 'Pending'];

    Datetime crDat = System.now();

    List<Tracking_LOG__c> lstUpdate = new List<Tracking_LOG__c>();

    for(Tracking_LOG__c tck: lsttracking){
        
        if(checkDateLimit(crDat.getTime(), tck.CreatedDate.getTime())) continue;

        tck.Status__c = 'Finished';
        tck.Error__c = true;
        tck.ERROR_DESCRIPTION__c = 'Governance limits';
        tck.EXCEPTION__c = 'Limits';

        lstUpdate.add(tck);
    }

    Database.update(lstUpdate);
  }

  global Boolean checkDateLimit(Long aDateNow, Long aDateRecord){
    
    Long diference = aDateNow - aDateRecord;
    Long seconds = diference / 1000;
    Long minutes = seconds / 60;

    return (minutes > 10);
  }
}
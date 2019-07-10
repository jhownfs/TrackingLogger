global class PurgerTrackLogBatch implements Database.Batchable<sObject>{

  /*
  // Codigo para agendar via execute anonymous
  PurgerTrackLogSchBatch.executar();
  */
    
  private list<Tracking_LOG__c> lstScope = new list<Tracking_LOG__c>();

  global Database.QueryLocator start(Database.BatchableContext bc) {

    PurgerTrackLogService service = new PurgerTrackLogService();
    return service.getTrackLog();
  }

  global void execute(Database.BatchableContext bc, List<Tracking_LOG__c> scope) {
        
    try{
      PurgerTrackLogService service = new PurgerTrackLogService();
      service.purgeTrackLog(scope);
      database.delete(scope); 
        
    }catch(exception ex){
      system.debug('ex = ' + ex);
    }
  }
  global void finish(Database.BatchableContext BC) {
    
  }
}
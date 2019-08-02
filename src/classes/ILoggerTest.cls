@isTest
private class ILoggerTest {
    
    testMethod static void quando_chamo_log_sucesso_tenho_que_ver_log_criado(){
     
      ILogger log = new ILogger('ILoggerTest');
     
      Test.startTest();
        log.registerLog();   
      Test.stopTest();
        
      list<Tracking_LOG__c> lstTrack = [Select name, id FROM Tracking_LOG__c WHERE name = 'ILoggerTest'];
        
      system.assert(!lstTrack.isEmpty());
                       
    }
    
    testMethod static void quando_chamo_log_erro_tenho_que_ver_log_criado(){
     
      ILogger log = new ILogger('ILoggerTest');
     
      Test.startTest();
        log.registerLog();
        log.setException(new CheckLimitsException('teste'));
      Test.stopTest();
        
      list<Tracking_LOG__c> lstTrack = [Select name, id, ERROR__c FROM Tracking_LOG__c WHERE name = 'ILoggerTest'];
        
      system.assert(!lstTrack.isEmpty());
      system.assert(lstTrack[0].ERROR__c);  
    }
    
    testMethod static void quando_chamo_log_passando_blob_tenho_log_criado(){
      
      Blob b = Blob.valueOf('teste Class');
      ILogger log = new ILogger('ILoggerTest', b);
     
      Test.startTest();
        log.registerLogWebservice(b);
      Test.stopTest();   
        
      list<Tracking_LOG__c> lstTrack = [Select name, id, REQUEST__c FROM Tracking_LOG__c WHERE name = 'ILoggerTest'];
 
      system.assert(!lstTrack.isEmpty());
      system.assert(String.isNotBlank(lstTrack[0].REQUEST__c));
    }
}
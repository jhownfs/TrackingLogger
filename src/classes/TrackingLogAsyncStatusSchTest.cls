@isTest
private class TrackingLogAsyncStatusSchTest {
    
    @testSetup
    static void setup(){
        
      Tracking_LOG__c tck = new Tracking_LOG__c();
      tck.STATUS__c = 'Pending';

      Database.insert(tck);        
    }
    
    testMethod static void rodo_rotina_que_muda_status_dos_registros(){
        
        test.startTest();
          system.schedule('TrackingLoggerSch', '0 0 0 * * ? *', new TrackingLogAsyncStatusSch());
        test.stopTest();
    }

}
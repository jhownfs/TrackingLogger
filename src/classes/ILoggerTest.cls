@isTest
private class ILoggerTest {
    
    TestMethod static void quand_chamo_log_sucesso_tenho_que_ver_log_criado(){
     
      ILogger log = new ILogger('ILoggerTest');
     
      Test.startTest();
        log.registerLog();   
      Test.stopTest();
                       
    }
    
    TestMethod static void quando_chamo_log_erro_tenho_que_ver_log_criado(){
     
      ILogger log = new ILogger('ILoggerTest');
     
      Test.startTest();
        log.registerLog();
        log.setException(new CheckLimitsException('teste'));
      Test.stopTest();                       
    }
    
    TestMethod static void quando_chamo_log_passando_blob_tenho_log_criado(){
      
      Blob b = Blob.valueOf('teste Class');
      ILogger log = new ILogger('ILoggerTest', b);
     
      Test.startTest();
        log.registerLogWebservice(b);
      Test.stopTest();                       
    }
}
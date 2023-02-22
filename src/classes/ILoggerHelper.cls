global class ILoggerHelper{

  list<Tracking_log_setting__mdt> lstLogSetting;

  global ILoggerHelper(String ClassName){
    this.lstLogSetting = [SELECT Register_Error__c, Register_Success__c 
                          FROM Tracking_log_setting__mdt WHERE DeveloperName =: ClassName];
  }

  global boolean shouldIGenerateError(){
    return this.lstLogSetting[0].Register_Error__c;
  }

  global boolean shouldIGenerateSuccess(){
    return this.lstLogSetting[0].Register_Success__c;
  }
    
}
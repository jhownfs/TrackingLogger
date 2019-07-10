global class ILoggerResponse {
   
   private TRACKING_LOG_EVENT__e log = new TRACKING_LOG_EVENT__e();
   private ILoggerException exct = new ILoggerException();
   private final String pckVersion = '1.0';

   global ILoggerResponse(){
     this.log.START_DATE__c = system.now();
     this.log.TYPE__c = ILogUtil.getExecutionType(); 
     this.log.VERSION__c = pckVersion;    
   }

   global TRACKING_LOG_EVENT__e getTrackRsp(){
      return this.log;
   }
}
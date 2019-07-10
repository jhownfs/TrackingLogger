global class ILoggerService{
  
  private ILoggerResponse response;
  private ILoggerFactory logFactory;
  private ILoggerHelper helper;
  private ILoggerRequest request;

  global ILoggerService(ILoggerRequest request){
    this.request = request;
    this.init();
  }

  private void init(){
    
    this.response = new ILoggerResponse();
    this.logFactory = new ILoggerFactory(this.response.getTrackRsp());
    this.logFactory.startLog(this.request);
    this.helper = new ILoggerHelper(this.logFactory.getLogName());
    EventBus.publish(this.logFactory.getLog());
  }

  global void registerLog (){

    if(!this.helper.shouldIGenerateSuccess()) return;

    TRACKING_LOG_EVENT__e tcke = this.response.getTrackRsp();

    ILoggerFactory logEnd = new ILoggerFactory(new TRACKING_LOG_EVENT__e(KEY__c = tcke.KEY__c));
    logEnd.setRequest(this.request.getRequest());
    EventBus.publish(logEnd.endLog());
  }

  global void setException(Exception ex){
    if(!this.helper.shouldIGenerateError()) return;

    TRACKING_LOG_EVENT__e tcke = this.response.getTrackRsp();

    ILoggerFactory logEnd = new ILoggerFactory(new TRACKING_LOG_EVENT__e(KEY__c = tcke.KEY__c));
    logEnd.endLog();
    EventBus.publish(logEnd.setException(ex));
  }
  
  global void registerLogWebservice(Blob blobReq){

     this.request.setRequest(blobReq);
     this.registerLog();
  }

  global void registerLogWebservice(Object objReq){
    this.logFactory.setRequest(objReq);
    this.registerLog();
  }
}
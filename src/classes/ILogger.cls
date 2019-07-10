global class ILogger{

private ILoggerRequest request;
private ILoggerService service;

  global ILogger(String ClassName){
    this.request = new ILoggerRequest(ClassName);
    this.service = new ILoggerService(this.request);
  }

  global ILogger(String ClassName, Blob bloob){
    this.request = new ILoggerRequest(ClassName, bloob);
    this.service = new ILoggerService(this.request);
  }

  global void registerLog(){
    this.service.registerLog();
  }

  global void registerLogWebservice(Blob request){
     this.service.registerLogWebservice(request);
  }

  global void registerLogWebservice(Object request){
     this.service.registerLogWebservice(request);
  }

  global void setException(Exception ex){
    this.service.setException(ex);
  }
}
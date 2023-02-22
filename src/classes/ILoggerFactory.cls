global class ILoggerFactory{
 
  private TRACKING_LOG_EVENT__e log = new TRACKING_LOG_EVENT__e();

  global ILoggerFactory(TRACKING_LOG_EVENT__e aLog){
    this.log = aLog;
  }

  global TRACKING_LOG_EVENT__e getLog(){
    return this.log;
  }

  global String getLogName(){
    return this.log.NAME__c;
  }

  global void setRequest(Blob req){
     this.log.Request__c = ILogUtil.ConvertTypetoString(req);
  }
  
  global void setRequest(Object req){
     this.log.Request__c = ILogUtil.ConvertTypetoString(req);
  }

  global void startLog(ILoggerRequest req){

    this.log.START_CPUTIME__c = limits.getCpuTime();
    this.log.START_QUERYROWS__c = limits.getQueryRows();
    this.log.START_HEAPSIZE__c = limits.getHeapSize();
    this.log.START_DML_OPERATIONS__c = limits.getDMLStatements();
    this.log.QUANTITY_RECORDS__c = limits.getDmlrows();
    this.log.START_QUERYS__c = limits.getQueries();
    this.log.NAME__c = req.getClassName();
    this.log.START_DATE__c = system.now();
    this.log.STATUS__c = 'Pending';
    this.log.KEY__c = this.generateKey();
  }
 
  global TRACKING_LOG_EVENT__e endLog(){
    this.log.END_CPUTIME__c = limits.getCpuTime();
    this.log.END_QUERYROWS__c = limits.getQueryRows();
    this.log.END_HEAPSIZE__c = limits.getHeapSize();
    this.log.END_QUERYS__c = limits.getQueries();
    this.log.END_DML_OPERATIONS__c = limits.getDMLStatements();
    this.log.END_DATE__c = system.now();
    this.log.STATUS__c = 'Finished';
    return this.log;
  }

  global TRACKING_LOG_EVENT__e setException(Exception ex){
    this.log.EXCEPTION__c = ex.getTypeName();
    this.log.ERROR__c = true;
    this.log.LINE_NUMBER__c = ex.getLineNumber();
    this.log.ERROR_DESCRIPTION__c = ex.getMessage();  
    this.log.STACKTRACE__c = ex.getStackTraceString();

    return this.log;
   }

   private String generateKey(){
      String senhaGerada;
      Blob blobKey = crypto.generateAesKey(128);
      String key = EncodingUtil.convertToHex(blobKey);
      senhaGerada = key.substring(0,15);
      
      return senhaGerada;
   }
}
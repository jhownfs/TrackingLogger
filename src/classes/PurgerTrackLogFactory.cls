global class PurgerTrackLogFactory{

  private list<Tracking_LOG__c> trackingLog;
  private list<Tracking_LOG_Historic__b> lsttrackoHistoric = new list<Tracking_LOG_Historic__b>();
  private Integer ExpirationTime;

  global PurgerTrackLogFactory(list<Tracking_LOG__c> trackingLog){
    this.trackingLog = trackingLog;
  } 

  public list<Tracking_LOG_Historic__b> getlistTrackHistoric(){
      return this.lsttrackoHistoric;
  }

  public Integer getExpirationTime(){
    PURGER_TIME_EXPIRATION__c prg = PURGER_TIME_EXPIRATION__c.getValues('purger');
    this.ExpirationTime = Integer.valueOf(prg.Expiration_Time__c);
    return this.ExpirationTime;
  }

  public void createHistoric(){

    for(Tracking_LOG__c tck: this.trackingLog){

       Tracking_LOG_Historic__b trackingHistoric = new Tracking_LOG_Historic__b();

       trackingHistoric.END_CPUTIME__c = tck.END_CPUTIME__c;
       trackingHistoric.END_DATE__c = tck.END_DATE__c;
       trackingHistoric.END_DML_OPERATIONS__c = tck.END_DML_OPERATIONS__c;
       trackingHistoric.END_HEAPSIZE__c = tck.END_HEAPSIZE__c;
       trackingHistoric.END_QUERYS__c = tck.END_QUERYS__c;
       trackingHistoric.ERROR_DESCRIPTION__c = tck.ERROR_DESCRIPTION__c;
       trackingHistoric.ERROR__c = String.valueof(tck.ERROR__c);
       trackingHistoric.EXCEPTION__c = tck.EXCEPTION__c;
       trackingHistoric.LINE_NUMBER__c = tck.LINE_NUMBER__c;
       trackingHistoric.QUANTITY_RECORDS__c = tck.QUANTITY_RECORDS__c;
       trackingHistoric.REQUEST__c = tck.REQUEST__c;
       trackingHistoric.RESPONSE__c = tck.RESPONSE__c;
       trackingHistoric.STACKTRACE__c = tck.STACKTRACE__c;
       trackingHistoric.START_CPUTIME__c = tck.START_CPUTIME__c;
       trackingHistoric.START_DATE__c = tck.START_DATE__c;
       trackingHistoric.START_DML_OPERATIONS__c = tck.START_DML_OPERATIONS__c;
       trackingHistoric.START_HEAPSIZE__c = tck.START_HEAPSIZE__c;
       trackingHistoric.START_QUERYROWS__c = tck.START_QUERYROWS__c;
       trackingHistoric.TYPE__c = tck.TYPE__c;
       trackingHistoric.VERSION__c = tck.VERSION__c;

       this.lsttrackoHistoric.add(trackingHistoric);
    }
  }



}
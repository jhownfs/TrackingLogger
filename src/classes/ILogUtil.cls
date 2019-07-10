global class ILogUtil{


  public static String getExecutionType(){
      
      String type = '';

      if(system.isBatch()){
        type = 'Batch';    
      }else if(system.isScheduled()){
        type = 'Scheduler';
      }else if(system.isFuture()){
        type = 'Future';
      }else if(trigger.isExecuting){
        type = 'Trigger';
      }else if(ApexPages.currentPage() != null){
        type = 'Visualforce';
      } else{
        type = 'Common';
      }

      return type;
  }
  
  public static String ConvertTypetoString(Blob blobReq){
    return blobReq.toString();
  }

  public static String ConvertTypetoString(Object objReq){
    return String.valueof(objReq);
  }
}
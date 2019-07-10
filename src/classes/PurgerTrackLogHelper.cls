global class PurgerTrackLogHelper implements IHelper{

  private Tracking_LOG__c tracklog;
  
  global PurgerTrackLogHelper(Tracking_LOG__c tracklog){
      this.tracklog = tracklog;
  }
  
  global void isValid(){
    if(this.isNull())
      system.debug('Componente invalido');
  }
  
  private boolean isNull(){

   return (this.tracklog == null);
  }
}
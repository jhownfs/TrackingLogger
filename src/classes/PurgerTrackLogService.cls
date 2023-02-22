global class PurgerTrackLogService{
 
  private IRepositoryFactory repositoryFactory;

  global PurgerTrackLogService(){

      this(new RepositoryFactory());
  }
  
  global PurgerTrackLogService(IRepositoryFactory repositoryFactory){
      this.repositoryFactory = repositoryFactory;
  }

  global Database.QueryLocator getTrackLog(){
  
   Database.QueryLocator loc;

   try{
     
     /*IRepository repository = RepositoryFactory.create(Tracking_LOG__c.SobjectType);
     PurgerTrackLogFactory trackings = new PurgerTrackLogFactory(new list<Tracking_LOG__c>());
     Specification spec = new PurgerTrackLogSpec(trackings.getExpirationTime());
     Repository.QueryBuilder queryBuilder = new Repository.QueryBuilder()
     .selectFields(FieldSetUtil.getFieldsFromFieldSet(Tracking_LOG__c.SObjectType, 'PURGERFIELDS'))
     .whereSpecification(spec);
     loc = repository.queryLocator(queryBuilder);*/

   }catch(Exception ex){
    
   }

   return loc;

  }

  global void purgeTrackLog(list<Tracking_LOG__c> lstObj){

      try{

         PurgerTrackLogFactory trackings = new PurgerTrackLogFactory(lstObj);
         trackings.createHistoric();
         
         Database.insertImmediate(trackings.getlistTrackHistoric());
         

      }catch(Exception ex){
        
      
      }
  }
       
}
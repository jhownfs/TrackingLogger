global class TrackingLogEventHandler{
  

  private list<TRACKING_LOG_EVENT__e> lstEvent = new list<TRACKING_LOG_EVENT__e>();
  private map<String, Tracking_LOG__c> mapTrack = new map<String, Tracking_LOG__c>();

  private IRepositoryFactory repositoryFactory;
  
  global TrackingLogEventHandler(IRepositoryFactory repositoryFactory){
      this.repositoryFactory = repositoryFactory;
  }

  public TrackingLogEventHandler(list<TRACKING_LOG_EVENT__e> aListEvent){
     this(new RepositoryFactory());
     this.lstEvent = aListEvent;
  }

  public void execute(){

    map<String, Tracking_LOG__c> mapTracklog = new map<String, Tracking_LOG__c>();
    this.getTracks();
    Tracking_LOG__c  tck;

    for(TRACKING_LOG_EVENT__e evt: this.lstEvent){
      system.debug('evt = ' + evt);
      tck = this.mapTrack.get(evt.KEY__c);

      if(tck == null) tck = mapTracklog.get(evt.KEY__c);
      if(tck == null) tck = new Tracking_LOG__c();

      if(checkIsNullorBlank(tck.START_CPUTIME__c)) tck.START_CPUTIME__c = evt.START_CPUTIME__c;
      if(checkIsNullorBlank(tck.END_CPUTIME__c)) tck.END_CPUTIME__c = evt.END_CPUTIME__c;
      if(checkIsNullorBlank(tck.START_DML_OPERATIONS__c)) tck.START_DML_OPERATIONS__c = evt.START_DML_OPERATIONS__c;
      if(checkIsNullorBlank(tck.END_DML_OPERATIONS__c)) tck.END_DML_OPERATIONS__c = evt.END_DML_OPERATIONS__c;
      if(checkIsNullorBlank(tck.END_DATE__c)) tck.END_DATE__c = evt.END_DATE__c;
      if(!tck.ERROR__c) tck.ERROR__c = evt.ERROR__c;
      if(checkIsNullorBlank(tck.ERROR_DESCRIPTION__c)) tck.ERROR_DESCRIPTION__c = evt.ERROR_DESCRIPTION__c;
      if(checkIsNullorBlank(tck.EXCEPTION__c)) tck.EXCEPTION__c = evt.EXCEPTION__c;
      if(checkIsNullorBlank(tck.START_HEAPSIZE__c)) tck.START_HEAPSIZE__c = evt.START_HEAPSIZE__c;
      if(checkIsNullorBlank(tck.END_HEAPSIZE__c)) tck.END_HEAPSIZE__c = evt.END_HEAPSIZE__c;
      if(checkIsNullorBlank(tck.LINE_NUMBER__c)) tck.LINE_NUMBER__c = evt.LINE_NUMBER__c;
      if(checkIsNullorBlank(tck.QUANTITY_RECORDS__c))tck.QUANTITY_RECORDS__c = evt.QUANTITY_RECORDS__c;
      if(checkIsNullorBlank(tck.START_QUERYROWS__c)) tck.START_QUERYROWS__c = evt.START_QUERYROWS__c;
      if(checkIsNullorBlank(tck.END_QUERYROWS__c)) tck.END_QUERYROWS__c = evt.END_QUERYROWS__c;
      if(checkIsNullorBlank(tck.END_QUERYS__c)) tck.END_QUERYS__c = evt.END_QUERYS__c;
      if(checkIsNullorBlank(tck.REQUEST__c)) tck.REQUEST__c = evt.REQUEST__c;
      if(checkIsNullorBlank(tck.RESPONSE__c)) tck.RESPONSE__c = evt.RESPONSE__c;
      if(checkIsNullorBlank(tck.STACKTRACE__c)) tck.STACKTRACE__c = evt.STACKTRACE__c;
      if(checkIsNullorBlank(tck.START_DATE__c)) tck.START_DATE__c = evt.START_DATE__c;
      tck.STATUS__c = evt.STATUS__c;
      if(checkIsNullorBlank(tck.TYPE__c)) tck.TYPE__c = evt.TYPE__c;
      if(checkIsNullorBlank(tck.KEY__c)) tck.KEY__c = evt.KEY__c;
      if(checkIsNullorBlank(tck.Name)) tck.Name = evt.Name__c;

      mapTracklog.put(tck.KEY__c, tck);
    }
      system.debug('mapTracklog = ' + mapTracklog);

    Database.upsert(mapTracklog.values(), Tracking_LOG__c.KEY__c);
  } 

  private void getTracks(){ 

    list<Tracking_LOG__c> lsttrack = new list<Tracking_LOG__c>();
    list<String> lstKeys = new list<String>();

    for(TRACKING_LOG_EVENT__e tcke: this.lstEvent){
        lstKeys.add(tcke.Key__c);
    }

    IRepository repository = RepositoryFactory.create(Tracking_LOG__c.SobjectType);
    Specification spec = new TrackingLogEventSpec(lstKeys);
    Repository.QueryBuilder queryBuilder = new Repository.QueryBuilder()
    .selectFields(FieldSetUtil.getFieldsFromFieldSet(Tracking_LOG__c.SObjectType, 'PURGERFIELDS'))
    .whereSpecification(spec);
    lsttrack = repository.queryObjects(queryBuilder);
    
    for(Tracking_LOG__c tck: lsttrack){
      this.mapTrack.put(tck.key__c, tck);
    }

    lstKeys.clear();
    lsttrack.clear();
  }  

  private Boolean checkIsNullorBlank(Decimal aVlr){
    return (aVlr == null);
  }

  private Boolean checkIsNullorBlank(String aVlr){
    return (String.isBlank(aVlr));
  }

  private Boolean checkIsNullorBlank(Datetime aVlr){
    return (aVlr == null);
  }

}
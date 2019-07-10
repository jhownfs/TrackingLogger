global class TrackingLogEventSpec extends CompositeSpecification{

    private list<String> lstKeys = new list<String>();

    global TrackingLogEventSpec(list<String> aLstKeys){
        for(String key: aLstKeys)
          this.lstKeys.add('\''+key+'\'');
    }
    
    global override Boolean isSatisfiedBy(Object candidate) {
 		return (candidate instanceof Tracking_LOG__c);
    }

    global override String toSOQLClauses() {
        return 'Key__c IN ' + this.lstKeys;
    }
}
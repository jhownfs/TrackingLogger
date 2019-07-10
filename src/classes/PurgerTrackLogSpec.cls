global class PurgerTrackLogSpec extends CompositeSpecification{
    
    private Integer purgerTime;

    global PurgerTrackLogSpec(Integer purgerTime){
        this.purgerTime = purgerTime;
    }
    
    global override Boolean isSatisfiedBy(Object candidate) {
 		return (candidate instanceof Tracking_LOG__c);
    }

    global override String toSOQLClauses() {
        DateTime Filter = Datetime.now().addHours(-this.purgerTime);
        return 'CreatedDate <= '+Filter.format('yyyy-MM-dd')+'T'+Filter.format('HH:mm')+':00.000Z';
    }
    
}
global class CheckLimits{

  private integer dmlRows;
  private integer queries;
  private integer dmlStatements;

  global CheckLimits(){
    this.queries = Limits.getQueries();
    this.dmlRows = Limits.getDmlRows();
    this.dmlStatements = Limits.getDmlStatements();
  }

  private void checkDMLLimitsRows(){
    if(dmlRows == Limits.getLimitDmlRows())
      throw new CheckLimitsException('Too many DMLRows');
  }
  
  global void checkSQOLLimits(){
    this.queries++;
    if(queries == Limits.getLimitQueries())
      throw new CheckLimitsException ('Too many Queries');
  }

  private void checkDMLLimitsStatements(){
    this.dmlStatements++;
    system.debug('this.dmlStatements = ' + this.dmlStatements);
    if(this.dmlStatements == (Limits.getLimitDmlStatements() - 2)){
      throw new CheckLimitsException('Too many DML statements');
    }
  }

  global void checkCPUTimeLimits(){
    if(Limits.getCpuTime() == Limits.getLimitCpuTime()){
      throw new CheckLimitsException('CPUTIME Limit exceeded');
    }
  }

  global void checkDMLLimits(Integer lSize){
     this.setDmlRows(lSize);
     this.checkDMLLimitsRows();
     this.checkDMLLimitsStatements();
  }

  private void setDmlRows(Integer lSize){
    this.dmlRows += lSize;
  }

}
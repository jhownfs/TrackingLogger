global class PurgerTrackLogSch implements Schedulable{

  global void execute(SchedulableContext sch){
      PurgerTrackLogBatch pgBatch = new PurgerTrackLogBatch();
      Database.executeBatch(pgBatch);
  }
}
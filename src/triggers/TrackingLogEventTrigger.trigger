trigger TrackingLogEventTrigger on TRACKING_LOG_EVENT__e (after insert) {


  TrackingLogEventHandler handler = new TrackingLogEventHandler(trigger.new);
  handler.execute();
  
  //subindo com CI 3
}
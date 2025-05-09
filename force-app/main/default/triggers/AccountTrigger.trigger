trigger AccountTrigger on Account (before delete) {
   if(Trigger.isDelete && Trigger.isBefore){
       AccountTriggerHandler.preventDeeleteIfOpenCases(Trigger.old);
   }
}
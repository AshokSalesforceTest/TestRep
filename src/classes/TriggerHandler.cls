public abstract class TriggerHandler{

    public virtual void onTrigger(){
        if(Trigger.isBefore){
            this.bulkBefore();
            if(Trigger.isDelete){
                for(SObject so : Trigger.old){
                    this.beforeDelete(so);
                }
            }
            else if(Trigger.isInsert){
                for(SObject so : Trigger.new){
                    this.beforeInsert(so);
                }
            }
            else if(Trigger.isUpdate){
                for(SObject so : Trigger.old){
                    this.beforeUpdate(so, Trigger.newMap.get(so.Id));
                }
            }
        }
        else{
            this.bulkAfter();
            if (Trigger.isDelete){
                for(SObject so : Trigger.old){
                    this.afterDelete(so);
                }
            }
            else if(Trigger.isInsert){
                for(SObject so : Trigger.new){
                    this.afterInsert(so);
                }
            }
            else if(Trigger.isUpdate){
                for(SObject so : Trigger.old){
                    this.afterUpdate(so, Trigger.newMap.get(so.Id));
                }
            }
        }
        this.andFinally();
    }
    public virtual void bulkBefore(){}
    public virtual void bulkAfter(){}
    public virtual void beforeInsert(SObject so){}
    public virtual void beforeUpdate(SObject oldSo, SObject so){}
    public virtual void beforeDelete(SObject so){}
    public virtual void afterInsert(SObject so){}
    public virtual void afterUpdate(SObject oldSo, SObject so){}
    public virtual void afterDelete(SObject so){}
    public virtual void andFinally(){}
    
}
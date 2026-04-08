trigger OrderTrigger on Order__c (after insert) {

    if (Trigger.isAfter && Trigger.isInsert) {
        OrderService.processNewOrders(Trigger.new);

        for (Order__c ord : Trigger.new) {
            InventoryService.updateInventory(ord.Product__c, ord.Quantity__c);
            NotificationService.sendOrderConfirmation(ord);
        }
    }
}

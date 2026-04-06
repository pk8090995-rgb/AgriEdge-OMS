trigger OrderTrigger on Order__c (after insert) {

    for (Order__c ord : Trigger.new) {

        // Inventory update
        InventoryService.updateStock(ord.Product__c, ord.Quantity__c);

        // Email notification
        NotificationService.sendOrderNotification(ord.Id);
    }
}

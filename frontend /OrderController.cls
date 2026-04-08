
public class OrderController {

    // Create New Order
    public static void createOrder(String name, Id productId, Integer qty) {

        Order__c newOrder = new Order__c();
        newOrder.Name = name;
        newOrder.Product__c = productId;
        newOrder.Quantity__c = qty;
        newOrder.Status__c = 'New';

        insert newOrder;

        // Task create pannum
        Task t = new Task(
            Subject = 'New Order Created',
            Status = 'Not Started',
            Priority = 'High',
            WhatId = newOrder.Id
        );
        insert t;
    }

    // Update Order Status
    public static void updateStatus(Id orderId, String status) {

        Order__c ord = [SELECT Id, Status__c FROM Order__c WHERE Id = :orderId];
        ord.Status__c = status;
        update ord;
    }
}

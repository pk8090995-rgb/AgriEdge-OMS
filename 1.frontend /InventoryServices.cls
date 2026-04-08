
public class InventoryService {

    public static void updateStock(Id productId, Integer qty) {

        Inventory__c inv = [SELECT Id, Stock__c 
                           FROM Inventory__c 
                           WHERE Product__c = :productId 
                           LIMIT 1];

        inv.Stock__c = inv.Stock__c - qty;

        update inv;
    }
}

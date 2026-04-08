public class NotificationService {

    public static void sendOrderNotification(Id orderId) {

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        mail.setToAddresses(new String[] {'admin@agriedge.com'});
        mail.setSubject('Order Created');
        mail.setPlainTextBody('Order Created Successfully. ID: ' + orderId);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}

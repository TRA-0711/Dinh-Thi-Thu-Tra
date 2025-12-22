import 'payment_method.dart';

class PaypalPayment extends PaymentMethod {
  @override
  String get name => 'PayPal';

  @override
  String get iconPath => 'assets/paypal.png';
}

import 'payment_method.dart';

class GooglePayPayment extends PaymentMethod {
  @override
  String get name => 'Google Pay';

  @override
  String get iconPath => 'assets/google_pay.png';
}

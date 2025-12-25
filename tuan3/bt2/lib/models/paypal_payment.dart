import 'payment_method.dart';

class PaypalPayment extends PaymentMethod {
  @override
  String get name => 'PayPal';

  @override
  String get iconPath => 'assets/paypal.png';
}
//Kế thừa (Inheritance) từ PaymentMethod
// Mỗi class chỉ chịu trách nhiệm dữ liệu của chính nó

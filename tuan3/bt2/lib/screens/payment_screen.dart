import 'package:flutter/material.dart';
import '../models/payment_method.dart';
import '../models/paypal_payment.dart';
import '../models/google_pay_payment.dart';
import '../models/apple_pay_payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? selectedMethod; //dong goi

  final List<PaymentMethod> methods = [
    PaypalPayment(),
    GooglePayPayment(),
    ApplePayPayment(),
  ]; //da hinh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(),
            ...methods.map((method) => _buildItem(method)),
            const SizedBox(height: 24),
            if (selectedMethod != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Header thay đổi theo trạng thái chọn
  Widget _buildHeader() {
    if (selectedMethod == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Icon(
          Icons.account_balance_wallet_outlined,
          size: 80,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Image.asset(
          selectedMethod!.iconPath,
          width: 120,
          height: 120,
        ),
      );
    }
  }

  Widget _buildItem(PaymentMethod method) {
    final bool isSelected = selectedMethod == method;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Radio<PaymentMethod>(
          value: method,
          groupValue: selectedMethod,
          onChanged: (value) {
            setState(() {
              selectedMethod = value;
            });
          },
        ),
        title: Text(method.name),
        trailing: Image.asset(
          method.iconPath,
          width: 32,
          height: 32,
        ),
        onTap: () {
          setState(() {
            selectedMethod = method;
          });
        },
      ),
    );
  }
}

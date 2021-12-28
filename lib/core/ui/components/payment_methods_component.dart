import 'package:flutter/material.dart';

class PaymentMethodsComponent extends StatelessWidget {
  const PaymentMethodsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 25),
          child: Container(
            height: 20,
            alignment: Alignment.topLeft,
            child: Text(
              'Formas de Pagamento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF4D0351)),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset('assets/icon/payment_methods_icons/visa.png'),
              SizedBox(width: 10),
              Image.asset('assets/icon/payment_methods_icons/mastercard.png'),
              SizedBox(width: 10),
              Image.asset('assets/icon/payment_methods_icons/elo.png'),
              SizedBox(width: 10),
              Image.asset('assets/icon/payment_methods_icons/amex.png'),
              SizedBox(width: 10),
              Image.asset('assets/icon/payment_methods_icons/pix.png'),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}

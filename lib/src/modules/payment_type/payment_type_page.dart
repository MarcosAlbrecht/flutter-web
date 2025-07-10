import 'package:flutter/material.dart';

import 'widgets/payment_type_header.dart';
import 'widgets/payment_type_item.dart';

class PaymentTypePage extends StatefulWidget {
  const PaymentTypePage({super.key});

  @override
  State<PaymentTypePage> createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentTypePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          PaymentTypeHeader(),
          SizedBox(height: 50),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PaymentTypeItem();
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 120,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 680,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

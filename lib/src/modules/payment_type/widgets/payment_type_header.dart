import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';

class PaymentTypeHeader extends StatelessWidget {
  const PaymentTypeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR FORMA DE PAGAMENTO',
      buttonPressed: () {},
      buttonLabel: 'ADICIONAR',
      filterWidget: DropdownButton<bool?>(
        value: null,
        items: [
          DropdownMenuItem(value: null, child: Text('Todos')),
          DropdownMenuItem(value: true, child: Text('Ativos')),
          DropdownMenuItem(value: false, child: Text('Inativos')),
        ],
        onChanged: (value) {},
      ),
    );
  }
}

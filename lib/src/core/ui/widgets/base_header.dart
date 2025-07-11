// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChange;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool addButton;
  final Widget? filterWidget;

  const BaseHeader({
    super.key,
    required this.title,
    this.searchChange,
    required this.buttonLabel,
    this.buttonPressed,
    this.addButton = true,
    this.filterWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Wrap(
          children: [
            Visibility(
              visible: filterWidget == null,
              replacement: filterWidget ?? SizedBox.shrink(),
              child: SizedBox(
                width: constraints.maxWidth * .15,
                child: TextFormField(
                  onChanged: searchChange,
                  decoration: InputDecoration(
                    isDense: false,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search, size: constraints.maxWidth * .02),
                    label: Text('Buscar', style: context.textStyles.textRegular.copyWith(fontSize: 12, color: Colors.grey)),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: constraints.maxWidth * .65,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyles.textTitle.copyWith(decoration: TextDecoration.underline, decorationThickness: 2),
              ),
            ),
            Visibility(
              visible: addButton,
              child: SizedBox(
                width: constraints.maxWidth * .15,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, size: constraints.maxWidth * .02),
                  label: Text(buttonLabel),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;

  const BaseLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final shortestSide = context.screenShortestSide;
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              constraints: BoxConstraints(minWidth: screenWidth, minHeight: shortestSide * .15, maxHeight: shortestSide * .15),
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}

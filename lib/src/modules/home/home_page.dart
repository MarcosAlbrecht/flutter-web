import 'package:flutter/material.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader();
          await Future.delayed(const Duration(seconds: 3));
          hideLoader();

          showError('Erro de alguma coisa');
        },
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(decoration: InputDecoration(label: Text('Login'))),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: Text('Botao')),
            ),
          ],
        ),
      ),
    );
  }
}

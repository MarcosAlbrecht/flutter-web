import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final ReactionDisposer statusReactionDisposer;
  final controller = Modular.get<LoginController>();

  @override
  void initState() {
    statusReactionDisposer = reaction((_) => controller.loginStatus, (status) {
      switch (status) {
        case LoginStateStatus.initial:
          break;
        case LoginStateStatus.loading:
          showLoader();
          break;
        case LoginStateStatus.success:
          hideLoader();
          Modular.to.navigate('/');
          break;
        case LoginStateStatus.error:
          hideLoader();
          showError(controller.errorMessage ?? 'Erro');
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    statusReactionDisposer();
    super.dispose();
  }

  void _formSubmit() async {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      await controller.login(emailEC.text, passwordEC.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenShortestSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;
    return Scaffold(
      backgroundColor: context.colors.black,
      body: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenShortestSide * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/lanche.png'), fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: context.percentHeight(.1)),
              width: screenShortestSide * .5,
              child: Image.asset('assets/images/logo.png'),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(maxWidth: context.percentWidth(screenWidth < 1300 ? .7 : .3)),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FractionallySizedBox(widthFactor: .3, child: Image.asset('assets/images/logo.png')),
                        SizedBox(height: 20),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Login', style: context.textStyles.textTitle),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onFieldSubmitted: (value) => _formSubmit(),
                          controller: emailEC,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: Validatorless.multiple([
                            Validatorless.required('Email obrigatório'),
                            Validatorless.email('Email inválido'),
                          ]),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onFieldSubmitted: (value) => _formSubmit(),
                          obscureText: true,
                          controller: passwordEC,
                          decoration: InputDecoration(labelText: 'Senha'),
                          validator: Validatorless.multiple([Validatorless.required('Senha obrigatório')]),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: _formSubmit, child: Text('Entrar')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

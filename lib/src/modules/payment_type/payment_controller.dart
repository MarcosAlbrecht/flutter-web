import 'package:mobx/mobx.dart';

part 'payment_controller.g.dart';

class PaymentController = PaymentControllerBase with _$PaymentController;

abstract class PaymentControllerBase with Store {}

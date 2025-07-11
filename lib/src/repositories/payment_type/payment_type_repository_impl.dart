import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/payment_type_model.dart';
import '../../rest_client/custom_dio.dart';
import './payment_type_repository.dart';

class PaymentTypeRepositoryImpl implements PaymentTypeRepository {
  final CustomDio _dio;

  PaymentTypeRepositoryImpl(this._dio);
  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) async {
    try {
      final paymentTypeResult = await _dio.auth().get(
        '/payment-type',
        queryParameters: {if (enabled != null) 'enabled': enabled},
      );
      return paymentTypeResult.data.map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }

  @override
  Future<PaymentTypeModel> getById(int id) async {
    try {
      final paymentTypeResult = await _dio.auth().get('/payment-type/$id');
      return PaymentTypeModel.fromMap(paymentTypeResult.data);
    } on DioException catch (e, s) {
      log('Erro ao buscar forma de pagamento $id', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar forma de pagamento $id');
    }
  }

  @override
  Future<void> save(PaymentTypeModel model) async {
    try {
      final client = _dio.auth();
      if (model.id != null) {
        await client.put('/payment-type/${model.id}', data: model.toMap());
      } else {
        await client.post('/payment-type/', data: model.toMap());
      }
    } on DioException catch (e, s) {
      log('Erro ao salvar forma de pagamento ${model.toString()}', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao salvar forma de pagamento ${model.toString()}');
    }
  }

  void Log() {}
}

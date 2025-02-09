import 'dart:convert';

import 'package:bank_sha/models/payment_methods_form_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodsFormModel>> getPaymentMethod() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return List<PaymentMethodsFormModel>.from(jsonDecode(res.body).map(
            (paymentMethod) =>
                PaymentMethodsFormModel.fromJson(paymentMethod))).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}

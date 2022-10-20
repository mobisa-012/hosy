import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosy/core/const/path_constants.dart';
import 'package:hosy/core/services/payment_method.dart';

class PaymentMethodController {
  static Future<List<PaymentMethod>> getMethods() async {
    return [
       const PaymentMethod(
          title: "Cash",
          description: "Default",
          id: "1",
          icon:
              PathConstants.payment),
      const PaymentMethod(
          title: "Master Card",
          description: "**** **** **** 4863",
          id: "2",
          icon:
              PathConstants.payment)
    ];
  }
}
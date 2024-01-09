import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remy/core/api/result.dart';
import 'exceptions.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return (await call());
  } on AppException catch (e) {
    showMessage(e.message);
    rethrow;
  } on DioException catch (e) {
    showMessage(e.response?.data['errorMessage'] ?? '');
    rethrow;
  } on SocketException catch (e) {
    showMessage(e.message);
    rethrow;
  } catch (e) {
    showMessage(e.toString());
     rethrow;
  }
}

void showMessage(String message, {bool isSuccess = false}) {
  // ScaffoldMessenger.of(
  //         GRouter.router.routerDelegate.navigatorKey.currentState!.context)
  //     .showSnackBar(SnackBar(content: Text(message)));
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccess ? Colors.greenAccent : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<Result<T>> toApiResult<T>(FutureOr<T> Function() call) async {
  try {
    return Success(await call());
  } on AppNetworkResponseException catch (e) {
    if (e.data is! String) {
      return Failure(e, message: e.message);
    }
    return Failure(e, message: e.message);
  } on AppNetworkException catch (e) {
    final message = e.message;
    final appNetworkException = e.copyWith(message: message);
    return Failure(appNetworkException, message: message);
  } on AppException catch (e) {
    return Failure(e, message: e.message);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    final exception = AppException.unknown(exception: e, message: e.toString());
    return Failure(exception, message: exception.message);
  }
}

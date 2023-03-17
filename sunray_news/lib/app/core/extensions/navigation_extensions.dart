import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext{

   @optionalTypeArgs
  void pop<T extends Object?>(
    [ T? result ]
  ) {
    return Navigator.of(this).pop<T>(result);
  }

   @optionalTypeArgs
  Future<T?> push<T extends Object?>(Route<T> route) {
    return Navigator.of(this).push(route);
  }

  @optionalTypeArgs
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
  
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T?, TO>(routeName, arguments: arguments, result: result);
  }
}
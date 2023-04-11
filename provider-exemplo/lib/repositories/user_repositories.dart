import 'package:flutter/material.dart';

class UserRepositories extends InheritedWidget {
  final String name;
  final Widget child;
  const UserRepositories({
    required this.name,
    required this.child,
  }) : super(child: child);

  /// este métdo é usado para dizer para o InheritedWidget se ele
  /// deve rebuildar ou não,
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static UserRepositories? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserRepositories>();
  }
}

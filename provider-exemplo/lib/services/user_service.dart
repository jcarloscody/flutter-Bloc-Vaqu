import 'package:flutter/material.dart';
import 'package:provider_exemplo/repositories/user_repositories.dart';

class UserService extends InheritedWidget {
  final UserRepositories repositories;

  const UserService({required this.repositories, required super.child});

  String repo() => repositories.name;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static UserService? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserService>();
  }
}

import 'package:flutter/material.dart';
import 'package:provider_exemplo/repositories/user_repositories.dart';
import 'package:provider_exemplo/repositories/user_repositories_provider.dart';

class UserServiceP {
  final UserRepositoriesP repositories;

  const UserServiceP({
    required this.repositories,
  });

  String repo() => repositories.name;
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemplo/repositories/user_repositories.dart';
import 'package:provider_exemplo/repositories/user_repositories_provider.dart';
import 'package:provider_exemplo/services/user_service.dart';
import 'package:provider_exemplo/services/user_service_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final a = UserService.of(context)?.repositories.name;
    final ap =
        Provider.of<UserServiceP>(context, listen: false).repositories.name;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemplo/pages/home.dart';
import 'package:provider_exemplo/repositories/user_repositories.dart';
import 'package:provider_exemplo/repositories/user_repositories_provider.dart';
import 'package:provider_exemplo/services/user_service.dart';
import 'package:provider_exemplo/services/user_service_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => UserRepositories(
              name: 'sds',
              child: Builder(
                //necessita do Builder para que não proxima interação do event loop, o userRepositories possa
                //ser enxergado
                builder: (context) => UserService(
                  repositories: UserRepositories.of(context)!,
                  child: const Home(),
                ),
              ),
            ),
        '/pro': (context) => Provider(
              create: (context) => UserRepositoriesP(
                name: 'name',
              ),
              child: Provider(
                create: (context) => UserServiceP(
                  repositories:
                      Provider.of<UserRepositoriesP>(context, listen: false),
                ),
                child: Home(),
              ),
            ),
        '/multPro': (context) => MultiProvider(
              providers: [
                Provider(
                  create: (context) => UserRepositoriesP(
                    name: 'name',
                  ),
                ),
                Provider(
                  create: (context) =>
                      UserServiceP(repositories: context.read()),
                ),
              ],
              child: Home(),
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

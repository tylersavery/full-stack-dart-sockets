import 'package:flutter_fridge_client/flutter_fridge_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fridge_flutter/src/fridge_screen.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const FrigeScreen(),
    );
  }
}

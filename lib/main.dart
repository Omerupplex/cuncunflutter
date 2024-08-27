import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'WebViewContainer.dart'; // Import your WebViewContainer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cun cun app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'MainFont'),
          headlineMedium: TextStyle(color: Colors.black, fontSize: 20),
          titleMedium: TextStyle(color: Colors.red, fontSize: 16),
        ),
        useMaterial3: true,
      ),
      home: const PermissionHandlerScreen(),
    );
  }
}

class PermissionHandlerScreen extends StatefulWidget {
  const PermissionHandlerScreen({super.key});

  @override
  State<PermissionHandlerScreen> createState() => _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  Future<Map<String, String>> _getPermissionStatuses() async {
    final statusStorage = await Permission.storage.status;
    final statusCamera = await Permission.camera.status;
    final statusLocation = await Permission.location.status;

    return {
      'Storage': statusStorage.isGranted ? 'Granted' : 'Denied',
      'Camera': statusCamera.isGranted ? 'Granted' : 'Denied',
      'Location': statusLocation.isGranted ? 'Granted' : 'Denied',
    };
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    await [
      Permission.storage,
      Permission.camera,
      Permission.location,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WebViewContainer(), // Replace with your widget
    );
  }
}

import 'package:didi_clone/app_routes.dart';
import 'package:didi_clone/components/sidebar.dart';
import 'package:didi_clone/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',  // Set the initial route as '/'
      onGenerateRoute: AppRoutes.onGenerateRoute,  // Use the routes defined in AppRoutes
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Home Page"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body:  HomePage(),
        drawer:  Sidebar(),  // Add a drawer to the app
      ),
    );
  }
}
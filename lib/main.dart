import 'package:didi_clone/app_routes.dart';
import 'package:didi_clone/components/sidebar.dart';
import 'package:didi_clone/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
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
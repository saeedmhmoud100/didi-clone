import 'package:didi_clone/app_routes.dart';
import 'package:didi_clone/components/sidebar.dart';
import 'package:didi_clone/firebase/auth.dart';
import 'package:didi_clone/pages/home_page.dart';
import 'package:didi_clone/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // DependencyInjection().init();
}


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return const LoginPage();
    } else {
      return  Scaffold(
        appBar: AppBar(
          title: const Text("My Home Page"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body:  const HomePage(),
        drawer:  const Sidebar(),  // Add a drawer to the app
      );
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(value: AuthService().user,
        initialData: null,
        child: GetMaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          initialRoute: '/',  // Set the initial route as '/'
          onGenerateRoute: AppRoutes.onGenerateRoute,  // Use the routes defined in AppRoutes
          home: const Wrapper(),
        ),
    );
  }
}
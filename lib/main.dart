import 'package:flutter/material.dart';
import 'package:message_app/screens/home_screen.dart';
import 'package:message_app/screens/splash_screen.dart';
import 'package:message_app/screens/widget_tree.dart';
import 'package:message_app/theme/theme_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Message App",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/tree':(context) => WidgetTree(),
        '/home':(context) => HomeScreen()
      },
    );
  }
}
import 'package:FireFlyer/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'FireFlyer';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (userSnapshot.hasData) {
            return const MyStatefulWidget();
          }
          return const LoginScreen();
        },
      ),
      color: Colors.transparent,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int currentIndex = 0; // for profile page
  final screens = [
    Home(),
    Search(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(212, 0, 0, 0),
        body: screens[currentIndex],
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            currentIndex: currentIndex,
            unselectedItemColor: const Color.fromARGB(255, 126, 126, 126),
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            onTap: (index) => setState(() => currentIndex = index),
            backgroundColor: const Color.fromARGB(196, 0, 0, 0),
            elevation: 0,
            iconSize: 30,
          ),
        ));
  }
}

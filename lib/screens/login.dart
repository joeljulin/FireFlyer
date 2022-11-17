import 'package:flutter/material.dart';
import 'package:FireFlyer/assets.dart';
import '../main.dart';

class Login extends StatelessWidget {
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Color.fromARGB(255, 176, 69, 39),
            Color.fromARGB(255, 0, 0, 0)
          ])),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                leadingWidth: 400,
                backgroundColor: const Color.fromARGB(0, 149, 149, 149),
              )),
          // By default, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Center(
                    child: Container(
                        height: 80.0,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Image.asset(
                          Assets.logo,
                          height: 40,
                          width: 400,
                        )),
                  )),
              const Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  cursorColor: Color.fromARGB(255, 255, 251, 251),
                  style: TextStyle(color: Color.fromARGB(255, 255, 251, 251)),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(113, 255, 251, 251),
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(113, 255, 251, 251),
                              width: 1.0)),
                      border: OutlineInputBorder(),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 251, 251)),
                      labelText: 'Email'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  cursorColor: Color.fromARGB(255, 255, 251, 251),
                  style: TextStyle(color: Color.fromARGB(255, 255, 251, 251)),
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(113, 255, 251, 251),
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(113, 255, 251, 251),
                              width: 1.0)),
                      border: OutlineInputBorder(),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 251, 251)),
                      labelText: 'Password'),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 5, bottom: 0),
                  child: TextButton(
                    onPressed: () {
                      ///
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Color.fromARGB(255, 183, 183, 183),
                          fontSize: 15),
                    ),
                  )),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(165, 115, 115, 115),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MyStatefulWidget()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 220,
              ),
              TextButton(
                onPressed: () {
                  ///
                },
                child: const Text(
                  'New User? Create Account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 183, 183, 183), fontSize: 15),
                ),
              ),
            ],
          ))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/auth_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;

  var _isLoading = false;

  void _submitAuthForm(
      String email,
      String password,
      String userName,
      bool isLogin,
      BuildContext ctx,
      ) async {
    // ignore: unused_local_variable
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        User? user = userCredential.user;

        if (user != null) {
          //add display name for just created user
          user.updateDisplayName(userName);
          //get updated user
          await user.reload();
          user = _auth.currentUser;
          //print final version to console
          print("Registered user:");
          print(user);
        }

      }

    } on PlatformException catch (err) {
      String? message = "An error occurred please check your credentials";

      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message!),
        backgroundColor: Theme.of(ctx).errorColor,
      ));

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      // ignore: avoid_print
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}

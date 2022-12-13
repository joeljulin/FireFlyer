import 'package:flutter/material.dart';
import 'package:FireFlyer/assets.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {Key? key}) : super(key: key);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid != null && isValid) {
      _formKey.currentState?.save();
      print(_userName.trim());
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 50, 14, 8)
          ])),
      child: SingleChildScrollView(
        reverse: false,
        padding: const EdgeInsets.only(
          top: 35,
          left: 25,
        ),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 120),
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
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.only(
                            top: 54.0, left: 20.0, right: 30.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextFormField(
                                        key: const ValueKey('email'),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'EMAIL',
                                          labelStyle: TextStyle(
                                              fontFamily: 'RobotoCondensed',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                          errorBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.red)),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autocorrect: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        enableSuggestions: false,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !value.contains('@')) {
                                            return 'Please enter an email address';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _userEmail = value!;
                                        },
                                      ),
                                    ))),
                            if (!_isLogin) const SizedBox(height: 20.0),
                            if (!_isLogin)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextFormField(
                                      key: const ValueKey('username'),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                          labelText: 'NAME',
                                          labelStyle: TextStyle(
                                              fontFamily: 'RobotoCondensed',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                      ),
                                      autocorrect: true,
                                      textCapitalization: TextCapitalization.words,
                                      enableSuggestions: false,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a name';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userName = value!;
                                      },
                                      // ignore: missing_return
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 20.0),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextFormField(
                                        key: const ValueKey('password'),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'PASSWORD',
                                          labelStyle: TextStyle(
                                              fontFamily: 'RobotoCondensed',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                        obscureText: true,

                                        // ignore: missing_return
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 7) {
                                            return 'Please enter a password';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _userPassword = value!;
                                        },
                                      ),
                                    ))),
                            const SizedBox(
                              height: 35,
                            ),
                            if (widget.isLoading)
                              const CircularProgressIndicator(),
                            if (!widget.isLoading)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Container(
                                  height: 57.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: const Color.fromRGBO(0, 110, 230, 100),
                                    child: TextButton(
                                      onPressed: _trySubmit,
                                      child: Center(
                                        child: Text(
                                          _isLogin ? "Login" : "Sign up",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Raleway'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            if (!widget.isLoading)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isLogin = !_isLogin;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    _isLogin
                                        ? "Create new account"
                                        : "I already have an account",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Raleway'),
                                  ),
                                ),
                              ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

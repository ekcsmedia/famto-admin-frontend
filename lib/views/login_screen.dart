import 'package:famto_admin_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // create a global key
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height, // get total height
                width: MediaQuery.of(context).size.width, // get total width
                child: Stack(
                  children: [
                    // background image
                    // Positioned(
                    //   top: 0,
                    //   left: 0,
                    //   child: Image.asset(
                    //     'assets/images/login_top.png',
                    //     width: 200,
                    //   ),
                    // ),

                    // bottom image
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: Image.asset(
                    //     'assets/images/login_bottom.png',
                    //     width: 200,
                    //   ),
                    // ),

                    // login form
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      left: MediaQuery.of(context).size.width * 0.25,
                      right: MediaQuery.of(context).size.width * 0.25,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // email text field
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),

                            // password text field
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            //elevated button code
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  // validate form
                                  if (_formKey.currentState!.validate()) {
                                    if (email == 'admin@mail.go' &&
                                        password == 'admin') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()),
                                      );
                                    }
                                    // navigate to home page
                                  }
                                },
                                child: const Text('Login'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}

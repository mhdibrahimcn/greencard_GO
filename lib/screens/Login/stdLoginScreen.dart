import 'dart:ui';

import 'package:flutter/material.dart';

class stdLoginScreen extends StatefulWidget {
  const stdLoginScreen({super.key});

  @override
  State<stdLoginScreen> createState() => _stdLoginScreenState();
}

class _stdLoginScreenState extends State<stdLoginScreen> {
  bool _passwordVisible = false;
  bool _obscuretext = true;
  double _blurvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: ClipRRect(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/welcome.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter:
                      ImageFilter.blur(sigmaX: _blurvalue, sigmaY: _blurvalue),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          Text(
                            "Let's go \n",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 50,
                                color: Color.fromARGB(255, 139, 179, 228)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _blurvalue = 10;
                          });
                        },
                        onTapOutside: (event) {
                          if (event != null) {
                            setState(() {
                              _blurvalue = 0;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email or Phone No',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[100]),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _blurvalue = 10;
                          });
                        },
                        onTapOutside: (event) {
                          if (event != null) {
                            setState(() {
                              _blurvalue = 0;
                            });
                          }
                        },
                        obscureText: _obscuretext,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                                _obscuretext = !_obscuretext;
                              });
                            },
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[100]),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //text(Dont have an account)
                      Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                              onPressed: () => print('f'),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 50, 104, 196),
                                  fontSize: 17,
                                ),
                              ))
                        ],
                      ),

                      //Login button

                      ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('stdHomeScreen'),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 139, 179, 228)),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(340.0, 60.0), // set the desired size heret
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  11.0), // Adjust the border radius here
                            ),
                          )),
                    ]),
                  ),
                ),
              )),
        ));
  }
}

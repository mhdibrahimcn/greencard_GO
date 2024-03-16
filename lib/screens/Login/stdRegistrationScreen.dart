import 'package:flutter/material.dart';

class stdRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                        color: Color.fromARGB(255, 139, 179, 228)),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'GreenCard GO',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 66, 63, 63),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 350,
              ),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("SignUpScreen"),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(350.0, 60.0), // set the desired size heret
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          11.0), // Adjust the border radius here
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('stdLoginscreen'),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(350.0, 60.0), // set the desired size heret
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          11.0), // Adjust the border radius here
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

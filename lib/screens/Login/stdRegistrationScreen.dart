import 'package:flutter/material.dart';

class stdRegistrationScreen extends StatelessWidget {
  const stdRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
              const SizedBox(
                height: 150,
              ),
              const Row(
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
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'GreenCard GO',
                    style: TextStyle(
                      color: Color.fromARGB(255, 66, 63, 63),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 350,
              ),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("SignUpScreen"),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(350.0, 60.0), // set the desired size heret
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          11.0), // Adjust the border radius here
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('stdLoginscreen'),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(350.0, 60.0), // set the desired size heret
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          11.0), // Adjust the border radius here
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

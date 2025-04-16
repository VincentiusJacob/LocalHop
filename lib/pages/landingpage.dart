import 'package:flutter/material.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingPageState();
}

class _LandingPageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
        
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Local',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF5C2EBC), 
                      ),
                    ),
                    TextSpan(
                      text: 'Hop!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF99A3AB), 
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
        
              // Image.asset(
              //   //COMING SOON!, 
              //   // height: 220,
              // ),

              const SizedBox(height: 40),
        
              const Text(
                'What we do?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'We guide you towards nutritious, wholesome food\nchoices for a healthier lifestyle.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Sign up Btn
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5C2EBC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ALREADY HAVE AN ACCOUNT?'),
                 TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Color(0xFF5C2EBC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

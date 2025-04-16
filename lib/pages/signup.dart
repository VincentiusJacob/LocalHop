import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
       
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/decoration1.png', 
              width: 175,
              height: 190,
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/decoration1.png', 
              width: 175,
              height: 190,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'Create your account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    //FB Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        label: const Text(
                          'CONTINUE WITH FACEBOOK',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C2EBC),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Google Btn
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Icon(FontAwesomeIcons.google,
                            color: Colors.black),
                        label: const Text('CONTINUE WITH GOOGLE'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'OR LOG IN WITH EMAIL',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Input Nama
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Siemen',
                        suffixIcon:
                            Icon(Icons.check, color: Colors.green),
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Input Email
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'imshuvo97@gmail.com',
                        suffixIcon:
                            Icon(Icons.check, color: Colors.green),
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Input Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '●●●●●●●',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility_off),
                          onPressed: () {},
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

            
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        const Text('I have read the '),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF5C2EBC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
     
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C2EBC),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

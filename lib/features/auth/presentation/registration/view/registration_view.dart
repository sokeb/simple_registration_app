import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:simple_registration_app/features/auth/widgets/widgets.dart';

class RegistrationView extends StatelessWidget {
  RegistrationView({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            child: FadeInUp(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GlassCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeInDown(
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      AnimatedTextField(
                        hint: 'Name',
                        controller: nameController,
                      ),
                      AnimatedTextField(
                        hint: 'Email',
                        controller: emailController,
                      ),
                      AnimatedTextField(
                        hint: 'Password',
                        controller: passController,
                        isPassword: true,
                      ),

                      const SizedBox(height: 20),

                      InkWell(
                        onTap: () {
                          // call bloc here
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF092327)),
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF0b5351),
                                Color(0xFF00a9a5),
                                Color(0xFF0b5351),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xFF092327),
                                fontSize: 20,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

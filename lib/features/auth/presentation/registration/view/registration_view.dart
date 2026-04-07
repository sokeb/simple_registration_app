import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_registration_app/features/auth/presentation/registration/registration.dart';
import 'package:simple_registration_app/features/auth/widgets/widgets.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView>
    with PartyValidator {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegistrationBloc>;
    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            child: FadeInUp(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GlassCard(
                  child: Form(
                    key: _formKey,
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
                          validator: validateName,
                          controller: _nameController,
                        ),
                        AnimatedTextField(
                          hint: 'Email',
                          validator: validateEmail,
                          controller: _emailController,
                        ),
                        AnimatedTextField(
                          hint: 'Password',
                          validator: validatePassword,
                          controller: _passController,
                          isPassword: true,
                        ),

                        const SizedBox(height: 20),

                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                              bloc().add(
                                OnRegistration(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passController.text,
                                ),
                              );
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF092327),
                              ),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  RegistrationViewState createState() => RegistrationViewState();
}

class RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const .all(20),
        child: Center(
          child: SingleChildScrollView(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const .all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow:const [BoxShadow(blurRadius: 10)],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text('Register',
                        style: TextStyle(fontSize: 24)),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: nameController,
                      validator: (v) =>
                      v!.isEmpty ? 'Enter name' : null,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),

                    TextFormField(
                      controller: emailController,
                      validator: (v) =>
                      v!.contains('@') ? null : 'Invalid email',
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),

                    TextFormField(
                      controller: passController,
                      obscureText: obscurePassword,
                      validator: (v) =>
                      v!.length < 6 ? 'Min 6 chars' : null,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                     ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('Register'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

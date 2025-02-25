import 'package:flutter/material.dart';
import 'package:payment/componets/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Payment Integration',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                  'assets/shopping.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: defaultTextField(
                            controller: _firstNameController,
                            label: 'First Name',
                            validate: (value) => value.isEmpty
                                ? 'First Name must not be empty'
                                : null,
                            type: TextInputType.text,
                            prefix: Icons.person_outline,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: defaultTextField(
                            controller: _lastNameController,
                            label: 'Last Name',
                            validate: (value) => value.isEmpty
                                ? 'Last Name must not be empty'
                                : null,
                            type: TextInputType.text,
                            prefix: Icons.person_outline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    defaultTextField(
                      controller: _emailController,
                      label: 'Email',
                      validate: (value) =>
                          value.isEmpty ? 'Email must not be empty' : null,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),

                    // Phone Field
                    defaultTextField(
                      controller: _phoneController,
                      label: 'Phone',
                      validate: (value) =>
                          value.isEmpty ? 'Phone must not be empty' : null,
                      type: TextInputType.phone,
                      prefix: Icons.phone,
                    ),
                    const SizedBox(height: 20),

                    // Price Field
                    defaultTextField(
                      controller: _priceController,
                      label: 'Price',
                      validate: (value) =>
                          value.isEmpty ? 'Price must not be empty' : null,
                      type: TextInputType.number,
                      prefix: Icons.attach_money,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('all done');
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

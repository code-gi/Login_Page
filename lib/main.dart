import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Screen',
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400, // Fixed width for a mobile-like view
            height: 800, // Fixed height for a mobile-like view
            child: LoginScreen(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _keepLoggedIn = false;

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Image.network(
                'data:image/png;base64,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',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Log in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Need an account? "),
                  GestureDetector(
                    onTap: () {
                      _navigateTo(context, const CreateAccountScreen());
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Username or Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _keepLoggedIn,
                          onChanged: (value) {
                            setState(() {
                              _keepLoggedIn = value!;
                            });
                          },
                        ),
                        const Text("Keep me logged in"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (kDebugMode) {
                              print('Email: ${_emailController.text}, Password: ${_passwordController.text}');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.teal,
                        ),
                        child: const Text('Log in'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            _navigateTo(context, const ForgotUsernameScreen());
                          },
                          child: const Text('Forgot username?'),
                        ),
                        const Text(" | "),
                        TextButton(
                          onPressed: () {
                            _navigateTo(context, const ForgotPasswordScreen());
                          },
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        _navigateTo(context, const CantLogInScreen());
                      },
                      child: const Text("Can't log in?"),
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

// Placeholder Screens
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: const Center(child: Text('Create Account Screen')),
    );
  }
}

class ForgotUsernameScreen extends StatelessWidget {
  const ForgotUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Username')),
      body: const Center(child: Text('Forgot Username Screen')),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(child: Text('Forgot Password Screen')),
    );
  }
}

class CantLogInScreen extends StatelessWidget {
  const CantLogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Can't Log In")),
      body: const Center(child: Text("Can't Log In Screen")),
    );
  }
}

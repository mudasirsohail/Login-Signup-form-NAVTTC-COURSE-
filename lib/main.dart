import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

// Home Page with Tabs
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Signup and Login
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Welcome!')),
          bottom: TabBar(tabs: [Tab(text: 'Signup'), Tab(text: 'Login')]),
        ),
        body: TabBarView(children: [SignupForm(), LoginForm()]),
      ),
    );
  }
}

// Signup Form
class SignupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text('Signup', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),

            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter first name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter last name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Enter valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Password too short';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Signup Successful')));
                }
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

// Login Form
class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // No 'final' here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text('Login', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Enter valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Incorrect Password';
                }
                return null;
              },
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Login Successful')));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

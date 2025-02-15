import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home_page.dart';
import 'package:flutter_application_1/screens/signup.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login in your account',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 40),
            _buildTextField('Email'),
            SizedBox(height: 20),
            _buildTextField('Password', isPassword: true),
            SizedBox(height: 40),
               GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  height: screenheight * 0.05,
                  width: screenwidth * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(screenheight * 0.1)),
                  child: Center(
                      child: Text(
                    "sign in",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: screenheight * 0.1,
              ),

            // Container(child: Text("Submitted"),),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>CreateAccountPage()));
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: screenwidth * 0.1,                                                           
                    ),
                    Text(
                      'Have not an account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Sign up ",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

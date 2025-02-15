import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Vertically center everything
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                Text(
                  "See what's",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenwidth * 0.05,
                  ),
                ),
                Text(
                  "happening in the",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenwidth * 0.05,
                  ),
                ),
                Text(
                  "world right now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenwidth * 0.05,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenheight * 0.05),

          // Center the button container horizontally
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountPage()));
              },
              child: Container(
                width: screenwidth * 0.8,
                height: screenheight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenwidth * 0.08),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenheight*0.03,),

           Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountPage()));
              },
              child: Container(
                width: screenwidth * 0.8,
                height: screenheight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenwidth * 0.08),
                  color: Colors.white,
                ),
                child: Center(
                  child: Row(


                    children: [
                      SizedBox(width: screenwidth*0.13,),
                     Image.asset("asset/images/image.png", height: screenheight*0.03,),
                      SizedBox(width: screenwidth*0.03,),
                      Text(
                        " Sign Up with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenwidth * 0.045,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

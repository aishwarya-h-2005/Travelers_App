import 'package:firebase_auth/firebase_auth.dart'; // IMPORTANT: Added this
import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // 1. Added Controllers to "grab" the text you type
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Dark background
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. CURVED HEADER IMAGE
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80), // Creates the curve
                  ),
                  child: Image.asset(
                    "assets/images/home.jpeg", 
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // --- EMAIL FIELD ---
                  const Text("Email", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController, // Added controller
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(color: Colors.white38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), 
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- PASSWORD FIELD ---
                  const Text("Password", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController, // Added controller
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(color: Colors.white38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15), 
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                  
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Optional: Add Forgot Password logic later
                      },
                      child: const Text("Forgot Password?", style: TextStyle(color: Colors.white60)),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- SIGN IN BUTTON (CONNECTED TO FIREBASE) ---
                  GestureDetector(
                    onTap: () async {
                      try {
                        // This line checks with Google if the user exists
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                        // If correct, go to Home
                        if (mounted) {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const Home())
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        // If WRONG, show an error bar on the phone
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(e.message ?? "Login failed"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- SWITCH TO SIGNUP ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ", style: TextStyle(color: Colors.white70)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          "Signup",
                          style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
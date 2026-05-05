import 'package:firebase_core/firebase_core.dart'; // 1. IMPORTANT: Added this
import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/top_places.dart';
import 'package:travel_app/pages/signup.dart';
import 'package:travel_app/pages/login.dart';

void main() async { // 2. Changed to 'async'
  // 3. These two lines are the "Turn On" switch for Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Starts on Login page as you requested
      home: const Login(), 
    );
  }
}
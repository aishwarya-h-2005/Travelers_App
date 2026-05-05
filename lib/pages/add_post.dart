import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // IMPORTANT: Added this
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  uploadPost() async {
    // 1. Get the current logged-in user
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (locationController.text != "" && descController.text != "" && imageUrlController.text != "") {
      
      showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator()));

      // 2. We use 'currentUser?.displayName' to get the real name (Hema, Hash, etc.)
      Map<String, dynamic> postData = {
        "name": currentUser?.displayName ?? "New Traveler", // THIS FIXES YOUR PROBLEM
        "image": imageUrlController.text,
        "location": locationController.text,
        "description": descController.text,
        "ts": FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection("Posts").add(postData);
      
      if (mounted) {
        Navigator.pop(context); // Close loading
        Navigator.pop(context); // Go back to Home
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error: All fields are required!"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Post your Travel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(
                  hintText: "Paste Image Link here...",
                  prefixIcon: const Icon(Icons.link, color: Colors.blue),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: "Location",
                  prefixIcon: const Icon(Icons.location_on, color: Colors.blue),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: descController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Description...",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: uploadPost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("UPLOAD POST", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
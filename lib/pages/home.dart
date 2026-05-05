import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:flutter/material.dart';
import 'package:travel_app/pages/login.dart';
import 'package:travel_app/pages/add_post.dart';
import 'package:travel_app/pages/comment.dart'; 
import 'top_places.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = ""; 
  Set<String> likedPosts = {}; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/home.jpeg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 35,
                  left: 15,
                  child: _headerButton(Icons.public, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TopPlaces()));
                  }),
                ),
                Positioned(
                  top: 35,
                  right: 80,
                  child: _headerButton(Icons.add, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost()));
                  }),
                ),
                Positioned(
                  top: 30,
                  right: 15,
                  child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      if (mounted) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset("assets/images/girl.png", height: 50, width: 50, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 140.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Travelers", style: TextStyle(color: Colors.white, fontSize: 55.0, fontWeight: FontWeight.bold)),
                      Text("Travel Community App", style: TextStyle(color: Colors.white70, fontSize: 18.0)),
                    ],
                  ),
                ),
                _searchBar(context),
              ],
            ),

            const SizedBox(height: 30.0),

            StreamBuilder(
              stream: (searchQuery == "") 
                  ? FirebaseFirestore.instance.collection("Posts").orderBy("ts", descending: true).snapshots() 
                  : FirebaseFirestore.instance.collection("Posts")
                      .where("location", isGreaterThanOrEqualTo: searchQuery)
                      .where("location", isLessThanOrEqualTo: searchQuery + "\uf8ff")
                      .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Center(child: Text("No destinations found!"));

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                    var postData = doc.data() as Map<String, dynamic>;
                    String docId = doc.id; 

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset("assets/images/girl.png", height: 40, width: 40, fit: BoxFit.cover),
                                      ),
                                      const SizedBox(width: 10.0),
                                      // CHANGED THIS LINE BELOW:
                                      Text(
                                        postData['name'] ?? "Traveler", 
                                        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                    onPressed: () => _confirmDelete(docId),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15.0),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  postData['image'] ?? "https://images.unsplash.com/photo-1508804185872-d7badad00f7d",
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Text(postData['location'] ?? "Unknown", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(height: 8.0),
                              Text(postData['description'] ?? "No description", style: const TextStyle(color: Colors.black87)),
                              const SizedBox(height: 15.0),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (likedPosts.contains(docId)) {
                                          likedPosts.remove(docId);
                                        } else {
                                          likedPosts.add(docId);
                                        }
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          likedPosts.contains(docId) ? Icons.favorite : Icons.favorite_outline,
                                          color: likedPosts.contains(docId) ? Colors.red : Colors.black54,
                                          size: 28,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text("Like"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (context) => CommentsPage(postId: docId))
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.add_comment_outlined, color: Colors.black54, size: 26),
                                        SizedBox(width: 5.0),
                                        Text("Comment"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _headerButton(IconData icon, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.blue, size: 28.0),
        ),
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: MediaQuery.of(context).size.height / 2.7),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: const InputDecoration(
              hintText: "Search your destination...",
              prefixIcon: Icon(Icons.search, color: Colors.blue),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(String docId) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Post?"),
        content: const Text("Are you sure you want to remove this travel memory?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection("Posts").doc(docId).delete();
              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Post deleted successfully")),
                );
              }
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
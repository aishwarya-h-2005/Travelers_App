import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final List<Map<String, String>> famousSights;

  const PlaceDetail({
    super.key, 
    required this.name, 
    required this.image, 
    required this.description,
    required this.famousSights, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Stack(
              children: [
                Image.asset(image, width: double.infinity, height: 380, fit: BoxFit.cover),
                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(description, style: const TextStyle(fontSize: 15, color: Colors.black54, height: 1.4)),
                  
                  const SizedBox(height: 25),
                  const Text("Famous Sights", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),

                  // This displays the list you gave me (Ubud, Eiffel Tower, etc.)
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: famousSights.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170,
                          margin: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  famousSights[index]['image']!,
                                  height: 130, width: 170, fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], child: const Icon(Icons.image)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(famousSights[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 14, color: Colors.blue),
                                  const SizedBox(width: 4),
                                  Text(famousSights[index]['location']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
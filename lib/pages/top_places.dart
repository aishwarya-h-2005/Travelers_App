import 'package:flutter/material.dart';
import 'package:travel_app/pages/place_detail.dart';

class TopPlaces extends StatefulWidget {
  const TopPlaces({super.key});

  @override
  State<TopPlaces> createState() => _TopPlacesState();
}

class _TopPlacesState extends State<TopPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                  ),
                ),
                const Expanded(child: Center(child: Text("Top Places", style: TextStyle(color: Colors.blue, fontSize: 28.0, fontWeight: FontWeight.bold)))),
              ],
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  buildPlaceCard("Bali", "assets/images/bali.jpeg", "Island of Gods", [
                    {"name": "Ubud", "location": "Bali", "image": "assets/images/Ubud.jpeg"},
                    {"name": "Tanah Lot", "location": "Bali", "image": "assets/images/tanah.jpeg"},
                    {"name": "Uluwatu", "location": "Bali", "image": "assets/images/uluwatu.jpeg"},
                    {"name": "Seminyak", "location": "Bali", "image": "assets/images/seminayak.jpeg"},
                    {"name": "Tegallalang", "location": "Bali", "image": "assets/images/tegallalang.jpeg"},
                  ]),
                  buildPlaceCard("Dubai", "assets/images/dubai.jpeg", "City of Gold", [
                    {"name": "Burj Khalifa", "location": "Dubai", "image": "assets/images/burj.jpeg"},
                    {"name": "Dubai Mall", "location": "Dubai", "image": "assets/images/mall.jpeg"},
                    {"name": "Palm Jumeirah", "location": "Dubai", "image": "assets/images/palm.jpeg"},
                    {"name": "Desert Safari", "location": "Dubai", "image": "assets/images/safari.jpeg"},
                  ]),
                  buildPlaceCard("New York", "assets/images/newyork.jpeg", "The Big Apple", [
                    {"name": "Statue of Liberty", "location": "NY", "image": "assets/images/status.jpeg"},
                    {"name": "Central Park", "location": "NY", "image": "assets/images/park.jpeg"},
                    {"name": "Times Square", "location": "NY", "image": "assets/images/time.jpeg"},
                    {"name": "Brooklyn Bridge", "location": "NY", "image": "assets/images/bridge.jpeg"},
                  ]),
                  buildPlaceCard("Mexico", "assets/images/mexico.jpeg", "Ancient Ruins", [
                    {"name": "Chichen Itza", "location": "Mexico", "image": "assets/images/itza.jpeg"},
                    {"name": "Cancun", "location": "Mexico", "image": "assets/images/cancun.jpeg"},
                    {"name": "Tulum", "location": "Mexico", "image": "assets/images/tulum.jpeg"},
                    {"name": "Mexico City", "location": "Mexico", "image": "assets/images/city.jpeg"},
                  ]),
                  buildPlaceCard("France", "assets/images/france.jpeg", "Romantic Escape", [
                    {"name": "Eiffel Tower", "location": "France", "image": "assets/images/tower.jpeg"},
                    {"name": "Louvre", "location": "France", "image": "assets/images/mus.jpeg"},
                    {"name": "Versailles", "location": "France", "image": "assets/images/palace.jpeg"},
                    {"name": "Riviera", "location": "France", "image": "assets/images/riviera.jpeg"},
                  ]),
                  buildPlaceCard("India", "assets/images/india.jpeg", "Incredible India", [
                    {"name": "Taj Mahal", "location": "India", "image": "assets/images/taj.jpeg"},
                    {"name": "Jaipur", "location": "India", "image": "assets/images/jai.jpeg"},
                    {"name": "Goa", "location": "India", "image": "assets/images/goa.jpeg"},
                    {"name": "Kerala", "location": "India", "image": "assets/images/kerala.jpeg"},
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlaceCard(String name, String img, String desc, List<Map<String, String>> sights) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetail(name: name, image: img, description: desc, famousSights: sights))),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.asset(img, fit: BoxFit.cover, width: double.infinity))),
              Padding(padding: const EdgeInsets.all(8.0), child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}
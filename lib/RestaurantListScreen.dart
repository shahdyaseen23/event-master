import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // تأكد من إضافتها في pubspec.yaml
import 'RestaurantDetailScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'fareed zamano',
      'image': 'assets/fareed.jpg',
      'rating': 4.7,
      'location': 'رفيديا - نابلس',
      'phone': '0593130136',
       'foodImages': ['assets/f1.jpg', 'assets/f2.jpg'],
    },
    {
      'name': '1948',
      'image': 'assets/1948.jpg',
      'rating': 4.5,
      'location': 'رفيديا - نابلس',
      'phone': '0597888807',
      'foodImages': ['assets/jeb.jpg', 'assets/ma.jpg' ,'assets/kob.jpg'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'قائمة المطاعم التي توفر بوفيهات للمناسبات',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final res = restaurants[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          res['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        res['name'],
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'التقييم: ${res['rating']}',
                        style: GoogleFonts.cairo(),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RestaurantDetailsScreen(
                              name: res['name'],
                              location: res['location'],
                              rating: res['rating'].toDouble(),
                              phone: res['phone'],
                              reviewImages: List<String>.from(res['foodImages']),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

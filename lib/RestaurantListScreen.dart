import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // تأكد من إضافتها في pubspec.yaml
import 'RestaurantDetailScreen.dart';

classimport 'package:flutter/material.dart';
import 'full_image_screen.dart';

class PhotographerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> photographer;

  const PhotographerDetailScreen(this.photographer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photographer['name'])),
      backgroundColor: Color(0xFFE3F2FD),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📍 المدينة: ${photographer['city']}', style: _infoStyle()),
                  Text('📷 نوع العمل: ${photographer['mobile'] ? 'ميداني' : 'استوديو فقط'}', style: _infoStyle()),
                  Text('⭐ التقييم: ${photographer['rating']}', style: _infoStyle()),
                  Text('📞 رقم التواصل: ${photographer['phone']}', style: _infoStyle()),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('📸 أعمال المصور:', style: _titleStyle()),
            SizedBox(height: 10),
            SizedBox(height: 100, child: _buildImageList(context)),
            SizedBox(height: 20),
            Text('🗓️ المواعيد المتوفرة:', style: _titleStyle()),
            SizedBox(height: 10),
            _buildCalendar(),
          ],
        ),
      ),
    );
  }

  TextStyle _infoStyle() => TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);
  TextStyle _titleStyle() => TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple[700]);

  Widget _buildImageList(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: photographer['portfolioImages']
          .map<Widget>(
            (img) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullImageScreen(imagePath: img),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(img, width: 100, height: 100, fit: BoxFit.cover),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendar() {
    final now = DateTime.now();
    final List<String> dummyDates = List.generate(10, (i) {
      final date = now.add(Duration(days: i * 3));
      return "${date.year}-${date.month}-${date.day}";
    });

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: dummyDates
          .map((date) => Chip(
                label: Text(date),
                backgroundColor: Colors.green[100],
              ))
          .toList(),
    );
  }
}
 extends StatelessWidget {
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

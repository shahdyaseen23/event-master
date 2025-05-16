import 'package:flutter/material.dart';
import 'full_image_screen.dart';
import 'PhotographerReservationScreen.dart';

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
            SizedBox(height: 30),

            // زر احجز الآن
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(
  builder: (_) => PhotographerReservationScreen(
    photographerName: photographer['name'], // أرسل اسم المصور
  ),
),

                  );
                },
                child: Text(
                  'احجز الآن',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _infoStyle() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  TextStyle _titleStyle() => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple[700],
  );

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
}

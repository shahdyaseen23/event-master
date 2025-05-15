import 'package:flutter/material.dart';
import 'full_image_screen.dart';

class PhotographerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> photographer;

  const PhotographerDetailScreen(this.photographer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photographer['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المدينة: ${photographer['city']}', style: TextStyle(fontSize: 16)),
            Text('نوع العمل: ${photographer['mobile'] ? 'ميداني' : 'استوديو فقط'}'),
            Text('التقييم: ${photographer['rating']} ⭐'),
            Text('رقم التواصل: ${photographer['phone']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('أعمال المصور:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 100, child: _buildImageList(context)),  // تم تمرير context هنا
            SizedBox(height: 16),
            Text('المواعيد المتوفرة:', style: TextStyle(fontWeight: FontWeight.bold)),
            _buildCalendar(),
          ],
        ),
      ),
    );
  }

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
                child: Image.asset(img, width: 100, height: 100, fit: BoxFit.cover),
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
      children: dummyDates
          .map((date) => Chip(
                label: Text(date),
                backgroundColor: Colors.green[100],
              ))
          .toList(),
    );
  }
}

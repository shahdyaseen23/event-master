import 'package:flutter/material.dart';
import 'photographerDetailScreen.dart';

class PhotographerListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> photographers = [
    {
      'name': 'Mohammad Samman',
      'city': 'نابلس',
      'mobile': true,
      'portfolioImages': ['assets/p1.jpg', 'assets/p2.jpg'],
      'rating': 4.7,
      'phone': '0599123456',
    },
    {
      'name': 'Sara Yaseen',
      'city': 'طولكرم',
      'mobile': false,
      'portfolioImages': ['assets/s1.jpg', 'assets/s2.jpg'],
      'rating': 4.5,
      'phone': '0599876543',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' 📸 اختر مصور مناسبتك',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Color(0xFFE3F2FD),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: photographers.length,
          itemBuilder: (context, index) {
            final photographer = photographers[index];
            return Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 6,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(photographer['portfolioImages'][0]),
                  radius: 30,
                ),
                title: Text(
                  photographer['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text('📍 ${photographer['city']}', style: TextStyle(color: Colors.white70)),
                    Text('📷 التنقل: ${photographer['mobile'] ? 'ميداني' : 'استوديو فقط'}',
                        style: TextStyle(color: Colors.white70)),
                    Text('⭐ ${photographer['rating']}', style: TextStyle(color: Colors.yellow[200])),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotographerDetailScreen(photographer),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

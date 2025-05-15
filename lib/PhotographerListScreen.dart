import 'package:flutter/material.dart';
import 'photographerDetailScreen.dart';

class PhotographerListScreen extends StatelessWidget {
 final List<Map<String, dynamic>> photographers = [
  {
    'name': 'Mohammad samman',
    'city': 'نابلس',
    'mobile': true,
    'portfolioImages': ['assets/p1.jpg', 'assets/p2.jpg'],
    'rating': 4.7,
    'phone': '0599123456',
  },
  {
    'name': 'Sara yaseen',
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
  backgroundColor: Colors.deepPurple,
  centerTitle: true,
  title: Text(
  'اختر مصور مناسبتك',
  style: TextStyle(
    fontFamily: 'Boldnose',
    fontSize: 28,
    color: Colors.white,
    letterSpacing: 1.2,
    shadows: [
      Shadow(
        blurRadius: 4.0,
        color: Colors.black26,
        offset: Offset(2, 2),
      ),
    ],
  ),
),
),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: photographers.length,
          itemBuilder: (context, index) {
            final photographer = photographers[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.deepPurple[300],
              elevation: 8,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(photographer['portfolioImages'][0]),
                  radius: 30,
                ),
                title: Text(
                  photographer['name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('المدينة: ${photographer['city']}', style: TextStyle(color: Colors.white70)),
                    Text('التنقل: ${photographer['mobile'] ? 'ميداني' : 'استوديو فقط'}', style: TextStyle(color: Colors.white70)),
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

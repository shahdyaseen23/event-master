import 'package:flutter/material.dart';

class GiftDetailScreen extends StatelessWidget {
  final Map<String, dynamic> shop;

  const GiftDetailScreen({required this.shop, Key? key}) : super(key: key);

  TextStyle boldonseStyle({
    double size = 16,
    Color color = Colors.black,
    FontWeight weight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: 'Boldonse',
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          shop['name'],
          style: boldonseStyle(size: 20, weight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color(0xFFE3F2FD),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shop['name'],
              style: boldonseStyle(size: 22, weight: FontWeight.bold, color: Colors.deepPurple[800]!),
            ),
            const SizedBox(height: 10),
            Text('📍 المدينة: ${shop['city']}', style: boldonseStyle(size: 16)),
            Text('🎁 نوع الخدمة: ${shop['category']}', style: boldonseStyle(size: 16)),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: shop['images']
                    .map<Widget>(
                      (img) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            img,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              shop['description'],
              style: boldonseStyle(size: 16),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '📞 للتواصل: ${shop['phone']}',
                  style: boldonseStyle(size: 16, weight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('خاصية الاتصال غير مفعلة حالياً'),
                      ),
                    );
                  },
                  child: Text('اتصل الآن', style: boldonseStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

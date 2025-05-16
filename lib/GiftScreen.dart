import 'package:flutter/material.dart';
import 'gift_detail_screen.dart';

class GiftsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> giftShops = [
    {
      'name': 'هدايا الورد',
      'city': 'عمان',
      'category': 'توزيعات زواج',
      'rating': 4.9,
      'phone': '0791234567',
      'images': [
        'assets/gift1.png',
        'assets/gift2.png',
      ],
      'description': 'نوفر لكم توزيعات مميزة للحفلات والمناسبات بأسعار رائعة مع تغليف أنيق ومميز.',
    },
    {
      'name': 'توزيعات المهرجان',
      'city': 'الزرقاء',
      'category': 'توزيعات مواليد',
      'rating': 4.7,
      'phone': '0799876543',
      'images': [
        'assets/gift3.png',
        'assets/gift4.png',
      ],
      'description': 'أجمل التوزيعات لمناسبات المواليد مع هدايا تذكارية مميزة.',
    },
    // ممكن تضيفي بيانات أكثر هنا
  ];

  // دالة جاهزة لإرجاع TextStyle بالخط Boldonse
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
        title: Text('التوزيعات والهدايا',
            style: boldonseStyle(size: 20, weight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color(0xFFE3F2FD),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ابحث عن التوزيعات التي تلائم مناسبتك',
              style: boldonseStyle(
                size: 16,
                weight: FontWeight.bold,
                color: Colors.deepPurple[700]!,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: giftShops.length,
                itemBuilder: (context, index) {
                  final shop = giftShops[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              shop['images'][0],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shop['name'],
                                  style: boldonseStyle(
                                      size: 18, weight: FontWeight.bold, color: Colors.deepPurple[800]!),
                                ),
                                Text('📍 المدينة: ${shop['city']}',
                                    style: boldonseStyle(size: 14, color: Colors.black87)),
                                Text('🎁 نوع الخدمة: ${shop['category']}',
                                    style: boldonseStyle(size: 14, color: Colors.black87)),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 18),
                                    const SizedBox(width: 4),
                                    Text('${shop['rating']}',
                                        style: boldonseStyle(size: 14, color: Colors.black87)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => GiftDetailScreen(shop: shop),
                                        ),
                                      );
                                    },
                                    child: Text('شاهد التفاصيل', style: boldonseStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // تأكد تضيفه في pubspec.yaml
import 'ReservationScreen.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String phone;
  final List<String> reviewImages;

  const RestaurantDetailsScreen({
    Key? key,
    required this.name,
    required this.location,
    required this.rating,
    required this.phone,
    required this.reviewImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.cairo( // استخدم خط أنيق عربي
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.black87,
    );

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بوكس التفاصيل
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFD6EAF8), // أزرق فاتح جذاب
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📍 الموقع: $location', style: textStyle),
                  SizedBox(height: 8),
                  Text('⭐ التقييم: $rating', style: textStyle),
                  SizedBox(height: 8),
                  Text('📞 رقم التواصل: $phone', style: textStyle),
                ],
              ),
            ),

            SizedBox(height: 20),
            Text(
              '📸 بعض الأطباق التي يقدمها المطعم:',
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // الصور
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: reviewImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FullScreenImage(imagePath: reviewImages[index]),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          reviewImages[index],
                          width: 200,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // زر واضح
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ReservationScreen(restaurantName: name)),
                  );
                },
               child: Text(
  'احجز الآن',
  style: GoogleFonts.cairo(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  const FullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

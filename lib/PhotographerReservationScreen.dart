import 'package:flutter/material.dart';

class PhotographerReservationScreen extends StatefulWidget {
  final String photographerName;

  const PhotographerReservationScreen({required this.photographerName, Key? key}) : super(key: key);

  @override
  State<PhotographerReservationScreen> createState() => _PhotographerReservationScreenState();
}

class _PhotographerReservationScreenState extends State<PhotographerReservationScreen> {
  DateTime? _selectedDate;
  String? _location;
  String? _duration;

  final List<String> durations = ['نصف ساعة', 'ساعة', 'ساعتين'];

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      locale: const Locale('ar'), // لو حابب التاريخ يكون بالعربي
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حجز جلسة مع ${widget.photographerName}')),
      backgroundColor: Color(0xFFE3F2FD),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📅 تاريخ المناسبة:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            InkWell(
              onTap: _pickDate,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : 'اختر التاريخ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),

            Text('📍 الموقع:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(
              onChanged: (value) => _location = value,
              decoration: InputDecoration(
                hintText: 'ادخل عنوان المناسبة',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            SizedBox(height: 20),

            Text('⏱️ مدة الجلسة:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            DropdownButtonFormField<String>(
              items: durations
                  .map((duration) => DropdownMenuItem(value: duration, child: Text(duration)))
                  .toList(),
              onChanged: (value) => setState(() => _duration = value),
              decoration: InputDecoration(
                hintText: 'اختر المدة',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            Spacer(),
            Center(
              child: ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('تم الحجز بشكل تجريبي ✅'),
      backgroundColor: Colors.green,
    ));
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  child: Text(
    'تأكيد الحجز',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white, // ← لون النص الأبيض
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

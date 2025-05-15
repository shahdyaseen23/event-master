import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  final String restaurantName;
  const ReservationScreen({Key? key, required this.restaurantName}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime? _selectedDate;
  final _locationController = TextEditingController();
  final _peopleCountController = TextEditingController();
  bool _isDateAvailable = true;
  double _estimatedPrice = 0.0;

  // دالة اختيار التاريخ
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _isDateAvailable = true; // مؤقتًا كل التواريخ متاحة
      });
    }
  }

  void _calculatePrice() {
    int peopleCount = int.tryParse(_peopleCountController.text) ?? 0;
    _estimatedPrice = peopleCount * 30.0; // 30 ريال لكل شخص
    setState(() {});
  }

  void _submitReservation() {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يرجى اختيار تاريخ أولاً")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم الحجز بنجاح!")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حجز في ${widget.restaurantName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تاريخ المناسبة:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            InkWell(
              onTap: _pickDate,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
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
            Text('الموقع:', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(hintText: 'ادخل الموقع'),
            ),
            SizedBox(height: 20),
            Text('عدد الأشخاص:', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _peopleCountController,
              decoration: InputDecoration(hintText: 'عدد الأشخاص'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _calculatePrice();
              },
            ),
            SizedBox(height: 20),
            Text(
              _isDateAvailable ? '✅ التاريخ متاح!' : '❌ التاريخ غير متاح',
              style: TextStyle(color: _isDateAvailable ? Colors.green : Colors.red),
            ),
            SizedBox(height: 20),
            Text('السعر التقديري: $_estimatedPrice ريال', style: TextStyle(fontSize: 16)),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _isDateAvailable ? _submitReservation : null,
                child: Text('تأكيد الحجز', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

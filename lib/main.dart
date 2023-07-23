import 'package:flutter/material.dart';

void main() {
  runApp(CalorieCounterApp());
}

class CalorieCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalorieCounterScreen(),
    );
  }
}

class CalorieCounterScreen extends StatefulWidget {
  @override
  _CalorieCounterScreenState createState() => _CalorieCounterScreenState();
}

class _CalorieCounterScreenState extends State<CalorieCounterScreen> {
  int totalCalories = 0;
  TextEditingController _calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalori Hesaplama'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Toplam Kalori:',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            '$totalCalories',
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _calorieController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Kalori miktarını girin...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                int calorie = int.tryParse(_calorieController.text) ?? 0;
                totalCalories += calorie;
                _calorieController.clear();
              });
            },
            child: Text('Ekle'),
          ),
        ],
      ),
    );
  }
}

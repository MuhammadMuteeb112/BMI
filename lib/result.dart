import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final double weight;
  final double height;
  final double inHeight;

  const Result({
    super.key,
    required this.weight,
    required this.height,
    required this.inHeight,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double bmi = 0.0;

  @override
  void initState() {
    super.initState();
    bmiCalculate();
  }

  void bmiCalculate() {
    final totalInches = widget.height * 12 + widget.inHeight;
    final bmiValue = (widget.weight / (totalInches * totalInches)) * 703;

    setState(() {
      bmi = bmiValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your BMI')),
      ),
      body: Center(
        child: Card(
          shadowColor: Colors.green.shade200,
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your BMI is',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  bmi.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Recalculate',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
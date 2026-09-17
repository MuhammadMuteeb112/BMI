
import 'package:flutter/material.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var inController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width:300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/image_1.png"),
              fit: BoxFit.cover,
            ),
            
          ),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow),),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                decoration: InputDecoration(
                  label: Text("Enter your weight in kg"),
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.green.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(Icons.line_weight),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                decoration: InputDecoration(
                  label: Text("Enter your height in cm"),
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.green.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                controller: inController,
                decoration: InputDecoration(
                  label: Text("Enter your height in inches"),
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.green.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  var weight = double.parse(weightController.text);
                  var height = double.parse(heightController.text);
                  var inHeight = double.parse(inController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        weight: weight,
                        height: height,
                        inHeight: inHeight,
                      ),
                    ),
                  );
                  
                },
                child: Text("Calculate" , style: TextStyle(fontSize: 20,color: Colors.green),),
                
              ),
          
            ],),
        ),
      )
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';

import 'native_class/native_communications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Platform Channels'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double num1=0.0;
  double num2=0.0;
  double sum=0.0;
  String name='';

  void calculateSum()async{
    NativeCommunications nativeCommunications = NativeCommunications();
   double result=await nativeCommunications.getSumFromNative(num1, num2);
    print('sum from native: $sum');
    setState(() {
      sum=result;

    });
  }
  void getName()async{
    NativeCommunications nativeCommunications = NativeCommunications();
    String result=await nativeCommunications.getNameFromNative(name);
    print('name from native: $name');
    setState(() {
      name=result;});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Number 1'),
              onChanged: (value) {
                num1 = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Number 2'),
              onChanged: (value) {
                num2 = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'sum: $sum' ,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'User Name '),
              onChanged: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'user name : $name' ,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculateSum,
        tooltip: 'Sum',
        child:  Icon(Icons.check),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'MassConversion.dart';
import 'LiquidConversion.dart';
import 'DistanceConversion.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Page 1'),
      //   centerTitle: true,
      // ),
      body: Center(
        child:Container(
    width: double.infinity, // Full width

    constraints: BoxConstraints(maxWidth:600.0), // Maximum width
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Padding(
    padding: const EdgeInsets.all(10.0), // Add your desired padding
    child: Text(
    "Which conversion do you want?",
    style: TextStyle(fontSize: 25.0,color: Colors.blue)
    ),
    ),
    const SizedBox(height: 10),

    ElevatedButton(onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const MassConversion())
    );
    },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(100.0, 50.0)), // Set your desired width and height
        ),

        child: Container(  width: double.infinity,child:Center(child:const Text("Mass Conversion",style: TextStyle(fontSize: 16.0),)))
    ),
    const SizedBox(height: 10),
    ElevatedButton(onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const LiquidConversion())
    );
    },  style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(100.0, 50.0)), // Set your desired width and height
      backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreenAccent),
    ),
        child: Container(  width: double.infinity,child:Center(child:const Text("Liquid Conversion",style: TextStyle(fontSize: 16.0),)))
    ),
    const SizedBox(height: 10),
    ElevatedButton(onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const DistanceConversion())
    );
    },style: ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(100.0, 50.0)), // Set your desired width and height
      backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
    ),
        child: Container(  width: double.infinity,child:Center(child:const Text("Distance Conversion",style: TextStyle(fontSize: 16.0),)))
    )
    ]),
    ) ,

    ));
  }
}

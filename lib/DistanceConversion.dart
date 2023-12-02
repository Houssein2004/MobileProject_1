import 'package:flutter/material.dart';
import 'MyDropDown.dart';
class DistanceConversion extends StatefulWidget {
  const DistanceConversion({Key? key}) : super(key: key);

  @override
  State<DistanceConversion> createState() => _DistanceConversionState();
}

class _DistanceConversionState extends State<DistanceConversion> {
  double Result = 0;
  String Input = "";
  String From = 'm';
  String To = 'm';
  String method = "";
  List<String> Items = ["m","yd","km","mi"];
  void updateText(String text) {
    setState(() {
      Input = text;
    });
  }
  void updateTo(String text){
    setState(() {
      To = text;
    });
    getResult();
  }
  void updateFrom(String text){
    setState(() {
      From = text;
    });
    getResult();
  }
  void getResult() {
    if (From == "m") {
      switch (To) {
        case "m":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "yd":
          Result = double.parse(Input) * 1.0936;
          method = "x 1.0936";
          break;
        case "km":
          Result = double.parse(Input) * 0.001;
          method = "x 0.001";
          break;
        case "mi":
          Result = double.parse(Input) * 0.00062137;
          method = "x 0.00062137";
      }
    } else if (From == "yd") {
      switch (To) {
        case "m":
          Result = double.parse(Input) * 0.9144;
          method = "x 0.9144";
          break;
        case "yd":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "km":
          Result = double.parse(Input) * 0.0009144;
          method = "x 0.0009144";
          break;
        case "mi":
          Result = double.parse(Input) * 0.00056818;
          method = "x 0.00056818";
      }
    } else if (From == "km") {
      switch (To) {
        case "m":
          Result = double.parse(Input) * 1000;
          method = "x 1000";
          break;
        case "yd":
          Result = double.parse(Input) * 1094;
          method = "x 1094";
          break;
        case "km":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "mi":
          Result = double.parse(Input) * 0.62137;
          method = "x 0.62137";
      }
    } else if (From == "mi") {
      switch (To) {
        case "m":
          Result = double.parse(Input) * 1609.34;
          method = "x 1609.34";
          break;
        case "yd":
          Result = double.parse(Input) * 1760;
          method = "x 1760";
          break;
        case "km":
          Result = double.parse(Input) * 1.60934;
          method = "x 1.60934";
          break;
        case "mi":
          Result = double.parse(Input);
          method = "x 1";
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Distance Conversion"),
        ),
        body: Column(
          children: [
            SizedBox(height:50.0),
            SizedBox(width: 300.0, height: 50.0,
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Input'
                  ),
                  onChanged: (text) { updateText(text); getResult();},
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 100,child:MyDropDown(value: From,itemsList: Items,updateValue: updateFrom),),
                  SizedBox(width: 100,child: Icon(Icons.arrow_forward),),
                  SizedBox(width: 100,child:MyDropDown(value: To,itemsList: Items,updateValue: updateTo),),
                ],
              ),
            ),
            SizedBox(height:50.0),
            Text("Result:$Input $From $method =  ${Result.toStringAsFixed(2)} $To", style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18.0, // Set your desired font size
              // You can also set other properties like fontWeight, color, etc.
            ),)
          ],

        )
    );
  }
}

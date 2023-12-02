import 'package:flutter/material.dart';
import 'MyDropDown.dart';
class LiquidConversion extends StatefulWidget {
  const LiquidConversion({Key? key}) : super(key: key);

  @override
  State<LiquidConversion> createState() => _LiquidConversionState();
}

class _LiquidConversionState extends State<LiquidConversion> {
  double Result = 0;
  String Input = "";
  String From = 'mL';
  String To = 'mL';
  String method = "";
  List<String> Items = ["mL","L","Fl Oz","Gal"];
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
    if (From == "mL") {
      switch (To) {
        case "mL":
          Result = double.parse(Input);
          method="x 1";
          break;
        case "L":
          Result = double.parse(Input) / 1000;
          method="/ 1000";
          break;
        case "Fl Oz":
          Result = double.parse(Input) / 29.57;
          method = "/ 29.57";
          break;
        case "Gal":
          Result = double.parse(Input) / 3785;
          method = "/ 3785";
      }
    } else if (From == "L") {
      switch (To) {
        case "mL":
          Result = double.parse(Input) * 1000;
          method = "x 1000";
          break;
        case "L":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "Fl Oz":
          Result = double.parse(Input) * 33.814;
          method = "x 33.814";
          break;
        case "Gal":
          Result = double.parse(Input) * 0.26417;
          method = "x 0.26417";
      }
    } else if (From == "Fl Oz") {
      switch (To) {
        case "mL":
          Result = double.parse(Input) * 29.57;
          method = "x 29.57";
          break;
        case "L":
          Result = double.parse(Input) / 33.814;
          method = "/ 33.814";
          break;
        case "Fl Oz":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "Gal":
          Result = double.parse(Input) / 128;
          method = "/ 128";
      }
    } else if (From == "Gal") {
      switch (To) {
        case "mL":
          Result = double.parse(Input) * 3785;
          method = "x 3785";
          break;
        case "L":
          Result = double.parse(Input) / 3.785;
          method = "/ 3.785";
          break;
        case "Fl Oz":
          Result = double.parse(Input) * 128;
          method = "x 128";
          break;
        case "Gal":
          Result = double.parse(Input);
          method = "x 1";
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liquid Conversion"),
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

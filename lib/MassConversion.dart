import 'package:flutter/material.dart';
import 'MyDropDown.dart';
class MassConversion extends StatefulWidget {
  const MassConversion({Key? key}) : super(key: key);

  @override
  State<MassConversion> createState() => _MassConversionState();
}

class _MassConversionState extends State<MassConversion> {
  double Result = 0;
  String Input = "";
  String From = 'g';
  String To = 'g';
  String method = '';
  List<String> Items = ["g","kg","lb","oz"];
  void updateText(String text) {
    setState(() {
      Input = text;
    });
  }
  void updateMethod(){

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
    if (From == "g") {
      switch (To) {
        case "g":
          Result = double.parse(Input);
          method = "x1";
          break;
        case "kg":
          Result = double.parse(Input) / 1000;
          method = "/ 1000";
          break;
        case "lb":
          Result = double.parse(Input) / 453.592;
          method = "/ 453.592";
          break;
        case "oz":
          Result = double.parse(Input) / 28.3495;
          method = "/ 28.3495";
          break;
      }
    } else if (From == "kg") {
      switch (To) {
        case "g":
          Result = double.parse(Input) * 1000;
          method = "x 1000";
          break;
        case "kg":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "lb":
          Result = double.parse(Input) * 2.20462;
          method = "x 2.20462";
          break;
        case "oz":
          Result = double.parse(Input) * 35.27396;
          method = "x 35.27396";
      }
    } else if (From == "lb") {
      switch (To) {
        case "g":
          Result = double.parse(Input) * 453.592;
          method = "x 453.592";
          break;
        case "kg":
          Result = double.parse(Input) * 0.453592;
          method = "x 0.453592";
          break;
        case "lb":
          Result = double.parse(Input);
          method = "x 1";
          break;
        case "oz":
          Result = double.parse(Input) * 16;
          method = "x 16";
      }
    } else if (From == "oz") {
      switch (To) {
        case "g":
          Result = double.parse(Input) * 28.3495;
          method = "x 28.3495";
          break;
        case "kg":
          Result = double.parse(Input) / 35.27396;
          method = "/ 35.27396";
          break;
        case "lb":
          Result = double.parse(Input) / 16;
          method = "/ 16";
          break;
        case "oz":
          Result = double.parse(Input);
          method = "x 1";
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mass Conversion"),
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
          ),),

        ],

      )
    );
  }
}

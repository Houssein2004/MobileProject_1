import 'package:flutter/material.dart';
class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key,required this.value,required this.itemsList,required this.updateValue}) : super(key: key);
  final String value;
  final updateValue;
  final List<String> itemsList; // Pass the list of items
  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value, // Set the initially selected value
      onChanged: (String? newValue) {
        setState(() {
          widget.updateValue(newValue);
        });
        print("Selected: $newValue");
      },
      items: widget.itemsList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
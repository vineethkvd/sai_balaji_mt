

// import 'package:flutter/material.dart';

// class DropDownWidget extends StatefulWidget {
// const DropDownWidget({Key? key}) : super(key: key);

// @override
// _DropDownWidgetState createState() => _DropDownWidgetState();
// }

// class _DropDownWidgetState extends State<DropDownWidget> {
	
// // Initial Selected Value
// String dropdownvalue = 'Item 1';

// // List of items in our dropdown menu
// var items = [	
// 	'Item 1',
// 	'Item 2',
// 	'Item 3',
// 	'Item 4',
// 	'Item 5',
// ];
// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(
// 		title: const Text("Geeksforgeeks"),
// 	),
// 	body: Center(
// 		child: Column(
// 		mainAxisAlignment: MainAxisAlignment.center,
// 		children: [
// 			DropdownButton(
				
// 			// Initial Value
// 			value: dropdownvalue,
				
// 			// Down Arrow Icon
// 			icon: const Icon(Icons.keyboard_arrow_down),	
				
// 			// Array list of items
// 			items: items.map((String items) {
// 				return DropdownMenuItem(
// 				value: items,
// 				child: Text(items),
// 				);
// 			}).toList(),
// 			// After selecting the desired option,it will
// 			// change button value to selected value
// 			onChanged: (String? newValue) {
// 				setState(() {
// 				dropdownvalue = newValue!;
// 				});
// 			},
// 			),
// 		],
// 		),
// 	),
// 	);
// }
// }
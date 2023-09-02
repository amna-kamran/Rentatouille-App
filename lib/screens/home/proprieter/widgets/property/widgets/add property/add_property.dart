import 'package:flutter/material.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/core/form_builder.dart';
import 'circle_button.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  int _selectedBedroom = 0;
  String _selectedUnit = 'Sq.Ft';
  final divider = const Divider(
    height: 40,
    thickness: 1,
  );

  void _handleBedroomSelection(int selectedNumber) {
    setState(() {
      _selectedBedroom = selectedNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spaces.h10,
                    const Text(
                      "Post a Property",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                    Spaces.h30,
                    const Text(
                      "Bedrooms",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 1; i <= 5; i++)
                          CircleButton(
                            number: i,
                            isSelected: _selectedBedroom == i,
                            onChanged: _handleBedroomSelection,
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        for (int i = 6; i <= 10; i++)
                          CircleButton(
                            number: i,
                            isSelected: _selectedBedroom == i,
                            onChanged: _handleBedroomSelection,
                          ),
                      ],
                    ),
                    divider,
                    Row(
                      children: [
                        Expanded(
                          child: AppInputTextField(
                            labelText: "Area",
                            fieldType: FieldType.number,
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          value: _selectedUnit,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedUnit = newValue!;
                            });
                          },
                          items: <String>[
                            'Sq.Ft',
                            'Sq.M',
                            'Sq.Yd',
                            'Marla',
                            'Kanal',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Spaces.w10
                      ],
                    ),
                    divider,
                    AppInputTextField(
                      labelText: "Title",
                      fieldType: FieldType.text,
                    ),
                    divider,
                    AppInputTextField(
                      labelText: "Description",
                      fieldType: FieldType.text,
                    ),
                    divider,
                    AppInputTextField(
                      labelText: "Address",
                      fieldType: FieldType.text,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

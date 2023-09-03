import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/core/form_builder.dart';
import 'package:rentatouille/screens/home/widgets/toggle_button.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/property/monthly_rent_provider.dart';
import 'package:rentatouille/services/property/property_provider.dart';
import 'package:rentatouille/services/toggle_provider.dart';
import 'circle_button.dart';
import 'monthly_rent.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});
  static final _formKey = GlobalKey<FormBuilderState>();

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

  void _handleBedroomSelection(int selectedNumber) => setState(() {
        _selectedBedroom = selectedNumber;
      });

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    final monthlyRentValue =
        Provider.of<MonthlyRentProvider>(context).monthlyRent;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: AddPropertyScreen._formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spaces.h10,
                      const Text(
                        "Post a Property",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w500),
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
                      divider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Lounge",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ToggleButtonApp(
                            initialValue: toggleProvider.hasLounge,
                            onToggle: (newValue) {
                              toggleProvider.toggleLounge();
                            },
                            activeColor: Colors.green,
                            inactiveColor: Colors.grey,
                          ),
                        ],
                      ),
                      divider,
                      const MonthlyRentWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: double.infinity,
          color: Colors.green,
          child: InkWell(
            onTap: () {
              final form = AddPropertyScreen._formKey.currentState;
              final isValid = form!.saveAndValidate();
              if (!isValid) return;

              final data = form.value;
              Map<String, dynamic> propertyData = {
                'bedrooms': _selectedBedroom,
                'area': data["Area"],
                'title': data["Title"],
                'description': data["Description"],
                'address': data["Address"],
                'lounge': toggleProvider.hasLounge,
                'monthly rent': monthlyRentValue,
                'user_id': AuthProvider.getCurrentUserId(),
              };
              PropertyProvider.create(propertyData);
            },
            child: const Center(
              child: Text(
                "Post Property",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

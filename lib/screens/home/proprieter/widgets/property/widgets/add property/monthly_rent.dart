import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/core/form_builder.dart';
import 'package:rentatouille/services/property/monthly_rent_provider.dart';

class MonthlyRentWidget extends StatefulWidget {
  const MonthlyRentWidget({super.key});

  @override
  _MonthlyRentWidgetState createState() => _MonthlyRentWidgetState();
}

class _MonthlyRentWidgetState extends State<MonthlyRentWidget> {
  final TextEditingController _controller = TextEditingController();
  String formattedValue = '';

  void formatNumber(String? value) {
    final numberFormat = NumberFormat("#,###");
    final parsedValue = int.tryParse(value!) ?? 0;
    setState(() {
      formattedValue = numberFormat.format(parsedValue);
      Provider.of<MonthlyRentProvider>(context, listen: false)
          .setMonthlyRent(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppInputTextField(
            labelText: "Monthly Rent",
            fieldType: FieldType.number,
            controller: _controller,
            onChanged: formatNumber,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          formattedValue,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

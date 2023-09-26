import 'package:flutter/material.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/core/uploaded/dropdown.dart';
import 'package:rentatouille/screens/home/renter/widgets/request/fetch_request.dart';

class ProprieterRequestScreen extends StatefulWidget {
  const ProprieterRequestScreen({super.key});

  @override
  State<ProprieterRequestScreen> createState() =>
      _ProprieterRequestScreenState();
}

class _ProprieterRequestScreenState extends State<ProprieterRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomDropdown(
                title: "Pending Requests",
                child: FetchRequest(isPending: true),
              ),
              Spaces.divider,
              CustomDropdown(
                title: "Accepted",
                child: FetchRequest(isAccepted: true),
              ),
              Spaces.divider,
              CustomDropdown(
                title: "Declined",
                child: FetchRequest(isDeclined: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

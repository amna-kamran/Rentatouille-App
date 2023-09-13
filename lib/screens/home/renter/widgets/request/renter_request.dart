import 'package:flutter/material.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/core/uploaded/dropdown.dart';
import 'package:rentatouille/screens/home/renter/widgets/request/pending_request.dart';

class RenterRequestScreen extends StatelessWidget {
  const RenterRequestScreen({super.key});

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
                child: RequestScreen(isPending: true),
              ),
              Spaces.divider,
              CustomDropdown(
                title: "Accepted",
                child: RequestScreen(isAccepted: true),
              ),
              Spaces.divider,
              CustomDropdown(
                title: "Declined",
                child: RequestScreen(isDeclined: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

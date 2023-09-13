import 'package:flutter/material.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/model/property.dart';

class RequestTile extends StatelessWidget {
  const RequestTile({
    Key? key,
    required this.property,
    required this.status,
  }) : super(key: key);

  final Property property;
  final RequestStatus status;

  @override
  Widget build(BuildContext context) {
    Icon? statusIcon;

    if (status == RequestStatus.accepted) {
      statusIcon = const Icon(Icons.check, color: Colors.green);
    } else if (status == RequestStatus.pending) {
      statusIcon = const Icon(Icons.access_time, color: Colors.grey);
    } else if (status == RequestStatus.declined) {
      statusIcon = const Icon(Icons.close, color: Colors.red);
    }

    return InkWell(
      onTap: () {},
      child: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              URL.missingImg,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    property.monthlyRent,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (statusIcon != null) statusIcon,
          ],
        ),
      ),
    );
  }
}

enum RequestStatus {
  accepted,
  pending,
  declined,
}

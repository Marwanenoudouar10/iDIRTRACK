import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final totalDays = endDate.difference(startDate).inDays;
    final remainingDays = endDate.difference(DateTime.now()).inDays;
    final progress = remainingDays / totalDays;

    Color getProgressColor() {
      if (progress > 0.75) {
        return Colors.green;
      } else if (progress > 0.25) {
        return Colors.orange;
      } else {
        return Colors.red;
      }
    }

    return Card(
      child: ListTile(
        leading: const Icon(Icons.directions_car),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Début: ${DateFormat('yyyy-MM-dd').format(startDate)}'),
            Text('Fin: ${DateFormat('yyyy-MM-dd').format(endDate)}'),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: getProgressColor(),
            ),
            const SizedBox(height: 4),
            Text('Jours restants: $remainingDays'),
          ],
        ),
      ),
    );
  }
}

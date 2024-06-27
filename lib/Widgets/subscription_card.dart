import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/container_widget.dart';
import 'package:intl/intl.dart';

Widget buildSubscriptionCard({
  required String title,
  required DateTime startDate,
  required DateTime endDate,
}) {
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
      leading: buildContainer(
        const Image(
          image: AssetImage('assets/icons/truck.png'),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Jours restants: $remainingDays',
            style: const TextStyle(fontSize: 13, color: Colors.green),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' ${DateFormat('yyyy-MM-dd').format(startDate)}',
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                ' ${DateFormat('yyyy-MM-dd').format(endDate)}',
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 10,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: getProgressColor(),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    ),
  );
}

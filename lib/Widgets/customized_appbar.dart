import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart'; // Make sure this import is correct
import 'package:idirtrack/Widgets/customized_search_bar.dart'; // Make sure this import is correct

class CustomizedAppbar extends StatelessWidget {
  const CustomizedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kIconColor,
      child: const Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
              child: Text(
            '100 Vehicles',
            style: TextStyle(color: Colors.black),
          )),
          const SizedBox(height: 5),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

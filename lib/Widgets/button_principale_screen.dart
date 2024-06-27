import 'package:flutter/material.dart';

Widget buildCustomizedButton({
  required BuildContext context,
  required String imagePath,
  required Object object,
  required String pageName,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.246,
    height: MediaQuery.of(context).size.height * 0.12,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => object as Widget),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 32,
            height: 32,
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pageName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 7,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

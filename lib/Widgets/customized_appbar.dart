import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart'; // Make sure this import is correct

class CustomizedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomizedAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kIconColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Center(
                child: Padding(
              padding: EdgeInsets.only(left: 113.0),
              child: Text(
                '100 Vehicles',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
            const SizedBox(height: 5),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

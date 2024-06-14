import 'package:flutter/material.dart';
import 'package:idirtrack/Widgets/add_items_button.dart';
import 'package:idirtrack/Widgets/customized_appbar.dart';
import 'package:idirtrack/constant.dart';

// ignore: must_be_immutable
class MaintenanceScreen extends StatefulWidget {
  List<Map<String, dynamic>> data = [];
  MaintenanceScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomizedAppbar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 50.0, // Set container height for titles
                decoration: const BoxDecoration(
                  color: kIconColor,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey), // Add bottom border
                  ),
                ),
                child: Row(
                  children: [
                    for (int i = 0; i < widget.data.length; i++)
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _selectedIndex = i),
                          child: Text(
                            widget.data[i]['title'],
                            style: TextStyle(
                              color: _selectedIndex == i
                                  ? Colors.white
                                  : Colors.black, // Change highlight color here
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return MyPageContent(widget.data[index]);
                  },
                  onPageChanged: (index) =>
                      setState(() => _selectedIndex = index),
                ),
              ),
            ],
          ),
          Positioned(
            top: 625,
            left: 300,
            child: CircleIconButton(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class MyPageContent extends StatelessWidget {
  final Map<String, dynamic> data;

  const MyPageContent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add your page content here
      child: Center(
        child: Text(data['content']), // Replace with your actual content
      ),
    );
  }
}

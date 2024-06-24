import 'dart:io';
import 'package:flutter/material.dart';
import 'package:idirtrack/global/global_state.dart';
import 'package:idirtrack/myContentPage/my_content_page.dart';
import 'package:idirtrack/utils/utils_file.dart';
import 'package:idirtrack/Widgets/customized_appbar.dart';
import 'package:idirtrack/constant.dart';
import 'package:provider/provider.dart';

class MaintenanceScreen extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  const MaintenanceScreen(
      {super.key, required this.data, required int locationId});

  @override
  // ignore: library_private_types_in_public_api
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  late File frontImage;
  late File backImage;
  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        int vehicleId =
            Provider.of<GlobalState>(context, listen: false).vehicleId;
        int locationId =
            Provider.of<GlobalState>(context, listen: false).userId;
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galerie de photos'),
                onTap: () {
                  frontImage = pickImage() as File;
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Appareil photo'),
                onTap: () {
                  backImage = pickImage() as File;
                  Navigator.of(context).pop();
                  uploadDocuments(
                    backendUrl: 'http://$kIpAddress',
                    backImage: backImage,
                    frontImage: frontImage,
                    vehicleId: vehicleId,
                    locationId: locationId,
                    context: context,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: unused_element
  void _showReviewMessage(BuildContext context) {
    Navigator.of(context).pop(); // Close the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Demande en cours de révision'),
          content: const Text('Votre demande est en cours de révision.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDocumentCard(BuildContext context,
      {required String text, required AssetImage icon}) {
    int vehicleId = Provider.of<GlobalState>(context, listen: false).vehicleId;
    int locationId = Provider.of<GlobalState>(context, listen: false).userId;
    return GestureDetector(
      onTap: () {
        _showPickerDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                getDocuments(
                  backendUrl: 'http://$kIpAddress',
                  vehicleId: vehicleId,
                  locationId: locationId,
                  context: context,
                );
              },
              child: Image(
                image: icon,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _showDocumentsDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                _buildDocumentCard(
                  context,
                  icon: const AssetImage('assets/icons/id_card.png'),
                  text: 'Clicker pour scanner votre permis (verso)',
                ),
                const SizedBox(height: 20),
                _buildDocumentCard(
                  context,
                  icon: const AssetImage('assets/icons/id_card_back.png'),
                  text: 'Clicker pour scanner votre permis (verso)',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomizedAppbar(
        headline: false,
        showSearchBar: true,
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            decoration: const BoxDecoration(
              color: kIconColor,
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: widget.data.asMap().entries.map((entry) {
                int index = entry.key;
                String title = entry.value['title'];
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedIndex = index);
                      _pageController.jumpToPage(index);
                    },
                    child: Text(
                      title,
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return MyPageContent(widget.data[index]);
              },
              onPageChanged: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDocumentsDialogue(context),
        backgroundColor: kIconColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

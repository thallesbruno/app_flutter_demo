import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Exemplos de widgets Cupertino: action sheet, alert dialog, activity indicator, date picker.
class CupertinoTela extends StatelessWidget {
  const CupertinoTela({super.key});

  void _abrirActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Favorite Dessert'),
        message: const Text('Please select the best dessert from the options below.'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Profiteroles'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cannolis'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Trifle'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  void _abrirAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Allow "Maps" to access your location while you use the app?'),
        content: const Text(
          'Your current location will be displayed on the map and used for '
          'directions, nearby search results, and estimated travel times.',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Don't Allow"),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Allow'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Cupertino')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('Bottom action sheet'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _abrirActionSheet(context),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Alert Dialog'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _abrirAlertDialog(context),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Activity Indicators'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CupertinoActivityIndicator(),
                      CupertinoActivityIndicator(radius: 20, color: Color(0xFF4A14B0)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Date Pickers'),
                  SizedBox(
                    height: 216,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (novaData) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

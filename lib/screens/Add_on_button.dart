import 'package:flutter/material.dart';

class ToggleChatForm extends StatefulWidget {
  const ToggleChatForm({super.key});

  @override
  State<ToggleChatForm> createState() => _ToggleChatFormState();
}

class _ToggleChatFormState extends State<ToggleChatForm> {
  bool _showForm = false; // Toggle switch control
  String? _selectedOption; // Stores the selected radio button option

  // List of options
  final List<String> _options = [
    'Start up',
    'Study',
    'Career guidance',
    'Tech'
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Advertisement Preferences"),
        actions: [
          Switch(
            value: _showForm,
            onChanged: (value) {
              setState(() {
                _showForm = value; // Show or hide the form
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Instructions
            const Text(
              "Which type of advertisements would you like to see in the app?",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Only show the form if the toggle is ON
            if (_showForm)
              Column(
                children: [
                  // Radio button options
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _options.map((option) {
                        return RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          activeColor: Colors.blue, // Color when selected
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                      if (_selectedOption != null) {
                        // Show selected option in a dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Selected Option"),
                              content: Text("You selected: $_selectedOption"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ToggleChatForm extends StatefulWidget {
  const ToggleChatForm({super.key});

  @override
  State<ToggleChatForm> createState() => _ToggleChatFormState();
}

class _ToggleChatFormState extends State<ToggleChatForm> {
  bool _showForm = false; // Toggle switch control
  String? _selectedOption; // Stores the selected advertisement preference
  String? _selectedTimeOption; // Stores the selected time duration option
  TimeOfDay? _selectedTime; // Stores the selected time if "Time" is selected
  final TextEditingController _otherTimeController = TextEditingController(); // Controller for "Other" input

  // List of advertisement options
  final List<String> _options = [
    'Start up',
    'Study',
    'Career guidance',
    'Tech'
  ];

  // List of time duration options
  final List<String> _timeOptions = [
    'Always',
    'Time',
    'Other'
  ];

  // Function to pick a time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final screenwidth = screenSize.width;
    final screenheight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Advertisement Preferences",
          style: TextStyle(color: Colors.white),
        ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
          
              // Only show the form if the toggle is ON
              if (_showForm)
                Column(
                  children: [
                    // Advertisement preferences question
                    const Text(
                      "Which type of advertisements would you like to see in the app?",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenheight * 0.05),
          
                    // Advertisement options as radio buttons
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
          
                    // Time duration options
                    const Text(
                      "Select time duration:",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenheight * 0.02),
          
                    // Time duration radio buttons
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _timeOptions.map((option) {
                          return RadioListTile<String>(
                            title: Text(option),
                            value: option,
                            groupValue: _selectedTimeOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedTimeOption = value;
                                if (value == 'Time') {
                                  _pickTime(context); // Show time picker if "Time" is selected
                                }
                              });
                            },
                            activeColor: Colors.blue, // Color when selected
                          );
                        }).toList(),
                      ),
                    ),
          
                    // If "Time" is selected, show the picked time
                    if (_selectedTimeOption == 'Time' && _selectedTime != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Selected time: ${_selectedTime!.format(context)}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
          
                    // If "Other" is selected, show a text field for custom input
                    if (_selectedTimeOption == 'Other')
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _otherTimeController,
                          decoration: const InputDecoration(
                            labelText: "Specify time",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
          
                    const SizedBox(height: 24),
          
                    // Submit Button
                    GestureDetector(
                      onTap: () {
                        // Handle form submission
                        if (_selectedOption != null && _selectedTimeOption != null) {
                          // Show selected options in a dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Selected Options"),
                                content: Text(
                                  "You selected: $_selectedOption\n"
                                  "Time duration: ${_selectedTimeOption == 'Time' ? _selectedTime!.format(context) : _selectedTimeOption == 'Other' ? _otherTimeController.text : _selectedTimeOption}",
                                ),
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
                      child: Container(
                        width: screenwidth * 0.8,
                        height: screenheight * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(screenwidth * 0.05),
                        ),
                        child: const Center(
                          child: Text('Submit', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

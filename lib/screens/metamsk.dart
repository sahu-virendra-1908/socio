import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MetaMaskLauncher extends StatelessWidget {
  // URL to open MetaMask app or Play Store if the app is not installed
  final String _metaMaskUrl = "io.metamask";
  final String _playStoreUrl = "https://play.google.com/store/apps/details?id=io.metamask";

  Future<void> _launchMetaMask() async {
    // Check if MetaMask is installed
    bool canLaunchMetaMask = await canLaunchUrl(Uri(scheme: 'metamask'));
    
    if (canLaunchMetaMask) {
      // If MetaMask is installed, launch MetaMask
      await launchUrl(Uri(scheme: 'metamask'));
    } else {
      // If MetaMask is not installed, open Play Store link
      await launchUrl(Uri.parse(_playStoreUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Launch MetaMask', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchMetaMask,
          child: Text('Open MetaMask'),
        ),
      ),
    );
  }
}



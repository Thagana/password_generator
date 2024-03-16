import 'package:flutter/material.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cyberman Password Generator'),
      ),
      body: Container(
        color: Colors.black,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Password Generator',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

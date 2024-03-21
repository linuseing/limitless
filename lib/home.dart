import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Sven',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text('ich hoffe dir geht es richtig beschissen!'),
            Container(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily challenge',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Upper Body'),
                      Text('Chest and back'),
                      Text('45 min'),
                    ],
                  ),
                ),
              ),
            ),
            Text('Your current progress',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: Card.outlined(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.local_fire_department_outlined),
                              SizedBox(width: 4), // Add this line
                              Text('Steps',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Text('10234'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card.outlined(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 4), // Add this line
                              Text('Heat Rate',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Text('10234'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Personal Recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

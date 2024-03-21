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
        child: Flexible(
          child: Column(
            children: [
              Text(
                'Hello, Sven',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('ich hoffe dir geht es richtig beschissen!'),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: Card.outlined(
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
              SizedBox(height: 16),
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
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      2, // Replace itemCount with the actual number of items
                  itemBuilder: (BuildContext context, int index) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage('assets/food.png'),
                              fit: BoxFit.cover,
                              width: 220, // Set the desired width
                            ),
                            Text(
                              "Sticky Coconut Chicken and Rice",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("30-40 minutes"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Sven',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text('ich hoffe dir geht es richtig beschissen!'),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: const Card.outlined(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Move',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('453 kcal',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Move',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('30 min',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Move',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('10 hr',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Your current progress',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Row(
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
              const SizedBox(height: 16),
              const Text('Personal Recommendations',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      2, // Replace itemCount with the actual number of items
                  itemBuilder: (BuildContext context, int index) {
                    return const Expanded(
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

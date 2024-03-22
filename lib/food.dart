import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  FoodPage({super.key});

  final List<Map<String, dynamic>> recommendations = [
    {
      'image': 'assets/food.png',
      'title': 'Sticky Coconut Chicken and Rice',
      'duration': '30-40 minutes',
      'icon': Icons.timer_outlined,
      'discription':
          'This is a delicious and easy recipe that you can make in under 30 minutes. It is a great way to use up leftover rice and chicken. The coconut milk adds a nice flavor to the rice and the chicken.',
    },
    {
      'image': 'assets/run.png',
      'title': 'BellFood Run',
      'duration': 'St. Gallen, Switzerland',
      'icon': Icons.location_on_outlined,
      'discription':
          'Join us for an exhilarating run through the streets of Saint Gallen! BellFood is hosting a company-wide event where employees will lace up their sneakers and conquer a 5 km route together. It\'s a fantastic opportunity to promote health and wellness while fostering team spirit and camaraderie.',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Recent Insights',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2, // Display two cards side by side
              shrinkWrap: true, // Make GridView adapt its size to its contents
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              children: [
                Card(
                  child: Container(
                    width: double.infinity, // Make the card take full width
                    height: double.infinity, // Make the card take full height
                    child: Center(
                      child: Text('Card 1'), // Replace with your content
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: double.infinity, // Make the card take full width
                    height: double.infinity, // Make the card take full height
                    child: Center(
                      child: Text('Card 2'), // Replace with your content
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Receipts for you',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
                "We found some receipts specially for you  based on your recent nutrition habits."),
            SizedBox(height: 16),
            SizedBox(
              height: 180, // Set the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    2, // Replace itemCount with the actual number of items
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the radius as needed
                                image: DecorationImage(
                                  image: AssetImage(
                                      recommendations[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              recommendations[index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  recommendations[index]['icon'],
                                  size: 16,
                                ), // Icon
                                SizedBox(width: 4), // Spacer
                                Text(recommendations[index]['duration']),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'Featured by your co-workers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200, // Set the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    2, // Replace itemCount with the actual number of items
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the radius as needed
                                image: DecorationImage(
                                  image: AssetImage(
                                      recommendations[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              recommendations[index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  recommendations[index]['icon'],
                                  size: 16,
                                ), // Icon
                                SizedBox(width: 4), // Spacer
                                Text(recommendations[index]['duration']),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

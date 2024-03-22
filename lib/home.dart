import 'package:flutter/material.dart';
import 'package:limitless/message_bubble.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.
class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController colorController = TextEditingController();

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

  List<String> options = <String>[
    'St. Gallen, Switzerland',
    'Zurich, Switzerland',
    'Budapest, Hungary'
  ];
  String dropdownValue = 'St. Gallen, Switzerland';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                underline: Container(
                  height: 0,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                selectedItemBuilder: (BuildContext context) {
                  // This is the widget that will be shown when you select an item.
                  // Here custom text style, alignment and layout size can be applied
                  // to selected item string.
                  return options.map((String value) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dropdownValue,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList();
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hello, Milena',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage("assets/milena.png"),
                    fit: BoxFit.cover,
                    width: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileView()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: Card.outlined(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Move',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('453 kcal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey[700])),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 2, // Adjust the width as needed
                                height: 40, // Adjust the height as needed
                                color: Colors
                                    .grey, // Ensure the color contrasts with the background
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Exercise',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('30 min',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey[700])),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 2, // Adjust the width as needed
                                height: 40, // Adjust the height as needed
                                color: Colors
                                    .grey, // Ensure the color contrasts with the background
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Stand',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('10 hr',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey[700])),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MessageBubble(
                          isSender: true,
                          sender: "Bell Coach",
                          text: "How are you feeling today?"),
                      FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(60, 24)), // Adjust the size as needed
                          ),
                          child: const Text("Take Questionnaire (+10p)")),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50, // Set the radius as needed
                    backgroundColor:
                        Colors.grey[200], // Set the background color
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/maennlicher_mann.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Recommendations',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: 200, // Set the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      2, // Replace itemCount with the actual number of items
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, recommendations[index]);
                      },
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
        ),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, Map<String, dynamic> recommendation) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height:
              MediaQuery.of(context).size.height * 2, // Set height as needed

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      16.0), // Adjust the radius as needed
                  image: DecorationImage(
                    image: AssetImage(recommendation['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                recommendation['title'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/avatar3.png"),
                  ),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/avatar1.png"),
                  ),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/avatar2.png"),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                      child: Text(
                          '3 of your co-workers are already participating ')),
                ],
              ),
              SizedBox(height: 16),
              Text(
                recommendation['duration'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                recommendation['discription'],
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Spacer(),
              SizedBox(
                width: double.infinity, // Set button width to full width
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Participate'),
                ),
              ),
              SizedBox(
                width: double.infinity, // Set button width to full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:limitless/message_bubble.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.
enum CityLabel {
  stgallen('St. Gallen', 'Switzerland'),
  zurich('Zurich', 'Switzerland');

  const CityLabel(this.name, this.country);
  final String name;
  final String country;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController colorController = TextEditingController();
  CityLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownMenu<CityLabel>(
                initialSelection: CityLabel.stgallen,
                controller: colorController,
                requestFocusOnTap: true,
                onSelected: (CityLabel? city) {
                  setState(() {
                    selectedColor = city;
                  });
                },
                dropdownMenuEntries: CityLabel.values
                    .map<DropdownMenuEntry<CityLabel>>((CityLabel city) {
                  return DropdownMenuEntry<CityLabel>(
                    value: city,
                    label: '${city.name}, ${city.country}',
                  );
                }).toList(),
                enableSearch: false,
                enableFilter: false,
              ),
              const SizedBox(width: 24),
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
                      width: 40),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: const Card.outlined(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: AssetImage("assets/maennlicher_mann.png"),
                      fit: BoxFit.cover,
                      width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MessageBubble(
                          sender: "Bell Coach",
                          text: "How are you feeling today?"),
                      FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(80, 24)), // Adjust the size as needed
                          ),
                          child: const Text("Take Questionnaire")),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
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
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

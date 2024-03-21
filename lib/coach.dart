import 'package:flutter/material.dart';

List<String> messages = [
  "Hello, how are you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  "I'm good, thanks! And you?",
  // Add more messages here for testing
];

class CoachPage extends StatelessWidget {
  const CoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                test(),
              ],
            )),
        Expanded(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.white],
                stops: [
                  0.0,
                  0.1
                ], // Adjust the stops for a larger or smaller fade effect
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => ListTile(
                  title: MessageBubble(
                sender: (index % 2 == 0) ? "Me" : "Bell Coach",
                text: messages[index % (messages.length)],
                isSender: index % 2 == 0,
              )),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ask me anything...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Logic to send message
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isSender;

  const MessageBubble({
    super.key,
    required this.sender,
    required this.text,
    this.isSender = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              sender,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: isSender
                    ? const EdgeInsets.only(right: 12.0)
                    : const EdgeInsets.only(left: 12.0),
              ),
              Container(
                margin: isSender
                    ? const EdgeInsets.only(right: 12.0)
                    : const EdgeInsets.only(left: 12.0),
                padding: const EdgeInsets.all(10.0),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                decoration: BoxDecoration(
                  color: isSender ? Colors.redAccent : Colors.grey[500],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft:
                        isSender ? const Radius.circular(16) : const Radius.circular(0),
                    bottomRight:
                        isSender ? const Radius.circular(0) : const Radius.circular(16),
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final bool isSender;

  BubblePainter({required this.isSender});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.redAccent;

    Path bubbleTail = Path();
    bubbleTail.moveTo(isSender ? size.width - 12 : 12, 0);
    bubbleTail.quadraticBezierTo(
      isSender ? size.width : 0,
      0,
      isSender ? size.width : 0,
      20,
    );
    bubbleTail.quadraticBezierTo(
      isSender ? size.width : 0,
      35,
      isSender ? size.width - 12 : 12,
      35,
    );
    bubbleTail.close();

    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Widget test() {
  return const Image(
    image: AssetImage('assets/maennlicher_mann.png'),
    width: 150.0,
    height: 150.0,
  );
}

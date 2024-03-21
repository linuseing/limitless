import 'package:flutter/material.dart';

class CoachPage extends StatefulWidget {
  const CoachPage({super.key});

  @override
  _CoachPage createState() => _CoachPage();
}

class Message {
  final String text;
  final bool isSender;

  const Message({
    required this.text,
    required this.isSender,
  });
}

class _CoachPage extends State<CoachPage> {
  List<Message> messages = [
    const Message(
      text:
          "Hello! I've been struggling with managing my time effectively. Can you help me?",
      isSender: true,
    ),
    const Message(
      text:
          "Of course! Let's tackle this together. Do you have a specific goal in mind, or is it more about general time management?",
      isSender: false,
    ),
    const Message(
      text:
          "It's more about general time management. I feel like I'm always busy, but not productive.",
      isSender: true,
    ),
    const Message(
      text:
          "I see. It's important to distinguish between being busy and being productive. Let's start by identifying your top priorities. What tasks or goals are most important to you?",
      isSender: false,
    ),
    const Message(
      text:
          "My top priorities are advancing in my career, spending quality time with my family, and working on my personal health.",
      isSender: true,
    ),
    const Message(
      text:
          "Great! With those priorities in mind, let's begin by allocating specific times during your day or week dedicated to each. It’s also vital to set realistic goals and break them into manageable tasks. How do you feel about starting with a simple weekly plan?",
      isSender: false,
    ),
    const Message(
      text:
          "That sounds like a plan. I've never really planned my weeks before, always just took things as they come.",
      isSender: true,
    ),
    const Message(
      text:
          "Planning can transform the way you approach your tasks and help you achieve a balance. Let's draft a flexible schedule that includes your work, family time, personal time, and health-related activities. Remember, it's important to also schedule downtime to recharge. How does that sound?",
      isSender: false,
    ),
    const Message(
      text:
          "It sounds good. I'm a bit anxious about sticking to the plan, but I'm willing to try.",
      isSender: true,
    ),
    const Message(
      text:
          "It's normal to feel anxious, but remember, flexibility is key. Life is unpredictable, so it's okay to adjust your plan as needed. The important thing is to keep your priorities in mind and make intentional decisions about how you spend your time. I'm here to support you through this process!",
      isSender: false,
    ),
    const Message(
      text:
          "Thanks, that's reassuring. How often should I review and adjust my plan?",
      isSender: true,
    ),
    const Message(
      text:
          "I recommend reviewing your plan weekly. It’s a good practice to reflect on what worked, what didn’t, and adjust accordingly. This will help you stay flexible and responsive to your own needs. Are you ready to outline your first weekly plan?",
      isSender: false,
    ),
    const Message(
      text: "Yes, I'm ready. Where do we start?",
      isSender: true,
    ),
    const Message(
      text:
          "Let's start with your career goals. Allocate blocks of time for focused work tasks, and don’t forget to include short breaks to avoid burnout. Then, we’ll schedule quality family time, followed by personal health activities. Does this approach work for you?",
      isSender: false,
    ),
    const Message(
      text:
          "Yes, it does. I think the breaks will especially help keep me refreshed.",
      isSender: true,
    ),
    const Message(
      text:
          "Perfect! Remember, the goal is progress, not perfection. It’s about making small, consistent changes that lead to big improvements over time. How about we check in next week to see how you're doing?",
      isSender: false,
    ),
    const Message(
      text: "That sounds great. I appreciate the help and guidance.",
      isSender: true,
    ),
    const Message(
      text:
          "You're welcome! Remember, I'm here to support you. Looking forward to hearing about your progress next week. Take care and start strong!",
      isSender: false,
    ),
    const Message(
      text: "Will do. Thanks again!",
      isSender: true,
    ),
    const Message(
      text:
          "Always a pleasure! Remember, every step forward is a step towards achieving your goals. Have a productive and fulfilling week!",
      isSender: false,
    ),
    const Message(
      text: "I will. See you next week!",
      isSender: true,
    ),
    const Message(
      text: "See you next week! Keep up the great work!",
      isSender: false,
    ),
  ];

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    final String text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        messages.add(Message(text: text, isSender: true));
      });
      _controller.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

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
                stops: [0.0, 0.1],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) => ListTile(
                  title: MessageBubble(
                sender: (messages[index].isSender) ? "Me" : "Bell Coach",
                text: messages[index].text,
                isSender: messages[index].isSender,
              )),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Ask me anything...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
                color: Colors.redAccent,
              ),
            ],
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
                    bottomLeft: isSender
                        ? const Radius.circular(16)
                        : const Radius.circular(0),
                    bottomRight: isSender
                        ? const Radius.circular(0)
                        : const Radius.circular(16),
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

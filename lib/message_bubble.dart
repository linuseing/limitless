import 'package:flutter/material.dart';

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

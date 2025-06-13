import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Toggle Input Mode
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
              child: Row(
                children: [
                  const Text("Input", style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.keyboard,
                                  size: 14, color: Colors.teal),
                              SizedBox(width: 4),
                              Text("Text",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.teal)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: Row(
                            children: const [
                              Icon(Icons.mic, size: 14, color: Colors.black54),
                              SizedBox(width: 4),
                              Text("Voice",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Icon(Icons.accessibility_new,
                        color: Colors.white, size: 14),
                  ),
                ],
              ),
            ),

            // Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  // Attach Icon
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.attach_file,
                        size: 18, color: Colors.grey.shade600),
                  ),
                  const SizedBox(width: 8),

                  // Input Box + Accessibility
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Type your message...",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),

                        // Accessibility Icon
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Send Button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 11, 111, 193),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        size: 18,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

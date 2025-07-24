import 'package:flutter/material.dart';
import 'package:thera_app/theme/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plain,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(168, 213, 186, 1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/counselor.png'),
              radius: 18,
            ),
            const SizedBox(width: 10),
            const Text(
              "Dr. Amanda Brown",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text("Today", style: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 10),

          // Messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Hi Sky, how are you feeling today?",
                    isUser: false,
                    time: "2:43 PM",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text: "Hi! I feel a bit overwhelmed.",
                    isUser: true,
                    time: "2:43 PM",
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "I'm here for you. Can you tell me more?",
                    isUser: false,
                    time: "2:44 PM",
                  ),
                ),
                SizedBox(height: 5),
                TypingIndicator(),
              ],
            ),
          ),

          // Message input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: const Color(0xFFF0F0F0),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: AppColors.green),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final String time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? const Color.fromRGBO(168, 213, 186, 1)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(0),
            bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(16),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 6),
        CircleAvatar(radius: 4, backgroundColor: Colors.grey),
        SizedBox(width: 4),
        CircleAvatar(radius: 4, backgroundColor: Colors.grey),
        SizedBox(width: 4),
        CircleAvatar(radius: 4, backgroundColor: Colors.grey),
      ],
    );
  }
}

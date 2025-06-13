import 'package:brainup/presentation/pages/chat_ai/widgets/bot_massage.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/chat_input.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/sugges_action.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/typing.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/user_massage.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatAiPage extends StatelessWidget {
  const ChatAiPage({super.key});
  static const rootLocation = '/ChatAiPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BrAInUp", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Personal Learning Assistant", style: TextStyle(fontSize: 12)),
          ],
        ),
        leading: InkWell(
            onTap: () => context.go(Home.rootLocation),
            child: Icon(Icons.arrow_back)),
        actions: [
          InkWell(
              onTap: () => context.go(Home.rootLocation),
              child: Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: const [
                  BotMessage(
                    text: "Hi! How can I support your learning journey today?",
                    time: "09:25",
                  ),
                  UserMessage(
                    text: "What are the best ways to memorize vocabulary?",
                    time: "09:26",
                  ),
                  TypingIndicator(),
                ],
              ),
            ),
            SuggestedActions(),
            ChatInputBar(),
          ],
        ),
      ),
    );
  }
}

// class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const ChatAppBar({super.key});

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("BrAInUp", style: TextStyle(fontWeight: FontWeight.bold)),
//           Text("Personal Learning Assistant", style: TextStyle(fontSize: 12)),
//         ],
//       ),
//       leading: InkWell(
//           onTap: () => context.go(Home.rootLocation),
//           child: Icon(Icons.arrow_back)),
//       actions: [
//         InkWell(
//             onTap: () => context.go(Home.rootLocation),
//             child: Icon(Icons.more_vert))
//       ],
//     );
//   }
// }

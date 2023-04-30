import 'package:chat_app/models/chatUsersModel.dart';
import 'package:chat_app/widgets/conversation_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Arvind Kejrival",
        messageText: "Awesome Setup",
        imageURL: "assets/images/arvind_kejrival.jpeg",
        time: "Now"),
    ChatUsers(
        name: "Manish Sisodia",
        messageText: "That's Great",
        imageURL: "assets/images/manish_sisodia.jpeg",
        time: "Yesterday"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 90,
              title: const Text("AAP Management"),
              elevation: 0,
              backgroundColor: Colors.blue,
              leading: null,
              bottom: TabBar(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                tabs: const [
                  Tab(text: "Volunteer", height: 50),
                  Tab(text: "Party Group", height: 50),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ConversationList(
                      name: chatUsers[index].name.toString(),
                      messageText: chatUsers[index].messageText.toString(),
                      imageUrl: chatUsers[index].imageURL.toString(),
                      time: chatUsers[index].time.toString(),
                      isMessageRead: (index == 0 || index == 3) ? true : false,
                    );
                  },
                ),
                const Center(child: Text("No Groups Available")),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w600),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.alarm),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.announcement_outlined),
                  label: "Anouncements",
                ),
              ],
            ),
          );
        }));
  }
}

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topBar(context),
        ],
      ),
    );
  }
}

Widget topBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15,right: 15,left: 15),
    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
    decoration: const BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.purple,
                )),
            const Text(
              "Leaderboard",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/profile_avatar.png"),
        ),
        const Text(
          "Name",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            scoreBox(context, "Your Score", "0"),
            scoreBox(context, "Global Rank", "-")
          ],
        )
      ],
    ),
  );
}

@override
Widget scoreBox(
  BuildContext context,
  String heading,
  String text,
) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          heading,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.yellow),
        ),
      ],
    ),
  );
}

Widget scoreRow(BuildContext context,String rank,String name,String score,) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
          "#",
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        Text(
          score,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.yellow),
        ),
  ],
  );
}
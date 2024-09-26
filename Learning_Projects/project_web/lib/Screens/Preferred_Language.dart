import 'package:flutter/material.dart';
import '../Widgets/preferredlanguagecard.dart';

class PreferredLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q="),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose your Preferred",
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 88, 137),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Language",
                  style: TextStyle(
                      color: Color.fromARGB(255, 29, 88, 137),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).devicePixelRatio,
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 18 / 3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: PreferredLanguageCard(choice: choices[index]),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

class Choice {
  const Choice({required this.title, required this.language});
  final String title;
  final String language;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'English', language: " "),
  const Choice(title: 'Hindi', language: "हिन्दी"),
  const Choice(title: 'Telugu', language: "తెలుగు"),
  const Choice(title: 'Tamil', language: "தமிழ்"),
  const Choice(title: 'Kannada', language: "ಕನ್ನಡ"),
  const Choice(title: 'Bengali', language: "বাংলা"),
  const Choice(title: 'Marathi', language: "मराठी"),
  const Choice(title: 'Malayalam', language: "മലയാളം"),
];


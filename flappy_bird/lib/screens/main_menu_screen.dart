import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flappy_bird/utils/assets.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  const MainMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove(MainMenuScreen.id);
          game.resumeEngine();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(AppAssets.message),
        ),
      ),
    );
  }
}

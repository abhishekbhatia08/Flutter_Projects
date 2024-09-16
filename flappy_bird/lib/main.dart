import 'package:flame/game.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flutter/cupertino.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(game: game),
  );
}

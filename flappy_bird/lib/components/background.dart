import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/utils/assets.dart';
import 'package:flappy_bird/game/flappy_bird.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(AppAssets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}

import 'package:flame/components.dart';
import 'package:gift_grab/constants/app_assets.dart';
import 'package:gift_grab/games/gift_grab_game.dart';

class SantaComponent extends SpriteComponent with HasGameRef<GiftGrabGame> {
  final double _spriteHeight = 200;

  @override
  Future<void> onLoad() async {
    return super.onLoad();

    sprite = await gameRef.loadSprite(Assets.santaComponent);
    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.42;
    anchor = Anchor.center;
    size = gameRef.size;
  }
}

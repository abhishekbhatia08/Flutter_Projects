import 'package:flame/components.dart';
import 'package:gift_grab/constants/app_assets.dart';
import 'package:gift_grab/games/gift_grab_game.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<GiftGrabGame> {
  @override
  Future<void> onLoad() async {
    return super.onLoad();

    sprite = await gameRef.loadSprite(Assets.backgroundComponent);
    size = gameRef.size;
  }
}

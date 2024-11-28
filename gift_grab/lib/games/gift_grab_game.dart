import 'package:flame/game.dart';
import 'package:gift_grab/components/background_component.dart';

class GiftGrabGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
  }
}

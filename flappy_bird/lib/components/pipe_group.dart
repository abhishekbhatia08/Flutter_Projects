import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/config.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flappy_bird/utils/assets.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

   // Define a minimum gap between the pipes
    const double minPipeGap = 190;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;

    // Calculate the maximum spacing that respects the minimum gap
    final spacing = minPipeGap + _random.nextDouble() * ((heightMinusGround / 4) - minPipeGap);

    // Adjust the centerY calculation to ensure it's always valid
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing - minPipeGap);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacing / 2),
      )
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -50) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit == true) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  updateScore() {
    FlameAudio.play(AppAssets.point);
    gameRef.bird.score += 1;
  }
}

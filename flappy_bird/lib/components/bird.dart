import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/config.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flappy_bird/utils/assets.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(AppAssets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(AppAssets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(AppAssets.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };
    current = BirdMovement.up;

    add(CircleHitbox());
  }

  fly() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      onComplete: () => current = BirdMovement.down,
    ));
    current = BirdMovement.middle;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void gameOver() {
    game.overlays.add(GameOverScreen.id);
    gameRef.pauseEngine();
    gameRef.isHit = true;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
  }
}

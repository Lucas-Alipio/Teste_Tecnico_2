import 'dart:async';

import 'package:bonfire/bonfire.dart';

class DemonSprite {
  static Future<SpriteAnimation> get demonIdleLeft => SpriteAnimation.load(
        'enemies/demon_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 0)),
      );

  static Future<SpriteAnimation> get demonIdleRight => SpriteAnimation.load(
        'enemies/demon_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 0)),
      );

  static Future<SpriteAnimation> get demonRunLeft => SpriteAnimation.load(
        'enemies/demon_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 48)),
      );

  static Future<SpriteAnimation> get demonRunRight => SpriteAnimation.load(
        'enemies/demon_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 48)),
      );

  static Future<SpriteAnimation> get demonDieRight => SpriteAnimation.load(
        'enemies/demon_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 120)),
      );

  static Future<SpriteAnimation> get demonDieLeft => SpriteAnimation.load(
        'enemies/demon_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.15,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 120)),
      );
}

import 'package:bonfire/bonfire.dart';

import '../main.dart';

class Sword extends GameDecoration with Sensor {
  Sword(Vector2 position)
      : super.withAnimation(
          animation: SpriteAnimation.load(
            'maps/weapons_.png',
            SpriteAnimationData.sequenced(
              amount: 1,
              stepTime: 0.1,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(46, 0),
            ),
          ),
          size: Vector2(tileSize, tileSize),
          position: position,
        ) {
    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(
        size: Vector2(10, 16),
        align: Vector2(0, 0),
      ),
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is SimplePlayer) {
      boost = true;
      generateValues(
        const Duration(milliseconds: 300),
        onChange: (value) {},
      );

      removeFromParent();
    }
  }
}

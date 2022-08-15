import 'package:bonfire/bonfire.dart';

import '../main.dart';

class Mush extends GameDecoration with Sensor {
  Mush(Vector2 position)
      : super.withAnimation(
          animation: SpriteAnimation.load(
            "maps/forest_decoration.png",
            SpriteAnimationData.sequenced(
              amount: 1,
              stepTime: 0.1,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(128, 0),
            ),
          ),
          size: Vector2(tileSize, tileSize),
          position: position,
        ) {
    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(
        size: Vector2(9, 9),
        align: Vector2(0, 10),
      ),
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is SimplePlayer) {
      points++;
      generateValues(
        const Duration(milliseconds: 300),
        onChange: (value) {},
      );

      removeFromParent();
    }
  }
}

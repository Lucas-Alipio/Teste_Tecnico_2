import 'package:bonfire/bonfire.dart';
import '../main.dart';
import 'package:teste_tecnico_2/player/mhero_sprite.dart';

class Mhero extends SimplePlayer with ObjectCollision {
  Mhero()
      : super(
          position: Vector2(tileSize, tileSize),
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleLeft: MheroSprite.heroIdleLeft,
            idleRight: MheroSprite.heroIdleRight,
            runLeft: MheroSprite.heroRunLeft,
            runRight: MheroSprite.heroRunRight,
          ),
          speed: 70,
          life: 1000,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(7, 5),
            align: Vector2(4.5, 11),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Enemy) {
      if (lastDirectionHorizontal == Direction.left) {
        animation?.playOnce(MheroSprite.heroReceiveDamageLeft,
            runToTheEnd: true);
        life -= 10;
      } else {
        animation?.playOnce(MheroSprite.heroReceiveDamageLeft,
            runToTheEnd: true);
        life -= 10;
        if (life <= 0) {
          die();
        }
      }
    }

    return super.onCollision(component, active);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}

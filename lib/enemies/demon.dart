import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_2/abilities/slash_ability_sprite.dart';
import '../main.dart';
import 'package:teste_tecnico_2/enemies/demon_sprite.dart';

class DemonEnemy extends SimpleEnemy with ObjectCollision {
  DemonEnemy({required Vector2 position})
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
          speed: 50,
          animation: SimpleDirectionAnimation(
            idleLeft: DemonSprite.demonIdleLeft,
            idleRight: DemonSprite.demonIdleRight,
            runLeft: DemonSprite.demonRunLeft,
            runRight: DemonSprite.demonRunRight,
          ),
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
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(15, 15),
          animationRight: SlashAbilitySprite.right,
          animationDown: SlashAbilitySprite.down,
          animationLeft: SlashAbilitySprite.left,
          animationUp: SlashAbilitySprite.up,
          direction: lastDirection,
        );
      },
      radiusVision: tileSize * 5,
      margin: 2,
    );

    super.update(dt);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Player && boost == true) {
      if (lastDirectionHorizontal == Direction.left) {
        animation?.playOnce(DemonSprite.demonDieLeft, runToTheEnd: true);
      } else {
        animation?.playOnce(DemonSprite.demonDieRight, runToTheEnd: true);
      }
      die();
    }

    return super.onCollision(component, active);
  }
}

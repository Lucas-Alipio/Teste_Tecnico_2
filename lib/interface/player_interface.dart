import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

import 'package:teste_tecnico_2/main.dart';

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  double life = 0;
  double lifeBar = 100;
  double pAux = 0;

  late async.Timer _lifeTime;

  @override
  void initState() {
    _lifeTime = async.Timer.periodic(
        const Duration(milliseconds: 100), _verifyLifeAndPoints);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: lifeBar,
          height: 30,
          color: Colors.green,
        ),
        Text(
          'points: $pAux',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none),
        )
      ],
    );
  }

  void _verifyLifeAndPoints(async.Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = (widget.game.player?.life ?? 0);

        final percent = life / (widget.game.player?.maxLife ?? 0);
        lifeBar = 100 * percent;
      });
    }

    if (pAux != (points)) {
      setState(() {
        pAux = points;
      });
    }
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'package:flame/flame.dart';

void main() async {
  Flame.util.enableEvents();
  Flame.audio.disableLog();
  Explosion.fetch();
  var dimensions = await Flame.util.initialDimensions();
  Flame.audio.loop('music.ogg');
  var game = new MyGame(dimensions);
  runApp(game.widget);
  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapDown = (TapDownDetails evt) {
      game.input(evt.globalPosition.dx, evt.globalPosition.dy);
    });
}

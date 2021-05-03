import 'dart:math';

import 'package:flutter/material.dart';
import '../config/ColorConfig.dart';
import 'dart:developer' as DevTools;
import '../maze/maze.dart';

class MazeView extends StatelessWidget {
  final Maze _maze;
  final Point<int> _currentPosition;
  final Direction _lastDirectionMoved;
  final Set<MagicKey> _collectedKeys;
  final Set<MagicSkill> _collectedSkills;

  MazeView(this._maze, this._currentPosition, this._lastDirectionMoved,
      this._collectedKeys, this._collectedSkills);

  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          for (var row = 0; row != _maze.rows; ++row)
            Expanded(
              child: Row(
                children: [
                  for (var col = 0; col != _maze.cols; ++col)
                    Expanded(
                      child: CellView(
                          Maze.getCell(_maze, row, col),
                          _currentPosition,
                          _lastDirectionMoved,
                          _collectedKeys,
                          _collectedSkills),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

enum MagicKey {
  key1,
  key2,
  key3,
}

enum MagicSkill {
  fire_proof,
  shark_proof,
  ghost_proof,
}

class CellView extends StatelessWidget {
  final Cell cell;
  final Point currentPosition;
  final Direction lastDirectionMoved;
  final Set<MagicKey> _collectedKeys;
  final Set<MagicSkill> _collectedSkills;

  CellView(this.cell, this.currentPosition, this.lastDirectionMoved,
      this._collectedKeys, this._collectedSkills);

  @override
  Widget build(BuildContext context) {
    // print(cell);
    return Container(
      child: Padding(
          padding: EdgeInsets.all(2.0), child: Center(child: getCenterIcon())),
      decoration: BoxDecoration(
          border: Border(
            top: _getBorderSide(Direction.top),
            left: _getBorderSide(Direction.left),
            right: _getBorderSide(Direction.right),
            bottom: _getBorderSide(Direction.bottom),
          ),
          color: getCellBackgroundColor(),
          shape: BoxShape.rectangle),
    );
  }

  Widget getCenterIcon() {
    if (cell.x == currentPosition.x && cell.y == currentPosition.y) {
      // DevTools.log("getCenterIcon: $currentPosition");

      return Padding(
          padding: EdgeInsets.all(4.0),
          child: Transform.rotate(
              angle: _getAvatarRotation(),
              child: CircleAvatar(
                  backgroundColor: ColorConfig.wallColorDefault,
                  backgroundImage: AssetImage('img/footsteps.gif'))));
    }
    switch (cell.type) {
      case CellType.shark_land:
        return Padding(
            padding: EdgeInsets.all(4.0), child: Image.asset('img/shark.png'));
      case CellType.ghost_land:
        return Padding(
            padding: EdgeInsets.all(6.0), child: Image.asset('img/ghost.png'));
      case CellType.fire_land:
        return Image.asset('img/fire.webp');
      case CellType.key1:
        if (_collectedKeys.contains(MagicKey.key1)) {
          return null;
        }
        return Padding(
            padding: EdgeInsets.all(4.0), child: Image.asset('img/key1.png'));
      case CellType.key2:
        if (_collectedKeys.contains(MagicKey.key2)) {
          return null;
        }
        return Padding(
            padding: EdgeInsets.all(4.0), child: Image.asset('img/key2.png'));
      case CellType.key3:
        if (_collectedKeys.contains(MagicKey.key3)) {
          return null;
        }
        return Padding(
            padding: EdgeInsets.all(4.0), child: Image.asset('img/key3.png'));
      default:
        return null;
    }
  }

  Color getCellBackgroundColor() {
    switch (cell.type) {
      case CellType.shark_land:
        return ColorConfig.pathColorRiver;
      case CellType.ghost_land:
        return ColorConfig.pathColorNight;
      case CellType.fire_land:
        return ColorConfig.pathColorFire;
      default:
        return ColorConfig.pathColorDefault;
    }
  }

  Color getWallBackgroundColor() {
    return ColorConfig.bgColorMazeSection;
  }

  BorderSide _getBorderSide(Direction wall) => BorderSide(
      width: 3.0,
      style: cell.wallsUp[wall.index] ? BorderStyle.solid : BorderStyle.none,
      color: getWallBackgroundColor()); //ColorConfig.wallColorGrass);

  double _getAvatarRotation() {
    switch (lastDirectionMoved) {
      case Direction.top:
        return 0.0;
      case Direction.bottom:
        return 3.14;
        break;
      case Direction.left:
        return -3.14 / 2.0;
        break;
      case Direction.right:
        return 3.14 / 2.0;
        break;
      default:
        return 0.0;
    }
  }
}

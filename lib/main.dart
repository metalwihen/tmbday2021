import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/ColorConfig.dart';
import 'maze/SelectMaze.dart';
import 'maze/maze.dart';
import 'view/InstructionView.dart';
import 'view/MazeView.dart';

// part 'maze.g.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'TM BDAY 2021',
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const _startingPosition = Point<int>(0, 0);

class _HomePageState extends State<HomePage> {
  var _maze;
  var _lastMove_Direction = Direction.top;
  var _currentPosition = _startingPosition;

  var collectedKeys = Set<MagicKey>();
  var collectedSkills = Set<MagicSkill>();

  var kidSpeakMessage = "";

  final FocusNode _focusNode = FocusNode();

  Function(CellType cellType) get onRiddleCallback => (CellType cellType) {
        switch (cellType) {
          case CellType.fire_land:
            collectedSkills.add(MagicSkill.fire_proof);
            setState(() {});
            break;
          case CellType.shark_land:
            collectedSkills.add(MagicSkill.shark_proof);
            setState(() {});
            break;
          case CellType.ghost_land:
            collectedSkills.add(MagicSkill.ghost_proof);
            setState(() {});
            break;
          case CellType.key1:
            collectedKeys.add(MagicKey.key1);
            setState(() {});
            break;
          case CellType.key2:
            collectedKeys.add(MagicKey.key2);
            setState(() {});
            break;
          case CellType.key3:
            collectedKeys.add(MagicKey.key3);
            setState(() {});
            break;
          default:
            break;
        }
      };

  @override
  void initState() {
    super.initState();
    setupMaze();
    kidSpeakMessage = getKidSpeakMessage();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void setupMaze() {
    _maze = Maze.fromJson(jsonDecode(SelectMaze.mazeJson));
    // print("${Maze.toJson(_maze)}");
  }

  void _handleKeyEvent(RawKeyEvent event) {
    // print("key movement $event");
    if (event.runtimeType == RawKeyDownEvent) {
      // should run for only KeyUpEvent
      return;
    }

    if (event.physicalKey == PhysicalKeyboardKey.arrowUp) {
      updateStateOnMovement(Direction.top);
    } else if (event.physicalKey == PhysicalKeyboardKey.arrowDown) {
      updateStateOnMovement(Direction.bottom);
    } else if (event.physicalKey == PhysicalKeyboardKey.arrowLeft) {
      updateStateOnMovement(Direction.left);
    } else if (event.physicalKey == PhysicalKeyboardKey.arrowRight) {
      updateStateOnMovement(Direction.right);
    }
  }

  void updateStateOnMovement(Direction directionMoved) {
    // Prevent state updates if no new movememnt
    bool movementAllowed =
        Maze.canMove(_maze, _currentPosition, directionMoved, collectedSkills);
    // print(
    //     "can move ${directionMoved.name()} (${directionMoved.index}) from $_currentPosition? - $movementAllowed");

    setState(() {
      /** MOVEMENT **/
      if (movementAllowed) {
        Point<int> newPosition =
            Maze.move(_maze, _currentPosition, directionMoved);
        _currentPosition = newPosition;
        // print(" moved from - $_currentPosition to $newPosition");
      } else {
        // play sound later
      }

      _lastMove_Direction = directionMoved;

      kidSpeakMessage = getKidSpeakMessage();
    });
  }

  Cell getCurrentCellType() {
    return Maze.getCell(_maze, _currentPosition.y, _currentPosition.x);
  }

  CellType getNextCellType() {
    Cell currentCell = getCurrentCellType();
    Cell nextCell = Maze.adjacentCell(_maze, currentCell, _lastMove_Direction);

    if (nextCell == null ||
        !Maze.canMoveWoWall(currentCell, _lastMove_Direction)) {
      return CellType.normal_path;
    } else {
      return nextCell.type;
    }
  }

  Widget createKeyboardListenerWidget(
    Widget widget,
  ) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorConfig.bgColor,
        body: createKeyboardListenerWidget(Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: InstructionView(
                              collectedKeys,
                              collectedSkills,
                              kidSpeakMessage,
                              getCurrentCellType().type,
                              getNextCellType(),
                              onRiddleCallback))),
                  Expanded(
                    flex: 2,
                    child: Container(
                        color: ColorConfig.bgColorMazeSection,
                        child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: MazeView(
                                _maze,
                                _currentPosition,
                                _lastMove_Direction,
                                collectedKeys,
                                collectedSkills))),
                  ),
                ])))),
      );

  String getKidSpeakMessage() {
    // WINNING
    if (collectedKeys.length == 3) {
      return """Tanya! You are a life-saver. Thank you!\nI'll teleport some goodies your way. Also, Happy Birthday!""";
    }

    // before key attained
    if (getCurrentCellType().type == CellType.key3 &&
            !collectedKeys.contains(MagicKey.key3) ||
        getCurrentCellType().type == CellType.key2 &&
            !collectedKeys.contains(MagicKey.key2) ||
        getCurrentCellType().type == CellType.key1 &&
            !collectedKeys.contains(MagicKey.key1)) {
      return "You found a key. But it is bound to the ground by magic.";
    }

    // after key attained
    if (getCurrentCellType().type == CellType.key3 &&
            collectedKeys.contains(MagicKey.key3) ||
        getCurrentCellType().type == CellType.key2 &&
            collectedKeys.contains(MagicKey.key2) ||
        getCurrentCellType().type == CellType.key1 &&
            collectedKeys.contains(MagicKey.key1)) {
      return "You are amazing! You got the key that was here.";
    }

    // before skill attained
    if (getNextCellType() == CellType.fire_land &&
        !collectedSkills.contains(MagicSkill.fire_proof)) {
      return "Those are fire lands. They were once occupied by Marshmallow people. But not anymore...";
    } else if (getNextCellType() == CellType.shark_land &&
        !collectedSkills.contains(MagicSkill.shark_proof)) {
      return "That's shark land. Even deep sea hunters are scared of this place.";
    } else if (getNextCellType() == CellType.ghost_land &&
        !collectedSkills.contains(MagicSkill.ghost_proof)) {
      return "I hear voices. Is that Ghost Town. We're not allowed there.";
    }

    // once skill attained
    if (getCurrentCellType().type == CellType.shark_land &&
        collectedSkills.contains(MagicSkill.shark_proof)) {
      return "Sharks scare me. But now, those sharks are scared of you!";
    } else if (getCurrentCellType().type == CellType.fire_land &&
        collectedSkills.contains(MagicSkill.fire_proof)) {
      return "Woah! You're fire-proof now.";
    } else if (getCurrentCellType().type == CellType.ghost_land &&
        collectedSkills.contains(MagicSkill.ghost_proof)) {
      return "Ghosts are harmless when you're around...";
    }

    // BEGINNING
    return """I need help. I lost my house keys while playing in the Maze.\nHelp me find it so I can go home. \n\nBut be careful, it's dangerous out there!""";
  }
}

TextStyle getTitleTextStyle() {
  return TextStyle(fontWeight: FontWeight.bold);
}

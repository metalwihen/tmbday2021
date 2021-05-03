import 'dart:developer' as DevTools;
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import '../view/MazeView.dart';

enum Direction {
  top,
  right,
  bottom,
  left,
}

extension EnumString on Direction {
  String name() {
    return this.toString().split('.').last;
  }
}

enum CellType {
  @JsonValue("normal_path")
  normal_path,
  @JsonValue("ghost_land")
  ghost_land,
  @JsonValue("shark_land")
  shark_land,
  @JsonValue("fire_land")
  fire_land,
  @JsonValue("key1")
  key1,
  @JsonValue("key2")
  key2,
  @JsonValue("key3")
  key3
}

extension ParseToString on CellType {
  String name() {
    return this.toString().split('.').last;
  }
}

CellType enumDecode(String jsonType) {
  if (jsonType == null) return null;
  return CellType.values.where((element) => element.name() == jsonType)?.first;
}

@JsonSerializable(explicitToJson: true)
class Cell {
  final int x;
  final int y;
  var type = CellType.normal_path;
  var wallsUp = List<bool>(Direction.values.length);

  // Required for generation
  @JsonKey(ignore: true)
  var visited = false;

  Cell(this.y, this.x) {
    for (var i = 0; i != wallsUp.length; ++i) {
      wallsUp[i] = true;
    }
  }

  static Cell fromJson(Map<String, dynamic> json) {
    return Cell(
      json['y'] as int,
      json['x'] as int,
    )
      ..wallsUp = (json['wallsUp'] as List)?.map((e) => e as bool)?.toList()
      ..type = (enumDecode(json['type']) ?? CellType.normal_path);
  }

  static Map<String, dynamic> toJson(Cell instance) => <String, dynamic>{
        'x': instance.x,
        'y': instance.y,
        'wallsUp': instance.wallsUp,
      };

  @override
  String toString() {
    return "x = $x, y = $y, wallsUp = $wallsUp";
  }
}

@JsonSerializable(explicitToJson: true)
class Maze {
  final int rows;
  final int cols;
  var cells;

  Maze(this.rows, this.cols) : cells = List<Cell>(rows * cols) {
    for (var col = 0; col < cols; col++) {
      for (var row = 0; row < rows; row++) {
        cells[offset(rows, row, col)] = Cell(row, col);
      }
    }
  }

  // Translate 2D row, column pair into a 1D offset
  static int offset(int totalRows, int row, int col) => row * totalRows + col;

  static Cell getCell(Maze maze, int row, int col) =>
      row < 0 || row >= maze.rows || col < 0 || col >= maze.cols
          ? null
          : maze.cells[offset(maze.rows, row, col)];

  static Cell adjacentCell(Maze maze, Cell cellFrom, Direction wall) {
    switch (wall) {
      case Direction.top:
        return getCell(maze, cellFrom.y - 1, cellFrom.x);
      case Direction.left:
        return getCell(maze, cellFrom.y, cellFrom.x - 1);
      case Direction.bottom:
        return getCell(maze, cellFrom.y + 1, cellFrom.x);
      case Direction.right:
        return getCell(maze, cellFrom.y, cellFrom.x + 1);
      default:
        assert(false);
        return null;
    }
  }

  static bool canMove(Maze maze, Point<int> currentPosition,
      Direction moveDirection, Set<MagicSkill> skills) {
    Cell current = getCell(maze, currentPosition.y, currentPosition.x);
    Cell nextCell = Maze.adjacentCell(maze, current, moveDirection);
    // print("--- check cell $current");
    return canMoveWoWall(current, moveDirection) &&
        canMoveInMagic(nextCell.type, skills);
  }

  static bool canMoveWoWall(Cell current, Direction moveDirection) {
    return !current.wallsUp[moveDirection.index];
  }

  static bool canMoveInMagic(CellType cellType, Set<MagicSkill> skills) {
    switch (cellType) {
      case CellType.fire_land:
        return skills.contains(MagicSkill.fire_proof);
      case CellType.shark_land:
        return skills.contains(MagicSkill.shark_proof);
      case CellType.ghost_land:
        return skills.contains(MagicSkill.ghost_proof);
      default:
        return true;
    }
  }

  static Point<int> move(
      Maze maze, Point<int> currentPosition, Direction moveDirection) {
    Cell currentCell = Maze.getCell(maze, currentPosition.y, currentPosition.x);
    Cell nextCell = Maze.adjacentCell(maze, currentCell, moveDirection);
    // print("current - $currentCell");
    // print("next - $nextCell");
    // if (canMove(maze, currentPosition, moveDirection)) {
    return Point<int>(nextCell.x, nextCell.y);
    // } else {
    //   return Point<int>(currentCell.x, currentCell.y);
    // }
  }

  static Maze fromJson(Map<String, dynamic> json) {
    int rows = json['rows'];
    int cols = json['cols'];
    List<Cell> cells = List<Cell>();
    for (Map<String, dynamic> cellJson in json['cells']) {
      Cell cell = Cell.fromJson(cellJson);
      cells.add(cell);
      // print("CELL_JSON = $cellJson");
      // print("CELL_OBJ = $cell");
    }
    return Maze(rows = rows, cols = cols)..cells = cells;
  }

  static Map<String, dynamic> toJson(Maze instance) => <String, dynamic>{
        'rows': instance.rows,
        'cols': instance.cols,
        'cells': instance.cells,
      };
}

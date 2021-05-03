import 'dart:convert';
import 'dart:math';

import 'maze.dart';

class Move {
  final Cell cellFrom;
  final Cell cellTo;

  Move(this.cellFrom, this.cellTo);
}

// It only works if the rows=cols
class MazeGenerator {
  final _skippedMoves = List<Move>();
  final _rand = Random();

  // Maze Generation
  Iterable<Cell> generateStepByStep(Maze newMaze) sync* {
    // Choose cell at random starting point
    var cell = Maze.getCell(
        newMaze, _rand.nextInt(newMaze.rows), _rand.nextInt(newMaze.cols));

    while (true) {
      // Mark current cell as "visited"
      cell.visited = true;

      // Notify any interested party
      yield cell;

      // Calculate possible cells to move to; a cell is possible to move to if
      //   the cell is adjacent in the top, left, bottom or right direction,
      //   the cell is not beyond the boundary and
      //   the cell is not already visited
      var possibleCellsTo = Direction.values
          .map((w) => Maze.adjacentCell(newMaze, cell, w))
          .where((c) => c != null && !c.visited)
          .toList();
      Move nextMove;

      // If there is a possible cell to move to from the current cell
      if (possibleCellsTo.isNotEmpty) {
        //  Choose random cell to move to
        nextMove =
            Move(cell, possibleCellsTo[_rand.nextInt(possibleCellsTo.length)]);

        // Remember possible moves we skipped for future consideration
        _skippedMoves.addAll(possibleCellsTo
            .where((c) => !identical(c, nextMove.cellTo))
            .map((c) => Move(cell, c)));
      }
      // If there are no possible moves from the current cell
      // check list of skipped moves for a "to" cell not already visited.
      else {
        nextMove = _skippedMoves.firstWhere((m) => !m.cellTo.visited,
            orElse: () => null);
      }

      // If there is a move
      if (nextMove != null) {
        // Figure out the walls to knock down
        var wallFrom = Direction.values.firstWhere((w) =>
            identical(
                Maze.adjacentCell(newMaze, nextMove.cellFrom, w),
                nextMove.cellTo));
        var wallTo =
        Direction.values[(wallFrom.index + 2) % Direction.values.length];

        // Knock down wall between the cell we're moving from to the cell we're moving to
        nextMove.cellFrom.wallsUp[wallFrom.index] = false;
        nextMove.cellTo.wallsUp[wallTo.index] = false;

        // Do the move and continue
        cell = nextMove.cellTo;
      } else {
        // we're done
        break;
      }
    }
  }

  void generateMaze(Maze maze) {
    Iterator<Cell> _iterator = generateStepByStep(maze).iterator;
    while (_iterator.moveNext()) {
      print("Maze Generation @${Cell.toJson(_iterator.current)}");
    }
  }

  static void printJson(Maze maze) {
    String json = jsonEncode(maze);
    print(json);
  }
}

import 'dart:math';
import 'package:game_of_life/objects/cell.dart';
import 'package:game_of_life/utils/list_utils.dart';

class CellsService {
 final randomNumberGenerator = Random();
  List<Cell> initCellList(final int totalCells) {
    List<Cell> cellsList = []; 
    for (var i = 0; i < totalCells; i++) {
      var c = Cell(i);
      c.isAlive = randomNumberGenerator.nextBool(); 
      cellsList.add(c);
    }
    return cellsList;
  }

  List<Cell> lifeCycleIteration(final List<Cell> currentCells, final int totalColumns) {
    List<Cell> newCells = [];
    
    for (var i = 0; i < currentCells.length; i++) {
      var cell = currentCells[i];
      var livingNeighborsCount = 0;
      // top left
      var topLeftCell = ListUtils.getListItem(i - totalColumns - 1, currentCells);
      if (topLeftCell?.isAlive == true){
        livingNeighborsCount++; 
      }
      // top middle
      var topMiddleCell = ListUtils.getListItem(i - totalColumns, currentCells);
      if (topMiddleCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      // top right
      var topRightCell = ListUtils.getListItem(i - totalColumns + 1, currentCells);
      if (topRightCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      // left 
      var leftCell = ListUtils.getListItem(i - 1, currentCells);
      if (leftCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      // right 
      var rightCell = ListUtils.getListItem(i + 1, currentCells);
      if (rightCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      // bottom left
      var bottomLeftCell = ListUtils.getListItem(i + totalColumns - 1, currentCells);
      if (bottomLeftCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      // bottom middle
      var bottomMiddleCell = ListUtils.getListItem(i + totalColumns, currentCells);
      if (bottomMiddleCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      // bottom right
      var bottomRightCell = ListUtils.getListItem(i + totalColumns + 1, currentCells);
      if (bottomRightCell?.isAlive == true) {
        livingNeighborsCount++;
      }
      
      Cell newCell = Cell(i);
      bool fromLiveToLive = cell.isAlive && (livingNeighborsCount == 2 || livingNeighborsCount == 3);
      bool fromDeadToLive = !cell.isAlive && livingNeighborsCount == 3;

      if (fromLiveToLive || fromDeadToLive) {
        newCell.isAlive = true;
      }
      newCells.add(newCell);
    }
    return newCells;
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_of_life/objects/cell.dart';
import 'package:game_of_life/services/cells_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game of Life',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Game of Life: First attempt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // constants
  final double cellSize = 10.0;
  final int totalRows = 315;
  final int totalColumns = 315;
  int totalCells = 0;

  // state
  List<Cell> cells = [];

  // services
  CellsService cellsService = CellsService();
  _MyHomePageState() {
    totalCells = totalRows * totalColumns;
    cells = cellsService.initCellList(totalCells);

    Timer.periodic(new Duration(milliseconds: 400), (timer) {
      _handleInterval();
    });
  }
  void _handleInterval() {
    var newCells = cellsService.lifeCycleIteration(cells, totalColumns);
    setState(() {
      cells = newCells;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: totalColumns * 10.0,
          child: Wrap(
            children: cells
                .map((c) => Container(
                      color: c.isAlive ? Colors.green : Colors.grey,
                      height: cellSize,
                      width: cellSize,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

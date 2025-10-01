import 'package:flutter/material.dart';


class ErenPuzzleScreen extends StatefulWidget {
  const ErenPuzzleScreen({super.key});

  @override
  State<ErenPuzzleScreen> createState() => _ErenPuzzleScreenState();
}

final String pieceZero = 'zero';
final String pieceOne = 'one';
final String pieceTwo = 'two';
final String pieceThree = 'three';

class _ErenPuzzleScreenState extends State<ErenPuzzleScreen> {
  bool isDropped = false;
  bool _isPieceZeroDropped = false;
  bool _isPieceOneDropped = false;
  bool _isPieceTwoDropped = false;
  bool _isPieceThreeDropped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        floatingActionButton: FloatingActionButton(

          backgroundColor: Colors.deepPurple[300],
          onPressed: () {
            setState(() {
              isDropped = false;
              _isPieceZeroDropped = false;
              _isPieceOneDropped = false;
              _isPieceTwoDropped = false;
              _isPieceThreeDropped = false;
            });
          },
          child: Icon(Icons.refresh,color: Colors.white,),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 20),
              Center(
                child: Container(
                  height: 320.0,
                  width: 320.0,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: DragTarget<String>(
                          builder:
                              (
                                BuildContext context,
                                List<dynamic> candidateData,
                                List<dynamic> rejectedData,
                              ) {
                                print(
                                  "Building DragTarget Zero, _isPieceZeroDropped: $_isPieceZeroDropped",
                                );
                                return Container(
                                  height: 160,
                                  width: 160,
                                  child: Image.asset(
                                    _isPieceZeroDropped
                                        ? 'assets/puzzle_images/piece_0.png'
                                        : 'assets/puzzle_images/piece_0opy.png',
                                  ),
                                );
                              },
                          onWillAcceptWithDetails: (details) {
                            print(
                              "onWillAccept pieceZero: data is ${details.data}",
                            );
                            return details.data == pieceZero;
                          },
                          onAcceptWithDetails: (details) {
                            setState(() {
                              _isPieceZeroDropped = true;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: DragTarget<String>(
                          builder:
                              (
                                BuildContext context,
                                List<dynamic> candidateData,
                                List<dynamic> rejectedData,
                              ) {
                                return Container(
                                  height: 160,
                                  width: 160,
                                  child: Image.asset(
                                    _isPieceOneDropped
                                        ? 'assets/puzzle_images/piece_1.png'
                                        : 'assets/puzzle_images/piece_1opy.png',
                                  ),
                                );
                              },
                          onWillAcceptWithDetails: (details) {
                            return details.data == pieceOne;
                          },
                          onAcceptWithDetails: (details) {
                            setState(() {
                              _isPieceOneDropped = true;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: DragTarget<String>(
                          builder:
                              (
                                BuildContext context,
                                List<dynamic> candidateData,
                                List<dynamic> rejectedData,
                              ) {
                                return Container(
                                  height: 160,
                                  width: 160,
                                  child: Image.asset(
                                    _isPieceTwoDropped
                                        ? 'assets/puzzle_images/piece_2.png'
                                        : 'assets/puzzle_images/piece_2opy.png',
                                  ),
                                );
                              },
                          onWillAcceptWithDetails: (details) {
                            print(
                              'onWillAccept: ${details.data}, expected: $pieceZero',
                            );
                            return details.data == pieceTwo;
                          },
                          onAcceptWithDetails: (details) {
                            onAcceptWithDetails:
                            print('onAccept: ${details.data}');
                            setState(() {
                              _isPieceTwoDropped = true;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: DragTarget<String>(
                          builder:
                              (
                                BuildContext context,
                                List<dynamic> candidateData,
                                List<dynamic> rejectedData,
                              ) {
                                return Container(
                                  decoration: BoxDecoration(),
                                  height: 160,
                                  width: 160,
                                  child: Image.asset(
                                    _isPieceThreeDropped
                                        ? 'assets/puzzle_images/piece_3.png'
                                        : 'assets/puzzle_images/piece_3opy.png',
                                  ),
                                );
                              },
                          onWillAcceptWithDetails: (details) {
                            return details.data == pieceThree;
                          },
                          onAcceptWithDetails: (details) {
                            setState(() {
                              _isPieceThreeDropped = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              Divider(thickness: 5, color: Colors.black),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Visibility(
                        visible: !_isPieceZeroDropped,
                        child: LongPressDraggable(
                          data: pieceZero,
                          feedback: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_0.png',
                              ),
                            ),
                          ),
                          childWhenDragging: Container(),
                          child: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_0.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: !_isPieceOneDropped,
                        child: LongPressDraggable(
                          data: pieceOne,
                          feedback: Container(
                            color: Colors.black,
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_1.png',
                              ),
                            ),
                          ),
                          childWhenDragging: Container(),
                          child: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_1.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: !_isPieceTwoDropped,
                        child: LongPressDraggable(
                          data: pieceTwo,
                          feedback: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_2.png',
                              ),
                            ),
                          ),
                          childWhenDragging: Container(),
                          child: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_2.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: !_isPieceThreeDropped,
                        child: LongPressDraggable(
                          data: pieceThree,
                          feedback: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_3.png',
                              ),
                            ),
                          ),
                          childWhenDragging: Container(),
                          child: Container(
                            height: 160.0,
                            width: 160.0,
                            child: Center(
                              child: Image.asset(
                                'assets/puzzle_images/piece_3.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/widgets.dart';
//
// List<Widget>buildPuzzlePieces(){
//   List<Widget>stackChildren=[];
//   for(int row=0;row<3;row++){
//     for(int col=0;col>3;col++){
//       stackChildren.add(
//         Positioned(
//             top: row*100,
//             left: col*100,
//             child: DragTarget<String>(
//               builder: (
//                   context,
//                   List<dynamic> candidateData,
//                   List<dynamic> rejectedData
//                   ) {
//                 return Container(
//                   height:row* 160,
//                   width:col* 200,
//                   child: Image.asset('assets/puzzle_images/piece_${row*3+col+1}.png'),
//                 );
//               },
//
//             ),
//             // Image.asset('assets/puzzle_images/piece_${row*3+col+1}.png'),
//
//         ),
//       );
//     }
//   }
//   return stackChildren;
// }
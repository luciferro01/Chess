import 'package:flutter/material.dart';

import '../helpers/alternate_color.dart';
import '../../models/chess_piece_model.dart';

class ChessBlock extends StatelessWidget {
  final int index;
  final bool isSelected;
  final ChessPiece? piece;
  final bool isValidMoves;
  ChessBlock({
    required this.isValidMoves,
    required this.isSelected,
    required this.piece,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color? selectedColor;
    if (isSelected) {
      selectedColor = Colors.green;
    } else if (isValidMoves) {
      selectedColor = Colors.green[200];
    } else {
      selectedColor =
          (alternateColor(index) ? Colors.grey[400] : Colors.grey[600])!;
    }
    return Container(
      alignment: Alignment.center,
      color: selectedColor,
      child: piece != null
          ? Image.asset(
              cacheHeight: 36,
              piece!.image,
              color: piece!.isWhite ? Colors.white : Colors.black,
            )
          : null,
    );
  }
}

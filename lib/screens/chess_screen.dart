import 'package:chess/utils/helpers/is_in_board.dart';
import 'package:flutter/material.dart';

import '../utils/helpers/initialize_board.dart';
import '../utils/widgets/chess_block.dart';
import '../models/chess_piece_model.dart';

class ChessScreen extends StatefulWidget {
  const ChessScreen({super.key});

  @override
  State<ChessScreen> createState() => _ChessScreenState();
}

class _ChessScreenState extends State<ChessScreen> {
  late List<List<ChessPiece?>> board;
  @override
  void initState() {
    board = initializeBoard();
    super.initState();
  }

  int selectedRow = -1;
  int selectedCol = -1;
  ChessPiece? selectedPiece;

  List<List<int>> validMoves = [];

  //Selected Piece
  void pieceSelected(int row, int col) {
    if (board[row][col] != null) {
      setState(() {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
        validMoves = calculateValidMoves(row, col, selectedPiece);
      });
    }
  }

  calculateValidMoves(int row, int col, ChessPiece? piece) {
    List<List<int>> candidateMoves = [];

    int direction = piece!.isWhite ? -1 : 1;

    switch (piece.type) {
      case ChessPieceType.pawn:
        //Starting Position for a pawn piece
        if (isInBoard(row + direction, col) &&
            board[row + direction][col] == null) {
          candidateMoves.add([row + direction, col]);
        }

        //If no other piece is present in the row
        if ((row == 1 && piece.isWhite) || (row == 6 && !piece.isWhite)) {
          if (isInBoard(row + 2, col) &&
              board[row + 2 * direction][col] == null &&
              board[row + direction][col] == null) {
            candidateMoves.add([row + 2 * direction, col]);
          }

          //Kill Diagonally for a pawn piece
          if (isInBoard(row + direction, col - 1)) {
            candidateMoves.add([row + direction, col - 1]);
          }
          if (isInBoard(row + direction, col - 1)) {
            candidateMoves.add([row + direction, col - 1]);
          }
        }
        break;
      case ChessPieceType.bishop:
        break;
      case ChessPieceType.horse:
        break;
      case ChessPieceType.king:
        break;
      case ChessPieceType.queen:
        break;
      case ChessPieceType.rook:
        break;
    }
    return candidateMoves;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8 * 8,
            itemBuilder: (context, index) {
              int row = index ~/ 8;
              int col = index % 8;
              bool isSelected = selectedRow == row && selectedCol == col;
              bool isValidMove = false;
              for (var position in validMoves!) {
                if (position[0] == row && position[1] == col) {
                  isValidMove = true;
                }
              }
              return GestureDetector(
                onTap: () => pieceSelected(row, col),
                child: ChessBlock(
                  isValidMoves: isValidMove,
                  isSelected: isSelected,
                  index: index,
                  piece: board[row][col],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

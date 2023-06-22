import '../../constants/assets_path.dart';
import '../../models/chess_piece_model.dart';

initializeBoard() {
  List<List<ChessPiece?>> newBoard =
      List.generate(8, (index) => List.generate(8, (index) => null));

  //Pawns
  for (int i = 0; i < 8; i++) {
    newBoard[1][i] = const ChessPiece(
        type: ChessPieceType.pawn, isWhite: false, image: Assets.pawn);

    newBoard[6][i] = const ChessPiece(
        type: ChessPieceType.pawn, isWhite: true, image: Assets.pawn);
  }

//Rook
  newBoard[7][0] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: true, image: Assets.rook);
  newBoard[0][0] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: false, image: Assets.rook);
  newBoard[7][7] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: true, image: Assets.rook);
  newBoard[0][7] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: false, image: Assets.rook);

  //Bishop
  newBoard[7][2] = const ChessPiece(
      type: ChessPieceType.bishop, isWhite: true, image: Assets.bishop);
  newBoard[0][2] = const ChessPiece(
      type: ChessPieceType.bishop, isWhite: false, image: Assets.bishop);
  newBoard[7][5] = const ChessPiece(
      type: ChessPieceType.bishop, isWhite: true, image: Assets.bishop);
  newBoard[0][5] = const ChessPiece(
      type: ChessPieceType.bishop, isWhite: false, image: Assets.bishop);

  //Horse
  newBoard[7][1] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: true, image: Assets.horse);
  newBoard[0][1] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: false, image: Assets.horse);
  newBoard[7][6] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: true, image: Assets.horse);
  newBoard[0][6] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: false, image: Assets.horse);

  //King
  newBoard[7][3] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: true, image: Assets.king);
  newBoard[0][4] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: false, image: Assets.king);

  //Queen
  newBoard[7][4] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: true, image: Assets.queen);
  newBoard[0][3] = const ChessPiece(
      type: ChessPieceType.rook, isWhite: false, image: Assets.queen);

  return newBoard;
}

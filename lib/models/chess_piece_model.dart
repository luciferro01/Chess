enum ChessPieceType { pawn, bishop, king, queen, rook, horse }

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String image;
  const ChessPiece({
    required this.type,
    required this.isWhite,
    required this.image,
  });
}

class GetAllPostError implements Exception {
  final String message;
  final StackTrace? stack;
  GetAllPostError(this.message, [this.stack]);
}

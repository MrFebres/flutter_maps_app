class SearchResults {
  SearchResults({
    required this.cancel,
    this.manual = false,
  });

  final bool cancel;
  final bool manual;

  @override
  String toString() {
    return '{cancel: $cancel, manual: $manual}';
  }
}

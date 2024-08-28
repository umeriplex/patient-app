extension CapitalizeString on String{
  // capitalize first letter of all words
  String get cp {
    return split(' ').map((word) {
      if (word.length > 1) {
        return '${word[0].toUpperCase()}${word.substring(1)}';
      } else {
        return word.toUpperCase();
      }
    }).join(' ');
  }
}
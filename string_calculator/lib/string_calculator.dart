class StringCalculator {

  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final List<String> delimiters = [",", "\n"];

    // Handling custom delimiters
    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      final customDelimiters = parts.first.substring(2);
      delimiters.add(customDelimiters);
      numbers = parts.sublist(1).join("\n");
    }

    return 0;
  }
}
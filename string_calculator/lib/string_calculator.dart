class StringCalculator {

  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final List<String> delimiters = [",", "\n"];
    final List<int> numbersList = [];

    // Handling custom delimiters
    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      final customDelimiters = parts.first.substring(2);
      delimiters.add(customDelimiters);
      numbers = parts.sublist(1).join("\n");
    }

    // Split numbers using the delimiters
    String currentNumber = "";
    for (int i = 0; i< numbers.length;i++) {
      if (delimiters.contains(numbers[i])) {
        if (currentNumber.isNotEmpty) {
          // Generating int list of Numbers
          numbersList.add(int.parse(currentNumber));

          // Resetting current number to empty string
          currentNumber = "";
        }
      } else {
        // Updating the current number
        currentNumber += numbers[i];
      }
    }

    if (currentNumber.isNotEmpty) {
      numbersList.add(int.parse(currentNumber));
    }

    //Handling negative numbers
    final List<int> negativeNumbers = numbersList.where((n) => n < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw Exception("Negative numbers are not allowed: ${negativeNumbers.join(", ")}");
    }

    return numbersList.reduce((sum, n) => sum + n);
  }
}
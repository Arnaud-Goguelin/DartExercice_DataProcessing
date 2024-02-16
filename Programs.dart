import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('dart Programs.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  print(inputFile);
}

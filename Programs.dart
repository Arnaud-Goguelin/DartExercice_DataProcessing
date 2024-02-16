import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('dart Programs.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  // à recoder avec async / await syntaxe
  final lines = File(inputFile).readAsLinesSync();
}
/*
lines = readFile(inputFile)
durationByTag = empty tag
lines.removeFirst()
for (line in lines)
  values = lines.split(',')
  duration = values[3]
  tag = values[5]
  update(durationByTag[tag], duration)
end
printAll(durationByTag)
*/

import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('dart Programs.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  // à recoder avec async / await syntaxe pour vérifier si inputFile != null
  final lines = File(inputFile).readAsLinesSync();
  final totalDurationByTag = <String, double>{};
  // retrait de la première ligne inutile
  lines.removeAt(0);
  var totalDuration = 0.0;
  for (var line in lines) {
    final values = line.split(',');
    final durationString =
        values[3].replaceAll('"', ''); //attention à la syntaxe: ' " ', ''
    final duration = double.parse(
        durationString); //memo : double.parse() = convertion d'une string en double
    final tag = values[5].replaceAll('"', '');
    final previousTotal = totalDurationByTag[tag];
    if (previousTotal == null) {
      totalDurationByTag[tag] = duration;
    } else {
      totalDurationByTag[tag] = previousTotal + duration;
    }
    totalDuration += duration;
  }
  for (var entry in totalDurationByTag.entries) {
    final durationFormated = entry.value.toStringAsFixed(1);
    // entry.key == '' vérifie si entry.key n'existe pas (est égale un à string vide), la syntaxe !entry.key ne fonctionne pas en Dart
    final tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('$tag: ${durationFormated}h');
  }
  print('Total for all tags: ${totalDuration.toStringAsFixed(1)}h');
}

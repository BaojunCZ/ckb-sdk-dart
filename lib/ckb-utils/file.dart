import 'dart:io';

String getScriptFromFile(String path) {
  File file = File(path);
  List<String> verifyScript_lines = file.readAsLinesSync();
  String verifyScript = "";
  verifyScript_lines.forEach((line) {
    verifyScript += (line + "\n");
  });
  return verifyScript;
}

// ignore_for_file: file_names, unnecessary_this

class ResultNumber {
  const ResultNumber(
    this.id,
    this.text,
  );
  final int id;
  final String text;

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "text": this.text,
    };
  }
}

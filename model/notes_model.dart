class Note {
  String id;
  String subtitle;
  String title;
  String time;
  int image;
  bool isDon;
  String category;
  DateTime? deadline;
  Note(this.id, this.subtitle, this.time, this.image, this.title, this.isDon, {this.category = 'All', this.deadline});
}

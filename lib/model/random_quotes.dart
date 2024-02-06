import 'dart:convert';

class RandomQuotes {
  String id;
  String content;
  String author;
  List<String> tags;
  String authorSlug;
  int length;
  String dateAdded;
  String dateModified;

  RandomQuotes({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory RandomQuotes.fromJson(Map<String, dynamic> json) {
    List<String> tagsList =
        List<String>.from(json['tags'].map((tag) => tag.toString()));
    return RandomQuotes(
        id: json['_id'],
        content: json['content'],
        author: json['author'],
        tags: tagsList,
        authorSlug: json['authorSlug'],
        length: json['length'],
        dateAdded: json['dateAdded'],
        dateModified: json['dateModified']);
  }
}

import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Wiki {

  const Wiki({
    required this.published,
    required this.summary,
    required this.content,
  });

  final String published;
  final String summary;
  final String content;

  factory Wiki.fromJson(Map<String,dynamic> json) => Wiki(
    published: json['published'] as String,
    summary: json['summary'] as String,
    content: json['content'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'published': published,
    'summary': summary,
    'content': content
  };

  Wiki clone() => Wiki(
    published: published,
    summary: summary,
    content: content
  );


  Wiki copyWith({
    String? published,
    String? summary,
    String? content
  }) => Wiki(
    published: published ?? this.published,
    summary: summary ?? this.summary,
    content: content ?? this.content,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Wiki && published == other.published && summary == other.summary && content == other.content;

  @override
  int get hashCode => published.hashCode ^ summary.hashCode ^ content.hashCode;
}

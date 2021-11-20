import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Wiki {

  const Wiki({
    this.published,
    this.summary,
    this.content,
  });

  final String? published;
  final String? summary;
  final String? content;

  factory Wiki.fromJson(Map<String,dynamic> json) => Wiki(
    published: json['published'] != null ? json['published'] as String : null,
    summary: json['summary'] != null ? json['summary'] as String : null,
    content: json['content'] != null ? json['content'] as String : null
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
    Optional<String?>? published,
    Optional<String?>? summary,
    Optional<String?>? content
  }) => Wiki(
    published: checkOptional(published, this.published),
    summary: checkOptional(summary, this.summary),
    content: checkOptional(content, this.content),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Wiki && published == other.published && summary == other.summary && content == other.content;

  @override
  int get hashCode => published.hashCode ^ summary.hashCode ^ content.hashCode;
}

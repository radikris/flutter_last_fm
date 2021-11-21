import 'package:flutter/foundation.dart';
import 'index.dart';

import 'tag.dart';

@immutable
class Toptags {
  const Toptags({
    required this.tag,
    required this.text,
  });

  final Tag tag;
  final String text;

  factory Toptags.fromJson(Map<String, dynamic> json) =>
      Toptags(tag: Tag.fromJson(json['tag'] as Map<String, dynamic>), text: json['#text'] as String);

  Map<String, dynamic> toJson() => {'tag': tag.toJson(), '#text': text};

  Toptags clone() => Toptags(tag: tag.clone(), text: text);

  Toptags copyWith({Tag? tag, String? text}) => Toptags(
        tag: tag ?? this.tag,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Toptags && tag == other.tag && text == other.text;

  @override
  int get hashCode => tag.hashCode ^ text.hashCode;
}

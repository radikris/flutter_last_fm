import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'tag.dart';

@immutable
class Tags {

  const Tags({
    this.tag,
  });

  final List<Tag>? tag;

  factory Tags.fromJson(Map<String,dynamic> json) => Tags(
    tag: json['tag'] != null ? (json['tag'] as List? ?? []).map((e) => Tag.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'tag': tag?.map((e) => e.toJson()).toList()
  };

  Tags clone() => Tags(
    tag: tag?.map((e) => e.clone()).toList()
  );


  Tags copyWith({
    Optional<List<Tag>?>? tag
  }) => Tags(
    tag: checkOptional(tag, this.tag),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Tags && tag == other.tag;

  @override
  int get hashCode => tag.hashCode;
}

import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Tag {

  const Tag({
    this.url,
    this.name,
  });

  final String? url;
  final String? name;

  factory Tag.fromJson(Map<String,dynamic> json) => Tag(
    url: json['url'] != null ? json['url'] as String : null,
    name: json['name'] != null ? json['name'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'url': url,
    'name': name
  };

  Tag clone() => Tag(
    url: url,
    name: name
  );


  Tag copyWith({
    Optional<String?>? url,
    Optional<String?>? name
  }) => Tag(
    url: checkOptional(url, this.url),
    name: checkOptional(name, this.name),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Tag && url == other.url && name == other.name;

  @override
  int get hashCode => url.hashCode ^ name.hashCode;
}

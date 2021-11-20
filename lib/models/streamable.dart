import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Streamable {

  const Streamable({
    this.fulltrack,
    this.text,
  });

  final String? fulltrack;
  final String? text;

  factory Streamable.fromJson(Map<String,dynamic> json) => Streamable(
    fulltrack: json['fulltrack'] != null ? json['fulltrack'] as String : null,
    text: json['#text'] != null ? json['#text'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'fulltrack': fulltrack,
    '#text': text
  };

  Streamable clone() => Streamable(
    fulltrack: fulltrack,
    text: text
  );


  Streamable copyWith({
    Optional<String?>? fulltrack,
    Optional<String?>? text
  }) => Streamable(
    fulltrack: checkOptional(fulltrack, this.fulltrack),
    text: checkOptional(text, this.text),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Streamable && fulltrack == other.fulltrack && text == other.text;

  @override
  int get hashCode => fulltrack.hashCode ^ text.hashCode;
}

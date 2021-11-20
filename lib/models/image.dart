import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class Image {
  const Image({
    this.text,
    this.size,
  });

  final String? text;
  ImageSizeEnum? get imageSizeEnum => _imageSizeEnumValues.map[size];
  final String? size;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
      text: json['#text'] != null ? json['#text'] as String : null,
      size: json['size'] != null ? json['size'] as String : null);

  Map<String, dynamic> toJson() => {'#text': text, 'size': size};

  Image clone() => Image(text: text, size: size);

  Image copyWith({Optional<String?>? text, Optional<String?>? size}) => Image(
        text: checkOptional(text, this.text),
        size: checkOptional(size, this.size),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Image && text == other.text && size == other.size;

  @override
  int get hashCode => text.hashCode ^ size.hashCode;
}

enum ImageSizeEnum { Small, Medium, Large, Extralarge, Mega, None }

extension ImageSizeEnumEx on ImageSizeEnum {
  String? get value => _imageSizeEnumValues.reverse[this];
}

final _imageSizeEnumValues = _ImageSizeEnumConverter({
  'small': ImageSizeEnum.Small,
  'medium': ImageSizeEnum.Medium,
  'large': ImageSizeEnum.Large,
  'extralarge': ImageSizeEnum.Extralarge,
  'mega': ImageSizeEnum.Mega,
  '': ImageSizeEnum.None
});

class _ImageSizeEnumConverter<String, O> {
  final Map<String, O> map;
  Map<O, String>? reverseMap;

  _ImageSizeEnumConverter(this.map);

  Map<O, String> get reverse => reverseMap ??= map.map((k, v) => MapEntry(v, k));
}

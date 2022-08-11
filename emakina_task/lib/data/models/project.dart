import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  Project({
    required this.name,
    required this.location,
    required this.description,
    required this.image,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  final String name;
  final String location;
  final String description;
  final String image;
}

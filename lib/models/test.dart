import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {

  static final table = "test";

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'year')
  int year;

  Test(this.id, this.year);

  factory Test.fromJson(Map<String, dynamic> json) =>
      _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}
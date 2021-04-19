import 'package:hive/hive.dart';
part 'ratings.g.dart';

@HiveType(typeId: 1)
class Ratings {
  @HiveField(0)
  String source;
  @HiveField(1)
  String value;

  Ratings({this.source, this.value});

  Ratings.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Source'] = this.source;
    data['Value'] = this.value;
    return data;
  }
}

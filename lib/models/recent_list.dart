import 'package:hive/hive.dart';

import 'movie.dart';
part 'recent_list.g.dart';

@HiveType(typeId: 2)
class RecentList {
  @HiveField(0)
  List<Movie> recentList;

  RecentList({this.recentList});

  RecentList.fromJson(Map<String, dynamic> json) {
    recentList = json['recentList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['recentList'] = this.recentList;

    return data;
  }
}

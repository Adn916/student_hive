import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class studentModel{
@HiveField(0)
 int? index;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String cls;

  @HiveField(4)
  final String phone;

  studentModel({required this.name, required this.age, required this.cls, required this.phone,this.index});

}
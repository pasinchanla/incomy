// Package imports:
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Money {
  @HiveField(0)
  final int total;

  @HiveField(1)
  final int money;

  Money({required this.total, required this.money});
}

import 'package:equatable/equatable.dart';

class IntRange extends Equatable {
  const IntRange(this.start, this.end);
  final int start;
  final int end;
  @override
  List<Object> get props => [start, end];
}

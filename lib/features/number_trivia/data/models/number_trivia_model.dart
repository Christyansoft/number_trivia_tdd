import 'package:meta/meta.dart';
import 'package:flutter_app_counter/features/number_trivia/domain/entities/number_trivia_entity.dart';

class NumberTriviaModel extends NumberTriviaEntity {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num) .toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number
    };
  }
}

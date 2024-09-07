import 'datum.dart';

class Test {
  bool? success;
  String? message;
  List<Datum>? data;

  Test({this.success, this.message, this.data});

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

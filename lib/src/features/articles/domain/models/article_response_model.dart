import 'package:flutter/foundation.dart';

class ApiResponse<T> {
  ApiResponse({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  late final String? status;
  late final String? copyright;
  late final int? numResults;
  late final T? results;

  static fromJson<T>(Map<dynamic, dynamic> json, Function tFromJson) {
    return ApiResponse<T>(
      status: json['status'],
      copyright: json['copyright'],
      numResults: json['num_results'],
      results: tFromJson(json['results']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiResponse) {
      return other.results is List
          ? listEquals(other.results, results as List)
          : other.results == results;
    }

    return false;
  }
}

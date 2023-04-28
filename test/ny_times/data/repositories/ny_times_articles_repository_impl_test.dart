import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/util/constant/network_constant.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/data_sources/ny_times_articles_api.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_article_response_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/repositories/ny_times_articles_repo_empl.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/repositories/ny_times_articles_repository.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/usecases/ny_times_articles_usecase.dart';

import 'mock_data/mock_ny_times_article_data.dart';
import 'ny_times_articles_repository_impl_test.mocks.dart';

@GenerateMocks([NyTimesArticlesApi])
void main() {
  NyTimesArticlesParams nyTimesParams = NyTimesArticlesParams(period: 30);
  late MockNyTimesArticlesApi mockApi;
  late NyTimesArticlesRepository nyTimesArticlesRepositoryImpl;
  setUp(() {
    mockApi = MockNyTimesArticlesApi();
    nyTimesArticlesRepositoryImpl = NyTimesArticlesRepositoryImpl(mockApi);
  });

  group("Test ny_times_articles_repository_impl", () {
    test(
        "Get All Articles Success Case With Empty Or Null Api response And Return Empty List",
        () async {
      when(mockApi.getNyTimesData(nyTimesParams))
          .thenAnswer((realInvocation) async {
        return ApiResponse(
          status: null,
          copyright: null,
          numResults: null,
          results: null,
        );
      });
      var result;
      try {
        result =
            await nyTimesArticlesRepositoryImpl.getNyTimesData(nyTimesParams);
      } catch (e) {
        result = e;
      }
      expect(result.value, mockNyTimesEmptyListData.value);
    });

    test("Get All Articles Success Case With Non Empty Or Null Api response",
        () async {
      when(mockApi.getNyTimesData(nyTimesParams))
          .thenAnswer((realInvocation) async {
        return ApiResponse(
          status: null,
          copyright: null,
          numResults: null,
          results: [
            NyTimesArticlesModel(
              id: 100000008872080,
            ),
            NyTimesArticlesModel(
              id: 100000008852162,
            ),
          ],
        );
      });
      var result;
      try {
        result =
            await nyTimesArticlesRepositoryImpl.getNyTimesData(nyTimesParams);
      } catch (e) {
        result = e;
      }
      expect(result.value, mockNyTimesListData.value);
    });
  });
}

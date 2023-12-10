import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/utils/constant/network_constant.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/abstract_article_api.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/domain/models/articles_params.dart';

import 'articles_api_test.mocks.dart';
import 'mock_data/actual_article_json.dart';
import 'mock_data/expected_article_data.dart';

@GenerateMocks([Dio])
void main() {
  // Api Params
  ArticlesParams articlesParams = ArticlesParams(period: 30);

  // Mocked Dio class
  late MockDio mockDio;

  // Our Api class that we need to test it.
  // The dependency for this class will be from the mocked Dio class not from
  // real Dio class
  late AbstractArticleApi articlesApi;
  setUp(() {
    mockDio = MockDio();
    articlesApi = ArticlesImplApi(mockDio);
  });

  RequestOptions requestOptions = RequestOptions();

  group("Test articles_impl_api", () {
    test("Get All Articles - Failed Case", () async {
      // Mockito will store the fake call to `fakeCall`, and pair the exact
      // arguments given with the response. When `fakeCall` is called outside a
      // `when` or `verify` context (a call "for real"), Mockito will respond with
      // the stored canned response, if it can match the mock method parameters.
      when(mockDio.get(getArticlePath(
        articlesParams.period,
      ))).thenAnswer((realInvocation) async {
        // Actual result
        return Response(requestOptions: requestOptions, statusCode: 400);
      });
      var result;
      try {
        result = await articlesApi.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }
      // Compare actual result with expected result
      expect(result, ServerException("Unknown Error", 400));
    });

    test("Get All Articles - Empty Case", () async {
      when(mockDio.get(getArticlePath(articlesParams.period)))
          .thenAnswer((realInvocation) async {
        // Actual result
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: actualArticlesEmptyJson,
        );
      });
      var result;
      try {
        // Compare actual result with expected result
        result = await articlesApi.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }

      expect(result, expectedArticlesEmptyListData);
    });

    test("Get All Articles - Empty Case", () async {
      when(mockDio.get(getArticlePath(articlesParams.period)))
          .thenAnswer((realInvocation) async {
        // Actual result
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: actualArticlesListJson,
        );
      });
      var result;
      try {
        // Compare actual result with expected result
        result = await articlesApi.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }

      expect(result, expectedArticlesListData);
    });
  });
}

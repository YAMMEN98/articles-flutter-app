import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/utils/constant/network_constant.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/abstract_article_api.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/domain/models/articles_params.dart';

import 'mock_data/times_article_data.dart';
import 'mock_data/times_article_json.dart';
import 'articles_api_test.mocks.dart';

@GenerateMocks([Dio, HttpClientAdapter])
void main() {
  ArticlesParams articlesParams = ArticlesParams(period: 30);
  late MockDio mockDio;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late AbstractArticleApi articlesApi;
  setUp(() {
    mockDio = MockDio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    mockDio.httpClientAdapter = mockHttpClientAdapter;
    articlesApi = ArticlesImplApi(mockDio);
  });

  RequestOptions requestOptions = RequestOptions();

  group("Test ny_times_articles_api", () {
    test("Get All Articles Failed Case", () async {
      when(mockDio.get(
        getArticlePath(
          articlesParams.period,
        ),
      )).thenAnswer((realInvocation) async {
        return Response(requestOptions: requestOptions, statusCode: 400);
      });
      var result;
      try {
        result = await articlesApi.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }
      expect(result, ServerException("Unknown Error", 400));
    });

    test("Get All Articles Empty Case", () async {
      print(requestOptions.path);

      when(mockDio.get(
        getArticlePath(
          articlesParams.period,
        ),
      )).thenAnswer((realInvocation) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: mockNyTimesEmptyJson,
        );
      });
      var result;
      try {
        result = await articlesApi.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }

      expect(result, mockNyTimesEmptyListData);
    });

    test("Get All Articles Success Case", () async {
      print(requestOptions.path);

      when(mockDio.get(
        getArticlePath(
          articlesParams.period,
        ),
      )).thenAnswer((realInvocation) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: mockNyTimesListJson,
        );
      });
      var result;
      try {
        result = await articlesApi.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }

      expect(result, mockNyTimesListData);
    });
  });
}

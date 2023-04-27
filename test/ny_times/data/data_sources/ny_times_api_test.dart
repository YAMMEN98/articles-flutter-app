import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/src/core/network/error/exceptions.dart';
import 'package:ny_times_app/src/core/util/constant/network_constant.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/data_sources/ny_times_articles_api.dart';
import 'package:ny_times_app/src/features/ny_times_articles/data/entities/ny_times_articles_model.dart';
import 'package:ny_times_app/src/features/ny_times_articles/domain/usecases/ny_times_articles_usecase.dart';

import 'mock_data/mock_ny_times_data.dart';
import 'mock_data/mock_ny_times_json.dart';
import 'ny_times_api_test.mocks.dart';

@GenerateMocks([Dio, HttpClientAdapter])
void main() {
  NyTimesArticlesParams nyTimesParams = NyTimesArticlesParams(period: 30);
  late MockDio mockDio;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late NyTimesArticlesApi nyTimesApi;
  setUp(() {
    mockDio = MockDio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    mockDio.httpClientAdapter = mockHttpClientAdapter;
    nyTimesApi = NyTimesArticlesApi(mockDio);
  });

  List<NyTimesArticlesModel> mockArticles = [
    NyTimesArticlesModel(title: "Title"),
  ];

  RequestOptions requestOptions = RequestOptions(
      path: getNyTimeArticle(nyTimesParams.period),
      method: 'GET',
      responseType: ResponseType.json);

  group("Test articles_api", () {
    test("Get All Articles Failed Case", () async {
      print(requestOptions.path);

      when(mockDio.get(
        getNyTimeArticle(
          nyTimesParams.period,
        ),
      )).thenAnswer((realInvocation) async {
        return Response(requestOptions: requestOptions, statusCode: 400);
      });
      var result;
      try {
        result = await nyTimesApi.getNyTimesData(nyTimesParams);
      } catch (e) {
        result = e;
      }
      expect(result, ServerException("UnKnow Error", 400));
    });



    test("Get All Articles Empty Case", () async {
      print(requestOptions.path);

      when(mockDio.get(
        getNyTimeArticle(
          nyTimesParams.period,
        ),
      )).thenAnswer((realInvocation) async {
        return Response(requestOptions: requestOptions, statusCode: 200, data: mockNyTimesEmptyJson,);
      });
      var result;
      try {
        result = await nyTimesApi.getNyTimesData(nyTimesParams);
      } catch (e) {
        result = e;
      }

      expect(result, mockNyTimesEmptyListData);
    });


    test("Get All Articles Success Case", () async {
      print(requestOptions.path);

      when(mockDio.get(
        getNyTimeArticle(
          nyTimesParams.period,
        ),
      )).thenAnswer((realInvocation) async {
        return Response(requestOptions: requestOptions, statusCode: 200, data: mockNyTimesListJson,);
      });
      var result;
      try {
        result = await nyTimesApi.getNyTimesData(nyTimesParams);
      } catch (e) {
        result = e;
      }

      expect(result, mockNyTimesListData);
    });
  });
}

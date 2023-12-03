import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/data/repositories/articles_repo_impl.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_response_model.dart';
import 'package:ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

import 'mock_data/mock_article_data.dart';
import 'articles_repository_impl_test.mocks.dart';

@GenerateMocks([ArticlesImplApi])
void main() {
  ArticlesParams nyTimesParams = ArticlesParams(period: 30);
  late MockArticlesImplApi mockApi;
  late AbstractArticlesRepository articlesRepositoryImpl;
  setUp(() {
    mockApi = MockArticlesImplApi();
    articlesRepositoryImpl = ArticlesRepositoryImpl(mockApi);
  });

  group("Test ny_times_articles_repository_impl", () {
    test(
        "Get All Articles Success Case With Empty Or Null Api response And Return Empty List",
        () async {
      when(mockApi.getArticles(nyTimesParams))
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
        result = await articlesRepositoryImpl.getArticles(nyTimesParams);
      } catch (e) {
        result = e;
      }
      expect(result.value, mockNyTimesEmptyListData.value);
    });

    test("Get All Articles Success Case With Non Empty Or Null Api response",
        () async {
      when(mockApi.getArticles(nyTimesParams))
          .thenAnswer((realInvocation) async {
        return ApiResponse(
          status: null,
          copyright: null,
          numResults: null,
          results: [
            ArticleModel(
              id: 100000008872080,
            ),
            ArticleModel(
              id: 100000008852162,
            ),
          ],
        );
      });
      var result;
      try {
        result = await articlesRepositoryImpl.getArticles(nyTimesParams);
      } catch (e) {
        result = e;
      }
      expect(result.value, mockNyTimesListData.value);
    });
  });
}

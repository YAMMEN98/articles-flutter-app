import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/src/features/articles/data/data_sources/remote/articles_impl_api.dart';
import 'package:ny_times_app/src/features/articles/data/repositories/articles_repo_impl.dart';
import 'package:ny_times_app/src/features/articles/domain/models/articles_params.dart';
import 'package:ny_times_app/src/features/articles/domain/repositories/abstract_articles_repository.dart';

import 'articles_repository_impl_test.mocks.dart';
import 'mock_data/actual_articles_data.dart';
import 'mock_data/expected_articles_data.dart';

@GenerateMocks([ArticlesImplApi])
void main() {
  // Api Params
  ArticlesParams articlesParams = ArticlesParams(period: 30);

  // Mocked ArticlesImplApi class
  late MockArticlesImplApi mockApi;

  // Our Repository class that we need to test it.
  // The dependency for this class will get from the mocked ArticlesImplApi class not from
  // real ArticlesImplApi class
  late AbstractArticlesRepository articlesRepositoryImpl;
  setUp(() {
    mockApi = MockArticlesImplApi();
    articlesRepositoryImpl = ArticlesRepositoryImpl(mockApi);
  });

  group("Test articles_rep_impl", () {
    test("Get All Articles - Failed Case, Empty Or Null Api response",
        () async {
      when(mockApi.getArticles(articlesParams))
          .thenAnswer((realInvocation) async {
        return actualArticlesFailedOrEmptyListData;
      });
      var result;
      try {
        result = await articlesRepositoryImpl.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }
      expect(result.value, expectedArticlesEmptyListData.value);
    });

    test("Get All Articles - Success Case", () async {
      when(mockApi.getArticles(articlesParams))
          .thenAnswer((realInvocation) async {
        return actualArticlesListData;
      });
      var result;
      try {
        result = await articlesRepositoryImpl.getArticles(articlesParams);
      } catch (e) {
        result = e;
      }
      expect(result.value, expectedArticlesListData.value);
    });
  });
}

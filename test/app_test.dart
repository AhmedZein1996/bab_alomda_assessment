import 'package:bab_alomda_assessment/core/helper/enums/enums.dart';
import 'package:bab_alomda_assessment/core/network/failure.dart';
import 'package:bab_alomda_assessment/features/stories/data/datasources/new_york_times_stories_datasource.dart';
import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:bab_alomda_assessment/features/stories/data/repositories/new_york_times_stories_repository.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewYorkTimesStoriesRepository extends Mock
    implements NewYorkTimesStoriesRepository {}

class MockNewYorkTimesStoriesDatasource extends Mock
    implements BaseNewYorkTimesStoriesDatasource {}

void main() {
  late StoryCubit sut;
  late MockNewYorkTimesStoriesDatasource mockNewYorkTimesStoriesDatasource;
  late MockNewYorkTimesStoriesRepository mockNewYorkTimesStoriesRepository;
  setUp(() {
    mockNewYorkTimesStoriesDatasource = MockNewYorkTimesStoriesDatasource();
    mockNewYorkTimesStoriesRepository = MockNewYorkTimesStoriesRepository();
    sut = StoryCubit(mockNewYorkTimesStoriesRepository);
  });
  final List<StoryModel> testStories = [
    StoryModel(
        'section 1', 'title 1', 'description 1', 'articleUrl 1', 'author 1', [
      Media(imageUrl: 'imageUrl 1', format: 'format 1'),
    ]),
    StoryModel(
        'section 2', 'title 2', 'description 2', 'articleUrl 2', 'author 2', [
      Media(imageUrl: 'imageUrl 2', format: 'format 2'),
    ]),
    StoryModel(
        'section 3', 'title 3', 'description 3', 'articleUrl 3', 'author 3', [
      Media(imageUrl: 'imageUrl 3', format: 'format 3'),
    ]),
  ];
  void arrangeNewYorkTimesStoriesRepositoryReturns3Stories() {
    when(() => mockNewYorkTimesStoriesRepository.getTopStories())
        .thenAnswer((_) async => Right(testStories));
  }

  test(
    'initial values are correct',
    () {
      expect(sut.viewStories, []);
      expect(sut.searchedStories, []);
      expect(sut.searchController.text, '');
      expect(sut.inSearchMode, false);
      expect(sut.state.runtimeType, StoryInitialState);
    },
  );

  // Get Top Stories And Filter Stories Test

  group('getStories', () {
    test(
      'gets top stories using NewYorkTimesStoriesRepository',
      () async {
        arrangeNewYorkTimesStoriesRepositoryReturns3Stories();
        await sut.getTopStories();
        verify(() => mockNewYorkTimesStoriesRepository.getTopStories())
            .called(1);
        expect(sut.viewStories.length, 3);
      },
    );

    test(
      'filtering by section updates displayed stories',
      () async {
        when(() => mockNewYorkTimesStoriesRepository
                .getFilterStories(SectionFilter.sports.value))
            .thenAnswer((_) async => Right(testStories));
        await sut.getFilterStories(SectionFilter.sports.value);
        verify(() => mockNewYorkTimesStoriesRepository
            .getFilterStories(SectionFilter.sports.value)).called(1);
        expect(sut.viewStories.length, 3);
      },
    );

    test(
      """"indicate loading of data,
     sets stories to the ones from the newYork times stories,
     indicates that data is not being loaded anymore""",
      () async {
        arrangeNewYorkTimesStoriesRepositoryReturns3Stories();
        final future = sut.getTopStories();
        expect(sut.state.runtimeType, StoryLoadingState);
        await future;
        expect(sut.viewStories, testStories);
        expect(sut.state.runtimeType, StorySuccessState);
      },
    );
  });

// Search Functionality Test

  group('Search Functionality:', () {
    setUp(() {
      arrangeNewYorkTimesStoriesRepositoryReturns3Stories();
      sut.getTopStories();
    });

    test(
      'search by title filters stories correctly',
      () async {
        sut.searchController.text = 'title 1';
        sut.searchStories();

        expect(sut.searchedStories.length, 1);
        expect(sut.searchedStories[0].title, 'title 1');
        expect(sut.inSearchMode, true);
        expect(sut.state.runtimeType, StartSearchState);
      },
    );

    test(
      'search by author name filters stories correctly',
      () async {
        sut.searchController.text = 'author 2';
        sut.searchStories();

        expect(sut.searchedStories.length, 1);
        expect(sut.searchedStories[0].author, 'author 2');
        expect(sut.inSearchMode, true);
        expect(sut.state.runtimeType, StartSearchState);
      },
    );

    test(
      'search with empty query stop searching',
      () async {
        sut.searchController.text = '';
        sut.searchStories();

        expect(sut.searchedStories.length, 0);
        expect(sut.inSearchMode, false);
        expect(sut.searchFocusNode.hasFocus, false);
        expect(sut.state.runtimeType, FinishSearchState);
      },
    );
  });

  // Error Handler Test

  test(
    'emits error state when API request fails',
    () async {
      when(() => mockNewYorkTimesStoriesRepository.getTopStories()).thenAnswer(
          (_) async => Left(Failure(500, 'Failed to fetch stories')));

      await sut.getTopStories();

      expect(sut.state.runtimeType, StoryErrorState);
    },
  );
}

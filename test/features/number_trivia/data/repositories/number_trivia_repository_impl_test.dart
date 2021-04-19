
import 'package:flutter_app_counter/core/platform/network_info.dart';
import 'package:flutter_app_counter/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_app_counter/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_app_counter/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_app_counter/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_app_counter/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getConcreteNumberTrivia', (){

    final tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel(text: 'test trivia', number: tNumber);
    final NumberTriviaEntity tNumberTrivia = tNumberTriviaModel;

    test('should check if the device is online', (){

      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      //act
      repository.getConcreteNumberTrivia(tNumber);

      //assert
      verify(mockNetworkInfo.isConnected);

    });

    group('device is online', (){

      setUp((){
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is sucessfull', (){

        //arrange
        when(mockRemoteDataSource.getConcreteNumberTrivia(any))
            .thenAnswer((_) async => tNumberTriviaModel);

        //act
        final result = await repository.getConcreteNumberTrivia(tNumber);




      });

    });

    group('device is offline', (){

      setUp((){
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

    });

  });



}

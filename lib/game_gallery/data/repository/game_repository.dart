import 'package:dartz/dartz.dart';
import 'package:portofolio_flutter/game_gallery/data/model/genre.dart';
import 'package:portofolio_flutter/game_gallery/data/remote_data_source/remote_data_source.dart';

abstract class IGameRepository{
  Future<Either<Exception,Genre>> getGenres();
}

class GameRepository implements IGameRepository{

  final IRemoteDataSource _iRemoteDataSource;

  GameRepository(this._iRemoteDataSource);

  @override
  Future<Either<Exception, Genre>> getGenres() async {
    return await _iRemoteDataSource.getGenres();
  }
}
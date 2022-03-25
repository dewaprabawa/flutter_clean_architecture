import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:portofolio_flutter/game_gallery/data/exceptions/exceptions.dart';
import 'package:portofolio_flutter/game_gallery/data/model/genre.dart';
import 'package:portofolio_flutter/game_gallery/data/remote_data_source/request_service.dart';

abstract class IRemoteDataSource {
  Future<Either<Exception, Genre>> getGenres();
}

class RemoteDataSource implements IRemoteDataSource {
  final RequestMethod _requestMethod;

  RemoteDataSource(this._requestMethod);

  @override
  Future<Either<Exception, Genre>> getGenres() async {
    try {
      final data = await _requestMethod.call(
          url: "https://api.rawg.io/api/genres", requestType: RequestType.get);
      return Right(genreFromJson(data.body));
    } on HTTPRequestException {
      return Left(Exception(["HTTPRequestException"]));
    } on OTHERRequestException {
      return Left(Exception(["OTHERRequestException"]));
    }
  }
}

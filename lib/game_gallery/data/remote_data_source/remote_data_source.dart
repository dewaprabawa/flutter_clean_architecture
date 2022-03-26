import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:portofolio_flutter/game_gallery/data/exceptions/exceptions.dart';
import 'package:portofolio_flutter/game_gallery/data/model/genre.dart';
import 'package:portofolio_flutter/game_gallery/data/remote_data_source/request_service.dart';

abstract class IRemoteDataSource {
  Future<Either<Exception, List<Genre>>> getGenres();
  Future<Either<Exception, Game>> getGames({GetQueryParams? queryParam});
}

class RemoteDataSource implements IRemoteDataSource {
  final RequestMethod _requestMethod;

  RemoteDataSource(this._requestMethod);

  @override
  Future<Either<Exception, List<Genre>>> getGenres() async {
    try {
      final data = await _requestMethod.call(
          url: "https://api.rawg.io/api/genres", requestType: RequestType.get);
      return Right(genreFromJson(data.body));
    } on HTTPRequestException {
      return Left(Exception(["HTTPRequestException"]));
    } on OTHERRequestException {
      return Left(Exception(["OTHERRequestException"]));
    } on NOInternetException {
       return Left(Exception(["NOInternetException"]));
    }
  }

  @override
  Future<Either<Exception, Game>> getGames({GetQueryParams? queryParam}) async {
   try{
     final data = await _requestMethod.call(url: "https://api.rawg.io/api/games", requestType: RequestType.get, headers: queryParam?.getParams());
     return Right(Game.fromJson(jsonDecode(data.body)));
   }on HTTPRequestException {
      return Left(Exception(["HTTPRequestException"]));
    } on OTHERRequestException {
      return Left(Exception(["OTHERRequestException"]));
    } on NOInternetException {
       return Left(Exception(["NOInternetException"]));
    }
  }
}


class GetQueryParams{
  
  GetQueryParams({this.page, this.search, this.genres});
  
  final String? page;
  final String? search;
  final String? genres;
  
  Map<String, String> getParams(){
   Map<String, String> map = {};
   if(page != null){
     map["page"] = page!;
   }
   if(search != null){
     map["search"] = search!;
   }
   if(genres != null){
     map["genres"] = genres!;
   }
   return map;
  }

}
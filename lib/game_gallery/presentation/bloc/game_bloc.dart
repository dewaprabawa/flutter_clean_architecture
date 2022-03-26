import 'dart:developer';

import 'package:portofolio_flutter/game_gallery/data/model/genre.dart';
import 'package:portofolio_flutter/game_gallery/data/repository/game_repository.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/model/game.dart';

class GameBloc{

  final IGameRepository _gameRepository;
  GameBloc(this._gameRepository){
    _stateStatus.sink.add(StateStatus.initial);
  }
  
  final _stateStatus = PublishSubject<StateStatus>();
  final _gamesFetcher = PublishSubject<List<Genre>>();
  Stream<List<Genre>> get allGames{
    return _gamesFetcher.stream;
  }
  
  getGenres() async {
    _stateStatus.sink.add(StateStatus.loading);
   final result = await _gameRepository.getGenres();
   result.fold((l){
     _gamesFetcher.sink.addError(l);
     _stateStatus.sink.add(StateStatus.failure); 
   }, (r){
      log(r.toString());
     _gamesFetcher.sink.add(r);
     _stateStatus.sink.add(StateStatus.loaded);
   });
  } 
  
  dispose(){
    _gamesFetcher.close();
    _stateStatus.close();
  }
}

enum StateStatus{
  initial,
  loading,
  loaded,
  failure
}
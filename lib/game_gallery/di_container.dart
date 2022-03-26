import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:portofolio_flutter/game_gallery/data/remote_data_source/remote_data_source.dart';
import 'package:portofolio_flutter/game_gallery/data/remote_data_source/request_service.dart';
import 'package:portofolio_flutter/game_gallery/data/repository/game_repository.dart';
import 'package:portofolio_flutter/game_gallery/presentation/bloc/game_bloc.dart';

final sl = GetIt.instance;
Future<void> initInjection() async {
   sl.registerLazySingleton<http.Client>(() => http.Client());
   sl.registerLazySingleton<RequestMethod>(() => RequestService(client: sl()));
   sl.registerLazySingleton<IRemoteDataSource>(() => RemoteDataSource(sl()));
   sl.registerLazySingleton<IGameRepository>(() => GameRepository(sl()));
   sl.registerFactory<GameBloc>(() => GameBloc(sl()));
}
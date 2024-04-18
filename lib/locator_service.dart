import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:makalam_homework/core/platform/network_info.dart';
import 'package:makalam_homework/feature/data/datasources/page_local_data_source.dart';
import 'package:makalam_homework/feature/data/datasources/page_remote_data_source.dart';
import 'package:makalam_homework/feature/data/repositories/artical_repository_impl.dart';
import 'package:makalam_homework/feature/data/repositories/user_repository_impl.dart';
import 'package:makalam_homework/feature/domain/repositories/artical_repository.dart';
import 'package:makalam_homework/feature/domain/repositories/user_repository.dart';
import 'package:makalam_homework/feature/domain/usecases/get_all_articles.dart';
import 'package:makalam_homework/feature/domain/usecases/login.dart';
import 'package:makalam_homework/feature/presentation/bloc/page_load_bloc/page_load_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc / Cubit
  sl.registerFactory(() => PageLoadBloc(getAllArticles: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetAllArticles(sl()));
  sl.registerLazySingleton(() => Login(sl()));

  // Repositories
  sl.registerLazySingleton<ArticalRepository>(
    () => ArticalRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PageRemoteDataSource>(
    () => PageRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<PageLocalDataSource>(
    () => PageLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}

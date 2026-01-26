import 'dart:io';

import 'package:erasica/services/app/app_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {
  @Named('photosTable')
  String get photosTable => 'photos';
  @preResolve
  Future<Database> provideDatabase(AppDatabase appDatabase) =>
      appDatabase.init();
  @preResolve
  Future<Directory> provideDirectory(AppService appService) async {
    await appService.getApplicationDirectory();
    return appService.applicationDirectory;
  }
}

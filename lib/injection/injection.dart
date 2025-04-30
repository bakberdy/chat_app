import "package:get_it/get_it.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:injectable/injectable.dart";
import "package:supabase_flutter/supabase_flutter.dart";

import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',  
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => sl.init();

@module
abstract class AppModule {
  @singleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @singleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
}

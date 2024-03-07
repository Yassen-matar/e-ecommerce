import 'package:get_it/get_it.dart';

import '../../features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import '../../features/auth/sign_in/data/repos/sign_in_repos._imp.dart';
import '../../features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import '../../features/auth/sign_up/data/repos/signup_repos.dart';

final locator = GetIt.instance;
void setupServiceLocator() {
  locator.registerSingleton<SignUpRepoImpl>(
      SignUpRepoImpl(SignUpRomteDataSourceImpl()));
  locator.registerSingleton<SignInRepoImpl>(
      SignInRepoImpl(SignInRomteDataSourceImpl()));

}

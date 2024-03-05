import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/auth/sign_up/domin/use_case/post_sign_up_with_github_use_case.dart';
import 'package:untitled/features/auth/sign_up/domin/use_case/post_sign_up_with_google_use_case.dart';
import '../../features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import '../../features/auth/sign_in/data/repos/sign_in_repos._imp.dart';
import '../../features/auth/sign_in/domin/use_case/post_sign_in_use_case.dart';
import '../../features/auth/sign_in/view/manegr/bloc/sign_in_bloc.dart';
import '../../features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import '../../features/auth/sign_up/data/repos/signup_repos.dart';
import '../../features/auth/sign_up/domin/use_case/post_sign_up_use_case.dart';
import '../../features/auth/sign_up/view/manger/bloc/sign_up_bloc.dart';
import '../../features/welcome/bloc/welcome_bloc.dart';

providers(context) {
  return [
    BlocProvider(
      create: (context) {
        return SignUpBloc(
            PostSignUpUseCase(SignUpRepoImpl(SignUpRomteDataSourceImpl())),
            PostSignUpWithGoogleUseCase(
                SignUpRepoImpl(SignUpRomteDataSourceImpl())),
            PostSignUpWithGithub(SignUpRepoImpl(SignUpRomteDataSourceImpl())));
      },
    ),
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(
      create: (context) {
        return SignInBloc(
            PostSignInUseCase(SignInRepoImpl(SignInRomteDataSourceImpl())));
      },
    ),
  ];
}

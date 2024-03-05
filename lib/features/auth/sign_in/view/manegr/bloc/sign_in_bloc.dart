import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/failure/failure.dart';
import '../../../domin/entity/user_case.dart';
import '../../../domin/use_case/post_sign_in_use_case.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final PostSignInUseCase postSignInUseCase;
  SignInBloc(this.postSignInUseCase) : super(SignInInitial()) {
    on<SignInWithEmailPassowrd>(_signInWithEmailPassword);
  }
  Future _signInWithEmailPassword(
      SignInWithEmailPassowrd event, Emitter<SignInState> emit) async {
    emit(SignInLoding());
    final Either<Failure, UserSignInEntity> result = await postSignInUseCase
        .call(email: event.email, password: event.password);
    result.fold((failure) => emit(SignInFaliure(failure.message)),
        (user) => emit(SignInSucsses(user)));
  } 
  
} 

import 'package:viewmodel/base/usecase.dart';
import 'package:viewmodel_example/repository/user_repository.dart';

class IsUserLoggedUseCase  extends UseCase<NoParams, bool>{
  final UserRepository _userRepository;

  IsUserLoggedUseCase(this._userRepository);


  @override
  Future<bool> execute(NoParams params ) {
    return _userRepository.getIfUserIsLogged();
  }

}
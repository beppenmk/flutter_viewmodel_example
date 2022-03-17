import 'package:viewmodel/base/usecase.dart';
import 'package:viewmodel_example/repository/user_repository.dart';



class LoginUseCase  extends UseCase<LoginParams, bool>{
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);


  @override
  Future<bool> execute(LoginParams params) {
    return _userRepository.login();
  }

}

class LoginParams {
  final String _username;
  final String _password;

  LoginParams(this._username, this._password);
}
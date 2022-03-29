import 'package:viewmodel/vm.dart';
import 'package:viewmodel_example/repository/user_repository.dart';
import 'package:viewmodel_example/usecase/is_user_logged_usecase.dart';
import 'package:viewmodel_example/usecase/login_usecase.dart';
import 'package:viewmodel_example/usecase/logout_usecase.dart';

class AuthViewModel extends BaseViewModel {
  late IsUserLoggedUseCase _isUserLoggedUseCase;
  late LoginUseCase _loginUseCase;
  late LogoutUseCase _logoutUseCase;

  AuthViewModel() {
    final UserRepository _userRepository = UserRepository();
    _isUserLoggedUseCase = IsUserLoggedUseCase(_userRepository);
    _loginUseCase = LoginUseCase(_userRepository);
    _logoutUseCase = LogoutUseCase(_userRepository);
  }

  final isUserLogged = BroadcastStream<bool>();

  void getIfUserIsLogged() {
    executeUseCase(_isUserLoggedUseCase, NoParams(),
        broadcastStream: isUserLogged);
  }

  void login() {
    executeUseCase(_loginUseCase, LoginParams("username", "password"),
        broadcastStream: isUserLogged);
  }

  void logout() {
    executeUseCase(_logoutUseCase, NoParams(), broadcastStream: isUserLogged);
  }
}

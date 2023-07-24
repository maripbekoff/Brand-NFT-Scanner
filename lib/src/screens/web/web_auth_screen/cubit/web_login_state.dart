part of 'web_login_cubit.dart';

@immutable
abstract class WebLoginState {}
 
class WebLoginInitial extends WebLoginState {}
class WebLoginLoading extends WebLoginState {}
class WebLoginLoaded extends WebLoginState {}
class WebLoginFailed extends WebLoginState {
  final String error;
  WebLoginFailed ({required this.error});
}
class WebLoginNotSupported extends WebLoginState {}


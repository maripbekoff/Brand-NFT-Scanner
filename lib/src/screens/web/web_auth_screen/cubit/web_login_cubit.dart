import 'package:bloc/bloc.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:meta/meta.dart';

part 'web_login_state.dart';

class WebLoginCubit extends Cubit<WebLoginState> {
  WebLoginCubit() : super(WebLoginInitial());

  login() async {
    if (ethereum == null) {
      emit(WebLoginNotSupported());
      return;
    }
    emit(WebLoginLoading());
    try {
      String address =
          (await ethereum!.request("eth_requestAccounts")).first.toString();
      print(address);
      int chainId = await ethereum!.getChainId();
      print(chainId);
      if (chainId!=97){
        emit(WebLoginFailed(error: "Switch to another network - Binance Smart Chain (97)"));
        return;
      }
      emit(WebLoginLoaded());
    } catch (e) {
      emit(WebLoginFailed(error: e.toString()));
      rethrow;
    }
  }
}

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:meta/meta.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit() : super(CreateOrderInitial());
  String _abiCode = "";
  late JsonRpcProvider provider;
  late Web3Provider web3;
  create(
    String name,
    String symbol,
    String uri,
    String minter,
    String admin,
    int royalty,
  ) async {
    if (name.isEmpty||symbol.isEmpty||uri.isEmpty||minter.isEmpty||admin.isEmpty||royalty!=0)
    {
      emit(CreateOrderFailed(error: 'Заполните все поля!'));
      return;
    }
    emit(CreateOrderLoading());
    try {
      web3 = Web3Provider(ethereum);
    provider =
        JsonRpcProvider("https://data-seed-prebsc-1-s1.binance.org:8545");
    _abiCode = await rootBundle.loadString("assets/abis/abi.json");
    var abiJson = json.decode(_abiCode);
    _abiCode = json.encode(abiJson);
    Interface abiInterface = Interface(_abiCode);
    String contractAddress = '0x3B823Eef6D5CDbADe6bCb60d91A6C118594AB42f';
    final contract = Contract(contractAddress, abiInterface, provider);
    final anotherBusd =
        Contract(contractAddress, abiInterface, web3.getSigner());
    await anotherBusd.call("createNewBrand", [name, symbol, uri, minter, admin, royalty]);
    emit(CreateOrderLoaded());
    } catch (e) {
      emit(CreateOrderFailed(error: e.toString()));
      rethrow;
    }
    
  }

}

part of 'create_order_cubit.dart';

@immutable
abstract class CreateOrderState {}

class CreateOrderInitial extends CreateOrderState {}
class CreateOrderLoading extends CreateOrderState {}
class CreateOrderLoaded extends CreateOrderState {}
class CreateOrderFailed extends CreateOrderState {
    final String error;
  CreateOrderFailed ({required this.error});
}

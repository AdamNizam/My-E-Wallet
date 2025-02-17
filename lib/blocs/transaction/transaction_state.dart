part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transaction;

  const TransactionSuccess(this.transaction);

  @override
  List<Object> get props => [transaction];
}

final class TransactionFailed extends TransactionState {
  final String e;

  const TransactionFailed(this.e);

  @override
  List<Object> get props => [e];
}

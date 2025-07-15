part of 'add_product_cubit.dart';

enum AddProductStatus {
  initial,
  loading,
  added,
  failure,
}

class AddProductState extends Equatable {
  final AddProductStatus status;
  final String? errorMessage;

  const AddProductState({
    this.status = AddProductStatus.initial,
    this.errorMessage,
  });

  AddProductState copyWith({
    AddProductStatus? status,
    String? errorMessage,
  }) {
    return AddProductState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}

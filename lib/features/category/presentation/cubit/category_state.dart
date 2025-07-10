import 'package:equatable/equatable.dart';
import 'package:handly/features/category/domain/models/category.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<Category> categories;
  final Category selectedCategory;

  const CategorySuccess(
      {required this.categories, required this.selectedCategory});

  CategorySuccess copyWith({
    List<Category>? categories,
    Category? selectedCategory,
  }) {
    return CategorySuccess(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object> get props => [categories, selectedCategory];
}

class CategoryFailure extends CategoryState {
  final String message;

  const CategoryFailure(this.message);

  @override
  List<Object> get props => [message];
}
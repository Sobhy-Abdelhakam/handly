
import 'package:handly/features/category/data/category.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadding extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<Category> categories;
  CategorySuccess(this.categories);
  
}

class CategoryFailure extends CategoryState {
  final String message;
  CategoryFailure(this.message);
}
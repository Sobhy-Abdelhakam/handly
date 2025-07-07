import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
import 'package:handly/features/category/data/category.dart';
import 'package:handly/features/category/logic/category_cubit.dart';
import 'package:handly/features/category/logic/category_state.dart';
import 'package:handly/features/product/data/product.dart';
import 'package:handly/features/product/data/product_repo.dart';
import 'package:handly/features/product/data/seller.dart';

class SellProductScreen extends StatefulWidget {
  const SellProductScreen({super.key});

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell a Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategorySuccess) {
                    return DropdownButtonFormField<Category>(
                      value: _selectedCategory,
                      items: state.categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category.nameEn),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Category'),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement image upload
                },
                child: const Text('Upload Image'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final authState = context.read<AuthCubit>().state;
                    if (authState is AuthSuccess) {
                      final user = authState.user;
                      final seller = Seller(
                        id: user.id,
                        name: user.name,
                        imageUrl: user.imageUrl ?? '',
                        rating: 0, // Default rating for new seller
                        bio: user.bio ?? '',
                      );
                      final product = Product(
                        id: '', // Firestore will generate an ID
                        title: _titleController.text,
                        description: _descriptionController.text,
                        price: double.parse(_priceController.text),
                        categoryId: _selectedCategory!.id,
                        photoUrl: 'https://via.placeholder.com/150', // Placeholder
                        seller: seller,
                        createdAt: DateTime.now(),
                      );
                      context.read<ProductRepo>().addProduct(product);
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
import 'package:handly/features/category/data/category.dart';
import 'package:handly/features/category/logic/category_cubit.dart';
import 'package:handly/features/category/logic/category_state.dart';
import 'package:handly/features/product/data/product.dart';
import 'package:handly/features/product/data/seller.dart';
import 'package:handly/features/product/logic/product_cubit.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _imageFile;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  void submit() {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
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
        context.read<ProductCubit>().addProduct(product);
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sell a Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  color: Colors.grey[200],
                  child:
                      _imageFile == null
                          ? const Center(child: Text('+ select image'))
                          : Image.file(
                            _imageFile!,
                            height: 150,
                            fit: BoxFit.fitHeight,
                          ),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Enter product title"
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Enter description"
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final price = double.tryParse(value ?? '');
                  if (price == null || price <= 0) {
                    return "Enter valid price";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategorySuccess) {
                    return DropdownButtonFormField<Category>(
                      value: _selectedCategory,
                      items:
                          state.categories.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.nameEn),
                            );
                          }).toList(),
                      onChanged:
                          (val) => setState(() => _selectedCategory = val),
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      validator:
                          (_) =>
                              _selectedCategory == null
                                  ? "Select a category"
                                  : null,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

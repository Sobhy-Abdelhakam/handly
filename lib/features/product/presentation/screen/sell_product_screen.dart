import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/category/domain/models/category.dart';
import 'package:handly/features/category/presentation/cubit/category_cubit.dart';
import 'package:handly/features/category/presentation/cubit/category_state.dart';
import 'package:handly/features/product/data/image_repository.dart';
import 'package:handly/features/product/data/product_repository_impl.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/usecases/create_product.dart';
import 'package:handly/features/product/presentation/cubit/add_product_cubit.dart';
import 'package:handly/features/product/presentation/cubit/image_upload_cubit.dart';
import 'package:handly/features/product/presentation/cubit/image_upload_state.dart';
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
  String? _imageUrl;

  late final ImageUploadCubit _imageUploadCubit;
  late final AddProductCubit _addProductCubit;

  @override
  void initState() {
    super.initState();
    _imageUploadCubit = ImageUploadCubit(ImageRepository());
    _addProductCubit = AddProductCubit(CreateProduct(ProductRepositoryImpl()));
  }

  @override
  void dispose() {
    _imageUploadCubit.close();
    _addProductCubit.close();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      _imageUploadCubit.uploadImage(_imageFile!);
    }
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a category")));
      return;
    }

    if (_imageUrl == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please upload an image")));
      return;
    }

    final authState = context.read<AuthCubit>().state;
    if (authState.status == AuthStatus.success) {
      final user = authState.user!;

      final product = Product(
        id: '', // Firestore will generate an ID
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        price: double.parse(_priceController.text.trim()),
        categoryId: _selectedCategory!.id,
        photoUrl: _imageUrl!,
        seller: user,
        createdAt: DateTime.now(),
      );
      _addProductCubit.addProduct(product);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User not authenticated")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _addProductCubit),
        BlocProvider(create: (_) => _imageUploadCubit)
        ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Sell a Product')),
        body: BlocConsumer<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state.status == AddProductStatus.added) {
              Navigator.of(context).pop();
            }
            if (state.status == AddProductStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (context, productState) {
            return BlocConsumer<ImageUploadCubit, ImageUploadState>(
              listener: (context, imageState) {
                if (imageState is ImageUploadSuccess) {
                  _imageUrl = imageState.imageUrl;
                }
                if (imageState is ImageUploadFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(imageState.message)));
                }
              },
              builder: (context, imageState) {
                return Padding(
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
                                imageState is ImageUploading
                                    ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                    : _imageFile == null
                                    ? const Center(
                                      child: Text('+ select image'),
                                    )
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
                                    (val) =>
                                        setState(() => _selectedCategory = val),
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
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed:
                              productState.status == AddProductStatus.loading ||
                                      imageState is ImageUploading ||
                                      _imageUrl == null
                                  ? null
                                  : _submit,
                          child:
                              productState.status == AddProductStatus.loading ||
                                      imageState is ImageUploading
                                  ? const CircularProgressIndicator()
                                  : const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );

    // BlocProvider.value(
    //   value: _imageUploadCubit,
    //   child: Scaffold(
    //     appBar: AppBar(title: const Text('Sell a Product')),
    //     body: BlocConsumer<ProductCubit, ProductState>(
    //       listener: (context, productState) {
    //         if (productState.status == ProductStatus.added) {
    //           Navigator.of(context).pop();
    //         }
    //         if (productState.status == ProductStatus.failure) {
    //           ScaffoldMessenger.of(
    //             context,
    //           ).showSnackBar(SnackBar(content: Text(productState.errorMessage!)));
    //         }
    //       },
    //       builder: (context, productState) {
    //         return BlocConsumer<ImageUploadCubit, ImageUploadState>(
    //           listener: (context, imageState) {
    //             if (imageState is ImageUploadSuccess) {
    //               _imageUrl = imageState.imageUrl;
    //             }
    //             if (imageState is ImageUploadFailure) {
    //               ScaffoldMessenger.of(
    //                 context,
    //               ).showSnackBar(SnackBar(content: Text(imageState.message)));
    //             }
    //           },
    //           builder: (context, imageState) {
    //             return Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: Form(
    //                 key: _formKey,
    //                 child: ListView(
    //                   children: [
    //                     GestureDetector(
    //                       onTap: _pickImage,
    //                       child: Container(
    //                         height: 150,
    //                         color: Colors.grey[200],
    //                         child:
    //                             imageState is ImageUploading
    //                                 ? const Center(
    //                                   child: CircularProgressIndicator(),
    //                                 )
    //                                 : _imageFile == null
    //                                 ? const Center(
    //                                   child: Text('+ select image'),
    //                                 )
    //                                 : Image.file(
    //                                   _imageFile!,
    //                                   height: 150,
    //                                   fit: BoxFit.fitHeight,
    //                                 ),
    //                       ),
    //                     ),
    //                     const SizedBox(height: 16),
    //                     TextFormField(
    //                       controller: _titleController,
    //                       decoration: const InputDecoration(
    //                         labelText: 'Title',
    //                         border: OutlineInputBorder(),
    //                       ),
    //                       validator:
    //                           (value) =>
    //                               value == null || value.isEmpty
    //                                   ? "Enter product title"
    //                                   : null,
    //                     ),
    //                     const SizedBox(height: 16),
    //                     TextFormField(
    //                       controller: _descriptionController,
    //                       decoration: const InputDecoration(
    //                         labelText: 'Description',
    //                         border: OutlineInputBorder(),
    //                       ),
    //                       maxLines: 3,
    //                       validator:
    //                           (value) =>
    //                               value == null || value.isEmpty
    //                                   ? "Enter description"
    //                                   : null,
    //                     ),
    //                     const SizedBox(height: 16),
    //                     TextFormField(
    //                       controller: _priceController,
    //                       keyboardType: TextInputType.number,
    //                       decoration: const InputDecoration(
    //                         labelText: 'Price',
    //                         border: OutlineInputBorder(),
    //                       ),
    //                       validator: (value) {
    //                         final price = double.tryParse(value ?? '');
    //                         if (price == null || price <= 0) {
    //                           return "Enter valid price";
    //                         }
    //                         return null;
    //                       },
    //                     ),
    //                     const SizedBox(height: 16),
    //                     BlocBuilder<CategoryCubit, CategoryState>(
    //                       builder: (context, state) {
    //                         if (state is CategorySuccess) {
    //                           return DropdownButtonFormField<Category>(
    //                             value: _selectedCategory,
    //                             items:
    //                                 state.categories.map((category) {
    //                                   return DropdownMenuItem(
    //                                     value: category,
    //                                     child: Text(category.nameEn),
    //                                   );
    //                                 }).toList(),
    //                             onChanged:
    //                                 (val) =>
    //                                     setState(() => _selectedCategory = val),
    //                             decoration: const InputDecoration(
    //                               labelText: 'Category',
    //                               border: OutlineInputBorder(),
    //                             ),
    //                             validator:
    //                                 (_) =>
    //                                     _selectedCategory == null
    //                                         ? "Select a category"
    //                                         : null,
    //                           );
    //                         }
    //                         return const Center(
    //                           child: CircularProgressIndicator(),
    //                         );
    //                       },
    //                     ),
    //                     const SizedBox(height: 24),
    //                     ElevatedButton(
    //                       onPressed:
    //                           productState.status == ProductStatus.loading ||
    //                                   imageState is ImageUploading ||
    //                                   _imageUrl == null
    //                               ? null
    //                               : _submit,
    //                       child:
    //                           productState.status == ProductStatus.loading ||
    //                                   imageState is ImageUploading
    //                               ? const CircularProgressIndicator()
    //                               : const Text('Submit'),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}

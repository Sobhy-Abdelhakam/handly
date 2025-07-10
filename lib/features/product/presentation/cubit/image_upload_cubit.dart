import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/data/image_repository.dart';
import 'package:handly/features/product/presentation/cubit/image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  final ImageRepository _imageRepository;

  ImageUploadCubit(this._imageRepository) : super(ImageUploadInitial());

  Future<void> uploadImage(File imageFile) async {
    emit(ImageUploading());
    try {
      final imageUrl = await _imageRepository.uploadImage(imageFile);
      if (imageUrl != null) {
        emit(ImageUploadSuccess(imageUrl));
      } else {
        emit(const ImageUploadFailure('Failed to upload image'));
      }
    } catch (e) {
      emit(ImageUploadFailure(e.toString()));
    }
  }
}

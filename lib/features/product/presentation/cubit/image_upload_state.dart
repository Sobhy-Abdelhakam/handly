import 'package:equatable/equatable.dart';

abstract class ImageUploadState extends Equatable {
  const ImageUploadState();

  @override
  List<Object> get props => [];
}

class ImageUploadInitial extends ImageUploadState {}

class ImageUploading extends ImageUploadState {}

class ImageUploadSuccess extends ImageUploadState {
  final String imageUrl;

  const ImageUploadSuccess(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class ImageUploadFailure extends ImageUploadState {
  final String message;

  const ImageUploadFailure(this.message);

  @override
  List<Object> get props => [message];
}

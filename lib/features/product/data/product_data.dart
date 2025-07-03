import 'package:handly/features/product/data/product.dart';
import 'package:handly/features/product/data/seller.dart';

final List<Product> dummyProducts = [
  Product(
      id: '1',
      title: 'Handmade Pottery Vase',
      description: 'A beautiful handmade pottery vase, perfect for your home decor.',
      photoUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
      price: 25.0,
      categoryId: '1',
      seller: Seller(
        id: 'seller1',
        name: 'Pottery Shop',
        imageUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
        rating: 4.5,
      ),
      createdAt: DateTime.now()),
  Product(
      id: '2',
      title: 'Hand-painted Porcelain Plate',
      description: 'A delicate hand-painted porcelain plate with a unique design.',
      photoUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
      price: 35.0,
      categoryId: '2',
      seller: Seller(
        id: 'seller2',
        name: 'Porcelain World',
        imageUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
        rating: 4.8,
      ),
      createdAt: DateTime.now()),
  Product(
      id: '3',
      title: 'Carved Wooden Bowl',
      description: 'A rustic wooden bowl, hand-carved from a single piece of wood.',
      photoUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
      price: 45.0,
      categoryId: '3',
      seller: Seller(
        id: 'seller3',
        name: 'Wooden Wonders',
        imageUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
        rating: 4.2,
      ),
      createdAt: DateTime.now()),
  Product(
      id: '4',
      title: 'Clay Mug',
      description: 'A unique clay mug, perfect for your morning coffee.',
      photoUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
      price: 15.0,
      categoryId: '1',
      seller: Seller(
        id: 'seller1',
        name: 'Pottery Shop',
        imageUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
        rating: 4.5,
      ),
      createdAt: DateTime.now()),
  Product(
      id: '5',
      title: 'Porcelain Tea Set',
      description: 'A beautiful porcelain tea set, perfect for a tea party.',
      photoUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
      price: 55.0,
      categoryId: '2',
      seller: Seller(
        id: 'seller2',
        name: 'Porcelain World',
        imageUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
        rating: 4.8,
      ),
      createdAt: DateTime.now()),
  Product(
      id: '6',
      title: 'Wooden Spoon',
      description: 'A hand-carved wooden spoon, perfect for your kitchen.',
      photoUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
      price: 10.0,
      categoryId: '3',
      seller: Seller(
        id: 'seller3',
        name: 'Wooden Wonders',
        imageUrl: 'https://th.bing.com/th/id/R.9b48642de2a7a5365b743c93651097b5?rik=BSFHuctwdHOcHg&pid=ImgRaw&r=0',
        rating: 4.2,
      ),
      createdAt: DateTime.now()),
];

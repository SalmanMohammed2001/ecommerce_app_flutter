import '../models/CategoryModel.dart';
import '../models/productModel.dart';

class DemoData {

  static List<String> sliderImages = [
    'https://media.cnn.com/api/v1/images/stellar/prod/ios-17-review-lead-cnnu.jpg?c=16x9',
    'https://www.apple.com/v/ios/ios-17/a/images/meta/ios-17__ni2koxyri7m2_og.png',
    'https://www.livemint.com/lm-img/img/2023/09/18/600x338/ios_17_1685986638198_1695016956548.png',
    'https://sempreupdate.com.br/wp-content/uploads/2023/10/ios-17-1-promete-mudancas-emocionantes-para-o-seu-iphone-860x484.jpg',
  ];

  static List<CategoryModel> categories = [
    CategoryModel(image: 'assets/images/mac.png', name: 'Mac'),
    CategoryModel(image: 'assets/images/ipad.png', name: 'i Pad'),
    CategoryModel(image: 'assets/images/iphone.png', name: 'i Phone'),
    CategoryModel(image: 'assets/images/watch.png', name: 'Watch'),
    CategoryModel(image: 'assets/images/airpods.png', name: 'AirPods'),
  ];

  static List<Product> products = [
    Product(
        image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15pro-digitalmat-gallery-1-202309_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1693346851451',
        price: 999,
        name: 'Iphone 15 pro'),

    Product(
        image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone13-digitalmat-gallery-3-202203?wid=728&hei=666&fmt=png-alpha&.v=1644988765122',
        price: 780,
        name: 'Iphone 13 '),

    Product(
        image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone14-digitalmat-gallery-3-202209?wid=728&hei=666&fmt=png-alpha&.v=1662055813794',
        price: 850,
        name: 'Iphone 14 '),
    Product(
        image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphonese-digitalmat-gallery-3-202203?wid=728&hei=666&fmt=png-alpha&.v=1644987579761',
        price: 750,
        name: 'Iphone SE '),

    Product(
        image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15-digitalmat-gallery-4-202309?wid=728&hei=666&fmt=png-alpha&.v=1693011169045',
        price: 900,
        name: 'Iphone 14 Plus '),

  ];

}
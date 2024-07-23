class Product {
  int? _totalSize;  // Tổng số lượng sản phẩm
  int? _typeId;     // ID loại sản phẩm
  int? _offset;     // Vị trí offset
  late List<ProductModel> _products;  // Danh sách các sản phẩm
  List<ProductModel> get products=>_products;  // Getter để truy cập danh sách sản phẩm
  
  // Constructor với các tham số bắt buộc
  Product({required totalSize, required typeId, required offset, required products}){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._products=products;
  }

  // Constructor để khởi tạo đối tượng từ JSON
  Product.fromJson(Map<String, dynamic> json){
    _totalSize = json['total_size'];
    _typeId  = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null){
      _products = <ProductModel>[];
      json['products'].forEach((v){
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

//Thông tin chi tiết của từng sản phẩm.
//Bao gồm : ID, tên, mô tả, giá cả, số sao, hình ảnh, vị trí, ngày tạo, ngày cập nhật và ID loại.
class ProductModel {
  int? id;
  String? name;
  String?description;
  int?price;
  int?stars;
  String?img;
  String?location;
  String?createdAt;
  String?updatedAt;
  int? typeId;

  // Constructor với các tham số tùy chọn
  ProductModel(
    {this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId});

  // Constructor để khởi tạo đối tượng từ JSON
  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson(){
    return{
      "id":this.id,
      "name":this.name,
      "price":this.price,
      "img":this.img,
      "location":this.location,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "typeId":this.typeId
    };
  }
}
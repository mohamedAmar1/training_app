


class CategoryModel{
  String? name;
  String? item_no;
  String? image_url;
  String? description;

  CategoryModel({
    required this.name ,
    required this.item_no ,
    required this.image_url ,
    required this.description
  });

  Map<String , dynamic> toJson() =>{
    "name" : name,
    "item_no":item_no,
    "image_url":image_url,
    "description":description
  };

}

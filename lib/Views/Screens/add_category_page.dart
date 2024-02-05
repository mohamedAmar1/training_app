
import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/category_model.dart';
import 'package:login_app/Models/Core/firebase_cloud_store_utils.dart';

import '../utils.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  bool isLoadding = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _itemNumberTextController = TextEditingController();
  TextEditingController _UrlImageTextController = TextEditingController();
  TextEditingController _descriptionTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category"),),
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
        hexaToString("CB2f93"),
        hexaToString("9946C4"),
        hexaToString("5E61F4")
        ], begin: Alignment.centerLeft, end: Alignment.bottomCenter),
            ),
        child:isLoadding == true?const Center(child: Column(
          children: [
            SizedBox(height: 40,),
            Text("Adding Category...",style: TextStyle(color: Colors.white),),
            SizedBox(height: 40,),
            CircularProgressIndicator(color: Colors.white,),
          ],
        ),):
        Form(
          key:_formKey ,
            child:SingleChildScrollView(
              padding:const EdgeInsets.all(10),
              child: Column(children: [
                const SizedBox(height: 20,),
                const Icon(Icons.add_card ,size: 100,color: Colors.white,),
                const SizedBox(height: 50,),
                reusableTextField(_nameTextController , Icons.drive_file_rename_outline_outlined ,"Category name" ),
                reusableTextField(_itemNumberTextController , Icons.countertops_outlined ,"Number" ),
                reusableTextField(_UrlImageTextController , Icons.image ,"Image Url" ),
                reusableTextField(_descriptionTextController , Icons.description_outlined ,"Description" ),
                const SizedBox(height: 40,),
                Container(
                  width: 300,
                    height: 50,
                    child: ElevatedButton(onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          CategoryModel categoryModel = CategoryModel(
                              name: _nameTextController.text,
                              item_no: _itemNumberTextController.text,
                              image_url: _UrlImageTextController.text,
                              description: _descriptionTextController.text
                          );

                          // -- open connection to firebaseFireStore to upload category --
                          isLoadding= true;
                          setState(() {});
                          bool res = await FireBaseCloudStroreUtils.addNewCategory(categoryModel);
                          if( res == true){
                            var snackBar = const SnackBar(content:Text("Sccessful add Category"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            isLoadding= false;
                            setState(() {});
                          }

                          else{
                            var snackBar =const SnackBar(content:Column(
                              children: [
                                Text("There is an Error accoure while add category "),
                                Text("Try to check internet connection"),
                              ],
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }


                        }
                    }, child: Text("Add Category" , style:TextStyle(),),)),



            ],
          ),
        )),
      ),
    );
  }
}

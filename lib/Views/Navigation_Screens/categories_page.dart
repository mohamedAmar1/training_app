import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Models/Core/firebase_cloud_store_utils.dart';
import '../utils.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final Stream<QuerySnapshot> catStream = FirebaseFirestore.instance.collection(FireBaseCloudStroreUtils.categoryCollectionName).snapshots();
  bool delRes = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: catStream,
      builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return const Center(child: Text("Some thing is wrong"),);
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child:
          Column(children: [
            Text("Loading"),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: Colors.deepPurple,)
          ],
          ));
        }
        return delRes == true?const Center(child: CircularProgressIndicator(color: Colors.white,),) :
        GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:(300/400),
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context , int index){
              Map<String, dynamic> data = snapshot.data!.docs[index].data()! as Map<String, dynamic>;
              return reusableContainer(context,data["name"] ,data["item_no"],data["image_url"],snapshot.data!.docs[index].id);
          }
        );

      },
    );


    //
  }
}

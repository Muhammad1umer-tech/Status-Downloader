import 'package:flutter/material.dart';



class imageViewClass extends StatefulWidget {
  static const routename = '/imageVieClass'; 

  @override
  State<imageViewClass> createState() => _imageViewClassState();
}

class _imageViewClassState extends State<imageViewClass> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(color: Colors.grey),),
       floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
        children:[
          IconButton(onPressed: (){}, icon:     Icon(Icons.download)),
          IconButton(onPressed: (){}, icon:     Icon(Icons.share)),
],
),
     
    );
  }
}
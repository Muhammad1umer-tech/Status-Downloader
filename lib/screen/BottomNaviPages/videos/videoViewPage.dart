import 'package:flutter/material.dart';



class videoViewClass extends StatefulWidget {
  static const routename = '/imageVieClass'; 

  @override
  State<videoViewClass> createState() => _videoViewClassState();
}

class _videoViewClassState extends State<videoViewClass> {
 
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
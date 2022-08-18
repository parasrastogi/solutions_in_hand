import 'package:flutter/material.dart';
import 'package:solutions_in_hand/core/model/item.dart';

class ReceiverItemTile extends StatefulWidget{
  final Item item;
  const ReceiverItemTile(this.item, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReceiverItemTileWidget();
}

class _ReceiverItemTileWidget extends State<ReceiverItemTile>{
  @override
  Widget build(BuildContext context) {
     return Card(
       color: Colors.brown.withOpacity(0.2),
       child: IntrinsicHeight(
         child: Row(
           children: [
             Flexible(
               flex: 2,
               fit: FlexFit.tight,
               child: Column(
                 children: [
                 //  widget.item.gender == 'M' ?
                   Image.asset('assets/images/male_logo.png',
                     width: 60, height: 60,
                   ), //: Image.asset('assets/images/female_logo.png',
                    // width: 60, height: 60,),
                 ],
               ),
             ),
             VerticalDivider(thickness: 2,),
             Flexible(
               flex: 6,
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(widget.item.itemName),
                       Image.network(widget.item.imageUrl, width: 100, height: 100,),
                     ],
                   ),
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextButton(onPressed: (){

                           }, child: const Text('Resolved')),
                           TextButton(onPressed: (){

                           }, child: const Text('Out of Stock'))
                         ],
                       )
                     ],
                   )
                 ],
               ),
             ),

           ],
         ),
       ),
     );
  }

}
import 'package:flutter/material.dart';
class NewsContainer extends StatefulWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  void Function(bool?)? onChanged;
  NewsContainer({super.key,
     required this.imgUrl,
     required this.newsDes,
     required this.newsHead,
     required this.newsUrl,
    this.onChanged,
   });

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              widget.imgUrl,
            height: 400,
          width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 20,),
                 Text(widget.newsHead,style: const TextStyle(
                     fontSize: 18,
                     fontWeight:FontWeight.bold ),),
                 const SizedBox(height: 10,),
                 Text(widget.newsDes,style: const TextStyle(
                   fontSize: 15,
                 ),),
               ],
             ),
           ),
         const SizedBox(height: 20,),
         // const Spacer(),
         //  Switch(
         //      value: _isDarkMode,
         //      onChanged: widget.onChanged,
         //  ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: (){},
                    child: const Text("Read More")
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}

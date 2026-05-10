import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  HmSuggestion({Key? key}) : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:
    Container(
      height: 200,
      child:Text("推荐",style: TextStyle(color: Colors.white),),
      color: Colors.blue,
      alignment: Alignment.center,
    )
      );
  }
}
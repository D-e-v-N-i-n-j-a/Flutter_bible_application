import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const TextField(
            decoration: InputDecoration(
              hintText: "Enter Search Here",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}

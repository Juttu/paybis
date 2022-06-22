


import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
   this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 36,
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
              //Center Column contents horizontally,
              children: <Widget>[
                SizedBox(width: 10),
                Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 24,
                ),
                SizedBox(width: 10),
                Container(
                  child: Expanded(
                      child: TextField(
                        autofocus: true,
                        keyboardType:TextInputType.emailAddress,
                    controller: searchController,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Contacts",
                        hintStyle: TextStyle(
                          color: Color(0xff3C3C43)
                        )),
                  )),
                )
              ]),
        ),
      ],
    );
  }
}
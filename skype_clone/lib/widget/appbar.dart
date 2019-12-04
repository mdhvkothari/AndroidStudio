import 'package:flutter/material.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget{
  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar({this.title,this.actions,this.centerTitle,this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(
            color: Universalvariables.senderColor,
            width: 1.4,
            style: BorderStyle.solid
          )
        )
      ),
      child:AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }
  final Size preferredSize = const Size.fromHeight(kToolbarHeight+10);
}
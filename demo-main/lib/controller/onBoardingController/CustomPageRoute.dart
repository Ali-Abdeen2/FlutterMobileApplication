import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder
{
  final child;

  CustomPageRoute(this.child,
      ):super(
      transitionDuration: Duration(milliseconds: 350),
      reverseTransitionDuration: Duration(milliseconds: 350),
      pageBuilder: (context,animation,secondaryAnimation)=>child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child)=>
      SlideTransition(
        
        position: Tween<Offset>(
          begin: Offset(-1,0),
          end: Offset.zero
        ).animate(animation),
        child: child,
      );
      
}
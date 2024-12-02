import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key, required this.value, required this.onChanged}) : super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin{
  AnimationController? animationController;

  @override
  void initState() {
   animationController =
    AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animationController!, builder: (context,child){
      return GestureDetector(
        onTap: (){
          if(animationController!.isCompleted){
            animationController!.reverse();
          }else{
            animationController!.fling();
          }
          widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
        },
          child: Container(
            width: displayWidth(context) * .107,
            height: displayHeight(context) * .03,
            decoration: BoxDecoration(
              color: widget.value ?ColorConstants.purple:ColorConstants.grey200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 3, bottom: 3),
              child: Container(
                alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: displayWidth(context) * .067,
                  height: displayWidth(context) * .067,
                  decoration:  BoxDecoration(
                      shape: BoxShape.circle, color:widget.value ?  ColorConstants.white:ColorConstants.grey400),
                ),
              ),
            ),
          ),
      );
    });
  }
}

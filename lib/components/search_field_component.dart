import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/constants.dart';

class SearchFieldComponent extends StatelessWidget {
  const SearchFieldComponent({Key? key, required this.padding})
      : super(key: key);
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      height: 36,
      decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(.12),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          SvgPicture.asset(Constants.kIconSearch),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                  fontSize: 17,
                  color: Constants.kWhiteColor.withOpacity(.6),
                  letterSpacing: -.41),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(
                    fontSize: 17,
                    color: Constants.kWhiteColor.withOpacity(.6),
                    letterSpacing: -.41),
                hintText: 'Search',
              ),
            ),
          ),
          SvgPicture.asset(Constants.kIconMic),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

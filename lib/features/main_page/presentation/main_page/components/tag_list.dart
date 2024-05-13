import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 120.0,
      child: Column(
        children: [
          Text("Top tags".tr()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text("ffff"),
                ),
              ),
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text("ffff"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text("ffff"),
                ),
              ),
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text("ffff"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text("ffff"),
                ),
              ),
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text("ffff"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
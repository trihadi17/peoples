import 'package:flutter/material.dart';

// Theme
import 'package:peoples/theme.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonPeople extends StatelessWidget {
  const SkeletonPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: (MediaQuery.of(context).size.width - 75) / 2,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              top: 4,
              right: 4,
              bottom: 12,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Shimmer.fromColors(
                baseColor: Color(0xffEAEAEA),
                highlightColor: whiteColor,
                child: Container(
                  height: 132,
                  width: double.infinity,
                  color: Color(0xffEAEAEA),
                ),
              ),
            ),
          ),

          // People Name
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Shimmer.fromColors(
              baseColor: Color(0xffEAEAEA),
              highlightColor: whiteColor,
              child: Container(
                width: double.infinity,
                height: 20,
                color: Color(0xffEAEAEA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

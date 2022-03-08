import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMoreBreakingNewsListWidget extends StatelessWidget {
  final int _noOfItems;

  const ShimmerMoreBreakingNewsListWidget({
    Key? key,
    int noOfItems = 5,
  })  : _noOfItems = noOfItems,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.separated(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: screenSize.width,
                  height: 210,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 4,
                )
              ],
            ),
          ),
          itemCount: _noOfItems,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}

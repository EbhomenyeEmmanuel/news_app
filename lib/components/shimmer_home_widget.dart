import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeWidget extends StatelessWidget {
  const ShimmerHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(
                  width: screenSize.width, height: screenSize.height * 0.45),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 20,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Container(
                  width: 80,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenSize.width * 0.6,
                        height: screenSize.height * 0.3,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: screenSize.width * 0.6,
                        height: 14.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.3,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: screenSize.width * 0.3,
                        height: 14.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:space/widgets/shimmer.dart';

class ProductGridSkeleton extends StatelessWidget {
  const ProductGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.zero,
        child: Container(
          width: ((MediaQuery.of(context).size.width - 66) / 2),
          padding: EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerItem(height: 122),
              SizedBox(
                height: 20.0,
              ),
              ShimmerItem(height: 22),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerItem(
                    height: 22,
                    width: 62,
                  ),
                  ShimmerItem(
                    height: 44,
                    width: 44,
                    variant: 'circle',
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

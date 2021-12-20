import 'package:flutter/material.dart';
import 'package:my_app/core/entities/store_entity.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class StoreTileRatingWidget extends StatelessWidget {
  final StoreEntity storeEntity;
  final Color backgroundColor;
  final BoxBorder? border;

  const StoreTileRatingWidget({
    Key? key,
    required this.backgroundColor,
    this.border,
    required this.storeEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/sign_or_signup', arguments: {'redirectTo': 'products_purchase'});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(storeEntity.imagePath),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeEntity.name,
                      style: customTextStyle(FontWeight.bold, 18, Color(0xFF560955)),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Image.asset('assets/icon/yellow_star.png'),
                        Text(
                          storeEntity.rate.toString(),
                          style: customTextStyle(FontWeight.w600, 18, Color(0xFFFF6600)),
                        ),
                        SizedBox(width: 10),
                        Text('•'),
                        SizedBox(width: 10),
                        Text(
                          storeEntity.kmDistance ?? '',
                          style: customTextStyle(FontWeight.w600, 18, Color(0xFF635F75)),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          storeEntity.deliveryTime.toString(),
                          style: customTextStyle(FontWeight.w600, 18, Color(0xFF635F75)),
                        ),
                        SizedBox(width: 10),
                        Text('•'),
                        SizedBox(width: 10),
                        Text(
                          storeEntity.deliveryFee! > 0
                              ? "R\$ ${storeEntity.deliveryFee!.toStringAsFixed(2)}"
                              : 'Grátis',
                          style: customTextStyle(FontWeight.w600, 18, Color(0xFF3399CC)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              child: Image.asset('assets/icon/arrow_foward.png'),
            )
          ],
        ),
      ),
    );
  }
}

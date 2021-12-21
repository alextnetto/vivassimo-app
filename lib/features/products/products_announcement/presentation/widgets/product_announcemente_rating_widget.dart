import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';

class ProductAnnouncementRatingWidget extends StatelessWidget {
  final String ratingIcon;
  final String customerName;
  final String ratingDate;
  final int amountStars;
  final String ratingDescription;

  const ProductAnnouncementRatingWidget(
      {Key? key,
      required this.ratingIcon,
      required this.customerName,
      required this.ratingDate,
      required this.amountStars,
      required this.ratingDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffB4D8D8)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 22, right: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.asset(ratingIcon, width: 54),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 115,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(customerName, style: customTextStyle(FontWeight.w600, 18, Color(0xFF4D0351))),
                            Text(ratingDate, style: AppTextStyles.defaultTextStyleDescriptionGrey)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/icon/star_yellow.png'),
                            SizedBox(width: 7),
                            Image.asset('assets/icon/star_yellow.png'),
                            SizedBox(width: 7),
                            Image.asset('assets/icon/star_yellow.png'),
                            SizedBox(width: 7),
                            Image.asset('assets/icon/star_yellow.png'),
                            SizedBox(width: 7),
                            Image.asset('assets/icon/star_yellow.png'),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 115,
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(ratingDescription, style: AppTextStyles.defaultTextStyleDescriptionGrey),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/ui/component_styles/text_style.dart';
import 'package:my_app/core/ui/widgets/app_button.dart';

class ModalBottomSheetDeleteComponentWidget {
  static Future<void> showModalDeleteComponent({
    required BuildContext context,
    required String deleteMessage,
    required String confirmButtomText,
    required String cancelButtomText,
  }) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: Color(0xFFFF3300),
                ),
                height: 130,
                // width: MediaQuery.of(context).size.width,
                child: Text(
                  deleteMessage,
                  textAlign: TextAlign.center,
                  style: customTextStyle(FontWeight.w800, 30, Colors.white, lineHeight: 1),
                ),
              ),
              SizedBox(
                // height: 200,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        borderColor: Color(0XFF006633),
                        buttonColor: Color(0XFF22AB86),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        textColor: Color(0XFFFFFFFF),
                        title: confirmButtomText,
                        onPressed: Navigator.of(context).pop,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        borderColor: Color(0XFFDE674B),
                        buttonColor: Color(0XFFFFB640),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        textColor: Color(0XFF4D0351),
                        title: cancelButtomText,
                        onPressed: Navigator.of(context).pop,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      context: context,
    );
  }
}

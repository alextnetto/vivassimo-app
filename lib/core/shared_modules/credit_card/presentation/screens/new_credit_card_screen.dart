import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/entities/credit_card_entity.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/payment_method_store.dart';
import 'package:my_app/core/ui/app_style.dart';
import 'package:my_app/core/ui/widgets/app_bar_default.dart';
import 'package:my_app/core/ui/widgets/app_text_field.dart';
import 'package:my_app/core/ui/widgets/button_confirm.dart';
import 'package:my_app/core/utils/formatters/app_formatter.dart';
import 'package:my_app/core/utils/helpers/app_helpers.dart';
import 'package:my_app/features/services_purchase/presentation/screens/cvv_indicator_screen.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/new_credit_card_store.dart';
import 'package:my_app/features/services_purchase/presentation/widgets/animation_card_widget.dart';
import 'package:my_app/features/services_purchase/presentation/widgets/credit_card_back_widget.dart';
import 'package:my_app/features/services_purchase/presentation/widgets/credit_card_widget.dart';
import 'dart:math';

class NewCreditCardScreen extends StatefulWidget {
  final PaymentMethodStore paymentStore;
  const NewCreditCardScreen({Key? key, required this.paymentStore}) : super(key: key);

  @override
  _NewCreditCardScreenState createState() => _NewCreditCardScreenState();
}

class _NewCreditCardScreenState extends State<NewCreditCardScreen> with SingleTickerProviderStateMixin {
  PaymentMethodStore get paymentStore => widget.paymentStore;
  NewCreditCardStore creditCardStore = Modular.get<NewCreditCardStore>();
  String cvv = '';
  bool iscvvFocused = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //Card Animation
  late bool isFrontVisible = true;
  late bool isGestureUpdate = false;
  late AnimationController controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  FocusNode cvvFocusNode = FocusNode();

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _updateRotations(false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    cvvFocusNode.dispose();
    super.dispose();
  }

  void textFieldFocusDidChange() {
    setState(() {
      creditCardStore.setShowBackView(cvvFocusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isGestureUpdate) {
      _updateRotations(false);
      if (creditCardStore.showBackView) {
        controller.forward();
      } else {
        controller.reverse();
      }
    } else {
      isGestureUpdate = false;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 280 + MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  Container(
                    height: 95,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(180, 216, 216, 0.2),
                        border: Border(bottom: BorderSide(color: Color.fromRGBO(99, 95, 117, 0.2)))),
                    child: Column(
                      children: const [
                        AppBarDefaultWidget(title: 'Novo cartão'),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 22, right: 22),
                      width: MediaQuery.of(context).size.width,
                      child: Observer(builder: (_) {
                        return Stack(
                          children: [
                            _cardGesture(
                                child: AnimationCard(
                              animation: _frontRotation,
                              child: CreditCardWidget(
                                brand: creditCardStore.cardBrand,
                                expirationDate: creditCardStore.expirationDate,
                                number: creditCardStore.number,
                                ownerName: creditCardStore.ownerName,
                              ),
                            )),
                            _cardGesture(
                              child: AnimationCard(
                                animation: _backRotation,
                                child: CreditCardBackWidget(
                                  brand: creditCardStore.cardBrand,
                                  cvv: creditCardStore.cvv,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                margin: const EdgeInsets.only(top: 35),
                child: Column(
                  children: [
                    AppTextField(
                      label: 'Digite os números do cartão',
                      onChanged: creditCardStore.setNumber,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        AppFormatter.creditCardInputFormatter,
                      ],
                      errorText: creditCardStore.getNumberError,
                      keyBoardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    AppTextField(
                      label: 'Digite o nome no cartão',
                      onChanged: creditCardStore.setName,
                      textAlign: TextAlign.center,
                      errorText: creditCardStore.getNameError,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => CvvIndicatorScreen()));
                          },
                          child: Icon(
                            Icons.info_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            label: 'Validade',
                            onChanged: creditCardStore.setExpireDate,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              AppFormatter.dateInputFormatter,
                            ],
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: AppTextField(
                            label: 'CVV',
                            onChanged: creditCardStore.setCvv,
                            textAlign: TextAlign.center,
                            // errorText: creditCardStore.getCvvError,
                            focusNode: cvvFocusNode,
                            keyBoardType: TextInputType.number,
                            inputFormatters: [
                              AppFormatter.cvvFormatter,
                            ],

                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(cvvFocusNode);
                            // },
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20),
                  ],
                ),
              );
            }),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 65)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              // margin: const EdgeInsets.only(top: 66),
              child: Observer(builder: (_) {
                return ButtonConfirm(
                  label: 'Continuar',
                  primary: VivassimoTheme.green,
                  textColor: VivassimoTheme.white,
                  borderColor: creditCardStore.enableButton ? VivassimoTheme.greenBorderColor : Colors.grey,
                  onPressed: creditCardStore.enableButton
                      ? () {
                          paymentStore.addCreditCard(CreditCardEntity(
                            id: paymentStore.creditCardEntities.length + 1,
                            number: creditCardStore.number,
                            cvv: creditCardStore.cvv,
                            expirationDate: creditCardStore.expirationDate,
                            ownerName: creditCardStore.ownerName,
                            imagePath: AppHelpers.getCredtiCardLogo(creditCardStore.cardBrand),
                            imagePathWhite: AppHelpers.getCredtiCardLogoWhite(creditCardStore.cardBrand),
                            brand: creditCardStore.cardBrand,
                            brandName: AppHelpers.getCreditCardBrandName(creditCardStore.cardBrand),
                          ));

                          Navigator.of(context).pop();
                        }
                      : null,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardGesture({required Widget child}) {
    bool isRightSwipe = true;
    return GestureDetector(
      onPanEnd: (_) {
        isGestureUpdate = true;
        if (isRightSwipe) {
          _leftRotation();
        } else {
          _rightRotation();
        }
      },
      onPanUpdate: (DragUpdateDetails details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          isRightSwipe = true;
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          isRightSwipe = false;
        }
      },
      child: child,
    );
  }

  void _leftRotation() {
    _toggleSide(false);
  }

  void _rightRotation() {
    _toggleSide(true);
  }

  void _toggleSide(bool isRightTap) {
    _updateRotations(!isRightTap);
    if (isFrontVisible) {
      controller.forward();
      isFrontVisible = false;
    } else {
      controller.reverse();
      isFrontVisible = true;
    }
  }

  void _updateRotations(bool isRightSwipe) {
    setState(() {
      final bool rotateToLeft = (isFrontVisible && !isRightSwipe) || !isFrontVisible && isRightSwipe;

      ///Initialize the Front to back rotation tween sequence.
      _frontRotation = TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.0, end: rotateToLeft ? (pi / 2) : (-pi / 2))
                .chain(CurveTween(curve: Curves.linear)),
            weight: 50.0,
          ),
          TweenSequenceItem<double>(
            tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2)),
            weight: 50.0,
          ),
        ],
      ).animate(controller);

      ///Initialize the Back to Front rotation tween sequence.
      _backRotation = TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)),
            weight: 50.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: rotateToLeft ? (-pi / 2) : (pi / 2), end: 0.0).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 50.0,
          ),
        ],
      ).animate(controller);
    });
  }
}

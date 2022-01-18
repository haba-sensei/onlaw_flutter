import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/subscription/infrastructure/subscription_controller.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (_) {
          final GlobalKey<FormState> formKey = GlobalKey<FormState>();
          return Scaffold(
            extendBody: true,
            backgroundColor: MyColors.blackBasico,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const CustomAppBar(),
            ),
            drawer: const DrawerLayout(
              page: 'PAGOS',
            ),
            bottomNavigationBar: const CustomBottonNavBar(),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  CreditCardWidget(
                    glassmorphismConfig: _.useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: _.cardNumber,
                    expiryDate: _.expiryDate,
                    cardHolderName: _.cardHolderName,
                    cvvCode: _.cvvCode,
                    showBackView: _.isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: Colors.red,
                    backgroundImage: _.useBackgroundImage ? 'assets/image/card_bg.png' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          'assets/image/mastercard.png',
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: _.cardNumber,
                            cvvCode: _.cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: _.cardHolderName,
                            expiryDate: _.expiryDate,
                            themeColor: Colors.blue,
                            textColor: Colors.white,
                            cardNumberDecoration: InputDecoration(
                              labelText: 'Numero de Tarjeta',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.white),
                              focusedBorder: _.border,
                              enabledBorder: _.border,
                            ),
                            expiryDateDecoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.white),
                              focusedBorder: _.border,
                              enabledBorder: _.border,
                              labelText: 'Fecha de Expiración',
                              hintText: 'XX/XX',
                            ),
                            cvvCodeDecoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.white),
                              focusedBorder: _.border,
                              enabledBorder: _.border,
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            cardHolderDecoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.white),
                              focusedBorder: _.border,
                              enabledBorder: _.border,
                              labelText: 'Nombre del titular',
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     const Text(
                          //       'Glassmorphism',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 18,
                          //       ),
                          //     ),
                          //     Switch(
                          //       value: _.useGlassMorphism,
                          //       inactiveTrackColor: Colors.grey,
                          //       activeColor: Colors.white,
                          //       activeTrackColor: Colors.green,
                          //       onChanged: (bool value) {
                          //         _.useGlassMorphism = value;
                          //       },
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     const Text(
                          //       'Card Image',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 18,
                          //       ),
                          //     ),
                          //     Switch(
                          //       value: _.useBackgroundImage,
                          //       inactiveTrackColor: Colors.grey,
                          //       activeColor: Colors.white,
                          //       activeTrackColor: Colors.green,
                          //       onChanged: (bool value) {
                          //         _.useBackgroundImage = value;
                          //       },
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              primary: const Color(0xff1b447b),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              child: const Text(
                                'Pagar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'halter',
                                  fontSize: 14,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _.actualizar();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    final _ = Get.find<SubscriptionController>();
    _.cardNumber = creditCardModel!.cardNumber;
    _.expiryDate = creditCardModel.expiryDate;
    _.cardHolderName = creditCardModel.cardHolderName;
    _.cvvCode = creditCardModel.cvvCode;
    _.isCvvFocused = creditCardModel.isCvvFocused;
  }
}

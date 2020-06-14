import 'package:capitalvotes/blocs/payment_card.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:capitalvotes/shared/form_util.dart';
import 'package:capitalvotes/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final AppBar _screenAppBar = AppBar(
    leading: IconButton(
        icon: Icon(Icons.keyboard_backspace),
        iconSize: 30.0,
        color: Colors.black,
        onPressed: () {}),
    title: Text(
      'Payment Methods',
      style: display2TextStyle,
    ),
    elevation: 0.0,
    backgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    // PAYMENTS CARD BUILDER
    Widget getCardContainer() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.24,
        margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
        padding: EdgeInsets.only(bottom: 10.0),
        child: userProfileBloc.paymentCardList.isEmpty
            ? Center(child: Text('Add A Payment method please'))
            : Center(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileBloc.paymentCardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    PaymentCard paymentCard =
                        userProfileBloc.paymentCardList[index];
                    return PaymentMethodCardWidget(
                      cardBrandImgUrl: paymentCard.cardVendorImageUrl,
                      cardNum: paymentCard.cardNum,
                      cardType: paymentCard.getCardType(),
                      isSelected: paymentCard.isSelected,
                      onTap: () {
                        setState(() {
                          /*
               To achieve effect found with radio buttons
                */
                          // on every card click
                          // set state isSelected = false to deselect all selected cards
                          userProfileBloc.paymentCardList
                              .forEach((element) => element.isSelected = false);
                          // then
                          // set the selected card state isSelected = true
                          paymentCard.isSelected = true;
                        });
                      },
                    );
                  },
                ),
              ),
      );
    }
    final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

    return Scaffold(
      appBar: _screenAppBar,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
//          PAYMENT CARDS CONTAINER
          getCardContainer(),
          Divider(thickness: 2.0, color: Colors.grey[200]),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 16.0),
            child: Text(
              'Add payment method',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PaymentMethodOptionWidget(
                  enabled: userProfileBloc.paymentCardList.length == 3
                      ? false
                      : true,
                  title: 'Add Credit or Debit Card',
                  trailingImgUrl: PaymentMethodImages().mcDarkImgUrl,
                  onTap: () {
                    userProfileBloc.paymentCardList.length == 3
                        ? print('add no more cards')
                        : pushGoTo(context, '/AddPaymentCardScreen');
                  },
                ),
                PaymentMethodOptionWidget(
                  enabled: true,
                  title: 'Paypal',
                  trailingImgUrl: PaymentMethodImages().payPalImgUrl,
                  onTap: () {
                    pushGoTo(context, '/AddPayPalAccountScreen');
                  },
                ),
                PaymentMethodOptionWidget(
                  enabled: true,
                  title: 'Promo code',
                  trailingImgUrl: PaymentMethodImages().promoCodeImgUrl,
                  onTap: () {
                    pushGoTo(context, '/PromoCodeScreen');
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 20.0),
                  child: privacyStatementWidget,
                ),
              ],
            ),
          ),
          Divider(thickness: 2.0, color: Colors.grey[200]),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.07,
              horizontal: screenWidth * 0.08,
            ),
            child: RaisedButton(
              
              child: Text('PROCEED'),
              color: capitalVotesTheme().primaryColor,
              textColor: Colors.white,
              disabledColor: Colors.white,
              disabledTextColor: Colors.black,
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper Widget for privacy statement at the bottom
Widget privacyStatementWidget = FittedBox(
  child: Row(
    children: <Widget>[
      Icon(Icons.lock, size: 18.0),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 12.0, color: Colors.black54),
          children: [
            TextSpan(text: 'Your payment info is stored securely '),
            TextSpan(
              text: ' Learn more',
              style: TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
      )
    ],
  ),
);

// Helper class to handle UI Design and state of payment cards
class PaymentMethodCardWidget extends StatelessWidget {
  final String cardNum;
  final bool isSelected;
  final String cardBrandImgUrl, cardType;
  final VoidCallback onTap;

  PaymentMethodCardWidget(
      {Key key,
      this.cardBrandImgUrl,
      this.cardNum,
      this.cardType,
      this.onTap,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 300.0,
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.285,
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: isSelected
              ? Border.all(
                  color: capitalVotesTheme().primaryColor,
                  width: 2.0,
                )
              : Border.all(color: Colors.white70),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              width: 60.0,
              height: 25.0,
              image: AssetImage(cardBrandImgUrl),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Text('**${cardNum.substring(13)}'),
            Text(cardType),
          ],
        ),
      ),
    );
  }
}

// Helper class to handle UI Design and state of payment method options
class PaymentMethodOptionWidget extends StatelessWidget {
  final bool enabled;
  final double width = 320.0;
  final String title;
  final VoidCallback onTap;
  final String trailingImgUrl;

  const PaymentMethodOptionWidget(
      {Key key, this.onTap, this.enabled, this.trailingImgUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: Offset(0.0, 3.0),
              blurRadius: 2.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: ListTile(
          enabled: enabled,
          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          leading: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(0.0, 3.0),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
          title: Text(
            title,
            style: display2TextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: !enabled ? Colors.grey[300] : display2TextStyle.color,
            ),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: !enabled
                ? SizedBox(
                    width: 0.0,
                  )
                : Image(
                    image: AssetImage(trailingImgUrl),
                    width: 27.0,
                  ),
          ),
        ),
      ),
    );
  }
}

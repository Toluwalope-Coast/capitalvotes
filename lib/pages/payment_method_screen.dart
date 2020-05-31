import 'package:capitalvotes/blocs/payment_card.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
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

    // Helper Method to create card widgets
    Widget getCardContainer(BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height / 4,
        margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: userProfileBloc.paymentCardList.isEmpty
            ? Center(child: Text('Add A Payment method please'))
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: userProfileBloc.paymentCardList.length,
                itemBuilder: (BuildContext context, int index) {
                  PaymentCard paymentCard = userProfileBloc.paymentCardList[index];
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
                        // set state isSeleted = false to deselect all selected cards
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
      );
    }

    return Scaffold(
      appBar: _screenAppBar,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          getCardContainer(context),
          Divider(thickness: 2.0, color: Colors.grey[200]),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 20.0),
            child: Text('Add payment method'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PaymentMethodOptionWidget(
                  title: 'Add Credit or Debit Card',
                  trailingImgUrl: PaymentMethodImages().mcDarkImgUrl,
                  onTap: () {

                  },
                ),
                PaymentMethodOptionWidget(
                  title: 'Paypal',
                  trailingImgUrl: PaymentMethodImages().payPalImgUrl,
                  onTap: () {},
                ),
                PaymentMethodOptionWidget(
                  title: 'Promo code',
                  trailingImgUrl: PaymentMethodImages().promoCodeImgUrl,
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 20.0),
                  child: privacyStatementWidget,
                ),
              ],
            ),
          ),
          Divider(thickness: 2.0, color: Colors.grey[200]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
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
      Icon(Icons.lock, size: 16.0),
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
  final double _paymentCardWidth = 100.0;
  final String cardBrandImgUrl, cardType;
  final Border _isSelectedBorder =
      Border.all(width: 2.0, color: capitalVotesTheme().primaryColor);
  final Border _isNotSelectedBorder =
      Border.all(width: 1.0, color: Colors.grey[300]);
  final VoidCallback onTap;

  PaymentMethodCardWidget(
      {Key key,
      this.cardBrandImgUrl,
      this.cardNum,
      this.cardType,
      this.isSelected,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.0),
        width: _paymentCardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          border: isSelected ? _isSelectedBorder : _isNotSelectedBorder,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 4.0,
              spreadRadius: 4.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: isSelected
                            ? capitalVotesTheme().primaryColor
                            : Colors.grey[200])),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  width: 80.0,
                  height: 40.0,
                  image: AssetImage(cardBrandImgUrl),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text('***${(cardNum).substring(6)}'),
            Text(cardType),
          ],
        ),
      ),
    );
  }
}

// Helper class to handle UI Design and state of payment method options
class PaymentMethodOptionWidget extends StatelessWidget {
  final double width = 320.0;
  final String title;
  final VoidCallback onTap;
  final String trailingImgUrl;

  const PaymentMethodOptionWidget(
      {Key key, this.onTap, this.trailingImgUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 4.0,
              spreadRadius: 4.0,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          leading: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 4.0,
                  spreadRadius: 4.0,
                ),
              ],
            ),
          ),
          title: Text(title, style: display2TextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image(
              image: AssetImage(trailingImgUrl),
              width: 27.0,
            ),
          ),
        ),
      ),
    );
  }
}

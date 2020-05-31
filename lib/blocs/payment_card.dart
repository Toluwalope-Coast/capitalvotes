class PaymentCard {
  String cardNum;
  bool isDebit;
  bool isSelected;
  bool isPaypal;
  String city;
  String email;
  String state;
  String zipCode;
  String country;
  String lastName;
  String firstName;
  String expiryDate;
  String streetAddress1;
  String streetAddress2;
  String verificationValue;
  String cardVendorImageUrl;

  getCardType() {
    if (isDebit) {
      return '(Debit)';
    } else {
      return '(Credit)';
    }
  }

}

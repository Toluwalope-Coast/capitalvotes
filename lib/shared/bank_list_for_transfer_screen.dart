import 'package:capitalvotes/pages/transfer_to_bank_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capitalvotes/services/bank_list_functions.dart';
import 'package:provider/provider.dart';
import 'package:capitalvotes/services/bank_bloc.dart';

class BankListScreen extends StatefulWidget {
  @override
  _BankListScreenState createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  String bankCode;
  String bankName;

  @override
  void initState() {
    super.initState();
    bankCode = '000';
    bankName = ' ';
  }

  @override
  Widget build(BuildContext context) {
    BankBloc _bankBloc = Provider.of<BankBloc>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Select bank for transfer',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 34.0),
        children: <Widget>[
          FutureBuilder<BankListInfo>(
            future: getListOfBanks(),
            builder: (context, snapshot) {
              var response = snapshot.data;
              if (response == null) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text('Getting list of banks... '),
                      Padding(padding: EdgeInsets.only(top: 34.0)),
                      CircularProgressIndicator(
                        strokeWidth: 4.0,
                      ),
                    ],
                  ),
                );
              } else
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: response.data.banks.length,
                  itemBuilder: (context, index) {
//                      sort alphabetically
                    response.data.banks
                        .sort((a, b) => a.name.compareTo(b.name));
//                      an instance of bank
                    Bank bank = response.data.banks[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            _bankBloc.setBankCode = bank.code;
                            _bankBloc.setBankName = bank.name;
                            print(bank.code);
                            print(bank.name);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferToBankScreen()),
                          );
                        },
                        leading: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipOval(
                            child: Image.asset(
                              'images/payment_icons/bank_icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          '${bank.name}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                );
            },
          ),
        ],
      ),
    );
  }
}

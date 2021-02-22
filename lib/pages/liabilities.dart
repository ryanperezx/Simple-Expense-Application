import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpleexpenseapplication/appdrawer.dart';

class Liabilities extends StatefulWidget {
  static const String routeName = '/liabilities';

  Liabilities({Key key}) : super(key: key);

  @override
  _Liabilities createState() => new _Liabilities();
}

class _Liabilities extends State<Liabilities> {
  DateTime selectedDate = DateTime.now();
  var _userTextController = new TextEditingController();
  final f = new DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _userTextController.text = f.format(selectedDate);
      });
  }

  Widget table = new Builder(builder: (BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: DataTable(
        columnSpacing: 15.0,
        columns: [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Item')),
          DataColumn(label: Text('Value'))
        ],
        rows: [
          DataRow(cells: <DataCell>[
            DataCell(Text('1/12/2021')),
            DataCell(Text('Credit Card')),
            DataCell(Text('Lazada')),
            DataCell(Text('Php 10,000')),
          ])
        ],
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
          height: 700,
          padding: const EdgeInsets.all(20),
          //padding for all widget
          child: Stack(children: [
            table,
          ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Theme(
                data: ThemeData(
                  primaryColor: Colors.black,
                  primaryColorDark: Colors.white,
                ),
                child: new Dialog(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(children: <Widget>[
                    Row(
                      children: [
                        Flexible(
                            child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                          ),
                          controller: _userTextController,
                        )),
                        Flexible(
                            child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Icon(
                            Icons.calendar_today,
                          ),
                          onPressed: () => _selectDate(context),
                        )),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Type',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Item',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Value',
                      ),
                    ),
                  ]),
                )),
              );
            },
          );
        },
      ),
      drawer: AppDrawer(),
    );
  }

  @override
  void initState() {
    super.initState();
    _userTextController.text = f.format(selectedDate);
  }

  @override
  void dispose() {
    _userTextController.dispose();
    super.dispose();
  }
}

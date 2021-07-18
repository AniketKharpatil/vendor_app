import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/vendorhome.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({Key? key}) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  late String id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String category = '', prodname = '';
  var price , gst , delcharge , offer ;

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => category = value!,
    );
  }

  TextFormField buildTextFormField2() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => prodname = value!,
    );
  }

  void createData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DocumentReference ref = await db.collection('products').add({
        'category': category,
        'prod_name': prodname,
        'price': price,
        'gst': gst,
        'del_charge': delcharge,
        'offer': offer
      });
      setState(() => id = ref.id);
      showDialog(context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Submitted'),
        content: Text('Product Data is successfully uploaded to database'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          )
        ],
      ),);
      
      print(ref.id);
    }
  }

  TextFormField buildTextFormField3() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => price = value,
    );
  }

  TextFormField buildTextFormField4() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => gst = value,
    );
  }

  TextFormField buildTextFormField5() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => delcharge = value,
    );
  }

  TextFormField buildTextFormField6() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => offer = value!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Welcome Vendor',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 125,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            ),
                            child: Text(
                              'All Items',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        height: 38,
                        width: 125,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueAccent, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            ),
                            child: Text(
                              'Out of Stock',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () => Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => UpdateData()),
                      //         ),
                      //     child: Text('Out of Stock')),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Add New',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            color: Colors.grey[200]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 50, bottom: 12, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 9, top: 2),
                              child: Text('Upload'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            color: Colors.grey[200]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 50, bottom: 12, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 9, top: 2),
                              child: Text('Upload'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            color: Colors.grey[200]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 50, bottom: 12, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 9, top: 2),
                              child: Text('Upload'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text('Category',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        width: 48.0,
                      ),
                      Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.grey[100],
                        ),
                        child: buildTextFormField(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text('Product Name',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        width: 14.0,
                      ),
                      Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.grey[100],
                        ),
                        child: buildTextFormField2(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text('Price Amount',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        width: 19.0,
                      ),
                      Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.grey[100],
                        ),
                        child: buildTextFormField3(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text('GST Amount',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.grey[100],
                        ),
                        child: buildTextFormField4(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text('Delivery Charge',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        width: 185,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.grey[100],
                        ),
                        child: buildTextFormField5(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text('Offer(%)',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        width: 54.0,
                      ),
                      Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.grey[100],
                        ),
                        child: buildTextFormField6(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.0,
                  ),
                  Material(
                    elevation: 5,
                    color: Colors.lightBlueAccent[400],
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: createData,
                      // onPressed: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => VendorPage()),
                      //),
                      minWidth: 260.0,
                      height: 40.0,
                      child: Text(
                        "Upload",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                  //ElevatedButton(onPressed:()=>null, child:Text('Submit'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFormFieldPage extends StatefulWidget {
  TextFormFieldPage({Key key}) : super(key: key);

  @override
  _TextFormFieldPageState createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _password;
  String _cinsiyet;
  bool _ilgiAlani1 = false;
  bool _ilgiAlani2 = false;
  bool _formOnayla = false;
  double _puan=0;
  String _mesaj;

  String _konu;

  List<String> _konuListesi=[
  'Dilek',
  'Şikayet',
  'Öneri',
  'Tebrik'

  ];



  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Form Field")),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            onSaved: (x) {
                              _name = x;
                            },
                            validator: _nameControl,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade300),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade300),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              errorStyle: TextStyle(color: Colors.red.shade300),
                              prefixIcon: Icon(Icons.account_box),
                              labelText: "Ad Soyad",
                              labelStyle: TextStyle(fontSize: 20),
                              hintText: "Adınız Soyadınız...",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            onSaved: (x) {
                              _email = x;
                            },
                            validator: _emailControl,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade300),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade300),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              errorStyle: TextStyle(color: Colors.red.shade300),
                              // focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.amber)),
                              // enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.pink)),
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 20),
                              hintText: "Email Adresiniz...",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                onSaved: (x) {
                                  _password = x;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                validator: _passwordControl,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red.shade300),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red.shade300),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  errorStyle:
                                      TextStyle(color: Colors.red.shade300),
                                  // focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.amber)),
                                  // enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.pink)),
                                  prefixIcon: Icon(Icons.email),
                                  labelText: "Şifre",
                                  labelStyle: TextStyle(fontSize: 20),
                                  hintText: "Şifreniz...",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                              ),
                              Text(
                                  "* Boşluk İçermemelidir.\n* En az 8 karakter olmalıdır.\n* Büyük harf içermelidir.\n* Rakam içermelidir.\n * Özel karakter içermelidir.")
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Cinsiyet",
                                  style: TextStyle(fontSize: 20),
                                ),
                                RadioListTile<String>(
                                    title: Text("Kadın"),
                                    value: "Kadın",
                                    groupValue: _cinsiyet,
                                    onChanged: (x) {
                                      setState(() {
                                        _cinsiyet = x;
                                      });
                                      debugPrint(_cinsiyet);
                                    }),
                                RadioListTile<String>(
                                    title: Text("Erkek"),
                                    value: "Erkek",
                                    groupValue: _cinsiyet,
                                    onChanged: (x) {
                                      setState(() {
                                        _cinsiyet = x;
                                      });
                                      debugPrint(_cinsiyet);
                                    }),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "İLgi Alanları",
                                  style: TextStyle(fontSize: 20),
                                ),
                                CheckboxListTile(
                                  title: Text("İlgi Alanı 1"),
                                  value: _ilgiAlani1,
                                  onChanged: (x) {
                                    setState(() {
                                      _ilgiAlani1 = x;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text("İlgi Alanı 2"),
                                  value: _ilgiAlani2,
                                  onChanged: (x) {
                                    setState(() {
                                      _ilgiAlani2 = x;
                                    });
                                  },
                                )
                              ],
                            )),
                       
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Puan",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Slider(
                                  activeColor: Colors.teal,
                                  label: _puan.toString(),
                                  min: 0,
                                  max: 5,
                                  divisions: 5,
                                  value: _puan,
                                  onChanged: (x) {
                                    setState(() {
                                      _puan = x;
                                    });
                                  },
                                ),
                                
                              ],
                            )),
                       
                       
                        Container(
                          width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                             
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Konu",
                                  style: TextStyle(fontSize: 20),
                                ),
                                DropdownButton(
                                  elevation: 10,
                                  isExpanded: true,
                                  hint: Text("Seçiniz"),
                                  value: _konu,
                                  items: _konuListesi.map((e) => DropdownMenuItem(child: Text(e.toString()), value: e,)).toList(), onChanged: (x){
                                  setState(() {
                                    _konu=x;
                                  });
                                })
                                
                                
                              ],
                            )),
                       

                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            onSaved: (x) {
                              _mesaj = x;
                            },
                            validator: (x) {

                              if (x.isEmpty) {
                                return 'Lütfen boş geçmeyiniz';
                              }
                              else if(x.length<6){

                                return 'Mesaj uzunluğu en az 6 karakter olamlıdır!';
                                
                              }
                              return null;
                            },
                            minLines: 3,
                            maxLines: 10,
                            maxLength: 500,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade300),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade300),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              errorStyle: TextStyle(color: Colors.red.shade300),
                              prefixIcon: Icon(Icons.short_text),
                              labelText: "Mesajınız",
                              labelStyle: TextStyle(fontSize: 20),
                              hintText: "Mesajınız...",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SwitchListTile(
                                  
                                  selected: true,
                                  title: Text(
                                      "Tüm Bilgilerin Doğruluğunu Onaylıyorum"),
                                  value: _formOnayla,
                                  onChanged: (x) {
                                    setState(() {
                                      _formOnayla = x;
                                    });
                                  },
                                ),
                              ],
                            )),
                        Container(
                          height: 100,
                        )

                        /*  Container(
                            width: double.infinity,
                            height: 70,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton.icon(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)),
                                color: Colors.teal,
                                onPressed: () {
                                  _girisBilgileriniOnayla();
                                },
                                icon: Icon(
                                  Icons.save,
                                  size: 32,
                                ),
                                label: Text(
                                  "Kaydet",
                                  style: TextStyle(fontSize: 24),
                                ))), */
                      ],
                    ))))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _girisBilgileriniOnayla();
        },
        child: Icon(Icons.send),
      ),
    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate() && _formOnayla==true) {
      formKey.currentState.save();
      formKey.currentState.reset();
      setState(() {
        _autoValidate = false;
      });

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sonuç"),
              content: Container(
                alignment: Alignment.center,
                width: 200,
                child: Column(

                  children: <Widget>[
                    Image.asset("assets/images/success.png", width: 100, height: 100),
                    Container(height:10),
                    Text("Mesajınız İletildi!"),
                  ],
                ),
              ),
              actions: <Widget>[
                RaisedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    label: Text("Kapat"))
              ],
            );
          });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }

    debugPrint(
        "Girilen isim: $_name, girilen email: $_email, girilen şifre: $_password, girilen mesaj: $_mesaj");
  }

  String _emailControl(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return "Geçerli bir email giriniz!";
    }
  }

  String _nameControl(String name) {
    Pattern pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';

    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(name) || name.length < 6) {
      return "Geçerli bir isim giriniz!";
    }
  }

  String _passwordControl(String password) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+-]).{8,}$';

    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(password) || password.contains(" ")) {
      return "Geçerli bir şifre giriniz!";
    }
  }
}

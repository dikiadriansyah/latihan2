import 'package:flutter/material.dart';

void main() {
  runApp(AppKu());
}

class AppKu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Latihan 1 Flutter',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const Scaffold(
        body: Center( // parent dari button
          /*
          Kita coba ubah widget Text yang menampilkan "Hello world!" dengan widget Heading yang kita buat.
           */

          child: BiggerText( // mengubah widget text
            text: "Hai Dunia Flutter",
          ),  // Ubah widget Heading ke PerubahanText
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget{
  /*
  StatelessWidget adalah widget yang nilai state-nya tidak dapat berubah (immutable)
  maka widget tersebut lebih bersifat statis dan memiliki interaksi yang terbatas.
   */

  final String text; // state text bersifat final
  // variabel text diatas merupakan contoh pendeklarasian state pada suatu widget.


  const Heading({Key? key, required this.text}): super(key: key); // lalu state text masuk ke constructor

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold
      )
    );
  }
}

class BiggerText extends StatefulWidget{
  final String text;

  const BiggerText({Key? key, required this.text}): super(key: key);

  @override
  _BiggerTextState createState()=> _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText>{
  double _textSize = 16.4;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
          child: const Text("Perbesar"),
          onPressed: (){
            setState((){
              _textSize = 32.0; // ukuran text diubah menjadi 32
            });
            /*
            Ketika tombol "Perbesar" ditekan, text "Hello world!" akan membesar karena state _textSize diubah nilainya.
             */
          },
        )
      ]
    );
  }
}
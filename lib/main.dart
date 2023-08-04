import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP using Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade500),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "BMIApp"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor= Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color:Colors.amber,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 21),
                TextField(
                  controller: wtController,

                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in Kgs'),
                    prefix: Icon(Icons.line_weight),
                  ),
                    keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in feats'),
                    prefix: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in inches '),
                    prefix: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if (wt!="" && ft!="" && inch!=""){
                      //BMI Calculation
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) * iInch;
                    var tCm = tInch*2.54;
                    var tM= tCm/100;
                    var bmi  = iWt/(tM*tM);
                    var msg="";
                    if(bmi>25){
                      msg="You're Overweight!!!";
                      bgColor= Colors.red;

                    }
                    else if(bmi<18){
                      msg="You're Underweight!!!";
                      bgColor= Colors.yellow;
                    }
                    else{
                      msg="You're Fit :)";
                      bgColor= Colors.greenAccent;
                    }
                    setState(() {
                      result= "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    });
                  }
                  else{
                    setState(() {
                      result = "Please fill all the required fields";
                    });
                  }
                },
                    child: Text('Calculate')
                ),
                Text(result, style: TextStyle(fontSize: 16),)
              ]
            ),
          ),
        ),
      )
      );// This trailing comma makes auto-formatting nicer for build methods.
  }
}

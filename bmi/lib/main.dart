import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var wtCont = TextEditingController();
  var ftCont = TextEditingController();
  var inCont = TextEditingController();

  var result = " ";
  var bgcolor = Colors.blue.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 70),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:80),
                  child: Row(
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/bmi.jpg',width: 50,
                          //height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'BMI',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtCont,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                      label: Text('Enter your Weight (in kgs)'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftCont,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text('Enter your Height (in feet)'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(//Sizebox
                  height: 11,
                ),
                TextField(
                  controller: inCont,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text('Enter your Height (in inch)'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(onPressed: (){
                    var wt = wtCont.text.toString();
                    var ft = ftCont.text.toString();
                    var inch = inCont.text.toString();

                    if(wt != "" && ft != "" && inch!= ""){
                      //BMI calculate
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);


                      var tInch = (ift*12) + iInch;
                      var tcm = tInch * 2.54;
                      var tm = tcm/100;
                      var bmi = iwt/(tm*tm);

                      var msg = '';

                      if (bmi>25){
                        msg = "OverWeigth!!";
                        bgcolor = Colors.orange.shade200;
                      }else if(bmi<18){
                        msg = "UnderWeigth!!";
                        bgcolor = Colors.red.shade200;
                      }else{
                        msg = "Healthy!!";
                        bgcolor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "${msg}  Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });

                    } else{
                      setState(() {
                        result = "please fill all the required blanks!!";
                      });
                    }

                  }, child: Text('Calculate')),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(result,style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      )
    );
  }
}

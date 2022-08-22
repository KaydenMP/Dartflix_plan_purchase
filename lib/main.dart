import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var personName;
var name;
var result;
var dropDownValueProfile;
var dropDownValuePlan;
List profileNumbers = [1, 2, 3, 4, 5];
List plan = ['HD', 'FHD', 'Stream + Download'];

calculate() {
  if (dropDownValuePlan == 'HD') {
    result = dropDownValueProfile * 18000;
    print('$result');
  } else if (dropDownValuePlan == 'FHD') {
    result = dropDownValueProfile * 27000;
    print('$result');
  } else {
    result = dropDownValueProfile * 31000;
    print('$result');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController personName = TextEditingController();
  TextEditingController profilePurchase = TextEditingController();
  TextEditingController planController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 217, 233),
        resizeToAvoidBottomInset: false,
        body:
            SafeArea(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Center(child: Text('DARTFLIX', style: GoogleFonts.anton(fontWeight: FontWeight.bold, fontSize: 40),)),
                ),
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
            
                const Icon(Icons.person),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: personName,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Name'),
                          hintText: 'Enter your name'),
                    ),
                  ),
                ),
              ],
                      ),
                      Row(children: [
              const Icon(Icons.people),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                      controller: profilePurchase,
                      decoration: InputDecoration(
                        suffixIcon: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: DropdownButton(
                              hint: const Text(' Number of profiles'),
                              value: dropDownValueProfile,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_sharp),
                              items: profileNumbers.map((profile) {
                                return DropdownMenuItem(
                                    value: profile,
                                    child: Text(profile.toString()));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropDownValueProfile = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                        border: const OutlineInputBorder(),
                      )),
                ),
              ),
                      ]),
                      Row(
              children: [
                const Icon(Icons.movie_filter_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                        controller: planController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            suffixIcon: DropdownButtonHideUnderline(
                              // child: const Padding(
                              //   padding: EdgeInsets.only(right: 8.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5, left: 5),
                                child: DropdownButton(
                                    isExpanded: true,
                                    hint: const Text('Choose a Plan '),
                                    value: dropDownValuePlan,
                                    items: plan.map((planType) {
                                      return DropdownMenuItem(
                                          value: planType,
                                          child: Text(planType.toString()));
                                    }).toList(),
                                    onChanged: ((value) {
                                      setState(() {
                                        dropDownValuePlan = value;
                                      });
                                    })),
                              ),
                            ))),
                  ),
                ),
              ],
                      ),
                      ElevatedButton(
                onPressed: () {
                  calculate();
                  setState(
                    () {
                      name = personName.text;
                      Text(' Name : $name ');
                      Text(
                          'Amount : $result MMK for $dropDownValueProfile of Dartflix with $dropDownValuePlan Plan');
                    },
                  );
                },
                child: const Text('Calculate')),
                      name == null
                ? Container()
                : Text(' Name : $name ', style: GoogleFonts.acme(fontSize: 25)),
                      result == null ||
                    dropDownValueProfile == null ||
                    dropDownValuePlan == null
                ? Container()
                : Text(
                    'Amount : $result MMK for $dropDownValueProfile of Dartflix with $dropDownValuePlan Plan',
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                    ]),
            ));

    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children:  [const Icon(Icons.person, size: 50,),
    //           TextField(
    //           controller: personName,
    //           decoration: const InputDecoration(
    //           border: OutlineInputBorder(),
    //           label: Text('Name'),
    //           hintText: 'Enter your name',
    //           ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // ),
  }
}

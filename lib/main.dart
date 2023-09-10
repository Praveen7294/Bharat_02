import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController inputController = TextEditingController();
  double result = 0;

  List<String> items = ['Fahrenheit', 'Kelvin', 'Celsius'];
  int selected1 = 0;
  int selected2 = 0;

  var temperatureScaleInput = "";
  var temperatureScaleOutput = "";

  String temperatureOutput(double inputText) {
    var tempInput = inputText;
    var tempOutput = 0.0;

    if (temperatureScaleInput == "Fahrenheit" &&
        temperatureScaleOutput == "Kelvin") {
      tempOutput = (tempInput - 32) * 5 / 9 + 273;
    } else if (temperatureScaleInput == "Fahrenheit" &&
        temperatureScaleOutput == "Celsius") {
      tempOutput = (tempInput - 32) / 1.8;
    }

    if (temperatureScaleInput == "Kelvin" &&
        temperatureScaleOutput == "Fahrenheit") {
      tempOutput = (tempInput - 273) * 1.8 + 32;
    } else if (temperatureScaleInput == "Kelvin" &&
        temperatureScaleOutput == "Celsius") {
      tempOutput = tempInput - 273;
    }

    if (temperatureScaleInput == "Celsius" &&
        temperatureScaleOutput == "Fahrenheit") {
      tempOutput = tempInput * 1.8 + 32;
    } else if (temperatureScaleInput == "Celsius" &&
        temperatureScaleOutput == "Kelvin") {
      tempOutput = tempInput + 273;
    }

    if (temperatureScaleInput == temperatureScaleOutput) {
      tempOutput = tempInput;
    }

    return tempOutput.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 58) / 3;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.93),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "TEMPERATURE CONVERSION",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          "TEMPERATURE TO BE CONVERTED:",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 110,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 0),
                              child: TextField(
                                controller: inputController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: "Enter the temperature",
                                  isDense: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                                height: 43,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.22),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemExtent: itemWidth + 2,
                                  itemCount: items.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected1 = index;
                                          temperatureScaleInput = items[index];
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: selected1 == index
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            items[index],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          "TO WHICH SCALE:",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                        alignment: Alignment.center,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            height: 43,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.22),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemExtent: itemWidth + 2.3,
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected2 = index;
                                      temperatureScaleOutput = items[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: selected2 == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        items[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Text(
                        "RESULT:",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${temperatureOutput(double.tryParse(inputController.text) ?? 0)} ",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

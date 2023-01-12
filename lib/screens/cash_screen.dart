import 'package:cashintransect/widgets/custom_button.dart';
import 'package:cashintransect/widgets/custom_snack_bar.dart';
import 'package:cashintransect/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class CashScreen extends StatefulWidget {
  const CashScreen({Key? key}) : super(key: key);

  @override
  _CashScreenState createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {
  TextEditingController hundredControl = TextEditingController();
  TextEditingController fiftyControl = TextEditingController();
  TextEditingController twentyControl = TextEditingController();
  TextEditingController tenControl = TextEditingController();
  TextEditingController fiveControl = TextEditingController();
  TextEditingController oneControl = TextEditingController();

  var hundred;
  var fifty;
  var twenty;
  var ten;
  var five;
  var one;
  var total;
  var totalCash;

  String? locationSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                "100's",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('X'),
              CustomTextField(
                width: 130,
                onChanged: (value) {
                  hundred = int.parse('100') *
                      int.parse(hundredControl.text.isEmpty
                          ? '0'
                          : hundredControl.text);
                  setState(() {});
                },
                textColor: Colors.white,
                cardColor: Colors.black,
                textEditingController: hundredControl,
              ),
              // const SizedBox(width: 60),
              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(hundred == null ? '\$0' : hundred.toString()),
              const Spacer()
            ],
          ),
          Row(
            children: [
              const Text(
                "50's",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('X'),
              CustomTextField(
                width: 130,
                onChanged: (value) {
                  fifty = int.parse('50') *
                      int.parse(
                          fiftyControl.text.isEmpty ? '0' : fiftyControl.text);
                  setState(() {});
                },
                textColor: Colors.white,
                cardColor: Colors.black,
                textEditingController: fiftyControl,
              ),
              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(fifty == null ? '\$0' : fifty.toString()),
              const Spacer()
            ],
          ),
          Row(
            children: [
              const Text(
                "20's",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('X'),
              CustomTextField(
                width: 130,
                onChanged: (value) {
                  twenty = int.parse('20') *
                      int.parse(twentyControl.text.isEmpty
                          ? '0'
                          : twentyControl.text);
                  setState(() {});
                },
                textColor: Colors.white,
                cardColor: Colors.black,
                textEditingController: twentyControl,
              ),
              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(twenty == null ? '\$0' : twenty.toString()),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Text(
                "10's",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('X'),
              CustomTextField(
                width: 130,
                onChanged: (value) {
                  ten = int.parse('10') *
                      int.parse(
                          tenControl.text.isEmpty ? '0' : tenControl.text);
                  setState(() {});
                },
                textColor: Colors.white,
                cardColor: Colors.black,
                textEditingController: tenControl,
              ),
              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(ten == null ? '\$0' : ten.toString()),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Text(
                "5's",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('X'),
              CustomTextField(
                width: 130,
                onChanged: (value) {
                  five = int.parse('5') *
                      int.parse(
                          fiveControl.text.isEmpty ? '0' : fiveControl.text);
                  setState(() {});
                },
                textColor: Colors.white,
                cardColor: Colors.black,
                textEditingController: fiveControl,
              ),
              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(five == null ? '\$0' : five.toString()),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Text(
                "1's",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              // const SizedBox(width: 50),
              const Text('X'),
              CustomTextField(
                width: 130,
                onChanged: (value) {
                  one = int.parse('1') *
                      int.parse(
                          oneControl.text.isEmpty ? '0' : oneControl.text);
                  setState(() {});
                },
                textColor: Colors.white,
                cardColor: Colors.black,
                textEditingController: oneControl,
              ),

              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(one == null ? '\$0' : one.toString()),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Text(
                'Total Cash =',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(width: 5),
              Text(
                total == null ? '\$0' : total.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.red),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Total Bill  =',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(width: 5),
              Text(
                totalCash == null ? '\$0' : totalCash.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.pinkAccent),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                  onTap: locationSelect != null
                      ? null
                      : () {
                          showPlacePicker();
                        },
                  child: const Icon(Icons.location_pin)),
              Expanded(
                  child: Text(
                locationSelect == null
                    ? 'Select Location'
                    : locationSelect.toString(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    hundred = int.parse('100') *
                        int.parse(hundredControl.text.isEmpty
                            ? '0'
                            : hundredControl.text);

                    fifty = int.parse('50') *
                        int.parse(fiftyControl.text.isEmpty
                            ? '0'
                            : fiftyControl.text);
                    twenty = int.parse('20') *
                        int.parse(twentyControl.text.isEmpty
                            ? '0'
                            : twentyControl.text);
                    ten = int.parse('10') *
                        int.parse(
                            tenControl.text.isEmpty ? '0' : tenControl.text);
                    five = int.parse('5') *
                        int.parse(
                            fiveControl.text.isEmpty ? '0' : fiveControl.text);
                    one = int.parse('1') *
                        int.parse(
                            oneControl.text.isEmpty ? '0' : oneControl.text);

                    total = int.parse(hundred.toString()) +
                        int.parse(fifty.toString()) +
                        int.parse(twenty.toString()) +
                        int.parse(ten.toString()) +
                        int.parse(five.toString()) +
                        int.parse(one.toString());

                    totalCash = int.parse(hundredControl.text.isEmpty
                            ? '0'
                            : hundredControl.text) +
                        int.parse(fiftyControl.text.isEmpty
                            ? '0'
                            : fiftyControl.text) +
                        int.parse(twentyControl.text.isEmpty
                            ? '0'
                            : twentyControl.text) +
                        int.parse(
                            tenControl.text.isEmpty ? '0' : tenControl.text) +
                        int.parse(
                            fiveControl.text.isEmpty ? '0' : fiveControl.text) +
                        int.parse(
                            oneControl.text.isEmpty ? '0' : oneControl.text);
                    setState(() {});
                  },
                  title: 'Cal',
                ),
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    hundredControl.clear();
                    fiftyControl.clear();
                    twentyControl.clear();
                    tenControl.clear();
                    fiveControl.clear();
                    oneControl.clear();
                    setState(() {});
                  },
                  title: 'Clea',
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void showPlacePicker() async {
    await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        maintainState: true,
        settings: const RouteSettings(name: 'Objext', arguments: Card()),
        builder: (context) => Stack(
              children: [
                Card(
                  child: PlacePicker(
                    onPlacePicked: (result) {
                      customSuccessSnackBar(
                          context, result.formattedAddress.toString());
                      print(result.adrAddress);
                      locationSelect = result.formattedAddress.toString();
                      setState(() {});
                      Navigator.pop(context);
                    },
                    autocompleteOnTrailingWhitespace: true,
                    forceAndroidLocationManager: true,
                    resizeToAvoidBottomInset: true,
                    usePlaceDetailSearch: true,
                    enableMapTypeButton: true,
                    selectInitialPosition: true,
                    useCurrentLocation: true,
                    hintText: 'Search your location',
                    initialMapType: MapType.terrain,
                    searchingText: 'Search Your Location',
                    forceSearchOnZoomChanged: true,
                    hidePlaceDetailsWhenDraggingPin: true,
                    usePinPointingSearch: true,
                    apiKey: 'AIzaSyCg5-A_d4ezu2U5PSi5tr-FW9X4-cAQod8',
                    initialPosition: const LatLng(0.8561, 0.2930),
                  ),
                ),
              ],
            )));
  }
}

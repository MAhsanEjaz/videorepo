import 'package:cashintransect/screens/home_screen.dart';
import 'package:cashintransect/widgets/custom_appbar.dart';
import 'package:cashintransect/widgets/custom_button.dart';
import 'package:cashintransect/widgets/custom_snack_bar.dart';
import 'package:cashintransect/widgets/custom_textfield.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  String? imei;
  String? product;
  String? name;
  String? device;

  getImei() async {
    imei = await DeviceInformation.deviceIMEINumber;
    product = await DeviceInformation.hardware;
    name = await DeviceInformation.deviceName;
    device = await DeviceInformation.platformVersion;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getImei();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
          context, 'Cash in transit', Colors.black, Colors.transparent),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xffd3e2df),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/623483706/vector/cash-and-valuables-in-transit-guard-man.jpg?s=612x612&w=0&k=20&c=BX-2j075emuf8qK3roJLTE4VY_mFBsig5bClBplikR8='),
                )),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    color: Color(0xffd3e2df),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Text(imei.toString()),
                      Text(product.toString()),
                      Text(device.toString()),
                      Text(
                        name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                      CustomTextField(
                        hint: 'Email',
                        textEditingController: emailControl,
                      ),
                      CustomTextField(
                        hint: 'Password',
                        textEditingController: passwordControl,
                      ),
                      CustomButton(
                        width: double.infinity,
                        height: 45,
                        title: 'Login',
                        onTap: () {
                          if (validation()) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                        },
                      ),
                      const SizedBox(height: 10)
                    ],
                  ))),
        ],
      ),
    );
  }

  bool validation() {
    if (emailControl.text.isEmpty) {
      customSnackBar(context, 'Please enter your email');
      return false;
    } else if (passwordControl.text.isEmpty) {
      customSnackBar(context, 'Please enter your password');
      return false;
    } else {
      return true;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppFlutter extends StatefulWidget {
  const WhatsAppFlutter({Key? key}) : super(key: key);

  @override
  _WhatsAppFlutterState createState() => _WhatsAppFlutterState();
}

class _WhatsAppFlutterState extends State<WhatsAppFlutter> {
  List<String> numnber = ['03313760067', '03313760068', '03313760069'];

  _launchWhatsapp(BuildContext context, String numbers) async {
    var whatsapp = numbers;
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello how r you");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: numnber.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      _launchWhatsapp(context, numnber[index]);
                    },
                    child: const Text('Send Message'),
                  );
                })
          ],
        ),
      ),
    );
  }
}

import 'package:emakina_task/app/resources/strings.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.privacyPolicyPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('Privacy Policy'),
          ),
        ),
      ),
    );
  }
}

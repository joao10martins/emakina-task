
import 'package:emakina_task/app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.privacyPolicyPageTitle),
      ),
      body: InAppWebView(
        initialFile: 'assets/privacyPolicy/privacy.html',
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            preferredContentMode: UserPreferredContentMode.MOBILE,
          ),
        ),
        onWebViewCreated: (InAppWebViewController webViewController) {
        },
      ),
    );
  }
}

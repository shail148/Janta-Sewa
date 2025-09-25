import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:janta_sewa/components/custom_app_bar.dart';

class JoinBjpVolunteerPage extends StatefulWidget {
  const JoinBjpVolunteerPage({super.key});

  @override
  State<JoinBjpVolunteerPage> createState() => _JoinBjpVolunteerPageState();
}

class _JoinBjpVolunteerPageState extends State<JoinBjpVolunteerPage> {
  late final WebViewController webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
          onWebResourceError: (error) => debugPrint("WebView error: ${error.description}"),
        ),
      )
      ..loadRequest(Uri.parse('https://membership.bjp.org/en/home/login'));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      /* onPopInvoked: (didPop) async {
        if (!didPop && await webViewController.canGoBack()) {
          webViewController.goBack();
        } else {
          Get.back();
        }
      }, */
      onPopInvokedWithResult: (didPop, result) async {
        // If WebView can go back, just navigate inside it
        if (await webViewController.canGoBack()) {
          webViewController.goBack();
          return; // stop here so Flutter/GetX doesn't pop this page
        }

        // Otherwise, let Flutter finish the pop if it hasn’t already
        if (!didPop) {
          Get.back(result: result);
        }
      },

      child: Scaffold(
        appBar: CustomTopAppBar(
          title: 'Janta Sewa',
          leftIcon: const Icon(Icons.arrow_back_ios_new_outlined, size: 30),
          onLeftTap: () => Get.back(),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: webViewController),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

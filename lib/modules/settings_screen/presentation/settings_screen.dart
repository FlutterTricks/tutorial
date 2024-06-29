import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:upi_quick_qr/core/constants/constants.dart';
import 'package:upi_quick_qr/core/extensions/build_context_extension.dart';
import 'package:upi_quick_qr/core/extensions/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String version = "";
  @override
  void initState() {
    super.initState();
    //on First frame drawn
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      version = (await PackageInfo.fromPlatform()).version;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card.outlined(
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  ListTile(
                    title: const Text("Rate Us"),
                    leading: const Icon(Icons.star),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      InAppReview.instance.openStoreListing();
                    },
                  ),
                  const CustomDivider(),
                  ListTile(
                    title: const Text("Share"),
                    leading: const Icon(Icons.share),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Share.share(
                          '${S.appName}\nCheckout this app to get UPI QR code with fixed amount and much more : ${S.feedbackUrl}',
                          subject: "Share ${S.appName}");
                    },
                  ),
                  const CustomDivider(),
                  ListTile(
                      title: const Text("Privacy Policy"),
                      leading: const Icon(Icons.policy),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        canLaunchUrl(Uri.parse(S.privacyPolicyUrl))
                            .then((value) {
                          if (value) {
                            launchUrl(Uri.parse(S.privacyPolicyUrl));
                          } else {
                            if (context.mounted) {
                              context.showErrorSnackBar(
                                const Text("Unable to open Url"),
                              );
                            }
                          }
                        });
                      }),
                  const CustomDivider(),
                  ListTile(
                    title: const Text("Give Feedback"),
                    leading: const Icon(Icons.mail),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      canLaunchUrl(Uri.parse(S.feedbackUrl)).then((value) {
                        if (value) {
                          launchUrl(Uri.parse(S.feedbackUrl));
                        } else {
                          if (context.mounted) {
                            context.showErrorSnackBar(
                              const Text("Unable to open App"),
                            );
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Card.outlined(
              child: ListTile(
                title: const Text("Try Our Other Apps"),
                leading: const Icon(Icons.info),
                onTap: () {
                  canLaunchUrl(Uri.parse(S.ourAppsUrl)).then((value) {
                    if (value) {
                      launchUrl(Uri.parse(S.ourAppsUrl));
                    }
                  });
                },
                // trailing: Icon(Icons.chevron_right),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Text("Version $version"),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 30,
      endIndent: 30,
      height: 8,
    );
  }
}

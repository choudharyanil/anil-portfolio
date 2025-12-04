import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_app/utils/app_colors.dart';
import 'package:portfolio_app/utils/app_strings.dart';
import 'package:portfolio_app/utils/alert_helper.dart';
import 'package:portfolio_app/widgets/gradientbutton.dart';
import '../utils/sizes.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController msgCtrl = TextEditingController();

  bool isLoading = false;

  // ------------ EMAIL VALIDATION ------------
  bool _isValidEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  // ------------ SEND EMAIL TO FORMSUBMIT ------------
  // Future<bool> sendEmail() async {
  //   final url = Uri.parse("https://formsubmit.co/ajax/kumaranilkumar432@gmail.com");
  //
  //   final response = await http.post(
  //     url,
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({
  //       "name": nameCtrl.text.trim(),
  //       "email": emailCtrl.text.trim(),
  //       "message": msgCtrl.text.trim(),
  //       "_captcha": "false",
  //     }),
  //   );
  //
  //   return response.statusCode == 200;
  // }
  Future<bool> sendEmail() async {
    final url = Uri.parse(
      "https://formsubmit.co/ajax/5cb719388e13272e3a99e341e0d392c3",
    );

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": nameCtrl.text.trim(),
          "email": emailCtrl.text.trim(),
          "message": msgCtrl.text.trim(),
          "_captcha": "false",
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      debugPrint("Email send error: $e");
      return false;
    }
  }


  Future<void> submitForm() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        msgCtrl.text.isEmpty) {
      AlertHelper.error("Missing Fields", "Please fill all fields");
      return;
    }

    if (!_isValidEmail(emailCtrl.text)) {
      AlertHelper.warning("Invalid Email", "Please enter a valid email address");
      return;
    }

    setState(() => isLoading = true);

    bool ok = await sendEmail();

    setState(() => isLoading = false);

    if (ok) {
      AlertHelper.success("Success", "Message sent successfully!");
      nameCtrl.clear();
      emailCtrl.clear();
      msgCtrl.clear();
    } else {
      AlertHelper.error("Error", "Something went wrong. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isMobile = MediaQuery.of(context).size.width < 750;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),

          Container(
            height: 3,
            width: 130,
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 30),

          // ---------------- CONTACT CARDS ----------------
          isMobile
              ? Column(
            children: [
              _contactItem(Icons.phone, "Phone", [AppStrings.phone]),
              const SizedBox(height: 20),
              _contactItem(Icons.email, "Email", [AppStrings.email]),
            ],
          )
              : Row(
            children: [
              Expanded(
                child: _contactItem(Icons.phone, "Phone", [AppStrings.phone]),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _contactItem(Icons.email, "Email", [AppStrings.email]),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // ---------------- MESSAGE FORM ----------------
          Container(
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.05),
                  Colors.white.withValues(alpha: 0.02),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.contactMessage,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                ),

                const SizedBox(height: 24),

                _textField("Name", controller: nameCtrl),
                _textField("Email", controller: emailCtrl),
                _textField("Message", maxLines: 4, controller: msgCtrl),

                const SizedBox(height: 12),

                GradientButton(
                  text: isLoading ? "Sending..." : "Submit",
                  icon: isLoading ? Icons.hourglass_empty : Icons.send,
                  onTap: isLoading ? () {} : submitForm,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ).paddingSymmetric(horizontal: AppSizes.md),
    );
  }

  // ---------------- CONTACT ITEM ----------------
  Widget _contactItem(IconData icon, String title, List<String> lines) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: .05),
            Colors.white.withValues(alpha: .02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.buttonGradient.createShader(bounds),
              child: Icon(icon, size: 28, color: Colors.white)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          ...lines.map(
                (e) => Text(
              e,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- FORM FIELD ----------------
  Widget _textField(String label,
      {int maxLines = 1, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 6),

        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withValues(alpha: .05),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.pinkAccent,
                width: 1.3,
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

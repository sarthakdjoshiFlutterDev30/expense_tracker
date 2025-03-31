import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms and Conditions')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "1. Account Registration\n\n"
          "1.1. To access certain features of the Expense Tracker App, you may be required to register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.\n\n"
          "2. Use of the App\n\n"
          "2.1. You agree to use the Expense Tracker App solely for lawful purposes and in accordance with these Terms.\n\n"
          "3. User Responsibilities\n\n"
          "3.1. You are solely responsible for any data you input into the App, including but not limited to financial information, expenses, and personal data.\n\n"
          "3.2. You agree not to share your account information with others and to notify us immediately of any unauthorized use of your account.\n\n"
          "4. Payment and Subscription\n\n"
          "4.1. Some features of the App may require payment. You agree to pay all fees associated with your use of the App.\n\n"
          "4.2. All payments are non-refundable unless otherwise stated.\n\n"
          "5. Data Privacy\n\n"
          "5.1. Your use of the App is subject to our Privacy Policy, which governs the collection, use, and disclosure of your personal information. By using the App, you consent to the terms of our Privacy Policy.\n\n"
          "5.2. We take reasonable measures to protect your data, but we cannot guarantee its absolute security.\n\n"
          "6. Intellectual Property\n\n"
          "6.1. The App and its contents, including but not limited to text, graphics, logos, and images, are the property of the Company or its licensors and are protected by copyright, trademark, and other intellectual property laws.\n\n"
          "7. Limitation of Liability\n\n"
          "7.1. To the fullest extent permitted by law, the Company shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of the App or these Terms.\n\n"
          "8. Termination\n\n"
          "8.1. We reserve the right to terminate or suspend your account and access to the App at our sole discretion, without notice, for conduct that we believe violates these Terms or is harmful to other users of the App, us, or third parties, or for any other reason.\n\n"
          "9. Governing Law\n\n"
          "9.1. These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law principles.\n\n"
          "10. Changes to Terms\n\n"
          "10.1. We may revise these Terms from time to time. We will notify you of any changes by posting the new Terms on this page. You are advised to review these Terms periodically for any changes.\n\n"
          "11. Contact Us\n\n"
          "11.1. If you have any questions about these Terms, please contact us at [Your Contact Information].\n\n",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

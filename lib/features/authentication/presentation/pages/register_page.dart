import 'package:ahad_ayna_interview_project/core/config/hive_db.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_dimens.dart';
import 'package:ahad_ayna_interview_project/features/app_common/presentation/widgets/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Sign In'),
            const Gap(AppDimens.space8),
            Padding(
              padding: const EdgeInsets.all(AppDimens.defaultPadding),
              child: AppTextFormField(
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.defaultPadding),
              child: AppTextFormField(
                controller: passwordController,
              ),
            ),
            const Gap(AppDimens.space8),
            ElevatedButton(
                onPressed: () async {
                  var user = User(
                      name: nameController.text.trim(),
                      password: passwordController.text.trim());
                  await User.save(user);
                  await AppLocalDB.write(
                      key: AppLocalKeys.currentUser, value: user);

                  print("User is $user");
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}

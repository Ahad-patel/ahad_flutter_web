import 'package:ahad_ayna_interview_project/core/config/app_colors.dart';
import 'package:ahad_ayna_interview_project/core/config/app_font_style.dart';
import 'package:ahad_ayna_interview_project/core/routes/app_route_keys.dart';
import 'package:ahad_ayna_interview_project/core/routes/navigation_service.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_dimens.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_snackbar.dart';
import 'package:ahad_ayna_interview_project/core/utils/common_functions.dart';
import 'package:ahad_ayna_interview_project/features/app_common/presentation/widgets/app_textform_field.dart';
import 'package:ahad_ayna_interview_project/features/authentication/presentation/manager/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  var nameCTRL = TextEditingController();
  var passwordCTRL = TextEditingController();
  var confirmPassCTRL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      lazy: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Register'),
              const Gap(AppDimens.space8),
              AppTextFormField(
                label: 'User Name',
                controller: nameCTRL,
              ),
              AppTextFormField(
                label: 'Password',
                obscureText: true,
                controller: passwordCTRL,
              ),
              AppTextFormField(
                label: 'Confirm Password',
                obscureText: true,
                controller: confirmPassCTRL,
              ),
              // const Gap(AppDimens.space8),
              // ElevatedButton(
              //     onPressed: () async {
              //       await AppLocalDB.deleteAll();
              //     },
              //     child: Text('Clear All ')),
              const Gap(AppDimens.space8),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state.responseState == ResponseState.success) {
                    context.goNamed(AppRoutes.home);
                  }

                  if (state.responseState == ResponseState.failure) {
                    AppSnackBars.showSnackBar(
                        alertType: AlertType.error, message: state.message!);
                  }
                },
                bloc: context.read(),
                builder: (context, state) => ElevatedButton(
                    onPressed: () async {
                      var user = User(
                          name: nameCTRL.text.trim(),
                          password: passwordCTRL.text.trim());

                      context
                          .read<AuthenticationBloc>()
                          .add(RegisterEvent(user: user));

                      var list = await User.getAll();
                      var currentUser = await User.get();
                      print("User List = ${list}");
                      print("Current User = $currentUser");

                      // print("User is $user");
                    },
                    child: Text('Submit')),
              ),
              const Gap(AppDimens.space8),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Do you have an account? "),
                WidgetSpan(
                    child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        NavigationService().pushNamedAndRemoveUntil(
                          AppRoutes.login,
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Login Now',
                        style: AppFS.style(AppDimens.space8,
                            fontColor: AppColors.primary),
                      )),
                ))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

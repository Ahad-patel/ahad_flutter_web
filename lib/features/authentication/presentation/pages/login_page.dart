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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Sign In'),
              const Gap(AppDimens.space8),
              AppTextFormField(
                label: 'User Name',
                controller: nameController,
              ),
              AppTextFormField(
                obscureText: true,
                label: 'Password',
                controller: passwordController,
              ),
              const Gap(AppDimens.space8),
              ElevatedButton(
                  onPressed: () async {
                    print("current user ${(await User.get())?.toMap()}");
                  },
                  child: Text("Get user Name")),
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
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () async {
                        var user = User(
                            name: nameController.text.trim(),
                            password: passwordController.text.trim());
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginEvent(user: user));
                      },
                      child: Text('Submit'));
                },
              ),
              const Gap(AppDimens.space8),
              Text.rich(
                  TextSpan(style: AppFS.style(AppDimens.space8), children: [
                TextSpan(text: "Don't have an account? "),
                WidgetSpan(
                    child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        NavigationService().pushNamedAndRemoveUntil(
                            AppRoutes.register, (route) => false);
                      },
                      child: Text(
                        'Register Now',
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

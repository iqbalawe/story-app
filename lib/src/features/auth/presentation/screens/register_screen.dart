import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/utils/error_mapper.dart';
import 'package:story_app/src/core/utils/my_show_snackbar.dart';
import 'package:story_app/src/core/widgets/app_loading.dart';
import 'package:story_app/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:story_app/src/features/auth/presentation/widgets/auth_footer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isVisible = true;

  void _passwordVisibilityHandler() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          myShowSnackbar(
            context: context,
            text: state.message,
            backgroundColor: Colors.green,
          );
          context.go('/login');
        } else if (state is AuthFailure) {
          final message = ErrorMapper.getErrorMessage(state.message, context);
          myShowSnackbar(context: context, text: message);
        }
      },
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;

        return LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      Text(
                        AppLocalizations.of(context)!.registerTitle,
                        style: textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.registerTagline,
                        style: textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.registerName,
                          suffixIcon: const Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.email,
                          suffixIcon: const Icon(Icons.mail_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.password,
                          suffixIcon: IconButton(
                            onPressed: _passwordVisibilityHandler,
                            icon: Icon(
                              _isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                        obscureText: _isVisible,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                context.read<AuthBloc>().add(
                                  AuthRegisterRequested(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                );
                              },
                        child: state is AuthLoading
                            ? const AppLoading()
                            : Text(
                                AppLocalizations.of(
                                  context,
                                )!.titleRegisterButton,
                              ),
                      ),
                      const Spacer(),
                      AuthFooter(
                        authText:
                            '${AppLocalizations.of(context)!.authLoginText} ',
                        navigationText: AppLocalizations.of(
                          context,
                        )!.titleLoginButton,
                        onTap: () => context.go('/login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

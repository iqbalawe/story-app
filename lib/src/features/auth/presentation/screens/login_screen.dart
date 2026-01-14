import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/utils/error_mapper.dart';
import 'package:story_app/src/core/utils/my_show_snackbar.dart';
import 'package:story_app/src/core/widgets/app_loading.dart';
import 'package:story_app/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:story_app/src/features/auth/presentation/widgets/auth_footer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            final message = ErrorMapper.getErrorMessage(state.message, context);
            myShowSnackbar(context: context, text: message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Story App', style: theme.textTheme.displayLarge),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.loginTagline,
                  style: theme.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon: Icon(Icons.lock_outline),
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
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state is AuthLoading
                      ? null
                      : () {
                          context.read<AuthBloc>().add(
                            AuthLoginRequested(
                              _emailController.text,
                              _passwordController.text,
                            ),
                          );
                        },
                  child: state is AuthLoading
                      ? const AppLoading()
                      : Text(
                          AppLocalizations.of(context)!.titleLoginButton,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                ),
                const SizedBox(height: 40),
                AuthFooter(
                  authText:
                      '${AppLocalizations.of(context)!.authRegisterText} ',
                  navigationText: AppLocalizations.of(
                    context,
                  )!.titleRegisterButton,
                  onTap: () => context.go('/register'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

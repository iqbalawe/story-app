import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/core/core.dart';
import 'package:story_app/src/features/auth/presentation/presentation.dart';

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
        state.maybeWhen(
          registerSuccess: (message) {
            myShowSnackbar(
              context: context,
              text: message,
              backgroundColor: Colors.green,
            );
            context.go('/login');
          },
          failure: (message) {
            final errorMessage = ErrorMapper.getErrorMessage(message, context);
            myShowSnackbar(context: context, text: errorMessage);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;
        final localizations = AppLocalizations.of(context)!;

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

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
                        localizations.registerTitle,
                        style: textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        localizations.registerTagline,
                        style: textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: localizations.registerName,
                          suffixIcon: const Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: localizations.email,
                          suffixIcon: const Icon(Icons.mail_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: localizations.password,
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
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<AuthBloc>().add(
                                  AuthEvent.registerRequested(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                );
                              },
                        child: isLoading
                            ? const AppLoading()
                            : Text(localizations.titleRegisterButton),
                      ),
                      const Spacer(),
                      AuthFooter(
                        authText: '${localizations.authLoginText} ',
                        navigationText: localizations.titleLoginButton,
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

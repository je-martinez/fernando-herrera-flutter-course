import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/bloc.dart';
import 'package:forms_app/presentation/widgets/inputs.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    final username = cubit.state.username;
    final password = cubit.state.password;
    final email = cubit.state.email;

    return Form(
      // key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              label: "Username",
              onChanged: (value) {
                // username = value;
                // _formKey.currentState!.validate();
                cubit.usernameChanged(value);
              },
              errorMessage: username.errorMessage
              // validator: (value) {
              //   if (value == null) return 'El campo es obligatorio';
              //   if (value.isEmpty) return 'El campo es obligatorio';
              //   if (value.trim().isEmpty) return 'El campo es obligatorio';
              //   if (value.length < 6) {
              //     return 'El campo debe tener al menos 3 caracteres';
              //   }
              //   return null;
              // },
              ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: "Email",
            onChanged: (value) {
              // email = value;
              // _formKey.currentState!.validate();
              cubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
            // validator: (value) {
            //   if (value == null) return 'El campo es obligatorio';
            //   if (value.isEmpty) return 'El campo es obligatorio';
            //   if (value.trim().isEmpty) return 'El campo es obligatorio';
            //   final isEmail =
            //       RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
            //   if (!isEmail) {
            //     return 'El campo debe ser un email';
            //   }
            //   return null;
            // },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: "Password",
            obscureText: true,
            errorMessage: password.errorMessage,
            onChanged: (value) {
              // password = value;
              // _formKey.currentState!.validate();
              cubit.passwordChanged(value);
            },
            // validator: (value) {
            //   if (value == null) return 'El campo es obligatorio';
            //   if (value.isEmpty) return 'El campo es obligatorio';
            //   if (value.trim().isEmpty) return 'El campo es obligatorio';
            //   if (value.length < 6) {
            //     return 'El campo debe tener al menos 6 caracteres';
            //   }
            //   return null;
            // },
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;
              cubit.onSubmit();
            },
            label: const Text('Guardar'),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}

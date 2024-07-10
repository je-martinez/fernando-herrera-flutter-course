import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/inputs.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Username",
            onChanged: (value) {
              username = value;
            },
            validator: (value) {
              if (value == null) return 'El campo es obligatorio';
              if (value.isEmpty) return 'El campo es obligatorio';
              if (value.trim().isEmpty) return 'El campo es obligatorio';
              if (value.length < 6) {
                return 'El campo debe tener al menos 3 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: "Email",
            onChanged: (value) {
              email = value;
            },
            validator: (value) {
              if (value == null) return 'El campo es obligatorio';
              if (value.isEmpty) return 'El campo es obligatorio';
              if (value.trim().isEmpty) return 'El campo es obligatorio';
              final isEmail =
                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
              if (!isEmail) {
                return 'El campo debe ser un email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: "Password",
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            validator: (value) {
              if (value == null) return 'El campo es obligatorio';
              if (value.isEmpty) return 'El campo es obligatorio';
              if (value.trim().isEmpty) return 'El campo es obligatorio';
              if (value.length < 6) {
                return 'El campo debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
            },
            label: const Text('Guardar'),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}

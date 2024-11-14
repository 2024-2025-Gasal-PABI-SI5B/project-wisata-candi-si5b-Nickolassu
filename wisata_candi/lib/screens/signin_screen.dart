import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SingInScreen extends StatefulWidget{
  SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  //TOD: 1. Deklarasi variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText='';

  bool _isSignIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //TODO: 2. pasang appbar
    appBar: AppBar(title: const Text('Sing In'),
    ),
    //TODO: 3. pasang body
    body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                    //TODO: 4. aturn mainAxisAligment dan CrossAxisAligment
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        //TODO: 5. Buat TextFormField untuk nama pengguna
                        TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Nama Pengguna',
                                hintText: 'Masukan nama pengguna',
                                border: OutlineInputBorder(),
                            ),
                        ),
                        //TODO: 6. Buat TextFormField untuk Kata Sandi
                        const SizedBox(height: 20,),
                        TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                hintText: 'Masukan kata sandi',
                                border: const OutlineInputBorder(),
                                errorText: _errorText.isNotEmpty?_errorText:null,
                                suffixIcon: IconButton(
                                    onPressed: (){
                                        setState(() {
                                          _obscurePassword= !_obscurePassword;
                                        });
                                    },
                                    icon: Icon(
                                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    ),
                                ),
                            ),
                            obscureText: _obscurePassword,
                        ),
                        //TODO: 7.Buat TextFormField untuk Sign in
                        SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: (){}, 
                            child: const Text('Sing In'),
                        ),
                        // TODO: 8. Pasang TextButton untuk Sing Up
                        SizedBox(height: 10,),
                        // TextButton(
                        //     onPressed: (){}, 
                        //     child: Text('Belum punya akun daftar disini'),
                        // ),
                        RichText(
                            text: TextSpan(
                                text: 'Belum Punya Akun',
                                style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                                children: [
                                    TextSpan(
                                        text: 'Daftar Di Sini',
                                        style: const TextStyle(
                                            fontSize: 16, 
                                            color: Colors.blue,
                                            decoration: TextDecoration.underline
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap= (){},
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
          ),
        ),
    ),
    );
    
  }
}
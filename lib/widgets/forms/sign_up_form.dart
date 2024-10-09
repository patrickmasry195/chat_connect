import 'dart:developer';
import 'dart:io';
import 'package:chat_connect/pages/chats_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chat_connect/helpers/regex_validator.dart';
import 'package:chat_connect/widgets/components/custom_background_form.dart';
import 'package:chat_connect/widgets/buttons/custom_button.dart';
import 'package:chat_connect/widgets/input_fields/custom_confirm_password_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_email_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_name_field.dart';
import 'package:chat_connect/widgets/input_fields/custom_password_field.dart';
import 'package:flutter/material.dart';
import '../../services/authentication.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  File? _profileImage;
  bool isLoading = false;
  final AuthService _authService = AuthService();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadProfileImage(File image) async {
    try {
      String fileName = path.basename(image.path);
      log('Uploading image with file name: $fileName');
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');

      UploadTask uploadTask = storageReference.putFile(image);
      log('Upload task started');
      TaskSnapshot snapshot = await uploadTask;
      log('Upload task completed');
      String downloadUrl = await snapshot.ref.getDownloadURL();
      log('Download URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        _profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Please fill all fields and upload a profile picture')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    String? profileImageUrl = await _uploadProfileImage(_profileImage!);

    if (profileImageUrl != null) {
      String res = await _authService.signUpUser(
        email: email,
        password: password,
        name: name,
        profileImageUrl: profileImageUrl,
      );

      if (res == "success") {
        Navigator.pushReplacementNamed(context, ChatsPage.id);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload profile picture')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundForm(
      height: 600,
      width: 350,
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Center(
                child: CircleAvatar(
                  maxRadius: 45,
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? const Icon(Icons.camera_alt, size: 50)
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomNameField(
              nameController: nameController,
              nameValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else if (!nameRegex.hasMatch(value)) {
                  return 'Enter a valid name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomEmailField(
              emailController: emailController,
              emailValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPasswordField(
              passwordController: passwordController,
              passwordValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (!passwordRegex.hasMatch(value)) {
                  return 'Enter a valid password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomConfirmPasswordField(
              confirmPasswordValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value != passwordController.text) {
                  return 'Passwords don\'t match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  )
                : CustomButton(
                    onPressed: () {
                      _signUp();
                    },
                    textAlign: TextAlign.center,
                    text: 'Create an account',
                    fontSize: 24,
                    height: 50,
                    width: 260,
                  ),
          ],
        ),
      ),
    );
  }
}

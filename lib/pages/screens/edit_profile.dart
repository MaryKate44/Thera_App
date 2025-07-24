import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/theme/colors.dart';
//import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: "Skylar Johnson");
  final emailController = TextEditingController(text: "skyjohnson@gmail.com");

  // XFile? _selectedImage;

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() => _selectedImage = image);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plain,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(168, 213, 186, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Avatar
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    //   backgroundImage: _selectedImage != null
                    //       ? FileImage(
                    //           File(_selectedImage!.path),
                    //         )
                    //       : const AssetImage('assets/profile.jpg')
                    //           as ImageProvider,
                    // ),
                    // IconButton(
                    //   icon: const Icon(Icons.camera_alt, color: Colors.black),
                    //   onPressed: _pickImage,
                     // tooltip: 'Change profile picture',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(168, 213, 186, 1),
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(168, 213, 186, 1),
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
               SizedBox(height: 30.h),

              Center(
          child: SizedBox(
            width:210.w,
             child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,//const Color.fromRGBO(168, 213, 186, 1),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Save Changes'),
              ),
          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

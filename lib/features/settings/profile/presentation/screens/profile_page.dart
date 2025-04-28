import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/widgets/avatar_widget.dart';
import 'package:chat_app/core/utils/error_toast.dart';
import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/settings/profile/presentation/widgets/labeled_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;
  const ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final UserEntity user;

  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _birthDateController;

  @override
  void initState() {
    print('user id: ${widget.userId}');
    if (widget.userId != null) {
      //send query to get user
      user = UserEntity(
          email: "bakberdy.ye@gmail.com",
          firstName: 'Bakberdi',
          lastName: 'Yessentay',
          uid: 'sjhwjbw',
          userAvatar:
              'https://images.vexels.com/media/users/3/145908/raw/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker.jpg',
          lastOnline: DateTime.now(),
          userStatus: 'Be a good human');
    } else {
      user = UserEntity(
          email: "Please return back and try again",
          firstName: "User doesn't exist",
          lastName: '',
          uid: 'sjhwjbw',
          userAvatar:
              'https://www.evolvefish.com/assets/images/Decals/EF-VDC-00035(Black).jpg',
          lastOnline: DateTime.now(),
          userStatus: '');
    }
    _nameController = TextEditingController(text: user.firstName);
    _lastNameController = TextEditingController(text: user.lastName);
    _emailController = TextEditingController(text: user.email);
    _birthDateController =
        TextEditingController(text: user.lastOnline.toString());
    super.initState();
  }

  final _dateTimeFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          shadowColor: Colors.white,
          actions: [
            TextButton(
              style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(TextStyle(color: themeData.primaryColor))
              ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    print('validated');
                  } else {
                    print("not validated");
                    showErrorToast('Please enter valid data', context);
                  }
                },
                child: Text('Done', style: TextStyle(color: themeData.primaryColor),))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 15),
                _avatarWidget(onTap: () {}),
                SizedBox(height: 20),
                Text('Main info',
                    style: TextStyle(
                        color: themeData.canvasColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                SizedBox(
                  height: 5,
                ),
                LabeledTextFormField(
                  label: 'Name',
                  themeData: themeData,
                  controller: _nameController,
                  validator: validateName,
                ),
                Divider(
                  height: 1,
                  color: themeData.hintColor.withAlpha(70),
                ),
                LabeledTextFormField(
                  label: 'Last Name',
                  themeData: themeData,
                  validator: validateName,
                  controller: _lastNameController,
                ),
                Divider(
                  height: 1,
                  color: themeData.hintColor.withAlpha(70),
                ),
                LabeledTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                  themeData: themeData,
                  controller: _emailController,
                  validator: validateEmail,
                ),
                Divider(
                  height: 1,
                  color: themeData.hintColor.withAlpha(70),
                ),
                LabeledTextFormField(
                  keyboardType: TextInputType.datetime,
                  label: 'Date of Birth',
                  themeData: themeData,
                  controller: _birthDateController,
                  validator: validateDate,
                  inputFormatters: [_dateTimeFormatter],
                ),
              ],
            ),
          ),
        ));
  }

  Center _avatarWidget({required VoidCallback onTap}) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AvatarWidget(size: 80, user: user),
            SizedBox(height: 10),
            Text(
              'Change user avatar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/core/auth/auth_listener.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/pages/page_not_authorized.dart';
import 'package:chat_app/core/shared/widgets/avatar_widget.dart';
import 'package:chat_app/core/utils/error_toast.dart';
import 'package:chat_app/core/utils/show_bottom_sheet_with_buttons.dart';
import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/settings/profile/presentation/widgets/labeled_text_form_field.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userId});
  final String? userId;
  @override
  Widget build(BuildContext context) {
    if (userId == 'me') {
      return Consumer<AuthListener>(builder: (context, authListener, _) {
        if (authListener.currentUser == null) {
          return PageNotAuthorized();
        } else {
          return ProfilePageContent(user: authListener.currentUser!);
        }
      });
    } else {
      return ProfilePageContent(user: UserEntity.empty());
    }
  }
}

class ProfilePageContent extends StatefulWidget {
  final UserEntity user;
  const ProfilePageContent({super.key, required this.user});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _birthDateController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _emailController = TextEditingController(text: widget.user.email);

    _birthDateController = TextEditingController(text: widget.user.birthDate);
    super.initState();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      sl<Talker>().info('validated');
    } else {
      sl<Talker>().info("not validated");
      showErrorToast('Please enter valid data', context);
    }
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
                    textStyle: WidgetStatePropertyAll(
                        TextStyle(color: themeData.primaryColor))),
                onPressed: _onSubmit,
                child: Text(
                  'Done',
                  style: TextStyle(color: themeData.primaryColor),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 15),
                _avatarWidget(onTap: () {
                  showBottomSheetWithButtons(context,
                      title: 'Avatar',
                      actions: [
                        BottomSheetActionItem(
                            onTap: () {},
                            text: 'Take a photo',
                            icon: Icons.camera_alt_rounded),
                        BottomSheetActionItem(
                            onTap: () {},
                            text: 'Select from gallery',
                            icon: Icons.photo_album_rounded)
                      ]);
                }),
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
                  hintText: 'dd/mm/yyyy',
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
            AvatarWidget(size: 80, user: widget.user),
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

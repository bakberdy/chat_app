import 'package:chat_app/core/core.dart';
import 'package:chat_app/core/shared/widgets/custom_adaptive_dialog_window.dart';
import 'package:chat_app/core/utils/select_user_avatar.dart';
import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/widgets/change_password_bottom_sheet_content.dart';
import 'package:chat_app/features/auth/presentation/widgets/profile_avatar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfilePageContent();
  }
}

class ProfilePageContent extends StatefulWidget {
  const ProfilePageContent({super.key});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _usernameController;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _birthDateController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  void _onSubmit({required BuildContext context}) {
    if (_formKey.currentState?.validate() ?? false) {
      final firstName = _nameController.text;
      final lastName = _lastNameController.text;
      final birthDate = _birthDateController.text;
      final username = _usernameController.text;
      _authBloc.add(AuthEvent.updateUserData(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
          username: username));
    } else {
      sl<Talker>().error("profile form is not correct");
      showErrorToast(message: 'Please enter correct data', context);
    }
  }

  final _dateTimeFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return BlocListener<AuthBloc, AuthState>(
      listener: _authBlocListener,
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Profile',
            height: 50,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AnimatedButton(
                  onTap: () => _onSubmit(context: context),
                  child: Text('Done',
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          color: themeData.primaryColor,
                          fontWeight: FontWeight.w500)),
                ),
              )
            ],
            pageContext: context,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<AuthBloc, AuthState>(
              bloc: _authBloc,
              builder: (context, state) {
                if (state.status.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (state.currentUser != null) {
                    final user = state.currentUser;
                    _nameController.text = user!.firstName ?? '';
                    _lastNameController.text = user.lastName ?? '';
                    _emailController.text = user.email;
                    _birthDateController.text = user.birthDate ?? '';
                    _usernameController.text = user.username;

                    return Form(
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      key: _formKey,
                      child: ListView(
                        children: [
                          SizedBox(height: 15),
                          ProfileAvatarWidget(
                            onTap: () =>
                                _showChangeAvatarBottomSheet(userId: user.id),
                            user: user,
                          ),
                          SizedBox(height: 20),
                          Text('Main info',
                              style: themeData.textTheme.bodyMedium
                                  ?.copyWith(color: themeData.canvasColor)),
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
                            enabled: false,
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
                          SizedBox(height: 30),
                          SizedBox(
                            height: 40,
                            child: CustomFilledButton(
                                withShadow: false,
                                borderColor: themeData.primaryColor,
                                titleColor: themeData.primaryColor,
                                title: 'Change password',
                                onPressed: _onChangePassword,
                                backgroundColor: Colors.white),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 40,
                            child: CustomFilledButton(
                                withShadow: false,
                                borderColor: Colors.red,
                                titleColor: Colors.red,
                                title: 'Log Out',
                                onPressed: () => _onLogOut(themeData),
                                backgroundColor: Colors.white),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: InfoWidget(
                        title: 'User not found',
                        subtitle: 'The user you are looking for does not exist',
                      ),
                    );
                  }
                }
              },
            ),
          )),
    );
  }

  void _showChangeAvatarBottomSheet({required int userId}) {
    showBottomSheetWithButtons(context, title: 'Avatar', actions: [
      BottomSheetActionItem(
        onTap: () async {
          final file = await selectUserAvatarFromCamera();
          if (file != null) {
            _authBloc.add(AuthEvent.updateProfilePicture(file: file));
          }
        },
        text: 'Take a photo',
        icon: Icons.camera_alt_rounded,
      ),
      BottomSheetActionItem(
          onTap: () {
            selectUserAvatarFromGallery().then((file) {
              if (file != null) {
                _authBloc.add(AuthEvent.updateProfilePicture(file: file));
              }
            });
          },
          text: 'Select from gallery',
          icon: Icons.photo_album_rounded)
    ]);
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state.status.isError) {
      showErrorToast(message: state.message ?? 'Occured error', context);
    }
  }

  Future<void> _onChangePassword() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        context: context,
        builder: (context) {
          return ChangePasswordBottomSheetContent();
        });
  }

  Future<void> _onLogOut(ThemeData theme) async {
    final isPermitted = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CustomAdaptiveDialogWindow(
          title: 'Log out',
          content: 'Do you want to log out?',
          onAgree: () {
            context.pop(true);
          },
        );
      },
    );
    if (isPermitted ?? false) {
      _authBloc.add(AuthEvent.logOut());
    }
  }
}

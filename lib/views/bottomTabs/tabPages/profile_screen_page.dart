import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:janta_sewa/controllers/image_picker_controller.dart';
import 'package:janta_sewa/view_models/controllers/profileViewModel/user_profile_view_model.dart';
import 'package:janta_sewa/widgets/custom_button.dart';
import 'package:janta_sewa/res/colors/app_color.dart';
import 'package:janta_sewa/widgets/date_picker.dart';
import 'package:janta_sewa/widgets/label_text.dart';
import 'package:janta_sewa/widgets/text_form_widget.dart';
import 'package:janta_sewa/widgets/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  final bool startEditing;

  const ProfileScreen({super.key, this.startEditing = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProfileViewModel _profileController = Get.put(
    UserProfileViewModel(),
  );
  final ImagePickerController _imagePickerController = Get.put(
    ImagePickerController(),
  );
  bool _isInitialLoad = true;

  @override
  void initState() {
    super.initState();
    _profileController.isEditing.value = widget.startEditing;

    // Load profile data only once when screen is first opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isInitialLoad && !_profileController.hasData) {
        _isInitialLoad = false;
        _profileController.fetchUserProfile();
      }
    });
  }

  void _showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20).r),
      ),
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Pick from Gallery'),
            onTap: () {
              _imagePickerController.pickImage(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a Photo'),
            onTap: () {
              _imagePickerController.pickImage(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          if (_imagePickerController.selectedImage.value != null)
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Remove Image'),
              onTap: () {
                _imagePickerController.clearImage();
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetX<UserProfileViewModel>(
          builder: (profileController) {
            if (profileController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.btnBgColor,
                  ),
                ),
              );
            }

            if (!profileController.hasUser) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 60.sp,
                      color: AppColors.textColor.withOpacity(0.5),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextWidget(
                      text: 'No profile data found',
                      color: AppColors.textColor.withOpacity(0.7),
                      fontsize: 16.sp,
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      textSize: 14.sp,
                      text: 'Load Profile',
                      backgroundColor: AppColors.btnBgColor,
                      height: 50.h,
                      width: 150.w,
                      onPressed: profileController.fetchUserProfile,
                    ),
                  ],
                ),
              );
            }

            return _buildProfileContent(context);
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      radius: Radius.circular(10).r,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image Section
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(() {
                    final selectedImage =
                        _imagePickerController.selectedImage.value;
                    return Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.btnBgColor,
                          width: 3.w,
                        ),
                        shape: BoxShape.circle,
                        color: AppColors.formBgColor,
                        image: selectedImage != null
                            ? DecorationImage(
                                image: FileImage(selectedImage),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: selectedImage == null
                          ? Icon(
                              Icons.person,
                              size: 50.sp,
                              color: AppColors.btnBgColor,
                            )
                          : null,
                    );
                  }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => _showImageSourceOptions(context),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.btnBgColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),

            // Header Section with Edit Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  CustomTextWidget(
                    text: 'Personal Details',
                    color: AppColors.textColor,
                    fontsize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  const Spacer(),
                  Obx(
                    () => CustomLabelText(
                      text: _profileController.isEditing.value
                          ? 'Editing'
                          : 'Edit',
                      color: _profileController.isEditing.value
                          ? Colors.green
                          : AppColors.textColor,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Obx(
                    () => IconButton(
                      icon: Icon(
                        _profileController.isEditing.value
                            ? Icons.close
                            : Icons.edit,
                        color: _profileController.isEditing.value
                            ? Colors.red
                            : AppColors.btnBgColor,
                        size: 22.sp,
                      ),
                      onPressed: _profileController.toggleEdit,
                      tooltip: _profileController.isEditing.value
                          ? 'Cancel Edit'
                          : 'Edit Profile',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Form Fields Section - KEEPING YOUR ORIGINAL STRUCTURE
            _buildFormSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Column(
      children: [
        // Row 1: Full Name & Mobile Number
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Full Name *'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Full Name',
                      controller: _profileController.fullName.value,
                      enabled: _profileController.isEditing.value,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Mobile Number *'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Mobile',
                      controller: _profileController.mobileNumber.value,
                      enabled: _profileController.isEditing.value,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Row 2: WhatsApp & Email
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'WhatsApp Number'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter WhatsApp',
                      controller: _profileController.whatsappNumber.value,
                      enabled: _profileController.isEditing.value,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Email *'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Email',
                      controller: _profileController.email.value,
                      enabled: _profileController.isEditing.value,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Row 3: Date of Birth & Aadhar Number
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Date of Birth'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'DD/MM/YYYY',
                      controller: _profileController.dob.value,
                      enabled: _profileController.isEditing.value,
                      suffixIcon: Icons.calendar_today,
                      suffixIconColor: AppColors.btnBgColor,
                      onSuffixTap: _profileController.isEditing.value
                          ? () {
                              showCustomCalendarDialog(
                                context: Get.context!,
                                controller: _profileController.dob.value,
                              );
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Aadhar Number'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Aadhar',
                      controller: _profileController.aadharNumber.value,
                      enabled: _profileController.isEditing.value,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Address
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabelText(text: 'Address'),
            SizedBox(height: 4.h),
            Obx(
              () => CustomTextFormField(
                hintText: 'Enter Complete Address',
                controller: _profileController.address.value,
                enabled: _profileController.isEditing.value,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Row 4: State & District
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'State'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter State',
                      controller: _profileController.stateCtrl.value,
                      enabled: _profileController.isEditing.value,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'District'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter District',
                      controller: _profileController.district.value,
                      enabled: _profileController.isEditing.value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Row 5: Block & Vidhansabha
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Block'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Block',
                      controller: _profileController.block.value,
                      enabled: _profileController.isEditing.value,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Vidhansabha'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Vidhansabha',
                      controller: _profileController.vidhansabha.value,
                      enabled: _profileController.isEditing.value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Row 6: City/Village & Ward Number
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'City/Village'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter City/Village',
                      controller: _profileController.cityVillage.value,
                      enabled: _profileController.isEditing.value,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(text: 'Ward Number'),
                  SizedBox(height: 4.h),
                  Obx(
                    () => CustomTextFormField(
                      hintText: 'Enter Ward No.',
                      controller: _profileController.wardNumber.value,
                      enabled: _profileController.isEditing.value,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Pincode
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabelText(text: 'Pincode'),
            SizedBox(height: 4.h),
            Obx(
              () => CustomTextFormField(
                hintText: 'Enter Pincode',
                controller: _profileController.pincode.value,
                enabled: _profileController.isEditing.value,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),

        // Save Button (only show when editing)
        Obx(() {
          if (_profileController.isEditing.value) {
            return Obx(
              () => CustomButton(
                text: _profileController.isUpdating.value
                    ? 'Saving...'
                    : 'Save Changes',
                textSize: 16.sp,
                backgroundColor: AppColors.btnBgColor,
                height: 56.h,
                width: double.infinity,
                onPressed: _profileController.isUpdating.value
                    ? null
                    : _profileController.updateUserProfile,
              ),
            );
          }
          return const SizedBox.shrink();
        }),
        SizedBox(height: 20.h),
      ],
    );
  }
}

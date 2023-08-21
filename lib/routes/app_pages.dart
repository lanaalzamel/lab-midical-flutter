import 'package:get/get.dart';

import '../modules/appointments/bindings/appointments_binding.dart';
import '../modules/appointments/views/appointments_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/medical_report/bindings/medical_report_binding.dart';
import '../modules/medical_report/views/medical_report_view.dart';
import '../modules/onBoarding_screen/bindings/on_boarding_screen_binding.dart';
import '../modules/onBoarding_screen/views/on_boarding_screen_view.dart';
import '../modules/past_appointments/bindings/past_appointments_binding.dart';
import '../modules/past_appointments/views/past_appointments_view.dart';
import '../modules/past_appointments_details/bindings/past_appointments_details_binding.dart';
import '../modules/past_appointments_details/views/past_appointments_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_details/bindings/profile_details_binding.dart';
import '../modules/profile_details/views/profile_details_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/results/bindings/results_binding.dart';
import '../modules/results/views/results_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/upComing_appointments/bindings/up_coming_appointments_binding.dart';
import '../modules/upComing_appointments/views/up_coming_appointments_view.dart';
import '../modules/upComing_appointments_details/bindings/up_coming_appointments_details_binding.dart';
import '../modules/upComing_appointments_details/views/up_coming_appointments_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENTS,
      page: () => AppointmentsView(),
      binding: AppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAILS,
      page: () => ProfileDetailsView(),
      binding: ProfileDetailsBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE_DETAILS,
          page: () => ProfileDetailsView(),
          binding: ProfileDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MEDICAL_REPORT,
      page: () => MedicalReportView(),
      binding: MedicalReportBinding(),
    ),
    GetPage(
      name: _Paths.UP_COMING_APPOINTMENTS,
      page: () => UpComingAppointmentsView(),
      binding: UpComingAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.UP_COMING_APPOINTMENTS_DETAILS,
      page: () => UpComingAppointmentsDetailsView(),
      binding: UpComingAppointmentsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAST_APPOINTMENTS_DETAILS,
      page: () => PastAppointmentsDetailsView(),
      binding: PastAppointmentsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RESULTS,
      page: () => ResultsView(),
      binding: ResultsBinding(),
    ),
    GetPage(
      name: _Paths.PAST_APPOINTMENTS,
      page: () => PastAppointmentsView(),
      binding: PastAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING_SCREEN,
      page: () => const OnBoardingScreenView(),
      binding: OnBoardingScreenBinding(),
    ),
  ];
}

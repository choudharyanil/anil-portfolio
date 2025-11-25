import 'package:get/get.dart';
import 'package:portfolio_app/utils/app_images.dart';

import '../models/project_model.dart';

class PortfolioController extends GetxController {
  final projects = <Project>[].obs;

  // Dynamically generated categories
  final categories = <String>[].obs;

  // Selected filter
  final selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleProjects();
    _generateCategories();
  }

  // ----------------------------------------
  // LOAD SAMPLE PROJECTS
  // ----------------------------------------
  void _loadSampleProjects() {
    projects.assignAll([
      Project(
        title: "Research Experts",
        duration: "2 Months",
        description: "A reliable academic plagiarism detection tool offering accurate scans, originality insights, and professional-grade report generation.",
        image: AppImages.re,
        category: "App Development",
        playStore:
            'https://play.google.com/store/apps/details?id=com.omak.researchexperts',
        appStore: 'https://apps.apple.com/in/app/research-experts/id6723883245',
        projectCategory: "Education",
      ),

      Project(
        title: "BT Transport",
        duration: "2 Months",
           image: AppImages.bt,
        description: "A driver-focused app that simplifies deliveries with quick POD submissions, service request management, real-time updates, and easy navigation—all in one place.",
        category: "App Development",
        playStore:
            'https://play.google.com/store/apps/details?id=com.btt.driver',
        appStore: "https://apps.apple.com/in/app/bt-transport/id6736523078",
        projectCategory: "Transport and Fleet Management",
      ),
      Project(
        title: "The Zahra Trust",
        duration: "4 Months",
        description:
            "Donation management app ensuring quick and effective fund distribution.",
        image: AppImages.zahra,
        playStore:
            "https://play.google.com/store/apps/details?id=com.elintminds.zahra",
        appStore: "https://apps.apple.com/in/app/the-zahratrust/id16083080682",
        category: "App Development",
        projectCategory: "Non-Profit Donation App",
      ),
      Project(
        title: "iwilltilimwell",
        duration: "4 Months",
           image: AppImages.iwilltillIm,
        description: "A unified telehealth platform offering on-demand access to licensed doctors and therapists for both medical and mental health support—affordable, convenient, and family-focused.",
        playStore: "https://apps.apple.com/us/app/iwilltilimwell/id6443433690",
        appStore: "https://apps.apple.com/us/app/iwilltilimwell/id6443433690",
        category: "App Development",
        projectCategory: "Health & Fitness",
      ),
      Project(
        title: "Growyu CRM",
        duration: "4 Months",
        image: AppImages.growYu,
        description: "GrowYu CRM is a SIM-based tele-calling platform that automates lead tracking, captures call recordings, and streamlines team management — all driven directly from phone call activity. Designed for sales & support teams to improve productivity, response time, and conversion success.",
        playStore: "https://play.google.com/store/apps/details?id=com.omak.growyucrm",
        appStore: "",
        category: "App Development",
        projectCategory: "SIM-Based Lead Management CRM",
      ),
      Project(
        title: "Sigma Calculator",
        duration: "4 Months",
        description:
            "Comprehensive savings, budget, checklist & financial organizer.",
        image: AppImages.sigma,
        playStore:
            "https://play.google.com/store/apps/details?id=com.sigmacalculator.app",
        appStore: "https://apps.apple.com/us/app/sigma-calculator/id1524444380",
        category: "App Development",
        projectCategory: "Utilities",
      ),
      Project(
        title: "Cloud POS",
        duration: "11 Months",
        description:
        "Restaurant automation system for ordering, delivery, POS integration, printers, cash drawer, Stripe payments.",
        image: AppImages.cloudPos,
        category: "App Development",
        projectCategory: "Restaurant POS & Billing System",


      ),
      Project(
        title: 'Indigo donations',
        image: AppImages.indigo,
        category: 'App Development',
        projectCategory: "Donation App",
          description: "A donation platform designed for non-profit organizations and donors, enabling seamless contributions, campaign management, and transparent giving."
      ),
      Project(
        title: 'Seed App',
        category: 'Web Development',
        image: AppImages.seed,
        description: 'description: "A social media platform similar to Instagram, allowing users to record and share 1–3 minute short videos, schedule their posts (Seeds), and connect with other users.',
        projectCategory: "Social Media",
      ),
      Project(
        title: "Jessy AI",
        duration: "5 Months",
        description: "Banking and finance management app for the Italy region.",
        image: AppImages.jessyAi,
        category: "App Development",
        projectCategory: "Banking and Finance Management",
      ),

      Project(
        title: "Cozii PropTech",
        duration: "5 Months",
        description:
            "Real-estate management app for landlords and tenants and Handyman services.",
        image: AppImages.cozii,
        playStore:
            "https://play.google.com/store/apps/details?id=project.mobile.cozii",
        appStore: "https://apps.apple.com/in/app/cozii-proptech/id1570348726",
        category: "App Development",
        projectCategory: "Rental App",
      ),

      Project(
        title: 'BookIt',
        category: 'Web Development',
        image: AppImages.bookit,
        description: "A hotel rental and booking platform that allows users to browse properties, check availability, and make seamless online reservations.",
        projectCategory: "Hotel Rental Platform",
      ),Project(
        title: 'Mezo',
        category: 'Design',
        image: AppImages.mezo,
        description: "A travel planning app that allows users to create itineraries, manage trip details, track destinations, and organize their entire journey.",
        projectCategory: "Utility",
      ),Project(
        title: 'EshaKoosh',
        category: 'Design',
        image: AppImages.eshakoosh,
        description: 'description: "A user-driven marketplace enabling item listings, product auctions, and real-time bidding, offering a hybrid OLX-style buy/sell and auction experience.',
        projectCategory: "E-commerce",
      ),
      Project(
        title: 'Now Now',
        category: 'Design',
        image: AppImages.nowNow,
        description: 'A collaborative idea sharing app.',
      ),
      Project(
        title: 'Doctor UI',
        category: 'Design',
        image: AppImages.doctorUI,
        description: "A modern and intuitive doctor consultation UI design featuring appointment booking, patient management, and clean healthcare interfaces.",
        projectCategory: "Health and Wellness",
      ),
      Project(
        title: 'Coffee UI',
        category: 'Design',
        image: AppImages.coffee,
        description: "A modern and visually appealing UI design for a coffee shop app, featuring product listings, ordering flow, and a clean café-themed interface.",
      ),





      Project(
        title: "Whiskr",
        duration: "3 Months",
        description:
        "Whiskr is a pet-focused mobile app that helps users find nearby pet events, services, and community activities. The design emphasizes a clean interface, easy navigation, and a friendly user experience",
        image: AppImages.whiskr,
        category: "Design",
      ),
      // Project(
      //     title: "Eon Assets",
      //     duration: "2 Months",
      //     description:
      //     "Financial investment app with future earnings projection calculator.",
      //     image: AppImages.eonAsset,
      //     category: "App Development",
      //     projectCategory: "Finance Management"
      // ),
      // Project(
      //   title: "YourDMARC",
      //   duration: "3 Months",
      //   description:
      //       "DMARC, SPF, DKIM analyzer with reporting and email security insights.",
      //   image: AppImages.yourDmarc,
      //   category: "Design",
      // ),

    ]);
  }

  // ----------------------------------------
  // AUTO-GENERATE CATEGORIES
  // ----------------------------------------
  void _generateCategories() {
    final set = {'All', ...projects.map((p) => p.category)};
    categories.assignAll(set.toList());
  }

  // ----------------------------------------
  // FILTERED PROJECT LIST FOR UI
  // ----------------------------------------
  List<Project> get filteredProjects {
    if (selectedCategory.value == 'All') return projects;
    return projects.where((p) => p.category == selectedCategory.value).toList();
  }

  // ----------------------------------------
  // SET SELECTED CATEGORY
  // ----------------------------------------
  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}

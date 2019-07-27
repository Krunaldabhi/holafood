-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 07, 2018 at 06:39 PM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saffaridb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_products`
--

CREATE TABLE `addon_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `addon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `avatar`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, 'admin@saffari.app', '+911234565434', '$2y$10$Vcjn6gVpKu.fv9sg110Bl.smxqr4hf3yp6yAWvdIBhfpeoowwOb8G', 'U4SBN2CtlAnDquWYOYPB064KrkzC702YDvmBRNwSZ6C7qJysW6mCL3R6odUc', NULL, '2018-09-24 11:37:07', NULL),
(2, 'sssa', NULL, 'odai.dammag1@gmail.com', '+967733474886', '$2y$10$fye1BwRnb7YfHxLBjF.lv.mCYuTV7wrLKN/yQqtB1zbz0l/hFsjwO', NULL, '2018-09-24 19:50:50', '2018-09-24 19:50:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_type` enum('stripe','braintree') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `last_four` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_addons`
--

CREATE TABLE `cart_addons` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_cart_id` int(11) NOT NULL,
  `addon_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `shop_id`, `name`, `description`, `position`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'Appetizer', 'special', NULL, 'enabled', NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(2, 0, 1, 'Meat and Game Birds', 'special', NULL, 'enabled', NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(3, 0, 1, 'Dessert', 'special', NULL, 'enabled', NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(4, 0, 2, 'Burgers', 'special', NULL, 'enabled', NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(5, 0, 2, 'Sandwitch', 'special', NULL, 'enabled', NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(6, 0, 2, 'Snacks', 'special', NULL, 'enabled', NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(7, 0, 3, 'اللحوم', 'لحوم', 0, 'enabled', '2018-09-24 18:24:55', '2018-09-24 18:24:55', NULL),
(8, 0, 5, 'FoodPanda', 'Enjoy free delivery on all orders', NULL, 'enabled', '2018-09-25 09:01:49', '2018-09-25 09:01:49', NULL),
(9, 0, 7, 'Snacks', 'Snacks', 4, 'enabled', '2018-09-25 12:07:28', '2018-09-25 12:07:28', NULL),
(10, 0, 8, 'krunalone1', 'krunal', 1, 'enabled', '2018-09-25 12:46:55', '2018-09-25 12:46:55', NULL),
(11, 0, 9, 'الاسماك', 'اسماك طازجة', 1, 'enabled', '2018-09-29 13:17:13', '2018-09-29 13:17:13', NULL),
(12, 0, 9, 'الارز', 'ارز بسمتي ,ارز مزه الاجود في العالم', 2, 'enabled', '2018-09-29 13:20:38', '2018-09-29 13:20:38', NULL),
(13, 0, 6, 'Royal Chicken', 'broasted chicken', 1, 'enabled', '2018-09-30 16:44:02', '2018-09-30 16:44:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_images`
--

CREATE TABLE `category_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_images`
--

INSERT INTO `category_images` (`id`, `category_id`, `url`, `position`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 'https://saffari.app/storage/categories/1YA1FZJ9dkhwvNb1Xi2Al6km8GOWdl0hAUYZFZTD.png', 0, '2018-09-25 09:01:49', '2018-09-25 09:01:49', NULL),
(2, 9, 'https://saffari.app/storage/categories/ob949XVNSHWuu8rENEZt6KzxEiIKlWHh9plVyXJ6.jpeg', 0, '2018-09-25 12:07:28', '2018-09-25 12:07:28', NULL),
(3, 10, 'https://saffari.app/storage/categories/LNuIVz5NQ5tm4z5aehg1tsgd9Dkcu5dIyKZAWXfA.jpeg', 0, '2018-09-25 12:46:55', '2018-09-25 12:46:55', NULL),
(4, 11, 'https://saffari.app/storage/categories/1jxyrOHMvB3M82ap9PWtzFO0ur60f3MBRBdsCjiI.jpeg', 0, '2018-09-29 13:17:13', '2018-09-29 13:17:13', NULL),
(5, 12, 'https://saffari.app/storage/categories/ct0hpQMZv9vxOPTLS0ByChfJsornonYl4NcIgsOq.jpeg', 0, '2018-09-29 13:20:38', '2018-09-29 13:20:38', NULL),
(6, 13, 'https://saffari.app/storage/categories/ojJbK4Bj8z7Jd77NaCgiaH6ANtfQeIe9MM7LCVJ7.png', 0, '2018-09-30 16:44:02', '2018-09-30 16:44:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`category_id`, `product_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(10, 9),
(11, 11),
(12, 10),
(13, 12);

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisines`
--

INSERT INTO `cuisines` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INDIAN', NULL, NULL, NULL),
(2, 'SOUTH INDIAN', NULL, NULL, NULL),
(3, 'BENGOLI', NULL, NULL, NULL),
(4, 'Yemen', '2018-09-24 19:54:02', '2018-09-29 13:11:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_shop`
--

CREATE TABLE `cuisine_shop` (
  `cuisine_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisine_shop`
--

INSERT INTO `cuisine_shop` (`cuisine_id`, `shop_id`) VALUES
(1, 1),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 2),
(4, 3),
(4, 4),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pushes`
--

CREATE TABLE `custom_pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_transporters`
--

CREATE TABLE `enquiry_transporters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `shop_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 3, '2018-09-25 14:02:12', '2018-09-25 14:02:13', '2018-09-25 14:02:13'),
(2, 3, 3, '2018-09-25 14:02:14', '2018-09-25 14:02:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_08_25_172600_create_settings_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2017_01_11_181312_create_cards_table', 1),
(10, '2017_01_11_182717_create_request_filters_table', 1),
(11, '2017_06_08_123940_create_admins_table', 1),
(12, '2017_06_08_123941_create_admin_password_resets_table', 1),
(13, '2017_06_09_044823_create_shops_table', 1),
(14, '2017_06_09_044824_create_shop_password_resets_table', 1),
(15, '2017_06_09_045212_create_transporters_table', 1),
(16, '2017_06_09_045213_create_transporter_password_resets_table', 1),
(17, '2017_06_09_102917_create_products_table', 1),
(18, '2017_06_09_105225_create_categories_table', 1),
(19, '2017_06_12_064740_create_user_addresses_table', 1),
(20, '2017_06_12_101042_create_orders_table', 1),
(21, '2017_06_12_101114_create_order_invoices_table', 1),
(22, '2017_06_12_101147_create_order_ratings_table', 1),
(23, '2017_06_12_101212_create_order_disputes_table', 1),
(24, '2017_06_12_101446_create_surge_pricings_table', 1),
(25, '2017_06_12_113225_create_notifications_table', 1),
(26, '2017_06_13_124334_create_zones_table', 1),
(27, '2017_06_13_125525_create_transporter_documents_table', 1),
(28, '2017_06_13_130530_create_category_images_table', 1),
(29, '2017_06_15_115211_create_product_images_table', 1),
(30, '2017_06_15_115323_create_product_prices_table', 1),
(31, '2017_06_16_112721_create_user_carts_table', 1),
(32, '2017_06_23_124807_create_oauth_access_token_guards', 1),
(33, '2017_08_03_194354_create_custom_pushes_table', 1),
(34, '2017_09_19_053529_create_cuisines_table', 1),
(35, '2017_09_19_053543_create_documents_table', 1),
(36, '2017_09_19_053556_create_order_dispute_comments_table', 1),
(37, '2017_09_19_053608_create_promocode_usages_table', 1),
(38, '2017_09_19_053619_create_transporter_vehicles_table', 1),
(39, '2017_09_19_053635_create_transporter_shifts_table', 1),
(40, '2017_09_19_053648_create_transporter_shift_timings_table', 1),
(41, '2017_09_19_053659_create_wallet_passbooks_table', 1),
(42, '2017_09_19_110911_create_shop_timings_table', 1),
(43, '2017_09_25_125459_create_transporter_locations_table', 1),
(44, '2017_10_04_130254_create_order_timings_table', 1),
(45, '2017_10_07_103112_create_favorites_table', 1),
(46, '2017_10_12_122111_create_shop_banners_table', 1),
(47, '2017_10_13_062225_create_notice_boards_table', 1),
(48, '2017_10_20_070027_create_order_dispute_helps_table', 1),
(49, '2017_10_21_063643_create_permission_tables', 1),
(50, '2017_11_06_111106_create_addons_table', 1),
(51, '2017_11_08_121819_create_cart_addons_table', 1),
(52, '2017_11_08_133602_create_enquiry_transporters_table', 1),
(53, '2017_11_09_062754_create_addon_products_table', 1),
(54, '2017_11_27_142447_create_restuarants_table', 1),
(55, '2017_11_28_063349_create_newsletters_table', 1),
(56, '2017_12_05_043339_add_delivery_date_to_orders', 1),
(57, '2017_12_06_091412_add_schedule_status_to_orders', 1),
(58, '2018_02_01_105814_create_favourites_table', 1),
(59, '2018_04_26_125520_create_email_template_table', 1),
(60, '2018_05_07_111346_create_promocodes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Admin'),
(2, 2, 'App\\Admin');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `transporter_id` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `transporter_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, 0, 'Your Order Created Successfully', '2018-09-24 19:24:05', '2018-09-24 19:24:05'),
(2, 3, 0, 'Your order Delivery Otp is 739408', '2018-09-24 19:24:05', '2018-09-24 19:24:05'),
(3, 3, 0, 'Dispute created against order ', '2018-09-24 19:24:47', '2018-09-24 19:24:47'),
(4, 3, 0, 'Dispute Resolved Successfully', '2018-09-24 19:28:13', '2018-09-24 19:28:13'),
(5, 3, 0, 'Dispute created against order ', '2018-09-24 19:28:23', '2018-09-24 19:28:23'),
(6, 3, 0, 'Your Order Id  Status is :status', '2018-09-24 19:32:17', '2018-09-24 19:32:17'),
(7, 3, 0, 'Your Order Created Successfully', '2018-09-24 19:46:03', '2018-09-24 19:46:03'),
(8, 3, 0, 'Your order Delivery Otp is 431663', '2018-09-24 19:46:03', '2018-09-24 19:46:03'),
(9, 3, 0, 'Dispute created against order ', '2018-09-24 19:46:56', '2018-09-24 19:46:56'),
(10, 3, 0, 'Your Order Created Successfully', '2018-09-24 20:10:21', '2018-09-24 20:10:21'),
(11, 3, 0, 'Your order Delivery Otp is 552603', '2018-09-24 20:10:21', '2018-09-24 20:10:21'),
(12, 3, 0, 'Dispute created against order ', '2018-09-24 20:11:54', '2018-09-24 20:11:54'),
(13, 5, 0, 'Your Order Created Successfully', '2018-09-25 10:21:21', '2018-09-25 10:21:21'),
(14, 5, 0, 'Your order Delivery Otp is 288583', '2018-09-25 10:21:21', '2018-09-25 10:21:21'),
(15, 5, 0, 'Your Order Created Successfully', '2018-09-25 10:24:17', '2018-09-25 10:24:17'),
(16, 5, 0, 'Your order Delivery Otp is 257909', '2018-09-25 10:24:18', '2018-09-25 10:24:18'),
(17, 5, 0, 'Dispute created against order ', '2018-09-25 10:25:55', '2018-09-25 10:25:55'),
(18, 5, 0, 'Dispute created against order ', '2018-09-25 10:25:55', '2018-09-25 10:25:55'),
(19, 5, 0, 'Your Order Created Successfully', '2018-09-25 10:47:13', '2018-09-25 10:47:13'),
(20, 5, 0, 'Your order Delivery Otp is 361553', '2018-09-25 10:47:13', '2018-09-25 10:47:13'),
(21, 5, 0, 'Dispute created against order ', '2018-09-25 10:47:18', '2018-09-25 10:47:18'),
(22, 6, 0, 'Your Order Created Successfully', '2018-09-25 12:11:17', '2018-09-25 12:11:17'),
(23, 6, 0, 'Your order Delivery Otp is 211670', '2018-09-25 12:11:17', '2018-09-25 12:11:17'),
(24, 6, 0, 'Dispute created against order ', '2018-09-25 12:11:29', '2018-09-25 12:11:29'),
(25, 6, 0, 'Your Order Created Successfully', '2018-09-25 12:19:17', '2018-09-25 12:19:17'),
(26, 6, 0, 'Your order Delivery Otp is 312595', '2018-09-25 12:19:17', '2018-09-25 12:19:17'),
(27, 6, 0, 'Dispute created against order ', '2018-09-25 12:19:22', '2018-09-25 12:19:22'),
(28, 6, 0, 'Your Order Created Successfully', '2018-09-25 12:20:53', '2018-09-25 12:20:53'),
(29, 6, 0, 'Your order Delivery Otp is 110939', '2018-09-25 12:20:54', '2018-09-25 12:20:54'),
(30, 6, 0, 'Dispute created against order ', '2018-09-25 12:20:58', '2018-09-25 12:20:58'),
(31, 5, 0, 'Your Order Created Successfully', '2018-09-25 12:48:09', '2018-09-25 12:48:09'),
(32, 5, 0, 'Your order Delivery Otp is 333551', '2018-09-25 12:48:10', '2018-09-25 12:48:10'),
(33, 5, 0, 'Dispute created against order ', '2018-09-25 12:48:27', '2018-09-25 12:48:27'),
(34, 6, 0, 'Your Order Created Successfully', '2018-09-25 13:13:19', '2018-09-25 13:13:19'),
(35, 6, 0, 'Your order Delivery Otp is 658780', '2018-09-25 13:13:19', '2018-09-25 13:13:19'),
(36, 6, 0, 'Dispute created against order ', '2018-09-25 13:13:26', '2018-09-25 13:13:26'),
(37, 6, 0, 'Your Order Created Successfully', '2018-09-25 13:14:39', '2018-09-25 13:14:39'),
(38, 6, 0, 'Your order Delivery Otp is 196032', '2018-09-25 13:14:39', '2018-09-25 13:14:39'),
(39, 6, 0, 'Dispute created against order ', '2018-09-25 13:14:46', '2018-09-25 13:14:46'),
(40, 5, 0, 'Your Order Created Successfully', '2018-09-25 13:15:26', '2018-09-25 13:15:26'),
(41, 5, 0, 'Your order Delivery Otp is 580824', '2018-09-25 13:15:26', '2018-09-25 13:15:26'),
(42, 5, 0, 'Dispute created against order ', '2018-09-25 13:15:31', '2018-09-25 13:15:31'),
(43, 3, 0, 'Your Order Created Successfully', '2018-09-25 13:25:51', '2018-09-25 13:25:51'),
(44, 3, 0, 'Your order Delivery Otp is 358043', '2018-09-25 13:25:51', '2018-09-25 13:25:51'),
(45, 3, 0, 'Dispute created against order ', '2018-09-25 13:26:41', '2018-09-25 13:26:41'),
(46, 3, 0, 'Dispute created against order ', '2018-09-25 13:26:41', '2018-09-25 13:26:41'),
(47, 6, 0, 'Your Order Created Successfully', '2018-09-25 13:28:47', '2018-09-25 13:28:47'),
(48, 6, 0, 'Your order Delivery Otp is 412487', '2018-09-25 13:28:47', '2018-09-25 13:28:47'),
(49, 6, 0, 'Dispute created against order ', '2018-09-25 13:29:37', '2018-09-25 13:29:37'),
(50, 3, 0, 'Dispute Resolved Successfully', '2018-09-25 13:35:38', '2018-09-25 13:35:38'),
(51, 3, 0, 'Your Order Created Successfully', '2018-09-25 13:36:24', '2018-09-25 13:36:24'),
(52, 3, 0, 'Your order Delivery Otp is 770285', '2018-09-25 13:36:24', '2018-09-25 13:36:24'),
(53, 3, 0, 'Dispute created against order ', '2018-09-25 13:36:30', '2018-09-25 13:36:30'),
(54, 3, 0, 'Dispute created against order ', '2018-09-25 13:36:30', '2018-09-25 13:36:30'),
(55, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 13:36:54', '2018-09-25 13:36:54'),
(56, 0, 2, 'New order request', '2018-09-25 13:47:00', '2018-09-25 13:47:00'),
(57, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-25 13:47:00', '2018-09-25 13:47:00'),
(58, 3, 0, 'Dispute created against order ', '2018-09-25 13:47:31', '2018-09-25 13:47:31'),
(59, 0, 2, 'Dispute created against order ', '2018-09-25 13:47:31', '2018-09-25 13:47:31'),
(60, 6, 0, 'Your Order Created Successfully', '2018-09-25 13:58:43', '2018-09-25 13:58:43'),
(61, 6, 0, 'Your order Delivery Otp is 460013', '2018-09-25 13:58:44', '2018-09-25 13:58:44'),
(62, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 13:59:02', '2018-09-25 13:59:02'),
(63, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 13:59:04', '2018-09-25 13:59:04'),
(64, 6, 0, 'Your Order Id  Status is :status', '2018-09-25 14:00:59', '2018-09-25 14:00:59'),
(65, 6, 0, 'Your Order Id  Status is :status', '2018-09-25 14:01:45', '2018-09-25 14:01:45'),
(66, 3, 0, 'Your Order Id  Status is :status', '2018-09-25 14:01:49', '2018-09-25 14:01:49'),
(67, 3, 0, 'Your Order Created Successfully', '2018-09-25 14:03:44', '2018-09-25 14:03:44'),
(68, 3, 0, 'Your order Delivery Otp is 145888', '2018-09-25 14:03:44', '2018-09-25 14:03:44'),
(69, 3, 0, 'Dispute created against order ', '2018-09-25 14:04:36', '2018-09-25 14:04:36'),
(70, 6, 0, 'Your Order Created Successfully', '2018-09-25 14:06:59', '2018-09-25 14:06:59'),
(71, 6, 0, 'Your order Delivery Otp is 782192', '2018-09-25 14:06:59', '2018-09-25 14:06:59'),
(72, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 14:07:44', '2018-09-25 14:07:44'),
(73, 6, 0, 'Your Order Created Successfully', '2018-09-25 14:20:21', '2018-09-25 14:20:21'),
(74, 6, 0, 'Your order Delivery Otp is 886349', '2018-09-25 14:20:22', '2018-09-25 14:20:22'),
(75, 6, 0, 'Dispute created against order ', '2018-09-25 14:21:12', '2018-09-25 14:21:12'),
(76, 6, 0, 'Your Order Created Successfully', '2018-09-25 14:23:23', '2018-09-25 14:23:23'),
(77, 6, 0, 'Your order Delivery Otp is 316097', '2018-09-25 14:23:23', '2018-09-25 14:23:23'),
(78, 6, 0, 'Your Order Created Successfully', '2018-09-25 14:24:34', '2018-09-25 14:24:34'),
(79, 6, 0, 'Your order Delivery Otp is 365097', '2018-09-25 14:24:34', '2018-09-25 14:24:34'),
(80, 6, 0, 'Dispute created against order ', '2018-09-25 14:25:24', '2018-09-25 14:25:24'),
(81, 6, 0, 'Your Order Created Successfully', '2018-09-25 14:31:58', '2018-09-25 14:31:58'),
(82, 6, 0, 'Your order Delivery Otp is 371558', '2018-09-25 14:31:58', '2018-09-25 14:31:58'),
(83, 6, 0, 'Dispute created against order ', '2018-09-25 18:25:06', '2018-09-25 18:25:06'),
(84, 6, 0, 'Dispute created against order ', '2018-09-25 18:25:07', '2018-09-25 18:25:07'),
(85, 3, 0, 'Your Order Created Successfully', '2018-09-25 19:12:16', '2018-09-25 19:12:16'),
(86, 3, 0, 'Your order Delivery Otp is 769402', '2018-09-25 19:12:16', '2018-09-25 19:12:16'),
(87, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 19:12:33', '2018-09-25 19:12:33'),
(88, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 19:12:34', '2018-09-25 19:12:34'),
(89, 3, 0, 'Your Order Id  Status is :status', '2018-09-25 19:16:50', '2018-09-25 19:16:50'),
(90, 3, 0, 'Your Order Id  Status is :status', '2018-09-25 19:17:03', '2018-09-25 19:17:03'),
(91, 3, 0, 'Your Order Created Successfully', '2018-09-25 19:20:14', '2018-09-25 19:20:14'),
(92, 3, 0, 'Your order Delivery Otp is 197979', '2018-09-25 19:20:14', '2018-09-25 19:20:14'),
(93, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-25 19:20:28', '2018-09-25 19:20:28'),
(94, 0, 2, 'New order request', '2018-09-25 19:20:39', '2018-09-25 19:20:39'),
(95, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-25 19:20:39', '2018-09-25 19:20:39'),
(96, 3, 0, 'Dispute created against order ', '2018-09-25 19:21:10', '2018-09-25 19:21:10'),
(97, 0, 2, 'Dispute created against order ', '2018-09-25 19:21:10', '2018-09-25 19:21:10'),
(98, 6, 0, 'Your Order Created Successfully', '2018-09-26 03:53:22', '2018-09-26 03:53:22'),
(99, 6, 0, 'Your order Delivery Otp is 602999', '2018-09-26 03:53:22', '2018-09-26 03:53:22'),
(100, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 03:55:02', '2018-09-26 03:55:02'),
(101, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 03:57:24', '2018-09-26 03:57:24'),
(102, 0, 2, 'New order request', '2018-09-26 03:57:37', '2018-09-26 03:57:37'),
(103, 6, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-26 03:57:37', '2018-09-26 03:57:37'),
(104, 6, 0, 'Dispute created against order ', '2018-09-26 03:58:09', '2018-09-26 03:58:09'),
(105, 0, 2, 'Dispute created against order ', '2018-09-26 03:58:09', '2018-09-26 03:58:09'),
(106, 6, 0, 'Your Order Created Successfully', '2018-09-26 13:28:55', '2018-09-26 13:28:55'),
(107, 6, 0, 'Your order Delivery Otp is 630070', '2018-09-26 13:28:55', '2018-09-26 13:28:55'),
(108, 6, 0, 'Dispute created against order ', '2018-09-26 17:56:10', '2018-09-26 17:56:10'),
(109, 3, 0, 'Your Order Created Successfully', '2018-09-26 17:56:53', '2018-09-26 17:56:53'),
(110, 3, 0, 'Your order Delivery Otp is 330787', '2018-09-26 17:56:53', '2018-09-26 17:56:53'),
(111, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 18:17:51', '2018-09-26 18:17:51'),
(112, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 18:20:09', '2018-09-26 18:20:09'),
(113, 0, 7, 'You Have One Incoming Request', '2018-09-26 18:22:54', '2018-09-26 18:22:54'),
(114, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:23:04', '2018-09-26 18:23:04'),
(115, 3, 0, 'Your Order Created Successfully', '2018-09-26 18:25:11', '2018-09-26 18:25:11'),
(116, 3, 0, 'Your order Delivery Otp is 167368', '2018-09-26 18:25:11', '2018-09-26 18:25:11'),
(117, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 18:25:26', '2018-09-26 18:25:26'),
(118, 0, 2, 'You Have One Incoming Request', '2018-09-26 18:35:45', '2018-09-26 18:35:45'),
(119, 3, 0, 'Your Order Ready To Dispatched', '2018-09-26 18:49:15', '2018-09-26 18:49:15'),
(120, 3, 0, 'order.order_ready_user_shop', '2018-09-26 18:49:20', '2018-09-26 18:49:20'),
(121, 0, 2, 'order.order_ready_transporter_shop', '2018-09-26 18:49:20', '2018-09-26 18:49:20'),
(122, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:25', '2018-09-26 18:51:25'),
(123, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:27', '2018-09-26 18:51:27'),
(124, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:32', '2018-09-26 18:51:32'),
(125, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:37', '2018-09-26 18:51:37'),
(126, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:43', '2018-09-26 18:51:43'),
(127, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:48', '2018-09-26 18:51:48'),
(128, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:51:56', '2018-09-26 18:51:56'),
(129, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:02', '2018-09-26 18:52:02'),
(130, 5, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:06', '2018-09-26 18:52:06'),
(131, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:11', '2018-09-26 18:52:11'),
(132, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:22', '2018-09-26 18:52:22'),
(133, 5, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:28', '2018-09-26 18:52:28'),
(134, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:33', '2018-09-26 18:52:33'),
(135, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:40', '2018-09-26 18:52:40'),
(136, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:44', '2018-09-26 18:52:44'),
(137, 6, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:51', '2018-09-26 18:52:51'),
(138, 5, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:55', '2018-09-26 18:52:55'),
(139, 5, 0, 'Your Order Id  Status is :status', '2018-09-26 18:52:59', '2018-09-26 18:52:59'),
(140, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 18:53:11', '2018-09-26 18:53:11'),
(141, 3, 0, 'Your Order Created Successfully', '2018-09-26 18:57:47', '2018-09-26 18:57:47'),
(142, 3, 0, 'Your order Delivery Otp is 477532', '2018-09-26 18:57:47', '2018-09-26 18:57:47'),
(143, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 18:58:11', '2018-09-26 18:58:11'),
(144, 0, 2, 'You Have One Incoming Request', '2018-09-26 18:59:12', '2018-09-26 18:59:12'),
(145, 3, 0, 'Your Order Ready To Dispatched', '2018-09-26 19:00:21', '2018-09-26 19:00:21'),
(146, 3, 0, 'order.order_ready_user_shop', '2018-09-26 19:00:22', '2018-09-26 19:00:22'),
(147, 0, 2, 'order.order_ready_transporter_shop', '2018-09-26 19:00:22', '2018-09-26 19:00:22'),
(148, 3, 0, 'Your Order Id  Status is :status', '2018-09-26 19:03:09', '2018-09-26 19:03:09'),
(149, 3, 0, 'Your Order Created Successfully', '2018-09-26 19:11:05', '2018-09-26 19:11:05'),
(150, 3, 0, 'Your order Delivery Otp is 457912', '2018-09-26 19:11:05', '2018-09-26 19:11:05'),
(151, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 19:11:34', '2018-09-26 19:11:34'),
(152, 6, 0, 'Your Order Created Successfully', '2018-09-26 19:31:01', '2018-09-26 19:31:01'),
(153, 6, 0, 'Your order Delivery Otp is 223397', '2018-09-26 19:31:01', '2018-09-26 19:31:01'),
(154, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 19:31:29', '2018-09-26 19:31:29'),
(155, 0, 2, 'You Have One Incoming Request', '2018-09-26 19:32:33', '2018-09-26 19:32:33'),
(156, 6, 0, 'Your Order Created Successfully', '2018-09-26 19:49:33', '2018-09-26 19:49:33'),
(157, 6, 0, 'Your order Delivery Otp is 660007', '2018-09-26 19:49:34', '2018-09-26 19:49:34'),
(158, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-26 19:50:19', '2018-09-26 19:50:19'),
(159, 0, 3, 'You Have One Incoming Request', '2018-09-26 19:51:21', '2018-09-26 19:51:21'),
(160, 6, 0, 'Your Order Ready To Dispatched', '2018-09-26 19:51:44', '2018-09-26 19:51:44'),
(161, 6, 0, 'order.order_ready_user_shop', '2018-09-26 19:51:47', '2018-09-26 19:51:47'),
(162, 0, 3, 'order.order_ready_transporter_shop', '2018-09-26 19:51:47', '2018-09-26 19:51:47'),
(163, 6, 0, 'Your Order Id  Status is REACHED', '2018-09-26 20:09:32', '2018-09-26 20:09:32'),
(164, 6, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-26 20:09:33', '2018-09-26 20:09:33'),
(165, 6, 0, 'Your Order Id  Status is ARRIVED', '2018-09-26 20:09:45', '2018-09-26 20:09:45'),
(166, 3, 0, 'Dispute created against order ', '2018-09-26 20:16:37', '2018-09-26 20:16:37'),
(167, 6, 0, 'Dispute created against order ', '2018-09-26 20:32:36', '2018-09-26 20:32:36'),
(168, 6, 0, 'Your Order Created Successfully', '2018-09-26 21:12:33', '2018-09-26 21:12:33'),
(169, 6, 0, 'Your order Delivery Otp is 761766', '2018-09-26 21:12:33', '2018-09-26 21:12:33'),
(170, 6, 0, 'Your Order Created Successfully', '2018-09-26 21:37:28', '2018-09-26 21:37:28'),
(171, 6, 0, 'Your order Delivery Otp is 475965', '2018-09-26 21:37:28', '2018-09-26 21:37:28'),
(172, 6, 0, 'Your Order Id  Status is COMPLETED', '2018-09-27 08:03:10', '2018-09-27 08:03:10'),
(173, 6, 0, 'Dispute created against order ', '2018-09-27 13:33:37', '2018-09-27 13:33:37'),
(174, 6, 0, 'Dispute created against order ', '2018-09-27 13:33:37', '2018-09-27 13:33:37'),
(175, 3, 0, 'Your Order Created Successfully', '2018-09-27 13:33:53', '2018-09-27 13:33:53'),
(176, 3, 0, 'Your order Delivery Otp is 817118', '2018-09-27 13:33:53', '2018-09-27 13:33:53'),
(177, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-27 13:35:23', '2018-09-27 13:35:23'),
(178, 6, 0, 'Your Order Created Successfully', '2018-09-27 14:38:58', '2018-09-27 14:38:58'),
(179, 6, 0, 'Your order Delivery Otp is 958068', '2018-09-27 14:38:58', '2018-09-27 14:38:58'),
(180, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-27 15:04:40', '2018-09-27 15:04:40'),
(181, 3, 0, 'Dispute created against order ', '2018-09-27 15:05:08', '2018-09-27 15:05:08'),
(182, 0, 3, 'You Have One Incoming Request', '2018-09-27 15:06:28', '2018-09-27 15:06:28'),
(183, 6, 0, 'Your Order Ready To Dispatched', '2018-09-27 15:07:17', '2018-09-27 15:07:17'),
(184, 6, 0, 'order.order_ready_user_shop', '2018-09-27 15:07:22', '2018-09-27 15:07:22'),
(185, 0, 3, 'order.order_ready_transporter_shop', '2018-09-27 15:07:22', '2018-09-27 15:07:22'),
(186, 6, 0, 'Your Order Id  Status is REACHED', '2018-09-27 15:08:43', '2018-09-27 15:08:43'),
(187, 6, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-27 15:09:24', '2018-09-27 15:09:24'),
(188, 6, 0, 'Your Order Id  Status is ARRIVED', '2018-09-27 15:09:43', '2018-09-27 15:09:43'),
(189, 6, 0, 'Your Order Id  Status is COMPLETED', '2018-09-27 15:09:58', '2018-09-27 15:09:58'),
(190, 3, 0, 'Your Order Created Successfully', '2018-09-27 15:40:00', '2018-09-27 15:40:00'),
(191, 3, 0, 'Your order Delivery Otp is 460997', '2018-09-27 15:40:00', '2018-09-27 15:40:00'),
(192, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-27 15:40:24', '2018-09-27 15:40:24'),
(193, 0, 2, 'You Have One Incoming Request', '2018-09-27 15:45:24', '2018-09-27 15:45:24'),
(194, 0, 3, 'You Have One Incoming Request', '2018-09-27 15:45:24', '2018-09-27 15:45:24'),
(195, 3, 0, 'Your Order Ready To Dispatched', '2018-09-27 15:45:54', '2018-09-27 15:45:54'),
(196, 3, 0, 'order.order_ready_user_shop', '2018-09-27 15:50:29', '2018-09-27 15:50:29'),
(197, 0, 2, 'order.order_ready_transporter_shop', '2018-09-27 15:50:30', '2018-09-27 15:50:30'),
(198, 3, 0, 'Your Order Created Successfully', '2018-09-27 16:13:09', '2018-09-27 16:13:09'),
(199, 3, 0, 'Your order Delivery Otp is 263731', '2018-09-27 16:13:09', '2018-09-27 16:13:09'),
(200, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-27 16:13:57', '2018-09-27 16:13:57'),
(201, 0, 3, 'You Have One Incoming Request', '2018-09-27 16:14:59', '2018-09-27 16:14:59'),
(202, 3, 0, 'Dispute created against order ', '2018-09-27 16:20:51', '2018-09-27 16:20:51'),
(203, 0, 2, 'Dispute created against order ', '2018-09-27 16:20:51', '2018-09-27 16:20:51'),
(204, 0, 2, 'Order 16  Status Updated To CANCELLED', '2018-09-27 16:23:24', '2018-09-27 16:23:24'),
(205, 3, 0, 'Your Order Created Successfully', '2018-09-27 17:08:24', '2018-09-27 17:08:24'),
(206, 3, 0, 'Your order Delivery Otp is 431034', '2018-09-27 17:08:24', '2018-09-27 17:08:24'),
(207, 3, 0, 'Your Order Created Successfully', '2018-09-27 17:35:06', '2018-09-27 17:35:06'),
(208, 3, 0, 'Your order Delivery Otp is 573758', '2018-09-27 17:35:06', '2018-09-27 17:35:06'),
(209, 3, 0, 'Dispute created against order ', '2018-09-27 18:41:22', '2018-09-27 18:41:22'),
(210, 3, 0, 'Dispute created against order ', '2018-09-27 18:41:22', '2018-09-27 18:41:22'),
(211, 3, 0, 'Dispute created against order ', '2018-09-27 18:41:29', '2018-09-27 18:41:29'),
(212, 3, 0, 'Dispute created against order ', '2018-09-27 18:41:33', '2018-09-27 18:41:33'),
(213, 3, 0, 'Your Order Id  Status is :status', '2018-09-27 18:42:44', '2018-09-27 18:42:44'),
(214, 3, 0, 'Your Order Id  Status is :status', '2018-09-27 18:42:52', '2018-09-27 18:42:52'),
(215, 3, 0, 'Your Order Id  Status is :status', '2018-09-27 18:42:57', '2018-09-27 18:42:57'),
(216, 3, 0, 'Your Order Id  Status is :status', '2018-09-27 18:43:01', '2018-09-27 18:43:01'),
(217, 3, 0, 'Your Order Id  Status is :status', '2018-09-27 18:43:06', '2018-09-27 18:43:06'),
(218, 3, 0, 'Your Order Created Successfully', '2018-09-27 18:48:02', '2018-09-27 18:48:02'),
(219, 3, 0, 'Your order Delivery Otp is 329400', '2018-09-27 18:48:02', '2018-09-27 18:48:02'),
(220, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-27 18:48:34', '2018-09-27 18:48:34'),
(221, 6, 0, 'Your Order Created Successfully', '2018-09-27 18:58:17', '2018-09-27 18:58:17'),
(222, 6, 0, 'Your order Delivery Otp is 591282', '2018-09-27 18:58:17', '2018-09-27 18:58:17'),
(223, 0, 2, 'You Have One Incoming Request', '2018-09-27 18:58:35', '2018-09-27 18:58:35'),
(224, 0, 8, 'You Have One Incoming Request', '2018-09-27 18:58:35', '2018-09-27 18:58:35'),
(225, 3, 0, 'Your Order Ready To Dispatched', '2018-09-27 18:58:52', '2018-09-27 18:58:52'),
(226, 3, 0, 'order.order_ready_user_shop', '2018-09-27 19:09:49', '2018-09-27 19:09:49'),
(227, 0, 8, 'order.order_ready_transporter_shop', '2018-09-27 19:09:49', '2018-09-27 19:09:49'),
(228, 6, 0, 'Dispute created against order ', '2018-09-27 19:58:18', '2018-09-27 19:58:18'),
(229, 6, 0, 'Your Order Created Successfully', '2018-09-27 20:39:04', '2018-09-27 20:39:04'),
(230, 6, 0, 'Your order Delivery Otp is 407158', '2018-09-27 20:39:04', '2018-09-27 20:39:04'),
(231, 6, 0, 'Dispute created against order ', '2018-09-27 21:39:08', '2018-09-27 21:39:08'),
(232, 3, 0, 'Your Order Created Successfully', '2018-09-28 17:02:59', '2018-09-28 17:02:59'),
(233, 3, 0, 'Your order Delivery Otp is 700182', '2018-09-28 17:02:59', '2018-09-28 17:02:59'),
(234, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-28 17:04:17', '2018-09-28 17:04:17'),
(235, 0, 2, 'You Have One Incoming Request', '2018-09-28 17:23:35', '2018-09-28 17:23:35'),
(236, 3, 0, 'Dispute created against order ', '2018-09-28 19:20:00', '2018-09-28 19:20:00'),
(237, 3, 0, 'Your Order Created Successfully', '2018-09-28 19:21:24', '2018-09-28 19:21:24'),
(238, 3, 0, 'Your order Delivery Otp is 176130', '2018-09-28 19:21:24', '2018-09-28 19:21:24'),
(239, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-28 19:24:40', '2018-09-28 19:24:40'),
(240, 3, 0, 'Dispute created against order ', '2018-09-28 22:16:13', '2018-09-28 22:16:13'),
(241, 3, 0, 'Your Order Created Successfully', '2018-09-29 14:07:29', '2018-09-29 14:07:29'),
(242, 3, 0, 'Your order Delivery Otp is 436685', '2018-09-29 14:07:29', '2018-09-29 14:07:29'),
(243, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 14:07:48', '2018-09-29 14:07:48'),
(244, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:16:33', '2018-09-29 14:16:33'),
(245, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:16:45', '2018-09-29 14:16:45'),
(246, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:17:51', '2018-09-29 14:17:51'),
(247, 3, 0, 'Your Order Created Successfully', '2018-09-29 14:20:46', '2018-09-29 14:20:46'),
(248, 3, 0, 'Your order Delivery Otp is 794041', '2018-09-29 14:20:46', '2018-09-29 14:20:46'),
(249, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 14:22:09', '2018-09-29 14:22:09'),
(250, 3, 0, 'Your Order Created Successfully', '2018-09-29 14:29:57', '2018-09-29 14:29:57'),
(251, 3, 0, 'Your order Delivery Otp is 247799', '2018-09-29 14:29:57', '2018-09-29 14:29:57'),
(252, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 14:31:06', '2018-09-29 14:31:06'),
(253, 6, 0, 'Your Order Id  Status is :status', '2018-09-29 14:41:39', '2018-09-29 14:41:39'),
(254, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:41:44', '2018-09-29 14:41:44'),
(255, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:41:49', '2018-09-29 14:41:49'),
(256, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:41:53', '2018-09-29 14:41:53'),
(257, 6, 0, 'Your Order Id  Status is :status', '2018-09-29 14:41:58', '2018-09-29 14:41:58'),
(258, 6, 0, 'Your Order Id  Status is :status', '2018-09-29 14:42:01', '2018-09-29 14:42:01'),
(259, 6, 0, 'Your Order Id  Status is :status', '2018-09-29 14:42:06', '2018-09-29 14:42:06'),
(260, 6, 0, 'Your Order Id  Status is :status', '2018-09-29 14:42:08', '2018-09-29 14:42:08'),
(261, 6, 0, 'Your Order Created Successfully', '2018-09-29 14:52:28', '2018-09-29 14:52:28'),
(262, 6, 0, 'Your order Delivery Otp is 427160', '2018-09-29 14:52:28', '2018-09-29 14:52:28'),
(263, 6, 0, 'Your Order Created Successfully', '2018-09-29 14:53:20', '2018-09-29 14:53:20'),
(264, 6, 0, 'Your order Delivery Otp is 988197', '2018-09-29 14:53:20', '2018-09-29 14:53:20'),
(265, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 14:53:47', '2018-09-29 14:53:47'),
(266, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:54:28', '2018-09-29 14:54:28'),
(267, 0, 3, 'New order request', '2018-09-29 14:54:48', '2018-09-29 14:54:48'),
(268, 6, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 14:54:48', '2018-09-29 14:54:48'),
(269, 6, 0, 'Your Order Ready To Dispatched', '2018-09-29 14:55:02', '2018-09-29 14:55:02'),
(270, 6, 0, 'order.order_ready_user_shop', '2018-09-29 14:55:02', '2018-09-29 14:55:02'),
(271, 0, 3, 'order.order_ready_transporter_shop', '2018-09-29 14:55:02', '2018-09-29 14:55:02'),
(272, 6, 0, 'Your Order Id  Status is REACHED', '2018-09-29 14:55:05', '2018-09-29 14:55:05'),
(273, 6, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 14:55:12', '2018-09-29 14:55:12'),
(274, 6, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 14:55:21', '2018-09-29 14:55:21'),
(275, 6, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 14:55:28', '2018-09-29 14:55:28'),
(276, 3, 0, 'Your Order Created Successfully', '2018-09-29 14:55:43', '2018-09-29 14:55:43'),
(277, 3, 0, 'Your order Delivery Otp is 747352', '2018-09-29 14:55:43', '2018-09-29 14:55:43'),
(278, 3, 0, 'Your Order Id  Status is :status', '2018-09-29 14:56:15', '2018-09-29 14:56:15'),
(279, 3, 0, 'Your Order Created Successfully', '2018-09-29 14:56:49', '2018-09-29 14:56:49'),
(280, 3, 0, 'Your order Delivery Otp is 330771', '2018-09-29 14:56:49', '2018-09-29 14:56:49'),
(281, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 14:57:06', '2018-09-29 14:57:06'),
(282, 0, 2, 'New order request', '2018-09-29 14:57:26', '2018-09-29 14:57:26'),
(283, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 14:57:26', '2018-09-29 14:57:26'),
(284, 0, 3, 'Settled Your amount Successfully', '2018-09-29 15:01:50', '2018-09-29 15:01:50'),
(285, 6, 0, 'Your Order Created Successfully', '2018-09-29 15:03:56', '2018-09-29 15:03:56'),
(286, 6, 0, 'Your order Delivery Otp is 175571', '2018-09-29 15:03:56', '2018-09-29 15:03:56'),
(287, 6, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 15:04:43', '2018-09-29 15:04:43'),
(288, 0, 3, 'New order request', '2018-09-29 15:05:41', '2018-09-29 15:05:41'),
(289, 6, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 15:05:41', '2018-09-29 15:05:41'),
(290, 6, 0, 'Your Order Ready To Dispatched', '2018-09-29 15:06:19', '2018-09-29 15:06:19'),
(291, 6, 0, 'order.order_ready_user_shop', '2018-09-29 15:06:22', '2018-09-29 15:06:22'),
(292, 0, 3, 'order.order_ready_transporter_shop', '2018-09-29 15:06:22', '2018-09-29 15:06:22'),
(293, 6, 0, 'Your Order Id  Status is REACHED', '2018-09-29 15:06:25', '2018-09-29 15:06:25'),
(294, 6, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 15:06:35', '2018-09-29 15:06:35'),
(295, 6, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 15:06:41', '2018-09-29 15:06:41'),
(296, 6, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 15:06:47', '2018-09-29 15:06:47'),
(297, 3, 0, 'Dispute created against order ', '2018-09-29 16:51:20', '2018-09-29 16:51:20'),
(298, 0, 2, 'Dispute created against order ', '2018-09-29 16:51:20', '2018-09-29 16:51:20'),
(299, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 16:52:07', '2018-09-29 16:52:07'),
(300, 3, 0, 'order.order_ready_user_shop', '2018-09-29 16:52:25', '2018-09-29 16:52:25'),
(301, 0, 2, 'order.order_ready_transporter_shop', '2018-09-29 16:52:25', '2018-09-29 16:52:25'),
(302, 3, 0, 'Your Order Id  Status is REACHED', '2018-09-29 16:56:14', '2018-09-29 16:56:14'),
(303, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 16:56:16', '2018-09-29 16:56:16'),
(304, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 16:56:25', '2018-09-29 16:56:25'),
(305, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 16:56:53', '2018-09-29 16:56:53'),
(306, 3, 0, 'Your Order Created Successfully', '2018-09-29 16:58:16', '2018-09-29 16:58:16'),
(307, 3, 0, 'Your order Delivery Otp is 781431', '2018-09-29 16:58:16', '2018-09-29 16:58:16'),
(308, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 17:00:15', '2018-09-29 17:00:15'),
(309, 0, 2, 'New order request', '2018-09-29 17:00:57', '2018-09-29 17:00:57'),
(310, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 17:00:57', '2018-09-29 17:00:57'),
(311, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 17:03:04', '2018-09-29 17:03:04'),
(312, 3, 0, 'order.order_ready_user_shop', '2018-09-29 17:03:04', '2018-09-29 17:03:04'),
(313, 0, 2, 'order.order_ready_transporter_shop', '2018-09-29 17:03:04', '2018-09-29 17:03:04'),
(314, 3, 0, 'Your Order Id  Status is REACHED', '2018-09-29 17:06:21', '2018-09-29 17:06:21'),
(315, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 17:06:25', '2018-09-29 17:06:25'),
(316, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 17:07:12', '2018-09-29 17:07:12'),
(317, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 17:07:27', '2018-09-29 17:07:27'),
(318, 3, 0, 'Your Order Created Successfully', '2018-09-29 17:10:17', '2018-09-29 17:10:17'),
(319, 3, 0, 'Your order Delivery Otp is 290775', '2018-09-29 17:10:17', '2018-09-29 17:10:17'),
(320, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 17:10:26', '2018-09-29 17:10:26'),
(321, 0, 2, 'New order request', '2018-09-29 17:10:35', '2018-09-29 17:10:35'),
(322, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 17:10:35', '2018-09-29 17:10:35'),
(323, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 17:11:43', '2018-09-29 17:11:43'),
(324, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 17:12:10', '2018-09-29 17:12:10'),
(325, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 17:12:14', '2018-09-29 17:12:14'),
(326, 3, 0, 'Your Order Id  Status is REACHED', '2018-09-29 17:15:31', '2018-09-29 17:15:31'),
(327, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 17:15:33', '2018-09-29 17:15:33'),
(328, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 17:15:35', '2018-09-29 17:15:35'),
(329, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 17:16:42', '2018-09-29 17:16:42'),
(330, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 17:19:58', '2018-09-29 17:19:58'),
(331, 3, 0, 'Your Order Created Successfully', '2018-09-29 17:33:03', '2018-09-29 17:33:03'),
(332, 3, 0, 'Your order Delivery Otp is 550372', '2018-09-29 17:33:03', '2018-09-29 17:33:03'),
(333, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 17:34:52', '2018-09-29 17:34:52'),
(334, 0, 2, 'New order request', '2018-09-29 17:35:59', '2018-09-29 17:35:59'),
(335, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 17:35:59', '2018-09-29 17:35:59'),
(336, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 17:36:22', '2018-09-29 17:36:22'),
(337, 3, 0, 'Your Order Id  Status is REACHED', '2018-09-29 17:36:23', '2018-09-29 17:36:23'),
(338, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 17:36:38', '2018-09-29 17:36:38'),
(339, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 17:37:01', '2018-09-29 17:37:01'),
(340, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 17:37:19', '2018-09-29 17:37:19'),
(341, 3, 0, 'Your Order Created Successfully', '2018-09-29 19:16:08', '2018-09-29 19:16:08'),
(342, 3, 0, 'Your order Delivery Otp is 471373', '2018-09-29 19:16:09', '2018-09-29 19:16:09'),
(343, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 19:16:46', '2018-09-29 19:16:46'),
(344, 0, 2, 'New order request', '2018-09-29 19:17:50', '2018-09-29 19:17:50'),
(345, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 19:17:50', '2018-09-29 19:17:50'),
(346, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 19:19:48', '2018-09-29 19:19:48'),
(347, 3, 0, 'Your Order Id  Status is REACHED', '2018-09-29 19:19:58', '2018-09-29 19:19:58'),
(348, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 19:20:07', '2018-09-29 19:20:07'),
(349, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 19:20:16', '2018-09-29 19:20:16'),
(350, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 19:20:45', '2018-09-29 19:20:45'),
(351, 3, 0, 'Your Order Created Successfully', '2018-09-29 19:21:52', '2018-09-29 19:21:52'),
(352, 3, 0, 'Your order Delivery Otp is 997783', '2018-09-29 19:21:52', '2018-09-29 19:21:52'),
(353, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 19:22:05', '2018-09-29 19:22:05'),
(354, 0, 2, 'New order request', '2018-09-29 19:22:19', '2018-09-29 19:22:19'),
(355, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 19:22:19', '2018-09-29 19:22:19'),
(356, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 19:23:35', '2018-09-29 19:23:35'),
(357, 3, 0, 'Your Order Ready To Dispatched', '2018-09-29 19:23:35', '2018-09-29 19:23:35'),
(358, 3, 0, 'Your Order Id  Status is REACHED', '2018-09-29 19:23:47', '2018-09-29 19:23:47'),
(359, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 19:23:53', '2018-09-29 19:23:53'),
(360, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 19:24:03', '2018-09-29 19:24:03'),
(361, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 19:24:16', '2018-09-29 19:24:16'),
(362, 11, 0, 'Your Order Created Successfully', '2018-09-29 21:38:15', '2018-09-29 21:38:15'),
(363, 11, 0, 'Your order Delivery Otp is 644060', '2018-09-29 21:38:15', '2018-09-29 21:38:15'),
(364, 11, 0, 'Your order Successfully Accepted By restaurant', '2018-09-29 21:40:13', '2018-09-29 21:40:13'),
(365, 0, 2, 'New order request', '2018-09-29 21:40:31', '2018-09-29 21:40:31'),
(366, 11, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-29 21:40:31', '2018-09-29 21:40:31'),
(367, 11, 0, 'Your Order Ready To Dispatched', '2018-09-29 21:41:08', '2018-09-29 21:41:08'),
(368, 11, 0, 'Your Order Id  Status is REACHED', '2018-09-29 21:41:10', '2018-09-29 21:41:10'),
(369, 11, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-29 21:41:25', '2018-09-29 21:41:25'),
(370, 11, 0, 'Your Order Id  Status is ARRIVED', '2018-09-29 21:41:46', '2018-09-29 21:41:46'),
(371, 11, 0, 'Your Order Id  Status is COMPLETED', '2018-09-29 21:42:12', '2018-09-29 21:42:12'),
(372, 11, 0, 'Your Order Created Successfully', '2018-09-29 21:42:38', '2018-09-29 21:42:38'),
(373, 11, 0, 'Your order Delivery Otp is 109133', '2018-09-29 21:42:38', '2018-09-29 21:42:38'),
(374, 11, 0, 'Dispute created against order ', '2018-09-30 11:27:50', '2018-09-30 11:27:50'),
(375, 12, 0, 'Your Order Created Successfully', '2018-09-30 14:24:38', '2018-09-30 14:24:38'),
(376, 12, 0, 'Your order Delivery Otp is 879200', '2018-09-30 14:24:38', '2018-09-30 14:24:38'),
(377, 12, 0, 'Dispute created against order ', '2018-09-30 16:11:05', '2018-09-30 16:11:05'),
(378, 13, 0, 'Your Order Created Successfully', '2018-09-30 16:27:34', '2018-09-30 16:27:34'),
(379, 13, 0, 'Your order Delivery Otp is 941536', '2018-09-30 16:27:34', '2018-09-30 16:27:34'),
(380, 13, 0, 'Your Order Id  Status is :status', '2018-09-30 16:27:55', '2018-09-30 16:27:55'),
(381, 12, 0, 'Your Order Id  Status is :status', '2018-09-30 16:28:01', '2018-09-30 16:28:01'),
(382, 11, 0, 'Your Order Id  Status is :status', '2018-09-30 16:28:06', '2018-09-30 16:28:06'),
(383, 13, 0, 'Your Order Created Successfully', '2018-09-30 16:28:41', '2018-09-30 16:28:41'),
(384, 13, 0, 'Your order Delivery Otp is 428769', '2018-09-30 16:28:41', '2018-09-30 16:28:41'),
(385, 14, 0, 'Your Order Created Successfully', '2018-09-30 16:29:31', '2018-09-30 16:29:31'),
(386, 14, 0, 'Your order Delivery Otp is 411725', '2018-09-30 16:29:32', '2018-09-30 16:29:32'),
(387, 14, 0, 'Your Order Id  Status is :status', '2018-09-30 16:32:53', '2018-09-30 16:32:53'),
(388, 13, 0, 'Your Order Id  Status is :status', '2018-09-30 16:32:56', '2018-09-30 16:32:56'),
(389, 14, 0, 'Your Order Created Successfully', '2018-09-30 16:56:48', '2018-09-30 16:56:48'),
(390, 14, 0, 'Your order Delivery Otp is 417390', '2018-09-30 16:56:48', '2018-09-30 16:56:48'),
(391, 14, 0, 'Your order Successfully Accepted By restaurant', '2018-09-30 16:57:26', '2018-09-30 16:57:26'),
(392, 0, 2, 'New order request', '2018-09-30 16:58:03', '2018-09-30 16:58:03'),
(393, 14, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-30 16:58:04', '2018-09-30 16:58:04'),
(394, 14, 0, 'Your Order Id  Status is :status', '2018-09-30 17:08:04', '2018-09-30 17:08:04'),
(395, 14, 0, 'Your Order Created Successfully', '2018-09-30 17:08:51', '2018-09-30 17:08:51'),
(396, 14, 0, 'Your order Delivery Otp is 515576', '2018-09-30 17:08:51', '2018-09-30 17:08:51'),
(397, 14, 0, 'Your order Successfully Accepted By restaurant', '2018-09-30 17:10:10', '2018-09-30 17:10:10'),
(398, 0, 9, 'New order request', '2018-09-30 17:11:02', '2018-09-30 17:11:02'),
(399, 14, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-30 17:11:02', '2018-09-30 17:11:02'),
(400, 14, 0, 'Your Order Ready To Dispatched', '2018-09-30 17:12:03', '2018-09-30 17:12:03'),
(401, 14, 0, 'Your Order Ready To Dispatched', '2018-09-30 17:12:03', '2018-09-30 17:12:03'),
(402, 14, 0, 'Your Order Id  Status is REACHED', '2018-09-30 17:12:05', '2018-09-30 17:12:05'),
(403, 14, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-30 17:12:32', '2018-09-30 17:12:32'),
(404, 14, 0, 'Your Order Id  Status is ARRIVED', '2018-09-30 17:12:55', '2018-09-30 17:12:55'),
(405, 14, 0, 'Your Order Id  Status is COMPLETED', '2018-09-30 17:13:11', '2018-09-30 17:13:11'),
(406, 14, 0, 'Your Order Created Successfully', '2018-09-30 17:16:07', '2018-09-30 17:16:07'),
(407, 14, 0, 'Your order Delivery Otp is 832394', '2018-09-30 17:16:08', '2018-09-30 17:16:08'),
(408, 14, 0, 'Your order Successfully Accepted By restaurant', '2018-09-30 17:17:05', '2018-09-30 17:17:05'),
(409, 0, 9, 'New order request', '2018-09-30 17:17:29', '2018-09-30 17:17:29'),
(410, 14, 0, 'Your Order Assigned To DeliveryBoy', '2018-09-30 17:17:29', '2018-09-30 17:17:29'),
(411, 14, 0, 'Your Order Ready To Dispatched', '2018-09-30 17:18:32', '2018-09-30 17:18:32'),
(412, 14, 0, 'Your Order Id  Status is REACHED', '2018-09-30 17:18:58', '2018-09-30 17:18:58'),
(413, 14, 0, 'Your Order Id  Status is PICKEDUP', '2018-09-30 17:19:18', '2018-09-30 17:19:18'),
(414, 14, 0, 'Your Order Id  Status is ARRIVED', '2018-09-30 17:19:38', '2018-09-30 17:19:38'),
(415, 14, 0, 'Your Order Id  Status is COMPLETED', '2018-09-30 17:19:53', '2018-09-30 17:19:53'),
(416, 14, 0, 'Your Order Id  Status is :status', '2018-09-30 19:28:47', '2018-09-30 19:28:47'),
(417, 0, 3, 'Settled Your amount Successfully', '2018-10-01 10:33:10', '2018-10-01 10:33:10'),
(418, 3, 0, 'Your Order Created Successfully', '2018-10-01 19:00:35', '2018-10-01 19:00:35'),
(419, 3, 0, 'Your order Delivery Otp is 340881', '2018-10-01 19:00:35', '2018-10-01 19:00:35'),
(420, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-01 19:01:01', '2018-10-01 19:01:01'),
(421, 0, 2, 'New order request', '2018-10-01 19:01:14', '2018-10-01 19:01:14'),
(422, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-01 19:01:14', '2018-10-01 19:01:14'),
(423, 3, 0, 'Your Order Ready To Dispatched', '2018-10-01 19:02:34', '2018-10-01 19:02:34'),
(424, 3, 0, 'Your Order Id  Status is REACHED', '2018-10-01 19:02:46', '2018-10-01 19:02:46'),
(425, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-10-01 19:02:56', '2018-10-01 19:02:56'),
(426, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-01 19:02:58', '2018-10-01 19:02:58'),
(427, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-01 19:02:59', '2018-10-01 19:02:59'),
(428, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-10-01 19:18:03', '2018-10-01 19:18:03'),
(429, 3, 0, 'Your Order Created Successfully', '2018-10-01 19:20:51', '2018-10-01 19:20:51'),
(430, 3, 0, 'Your order Delivery Otp is 881830', '2018-10-01 19:20:51', '2018-10-01 19:20:51'),
(431, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-01 19:21:04', '2018-10-01 19:21:04'),
(432, 0, 2, 'New order request', '2018-10-01 19:22:44', '2018-10-01 19:22:44'),
(433, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-01 19:22:44', '2018-10-01 19:22:44'),
(434, 3, 0, 'Your Order Ready To Dispatched', '2018-10-01 19:23:07', '2018-10-01 19:23:07'),
(435, 3, 0, 'order.order_ready_user_shop', '2018-10-01 19:23:08', '2018-10-01 19:23:08'),
(436, 0, 2, 'order.order_ready_transporter_shop', '2018-10-01 19:23:08', '2018-10-01 19:23:08'),
(437, 3, 0, 'Your Order Id  Status is REACHED', '2018-10-01 19:23:09', '2018-10-01 19:23:09'),
(438, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-10-01 19:23:10', '2018-10-01 19:23:10'),
(439, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-01 19:23:13', '2018-10-01 19:23:13'),
(440, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-10-01 19:23:25', '2018-10-01 19:23:25'),
(441, 3, 0, 'Your Order Created Successfully', '2018-10-01 19:24:35', '2018-10-01 19:24:35'),
(442, 3, 0, 'Your order Delivery Otp is 566138', '2018-10-01 19:24:35', '2018-10-01 19:24:35'),
(443, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-01 19:24:42', '2018-10-01 19:24:42'),
(444, 0, 8, 'New order request', '2018-10-01 19:25:20', '2018-10-01 19:25:20'),
(445, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-01 19:25:20', '2018-10-01 19:25:20'),
(446, 3, 0, 'Your Order Id  Status is :status', '2018-10-01 19:33:56', '2018-10-01 19:33:56'),
(447, 3, 0, 'Your Order Created Successfully', '2018-10-01 19:35:21', '2018-10-01 19:35:21'),
(448, 3, 0, 'Your order Delivery Otp is 626992', '2018-10-01 19:35:21', '2018-10-01 19:35:21'),
(449, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-01 19:35:40', '2018-10-01 19:35:40'),
(450, 0, 2, 'New order request', '2018-10-01 19:35:51', '2018-10-01 19:35:51'),
(451, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-01 19:35:51', '2018-10-01 19:35:51'),
(452, 3, 0, 'Your Order Ready To Dispatched', '2018-10-01 19:36:09', '2018-10-01 19:36:09'),
(453, 3, 0, 'Your Order Id  Status is REACHED', '2018-10-01 19:36:11', '2018-10-01 19:36:11'),
(454, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-10-01 19:36:14', '2018-10-01 19:36:14'),
(455, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-01 19:36:16', '2018-10-01 19:36:16'),
(456, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-10-01 19:36:26', '2018-10-01 19:36:26'),
(457, 3, 0, 'Your Order Created Successfully', '2018-10-01 22:08:28', '2018-10-01 22:08:28'),
(458, 3, 0, 'Your order Delivery Otp is 969536', '2018-10-01 22:08:28', '2018-10-01 22:08:28'),
(459, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-01 22:09:24', '2018-10-01 22:09:24'),
(460, 0, 8, 'You Have One Incoming Request', '2018-10-01 22:10:25', '2018-10-01 22:10:25'),
(461, 0, 9, 'You Have One Incoming Request', '2018-10-01 22:10:26', '2018-10-01 22:10:26'),
(462, 3, 0, 'Your Order Id  Status is :status', '2018-10-01 22:12:25', '2018-10-01 22:12:25'),
(463, 3, 0, 'Your Order Created Successfully', '2018-10-01 22:15:30', '2018-10-01 22:15:30'),
(464, 3, 0, 'Your order Delivery Otp is 892341', '2018-10-01 22:15:30', '2018-10-01 22:15:30'),
(465, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-01 22:15:40', '2018-10-01 22:15:40'),
(466, 0, 2, 'New order request', '2018-10-01 22:17:12', '2018-10-01 22:17:12'),
(467, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-01 22:17:12', '2018-10-01 22:17:12'),
(468, 3, 0, 'Your Order Ready To Dispatched', '2018-10-01 22:17:43', '2018-10-01 22:17:43'),
(469, 3, 0, 'order.order_ready_user_shop', '2018-10-01 22:17:45', '2018-10-01 22:17:45'),
(470, 0, 2, 'order.order_ready_transporter_shop', '2018-10-01 22:17:45', '2018-10-01 22:17:45'),
(471, 3, 0, 'Your Order Id  Status is REACHED', '2018-10-01 22:18:11', '2018-10-01 22:18:11'),
(472, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-10-01 22:18:30', '2018-10-01 22:18:30'),
(473, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-01 22:18:41', '2018-10-01 22:18:41'),
(474, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-10-01 22:19:20', '2018-10-01 22:19:20'),
(475, 3, 0, 'Your Order Created Successfully', '2018-10-02 00:07:42', '2018-10-02 00:07:42'),
(476, 3, 0, 'Your order Delivery Otp is 518120', '2018-10-02 00:07:42', '2018-10-02 00:07:42'),
(477, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-02 00:09:50', '2018-10-02 00:09:50'),
(478, 0, 2, 'New order request', '2018-10-02 00:10:28', '2018-10-02 00:10:28'),
(479, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-02 00:10:28', '2018-10-02 00:10:28'),
(480, 3, 0, 'Your Order Ready To Dispatched', '2018-10-02 00:10:54', '2018-10-02 00:10:54'),
(481, 3, 0, 'Your Order Id  Status is REACHED', '2018-10-02 00:11:14', '2018-10-02 00:11:14'),
(482, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-10-02 00:11:19', '2018-10-02 00:11:19'),
(483, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-02 00:11:38', '2018-10-02 00:11:38'),
(484, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-10-02 00:11:50', '2018-10-02 00:11:50'),
(485, 6, 0, 'Your Order Created Successfully', '2018-10-02 16:09:43', '2018-10-02 16:09:43'),
(486, 6, 0, 'Your order Delivery Otp is 606407', '2018-10-02 16:09:43', '2018-10-02 16:09:43'),
(487, 6, 0, 'Your Order Created Successfully', '2018-10-02 16:10:13', '2018-10-02 16:10:13'),
(488, 6, 0, 'Your order Delivery Otp is 811077', '2018-10-02 16:10:14', '2018-10-02 16:10:14'),
(489, 6, 0, 'Your Order Created Successfully', '2018-10-02 16:26:09', '2018-10-02 16:26:09'),
(490, 6, 0, 'Your order Delivery Otp is 269051', '2018-10-02 16:26:09', '2018-10-02 16:26:09'),
(491, 6, 0, 'Your Order Created Successfully', '2018-10-02 16:51:33', '2018-10-02 16:51:33'),
(492, 6, 0, 'Your order Delivery Otp is 647916', '2018-10-02 16:51:33', '2018-10-02 16:51:33'),
(493, 6, 0, 'Dispute created against order ', '2018-10-07 13:33:43', '2018-10-07 13:33:43'),
(494, 6, 0, 'Dispute created against order ', '2018-10-07 13:33:43', '2018-10-07 13:33:43'),
(495, 6, 0, 'Dispute created against order ', '2018-10-07 13:33:49', '2018-10-07 13:33:49'),
(496, 6, 0, 'Dispute created against order ', '2018-10-07 13:33:54', '2018-10-07 13:33:54'),
(497, 3, 0, 'Your Order Created Successfully', '2018-10-07 13:42:42', '2018-10-07 13:42:42'),
(498, 3, 0, 'Your order Delivery Otp is 182959', '2018-10-07 13:42:42', '2018-10-07 13:42:42'),
(499, 3, 0, 'Your order Successfully Accepted By restaurant', '2018-10-07 13:43:02', '2018-10-07 13:43:02'),
(500, 0, 2, 'New order request', '2018-10-07 13:44:33', '2018-10-07 13:44:33'),
(501, 3, 0, 'Your Order Assigned To DeliveryBoy', '2018-10-07 13:44:33', '2018-10-07 13:44:33'),
(502, 3, 0, 'Your Order Ready To Dispatched', '2018-10-07 13:45:19', '2018-10-07 13:45:19'),
(503, 3, 0, 'Your Order Id  Status is REACHED', '2018-10-07 13:45:27', '2018-10-07 13:45:27'),
(504, 3, 0, 'Your Order Id  Status is PICKEDUP', '2018-10-07 13:45:36', '2018-10-07 13:45:36'),
(505, 3, 0, 'Your Order Id  Status is ARRIVED', '2018-10-07 13:45:43', '2018-10-07 13:45:43'),
(506, 3, 0, 'Your Order Id  Status is COMPLETED', '2018-10-07 13:45:50', '2018-10-07 13:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0591988bf8736d344908216faaa6efe8a0663d4dd8a66ac7be40887adc5705cdfbfa62441a12f1f0', 3, 1, '3transporter', '[]', 0, '2018-10-01 10:33:59', '2018-10-01 10:33:59', '2019-10-01 10:33:59'),
('063c4f75a56573f3c2727914acdb88526d591fc180840e446fda58b4a71458cd4860b124d50e3094', 3, 1, '3transporter', '[]', 0, '2018-10-01 11:21:42', '2018-10-01 11:21:42', '2019-10-01 11:21:42'),
('0a069bb191357eeac21d16ec1c3293767603359d5274621c72961acd80c4cfc5113fbf52a4bd7209', 7, 1, '7transporter', '[]', 0, '2018-09-26 03:22:57', '2018-09-26 03:22:57', '2019-09-26 03:22:57'),
('0af33f25ccca3818eaba86ede503a7e27fc3223067a8ffc20e295beb099b46fa91e492e855b3a471', 3, 1, '3transporter', '[]', 0, '2018-10-01 10:53:53', '2018-10-01 10:53:53', '2019-10-01 10:53:53'),
('0bef4dd8d04e470966093fd25909e1e2b86c5661a60f0bb05fe78890a9b6da44db212beb538f218c', 3, 1, '3transporter', '[]', 0, '2018-09-25 14:17:04', '2018-09-25 14:17:04', '2019-09-25 14:17:04'),
('0ce08a4a038ff7098da5cdb4119cac14c0e290adf47aa7c7bba3302c100829f462835ed674e3bb2a', 3, 1, '3transporter', '[]', 0, '2018-10-07 16:18:05', '2018-10-07 16:18:05', '2019-10-07 16:18:05'),
('1ca4b24ab52d639a00da8e63ef8a15c0b626f029fb558b8b1396c1b67e3a738c848b73ce5ddc5df4', 6, 2, NULL, '[]', 0, '2018-09-27 14:43:26', '2018-09-27 14:43:26', '2019-09-27 14:43:26'),
('1de6a7b74574f73aa996f24ade006840bde62c1169c603eedac16da0eb55a77b187b4d09f0dcc446', 6, 2, NULL, '[]', 0, '2018-09-27 18:56:53', '2018-09-27 18:56:53', '2019-09-27 18:56:53'),
('1fbc3853390430acc905647e48ea90d914aaca6b4c87426b0159eecce6dde92c4f80f1d57a9125f1', 6, 2, NULL, '[]', 0, '2018-09-25 12:50:48', '2018-09-25 12:50:48', '2019-09-25 12:50:48'),
('27c892029dc65b9ac5b00b98b479d2e13b9bca37d97e910cc597b99ec916566e66a791ccd15262eb', 13, 2, NULL, '[]', 0, '2018-09-30 16:23:50', '2018-09-30 16:23:50', '2019-09-30 16:23:50'),
('2bcadba79d7c05a220ff7dc5fe1f01a44b99631519f8026134578d0abd8f136dd94b56391d94e793', 3, 1, '3transporter', '[]', 0, '2018-09-29 14:59:44', '2018-09-29 14:59:44', '2019-09-29 14:59:44'),
('2d28c3cc9a8edece2f88fa4a0a1e1af11605b6b36b8bc772ae5fb3d76b88f3fbbef47d9f1ff6058f', 6, 2, NULL, '[]', 0, '2018-09-25 13:58:20', '2018-09-25 13:58:20', '2019-09-25 13:58:20'),
('2d7088004b35da13967b32e6f3e9af478651b65347c346fcb9c3bd9fe93194c0794400adc26c3ce6', 9, 1, '9transporter', '[]', 0, '2018-09-30 17:07:00', '2018-09-30 17:07:00', '2019-09-30 17:07:00'),
('307d10100baf5eadc69be4558ff1c47f87cad1de513889f29733205d55b0d06d8730ebd263721901', 3, 1, '3transporter', '[]', 0, '2018-10-01 09:59:31', '2018-10-01 09:59:31', '2019-10-01 09:59:31'),
('35f037181509f3f80582d6bb9ead99d9d5970442c0913cf78658bc166edc75b1699b2bbd2a7bf43b', 3, 1, '3transporter', '[]', 0, '2018-09-26 19:38:33', '2018-09-26 19:38:33', '2019-09-26 19:38:33'),
('38a398415cbbc0e580d79a3e0615a86e4420fa1bbba0da8403f292ec28baaa180eadd6d301550121', 6, 2, NULL, '[]', 0, '2018-09-25 12:10:00', '2018-09-25 12:10:00', '2019-09-25 12:10:00'),
('38d6e624931e5ee708f40f88f983830dac084e54c22401a490a2db712a2b2d103a4bbb014d55acce', 7, 1, '7transporter', '[]', 0, '2018-09-25 14:45:35', '2018-09-25 14:45:35', '2019-09-25 14:45:35'),
('3f525b9d8ad46ebfd7e7cf3bd74a33e1702e78e3eba42691b05ab505e2798cb9cfe198bc9317c015', 3, 1, '3transporter', '[]', 0, '2018-09-30 06:46:54', '2018-09-30 06:46:54', '2019-09-30 06:46:54'),
('3f659531bc3c9419af67d9e07ffb41266c835e4ea2c812b9e28704f0ac0b49aa1f77823b7c3a6e4c', 3, 1, '3transporter', '[]', 0, '2018-09-25 10:56:38', '2018-09-25 10:56:38', '2019-09-25 10:56:38'),
('3f896a0e7989f6696b938e0081dc0b806e6f04d2d5089ef88f4f53463906c2e5651be067a3188fae', 3, 1, '3transporter', '[]', 0, '2018-10-01 10:33:35', '2018-10-01 10:33:35', '2019-10-01 10:33:35'),
('48b142ad44bf25581e5bbd4724c1080bd3ee271f92f7e2c0d3270d373ddc68739d93cce2ed7e38e6', 2, 1, '2transporter', '[]', 0, '2018-09-29 14:07:04', '2018-09-29 14:07:04', '2019-09-29 14:07:04'),
('4eee930dbdf71a88323d4f25237b6c307c88a280ef7d3f84b26a4a88c0f40bc1c19e3062d142363d', 6, 2, NULL, '[]', 0, '2018-09-26 13:27:30', '2018-09-26 13:27:30', '2019-09-26 13:27:30'),
('53f178a063e94d8ca2f201d4bb36a0ee9dec97dbc24b0281b6b0439b1d89722765d7969faeeeb2b8', 3, 2, NULL, '[]', 0, '2018-09-27 15:39:26', '2018-09-27 15:39:26', '2019-09-27 15:39:26'),
('55301a8985c39c7b5b7b3398063033d97aece7a67863788ba20848e33a1cfbcf42d3f95327ce2376', 13, 2, NULL, '[]', 0, '2018-09-30 16:30:27', '2018-09-30 16:30:27', '2019-09-30 16:30:27'),
('563cee0655899e0e81c4fb4790948f7e549ec407af48887fc5d028c0d291c9360d77cc1483cdfa42', 8, 1, '8transporter', '[]', 0, '2018-09-29 13:04:30', '2018-09-29 13:04:30', '2019-09-29 13:04:30'),
('57ae4baa556847f60f26b322a831c9738928066e5769969941c288c147d08ca05e18bd04a751ebb2', 2, 1, '2transporter', '[]', 0, '2018-09-25 13:46:15', '2018-09-25 13:46:15', '2019-09-25 13:46:15'),
('58ad6832d311c863da32f47f8f78b081ae4e2554f32aa385fd30a8611adf2209c8514c67f05cb6ff', 6, 2, NULL, '[]', 0, '2018-10-01 09:56:05', '2018-10-01 09:56:05', '2019-10-01 09:56:05'),
('5bf2f9bf3d670c7c8cc8e4eff0a1e06c11bb646bef257cdf618e8b165f72ccc4d73a4672a08aa73b', 5, 2, NULL, '[]', 0, '2018-09-25 10:19:48', '2018-09-25 10:19:48', '2019-09-25 10:19:48'),
('5f90caaf702876aff958692b89fee57f6c3a37a0f9f4ae09bef775004f68e20815a21c92135e1d98', 3, 1, '3transporter', '[]', 0, '2018-10-01 11:20:01', '2018-10-01 11:20:01', '2019-10-01 11:20:01'),
('650dadfe21ca70d1e18b6a3b2b1fe308425201d8c2ded1c08b0532be4b232a59fa7a3327b422f3f8', 6, 2, NULL, '[]', 0, '2018-09-27 18:48:33', '2018-09-27 18:48:33', '2019-09-27 18:48:33'),
('6a750f80a3b5ef77eea34fb3c269597f37409827d7c15331d0ac569f813fa88b68da0377f2aaf8b8', 5, 2, NULL, '[]', 0, '2018-09-25 12:21:01', '2018-09-25 12:21:01', '2019-09-25 12:21:01'),
('6b3492dac965bb248850861abbe345bc17d691443951271e0792d34392e2aeae4f8ec89a6c4cef97', 3, 1, '3transporter', '[]', 0, '2018-09-30 06:27:25', '2018-09-30 06:27:25', '2019-09-30 06:27:25'),
('6bcb5f0b43125a721a9e802add808b8ec76157089e34ae8392a8756c03eaf24a05344aca93ce9b0a', 6, 2, NULL, '[]', 0, '2018-09-26 11:06:28', '2018-09-26 11:06:28', '2019-09-26 11:06:28'),
('6cf18c98e47709247d58347c0221a03b91e6b9e5beea09c1027f1110e6e5c6c7c8b944ceadbde7c1', 6, 2, NULL, '[]', 0, '2018-09-29 14:59:14', '2018-09-29 14:59:14', '2019-09-29 14:59:14'),
('6dfa43d71d0ca81249a2c5c9166126a00516efb3c25350434f69ebc8492aab084f851d4031fdfe07', 11, 2, NULL, '[]', 0, '2018-09-29 21:35:12', '2018-09-29 21:35:12', '2019-09-29 21:35:12'),
('710ec247565c7006ecd247564226d0e538dd848a44e05a2c82fc17661d1559de2b910d00bc8c9b05', 5, 2, NULL, '[]', 0, '2018-09-25 12:07:09', '2018-09-25 12:07:09', '2019-09-25 12:07:09'),
('739567cb109da261451f8b95ebe710e5c814f72e19ec24b43b763e38550360e0164bfc0d97a52beb', 6, 2, NULL, '[]', 0, '2018-09-26 21:37:03', '2018-09-26 21:37:03', '2019-09-26 21:37:03'),
('7c36dbc3fd2e43c17a8f43a02313bccc24de3f99749e8ca38c95679b74e53e63cd1fb3e4f2b8391f', 3, 1, '3transporter', '[]', 0, '2018-09-27 05:19:55', '2018-09-27 05:19:55', '2019-09-27 05:19:55'),
('7fd988588cd88c63ab8252b2cf70036702bc1e487ad51b20d0195057f302eded174d8d84e3f680c1', 6, 2, NULL, '[]', 0, '2018-09-29 14:28:30', '2018-09-29 14:28:30', '2019-09-29 14:28:30'),
('80a261f0511e1fa70e547050da6096d0550707a2481b299d06758371c805ca79dad73133c492d7bf', 2, 1, '2transporter', '[]', 0, '2018-09-27 18:53:34', '2018-09-27 18:53:34', '2019-09-27 18:53:34'),
('8c0d841ec2360a61263b25f64e9cab4271f9533c867df6f0496bdfd7730944bbe1f7673d24a73519', 5, 2, NULL, '[]', 0, '2018-09-25 10:09:00', '2018-09-25 10:09:00', '2019-09-25 10:09:00'),
('96b2fad15e2efa026c5e03facbf73a9d5623b1084dbd79dfe66d9cbe9e962844149601a4f292a567', 3, 1, '3transporter', '[]', 0, '2018-09-30 06:29:53', '2018-09-30 06:29:53', '2019-09-30 06:29:53'),
('9c82eadb1fd13e5bb58f7626a665b7a77ab58f6f0f7630c9ee0eafd002543ae483998985a57f17c5', 8, 1, '8transporter', '[]', 0, '2018-09-27 19:45:02', '2018-09-27 19:45:02', '2019-09-27 19:45:02'),
('9f1b860f90936bdd569fa43916fac1b521bd8533a7d14cd10aaaa464e0fe3a746bff2fb79857d2e9', 14, 2, NULL, '[]', 0, '2018-09-30 16:25:03', '2018-09-30 16:25:03', '2019-09-30 16:25:03'),
('aa3518792e926958cf108b8b350816e77f6b1e8d7a7cc394fcd17750cc30a22800c7e26ab18d7540', 2, 1, '2transporter', '[]', 0, '2018-09-26 18:57:09', '2018-09-26 18:57:09', '2019-09-26 18:57:09'),
('ae2d87f6042bc82a68ff4e961ba815d013420cb1056aaf0cb020117dc9a58d08b80b7cbcd83d7e88', 5, 2, NULL, '[]', 0, '2018-09-27 10:51:42', '2018-09-27 10:51:42', '2019-09-27 10:51:42'),
('afff50752bc7926a817c10ef958eac1623b969d416efbdcd6c37e5f219f6a3c237dfb3f3d1db5b77', 8, 1, '8transporter', '[]', 0, '2018-09-27 19:19:22', '2018-09-27 19:19:22', '2019-09-27 19:19:22'),
('c5b586b8aca597cd7d7357d7579b4a2431c4b332a9f82da11edd4e01606e7e9290f5c4df776142c2', 5, 2, NULL, '[]', 0, '2018-09-25 12:15:20', '2018-09-25 12:15:20', '2019-09-25 12:15:20'),
('cc28332c0ae175585a0eafd6408ab76b3bb15e49710eaa090a0abb9a6301e45c6c418a3c85c205e6', 3, 1, '3transporter', '[]', 0, '2018-09-29 14:47:47', '2018-09-29 14:47:47', '2019-09-29 14:47:47'),
('cfbe0385a4f1b3b938de28f0e9c45af1ff267982df930006735a17a5759f63233a67689a9d04f386', 8, 1, '8transporter', '[]', 0, '2018-09-27 18:57:30', '2018-09-27 18:57:30', '2019-09-27 18:57:30'),
('d1ef8c5636cd39a193911fcbdfabd83589b5039c9266caa3701fc332f94c5b5a046e993786fabe74', 6, 2, NULL, '[]', 0, '2018-09-26 21:12:08', '2018-09-26 21:12:08', '2019-09-26 21:12:08'),
('d4bdbb32511b2a019fbb02181674b5656fa2c32867b65b3ce8071420596f611b599e14d1d3e535fd', 3, 1, '3transporter', '[]', 0, '2018-09-26 19:46:27', '2018-09-26 19:46:27', '2019-09-26 19:46:27'),
('d87e8e30207cf8d8d2b4dc85eedbd8ad6d2a7ee1bfbbf76b17557ad1e5a269b3f06c2236fca78f17', 2, 1, '2transporter', '[]', 0, '2018-09-28 17:14:29', '2018-09-28 17:14:29', '2019-09-28 17:14:29'),
('d9b522216ea15faeb8c78de0350e07108b4ad6793aa5b9ee0912df66e2623a58ec6247a781a14311', 3, 1, '3transporter', '[]', 0, '2018-09-25 10:11:35', '2018-09-25 10:11:35', '2019-09-25 10:11:35'),
('da755cf102e2ca995bc54e06352fd6c2e22f5f3b39d3be52ad7ab0c6827e51580e9e945c0e8b1233', 3, 1, '3transporter', '[]', 0, '2018-09-30 06:24:40', '2018-09-30 06:24:40', '2019-09-30 06:24:40'),
('e332d96e84cf7288380a6747242524283f78cd6505ee38d98ece5faa225f1c16373d55de5b0ed945', 7, 2, NULL, '[]', 0, '2018-09-25 12:37:46', '2018-09-25 12:37:46', '2019-09-25 12:37:46'),
('e4822a33a520d8d20782febc84b82aefb695503af12a41b1c989939e103d649adbe758a1cb8d74d3', 12, 2, NULL, '[]', 0, '2018-09-30 11:26:26', '2018-09-30 11:26:26', '2019-09-30 11:26:26'),
('f050466080f3746c52c740c7c002c95d37538a3cfa21eec02d13dd7926bfc8afdd085617d8f24a70', 14, 2, NULL, '[]', 0, '2018-09-30 16:27:15', '2018-09-30 16:27:15', '2019-09-30 16:27:15'),
('fcc1dbce22b5c8613c9a0a190a9fa75e919ee99b906efb42612ab1aacc34dae913fc34e7762302ba', 6, 2, NULL, '[]', 0, '2018-09-26 21:51:02', '2018-09-26 21:51:02', '2019-09-26 21:51:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token_providers`
--

CREATE TABLE `oauth_access_token_providers` (
  `oauth_access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_token_providers`
--

INSERT INTO `oauth_access_token_providers` (`oauth_access_token_id`, `provider`, `created_at`, `updated_at`) VALUES
('0591988bf8736d344908216faaa6efe8a0663d4dd8a66ac7be40887adc5705cdfbfa62441a12f1f0', 'users', '2018-10-01 10:33:59', '2018-10-01 10:33:59'),
('063c4f75a56573f3c2727914acdb88526d591fc180840e446fda58b4a71458cd4860b124d50e3094', 'users', '2018-10-01 11:21:42', '2018-10-01 11:21:42'),
('0a069bb191357eeac21d16ec1c3293767603359d5274621c72961acd80c4cfc5113fbf52a4bd7209', 'users', '2018-09-26 03:22:57', '2018-09-26 03:22:57'),
('0af33f25ccca3818eaba86ede503a7e27fc3223067a8ffc20e295beb099b46fa91e492e855b3a471', 'users', '2018-10-01 10:53:53', '2018-10-01 10:53:53'),
('0bef4dd8d04e470966093fd25909e1e2b86c5661a60f0bb05fe78890a9b6da44db212beb538f218c', 'users', '2018-09-25 14:17:04', '2018-09-25 14:17:04'),
('0ce08a4a038ff7098da5cdb4119cac14c0e290adf47aa7c7bba3302c100829f462835ed674e3bb2a', 'users', '2018-10-07 16:18:05', '2018-10-07 16:18:05'),
('1ca4b24ab52d639a00da8e63ef8a15c0b626f029fb558b8b1396c1b67e3a738c848b73ce5ddc5df4', 'users', '2018-09-27 14:43:26', '2018-09-27 14:43:26'),
('1de6a7b74574f73aa996f24ade006840bde62c1169c603eedac16da0eb55a77b187b4d09f0dcc446', 'users', '2018-09-27 18:56:53', '2018-09-27 18:56:53'),
('1fbc3853390430acc905647e48ea90d914aaca6b4c87426b0159eecce6dde92c4f80f1d57a9125f1', 'users', '2018-09-25 12:50:48', '2018-09-25 12:50:48'),
('27c892029dc65b9ac5b00b98b479d2e13b9bca37d97e910cc597b99ec916566e66a791ccd15262eb', 'users', '2018-09-30 16:23:50', '2018-09-30 16:23:50'),
('2bcadba79d7c05a220ff7dc5fe1f01a44b99631519f8026134578d0abd8f136dd94b56391d94e793', 'users', '2018-09-29 14:59:44', '2018-09-29 14:59:44'),
('2d28c3cc9a8edece2f88fa4a0a1e1af11605b6b36b8bc772ae5fb3d76b88f3fbbef47d9f1ff6058f', 'users', '2018-09-25 13:58:20', '2018-09-25 13:58:20'),
('2d7088004b35da13967b32e6f3e9af478651b65347c346fcb9c3bd9fe93194c0794400adc26c3ce6', 'users', '2018-09-30 17:07:00', '2018-09-30 17:07:00'),
('307d10100baf5eadc69be4558ff1c47f87cad1de513889f29733205d55b0d06d8730ebd263721901', 'users', '2018-10-01 09:59:31', '2018-10-01 09:59:31'),
('35f037181509f3f80582d6bb9ead99d9d5970442c0913cf78658bc166edc75b1699b2bbd2a7bf43b', 'users', '2018-09-26 19:38:33', '2018-09-26 19:38:33'),
('38a398415cbbc0e580d79a3e0615a86e4420fa1bbba0da8403f292ec28baaa180eadd6d301550121', 'users', '2018-09-25 12:10:00', '2018-09-25 12:10:00'),
('38d6e624931e5ee708f40f88f983830dac084e54c22401a490a2db712a2b2d103a4bbb014d55acce', 'users', '2018-09-25 14:45:35', '2018-09-25 14:45:35'),
('3f525b9d8ad46ebfd7e7cf3bd74a33e1702e78e3eba42691b05ab505e2798cb9cfe198bc9317c015', 'users', '2018-09-30 06:46:54', '2018-09-30 06:46:54'),
('3f659531bc3c9419af67d9e07ffb41266c835e4ea2c812b9e28704f0ac0b49aa1f77823b7c3a6e4c', 'users', '2018-09-25 10:56:38', '2018-09-25 10:56:38'),
('3f896a0e7989f6696b938e0081dc0b806e6f04d2d5089ef88f4f53463906c2e5651be067a3188fae', 'users', '2018-10-01 10:33:36', '2018-10-01 10:33:36'),
('48b142ad44bf25581e5bbd4724c1080bd3ee271f92f7e2c0d3270d373ddc68739d93cce2ed7e38e6', 'users', '2018-09-29 14:07:04', '2018-09-29 14:07:04'),
('4eee930dbdf71a88323d4f25237b6c307c88a280ef7d3f84b26a4a88c0f40bc1c19e3062d142363d', 'users', '2018-09-26 13:27:30', '2018-09-26 13:27:30'),
('53f178a063e94d8ca2f201d4bb36a0ee9dec97dbc24b0281b6b0439b1d89722765d7969faeeeb2b8', 'users', '2018-09-27 15:39:26', '2018-09-27 15:39:26'),
('55301a8985c39c7b5b7b3398063033d97aece7a67863788ba20848e33a1cfbcf42d3f95327ce2376', 'users', '2018-09-30 16:30:27', '2018-09-30 16:30:27'),
('563cee0655899e0e81c4fb4790948f7e549ec407af48887fc5d028c0d291c9360d77cc1483cdfa42', 'users', '2018-09-29 13:04:30', '2018-09-29 13:04:30'),
('57ae4baa556847f60f26b322a831c9738928066e5769969941c288c147d08ca05e18bd04a751ebb2', 'users', '2018-09-25 13:46:15', '2018-09-25 13:46:15'),
('58ad6832d311c863da32f47f8f78b081ae4e2554f32aa385fd30a8611adf2209c8514c67f05cb6ff', 'users', '2018-10-01 09:56:05', '2018-10-01 09:56:05'),
('5bf2f9bf3d670c7c8cc8e4eff0a1e06c11bb646bef257cdf618e8b165f72ccc4d73a4672a08aa73b', 'users', '2018-09-25 10:19:48', '2018-09-25 10:19:48'),
('5f90caaf702876aff958692b89fee57f6c3a37a0f9f4ae09bef775004f68e20815a21c92135e1d98', 'users', '2018-10-01 11:20:01', '2018-10-01 11:20:01'),
('650dadfe21ca70d1e18b6a3b2b1fe308425201d8c2ded1c08b0532be4b232a59fa7a3327b422f3f8', 'users', '2018-09-27 18:48:33', '2018-09-27 18:48:33'),
('6a750f80a3b5ef77eea34fb3c269597f37409827d7c15331d0ac569f813fa88b68da0377f2aaf8b8', 'users', '2018-09-25 12:21:01', '2018-09-25 12:21:01'),
('6b3492dac965bb248850861abbe345bc17d691443951271e0792d34392e2aeae4f8ec89a6c4cef97', 'users', '2018-09-30 06:27:25', '2018-09-30 06:27:25'),
('6bcb5f0b43125a721a9e802add808b8ec76157089e34ae8392a8756c03eaf24a05344aca93ce9b0a', 'users', '2018-09-26 11:06:28', '2018-09-26 11:06:28'),
('6cf18c98e47709247d58347c0221a03b91e6b9e5beea09c1027f1110e6e5c6c7c8b944ceadbde7c1', 'users', '2018-09-29 14:59:14', '2018-09-29 14:59:14'),
('6dfa43d71d0ca81249a2c5c9166126a00516efb3c25350434f69ebc8492aab084f851d4031fdfe07', 'users', '2018-09-29 21:35:12', '2018-09-29 21:35:12'),
('710ec247565c7006ecd247564226d0e538dd848a44e05a2c82fc17661d1559de2b910d00bc8c9b05', 'users', '2018-09-25 12:07:09', '2018-09-25 12:07:09'),
('739567cb109da261451f8b95ebe710e5c814f72e19ec24b43b763e38550360e0164bfc0d97a52beb', 'users', '2018-09-26 21:37:03', '2018-09-26 21:37:03'),
('7c36dbc3fd2e43c17a8f43a02313bccc24de3f99749e8ca38c95679b74e53e63cd1fb3e4f2b8391f', 'users', '2018-09-27 05:19:55', '2018-09-27 05:19:55'),
('7fd988588cd88c63ab8252b2cf70036702bc1e487ad51b20d0195057f302eded174d8d84e3f680c1', 'users', '2018-09-29 14:28:30', '2018-09-29 14:28:30'),
('80a261f0511e1fa70e547050da6096d0550707a2481b299d06758371c805ca79dad73133c492d7bf', 'users', '2018-09-27 18:53:34', '2018-09-27 18:53:34'),
('8c0d841ec2360a61263b25f64e9cab4271f9533c867df6f0496bdfd7730944bbe1f7673d24a73519', 'users', '2018-09-25 10:09:00', '2018-09-25 10:09:00'),
('96b2fad15e2efa026c5e03facbf73a9d5623b1084dbd79dfe66d9cbe9e962844149601a4f292a567', 'users', '2018-09-30 06:29:53', '2018-09-30 06:29:53'),
('9c82eadb1fd13e5bb58f7626a665b7a77ab58f6f0f7630c9ee0eafd002543ae483998985a57f17c5', 'users', '2018-09-27 19:45:02', '2018-09-27 19:45:02'),
('9f1b860f90936bdd569fa43916fac1b521bd8533a7d14cd10aaaa464e0fe3a746bff2fb79857d2e9', 'users', '2018-09-30 16:25:03', '2018-09-30 16:25:03'),
('aa3518792e926958cf108b8b350816e77f6b1e8d7a7cc394fcd17750cc30a22800c7e26ab18d7540', 'users', '2018-09-26 18:57:09', '2018-09-26 18:57:09'),
('ae2d87f6042bc82a68ff4e961ba815d013420cb1056aaf0cb020117dc9a58d08b80b7cbcd83d7e88', 'users', '2018-09-27 10:51:42', '2018-09-27 10:51:42'),
('afff50752bc7926a817c10ef958eac1623b969d416efbdcd6c37e5f219f6a3c237dfb3f3d1db5b77', 'users', '2018-09-27 19:19:22', '2018-09-27 19:19:22'),
('c5b586b8aca597cd7d7357d7579b4a2431c4b332a9f82da11edd4e01606e7e9290f5c4df776142c2', 'users', '2018-09-25 12:15:20', '2018-09-25 12:15:20'),
('cc28332c0ae175585a0eafd6408ab76b3bb15e49710eaa090a0abb9a6301e45c6c418a3c85c205e6', 'users', '2018-09-29 14:47:47', '2018-09-29 14:47:47'),
('cfbe0385a4f1b3b938de28f0e9c45af1ff267982df930006735a17a5759f63233a67689a9d04f386', 'users', '2018-09-27 18:57:30', '2018-09-27 18:57:30'),
('d1ef8c5636cd39a193911fcbdfabd83589b5039c9266caa3701fc332f94c5b5a046e993786fabe74', 'users', '2018-09-26 21:12:08', '2018-09-26 21:12:08'),
('d4bdbb32511b2a019fbb02181674b5656fa2c32867b65b3ce8071420596f611b599e14d1d3e535fd', 'users', '2018-09-26 19:46:27', '2018-09-26 19:46:27'),
('d87e8e30207cf8d8d2b4dc85eedbd8ad6d2a7ee1bfbbf76b17557ad1e5a269b3f06c2236fca78f17', 'users', '2018-09-28 17:14:29', '2018-09-28 17:14:29'),
('d9b522216ea15faeb8c78de0350e07108b4ad6793aa5b9ee0912df66e2623a58ec6247a781a14311', 'users', '2018-09-25 10:11:35', '2018-09-25 10:11:35'),
('da755cf102e2ca995bc54e06352fd6c2e22f5f3b39d3be52ad7ab0c6827e51580e9e945c0e8b1233', 'users', '2018-09-30 06:24:40', '2018-09-30 06:24:40'),
('e332d96e84cf7288380a6747242524283f78cd6505ee38d98ece5faa225f1c16373d55de5b0ed945', 'users', '2018-09-25 12:37:46', '2018-09-25 12:37:46'),
('e4822a33a520d8d20782febc84b82aefb695503af12a41b1c989939e103d649adbe758a1cb8d74d3', 'users', '2018-09-30 11:26:26', '2018-09-30 11:26:26'),
('f050466080f3746c52c740c7c002c95d37538a3cfa21eec02d13dd7926bfc8afdd085617d8f24a70', 'users', '2018-09-30 16:27:15', '2018-09-30 16:27:15'),
('fcc1dbce22b5c8613c9a0a190a9fa75e919ee99b906efb42612ab1aacc34dae913fc34e7762302ba', 'users', '2018-09-26 21:51:02', '2018-09-26 21:51:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Saffari Personal Access Client', 'hyLis0z6HlC4bPHazWTtsFCLZhu2xYUXWgZGNLhr', 'http://localhost', 1, 0, 0, '2018-09-24 11:18:57', '2018-09-24 11:18:57'),
(2, NULL, 'Saffari Password Grant Client', 'RP6fCLiCGYLC163GLkPWMabusArAVKFX3pxUMkXl', 'http://localhost', 0, 1, 0, '2018-09-24 11:18:57', '2018-09-24 11:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-09-24 11:18:57', '2018-09-24 11:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0a4415123d3f82846ef666cf81e1c53559d04ebfd9d59bbf74ca4b90be2069dca82a68da3f618e54', '1fbc3853390430acc905647e48ea90d914aaca6b4c87426b0159eecce6dde92c4f80f1d57a9125f1', 0, '2019-09-25 12:50:48'),
('0b809d707296704bb9768ced5c86c6db25b63d9b0b85f230593179d6e9c9f2794beefc653bb27094', '38a398415cbbc0e580d79a3e0615a86e4420fa1bbba0da8403f292ec28baaa180eadd6d301550121', 0, '2019-09-25 12:10:00'),
('145fdceb4f749eae198061b2c196720d0cda1fff4af040177e3edd3b33735679094d724d29137fdf', 'd1ef8c5636cd39a193911fcbdfabd83589b5039c9266caa3701fc332f94c5b5a046e993786fabe74', 0, '2019-09-26 21:12:08'),
('14c22446268ef625d03caf88824421b44475a7669655f3c3c06eaccec2bc6a58a6f83e0a6ace0973', '6bcb5f0b43125a721a9e802add808b8ec76157089e34ae8392a8756c03eaf24a05344aca93ce9b0a', 0, '2019-09-26 11:06:28'),
('264a7569d0245cffca811bdf998b0f40537c8409aab654fa7f9608282d2cc8c7059226692dbb916c', 'c5b586b8aca597cd7d7357d7579b4a2431c4b332a9f82da11edd4e01606e7e9290f5c4df776142c2', 0, '2019-09-25 12:15:20'),
('27ccffcdb577bacf90409d1562b1ced9d9ea0b20faa35c156e8ce5c1ddc645216243c339f513c84d', '8c0d841ec2360a61263b25f64e9cab4271f9533c867df6f0496bdfd7730944bbe1f7673d24a73519', 0, '2019-09-25 10:09:00'),
('3b26d50c86cffbfd078a41ffc75bce47710d00a26c94b786b074a6a4ac430e31b36a32bd980c249a', '1de6a7b74574f73aa996f24ade006840bde62c1169c603eedac16da0eb55a77b187b4d09f0dcc446', 0, '2019-09-27 18:56:53'),
('4f95253f0a966d37c919aee4a88ff8452d587f8e44beb98b823cd99548228a82b01d21b041c7bb00', '9f1b860f90936bdd569fa43916fac1b521bd8533a7d14cd10aaaa464e0fe3a746bff2fb79857d2e9', 0, '2019-09-30 16:25:03'),
('647851665d045969be0d6f6726e63a5dd92709810fbad9160a0d8cbe8220d4f8c69a7973be7ec2c0', '6a750f80a3b5ef77eea34fb3c269597f37409827d7c15331d0ac569f813fa88b68da0377f2aaf8b8', 0, '2019-09-25 12:21:01'),
('6b48f7cc2c48e7bf585f3e6634bca5b79145eec8c7cd623ed76e1cde2b7e5d32955b38e5b5730697', '5bf2f9bf3d670c7c8cc8e4eff0a1e06c11bb646bef257cdf618e8b165f72ccc4d73a4672a08aa73b', 0, '2019-09-25 10:19:48'),
('705987468bed545358c381f6abc6bdfa2c0aa38851f2babfafeff161c6d4551fa89dbd61a33c24ba', '2d28c3cc9a8edece2f88fa4a0a1e1af11605b6b36b8bc772ae5fb3d76b88f3fbbef47d9f1ff6058f', 0, '2019-09-25 13:58:20'),
('7bc2c18295066ce1dc91a67c8155486c9d1dfc6ea7b961acfee37683ae9ba79de055aae34e9e8716', '7fd988588cd88c63ab8252b2cf70036702bc1e487ad51b20d0195057f302eded174d8d84e3f680c1', 0, '2019-09-29 14:28:30'),
('89e6b3ae022db639ba72525539c89234f7a2b47b19e9e7cee8e0eba487f53cf0fc7ad29fce1dbd06', '710ec247565c7006ecd247564226d0e538dd848a44e05a2c82fc17661d1559de2b910d00bc8c9b05', 0, '2019-09-25 12:07:09'),
('95e6acc661dda6875bfe76f414fb69a1ace578d3cc1290ebfd877a22bd806d70db08d1a66c4b84e4', '739567cb109da261451f8b95ebe710e5c814f72e19ec24b43b763e38550360e0164bfc0d97a52beb', 0, '2019-09-26 21:37:03'),
('97b98a4ddc8896406784285ae0ff78fd2968ad5c597a63279d9b91abdb8bb8eb2909dfe106260db4', 'ae2d87f6042bc82a68ff4e961ba815d013420cb1056aaf0cb020117dc9a58d08b80b7cbcd83d7e88', 0, '2019-09-27 10:51:42'),
('9b0f419cc20a17b32982abdbe26338e2b820111aa2a2f47deceaf3e9271525db1d3ef30299e9285a', '55301a8985c39c7b5b7b3398063033d97aece7a67863788ba20848e33a1cfbcf42d3f95327ce2376', 0, '2019-09-30 16:30:27'),
('9e38be6788dd466c9b32f032328d5b0e781c6ba39a7d14cdee79dcf2bc9ba50da197cd21b431c30b', '6cf18c98e47709247d58347c0221a03b91e6b9e5beea09c1027f1110e6e5c6c7c8b944ceadbde7c1', 0, '2019-09-29 14:59:14'),
('a47424906307df3f1a5fa27b976d336cf0412b8095c376db51f55f3bc7da489d538eb8b8d907a5d5', '27c892029dc65b9ac5b00b98b479d2e13b9bca37d97e910cc597b99ec916566e66a791ccd15262eb', 0, '2019-09-30 16:23:50'),
('abaf761c8c40ff6df4f61e23862873db18683bd1052d9d9c7e5fc10b28d7e629f1d5c3082e6c43a9', '6dfa43d71d0ca81249a2c5c9166126a00516efb3c25350434f69ebc8492aab084f851d4031fdfe07', 0, '2019-09-29 21:35:13'),
('ae1263d6a060598f0f94a5f012ca0f16d73bd29254b5114083d48a5031b73817d76d8e2d10cd4f8f', '53f178a063e94d8ca2f201d4bb36a0ee9dec97dbc24b0281b6b0439b1d89722765d7969faeeeb2b8', 0, '2019-09-27 15:39:26'),
('af1bf1984fcbea6a00d664300cd5ca5ecdc5db9949714125cc272495ae1ae308d1e6ece518fc78bc', 'f050466080f3746c52c740c7c002c95d37538a3cfa21eec02d13dd7926bfc8afdd085617d8f24a70', 0, '2019-09-30 16:27:15'),
('d59acf34f1dbd0d22aa13ea0c9e6c3ef1da9383f5b54e2cb831eec9eef4b5ec9c6c53a957bcdd075', '1ca4b24ab52d639a00da8e63ef8a15c0b626f029fb558b8b1396c1b67e3a738c848b73ce5ddc5df4', 0, '2019-09-27 14:43:26'),
('dccbd572037b3e93f830353227633d81a883d783d266edb0bd8b2fd5dbd4d9d98e3b4f7bf735c99c', 'fcc1dbce22b5c8613c9a0a190a9fa75e919ee99b906efb42612ab1aacc34dae913fc34e7762302ba', 0, '2019-09-26 21:51:02'),
('e30276961d065a76e8fa144222435c5e66130fa99086a744ccb0a5bc1f0e6303c5af2c60c22f2fdb', '58ad6832d311c863da32f47f8f78b081ae4e2554f32aa385fd30a8611adf2209c8514c67f05cb6ff', 0, '2019-10-01 09:56:05'),
('e4a6812bcfa27dea5b12a59b16a53a81ec166d634e7a053eb2e433943db02e6d83b73e57edd30450', 'e332d96e84cf7288380a6747242524283f78cd6505ee38d98ece5faa225f1c16373d55de5b0ed945', 0, '2019-09-25 12:37:46'),
('ebd07098141fd2e61c2b4a931df01a5dfc46cdb269d83ef198dc8e9e1bf3bc57ebbc23b7689a9f15', '4eee930dbdf71a88323d4f25237b6c307c88a280ef7d3f84b26a4a88c0f40bc1c19e3062d142363d', 0, '2019-09-26 13:27:30'),
('fafda8ef07fc943c0ea56c41607425f16854201412d1e426b6a2af1822173a14896115f39a1330e3', 'e4822a33a520d8d20782febc84b82aefb695503af12a41b1c989939e103d649adbe758a1cb8d74d3', 0, '2019-09-30 11:26:26'),
('ff28c77c673556c50a7b8a52d125e119bb9e038e7d88d66d4dbff6a099d3dc5e2f9c58ffb3871c12', '650dadfe21ca70d1e18b6a3b2b1fe308425201d8c2ded1c08b0532be4b232a59fa7a3327b422f3f8', 0, '2019-09-27 18:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `user_address_id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `transporter_id` int(11) DEFAULT NULL,
  `transporter_vehicle_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `route_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute` enum('CREATED','RESOLVE','NODISPUTE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NODISPUTE',
  `delivery_date` datetime NOT NULL,
  `order_otp` int(11) NOT NULL,
  `order_ready_time` int(11) NOT NULL DEFAULT '0',
  `order_ready_status` int(11) NOT NULL DEFAULT '0',
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','SEARCHING','REACHED','PICKEDUP','ARRIVED','COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ORDERED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `schedule_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `user_id`, `shift_id`, `user_address_id`, `shop_id`, `transporter_id`, `transporter_vehicle_id`, `reason`, `note`, `route_key`, `dispute`, `delivery_date`, `order_otp`, `order_ready_time`, `order_ready_status`, `status`, `created_at`, `updated_at`, `deleted_at`, `schedule_status`) VALUES
(2, '67474c69-41f7-4e55-b721-0d4c495ca7dd', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'yjftAaatlG', 'CREATED', '2018-09-24 19:46:00', 431663, 0, 0, 'CANCELLED', '2018-09-24 19:46:03', '2018-09-26 18:52:22', NULL, 0),
(3, '93a7e637-8152-4216-aa88-e8ff56bf3ca6', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'yjftAaatlG', 'CREATED', '2018-09-24 20:10:00', 552603, 0, 0, 'CANCELLED', '2018-09-24 20:10:21', '2018-09-26 18:20:09', NULL, 0),
(4, '5f3a0c93-18f0-4155-9c61-b989a52d0f2e', 5, NULL, 4, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 10:21:00', 288583, 0, 0, 'CANCELLED', '2018-09-25 10:21:21', '2018-09-26 18:52:59', NULL, 0),
(5, 'e80aca6d-66d0-406b-adb5-6ced43c5cb5b', 5, NULL, 4, 5, NULL, NULL, 'not interested', NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 10:24:00', 257909, 0, 0, 'CANCELLED', '2018-09-25 10:24:17', '2018-09-25 10:39:51', NULL, 0),
(6, '607f06bd-2fb0-4621-8a44-43e69266def4', 5, NULL, 4, 3, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 10:47:00', 361553, 0, 0, 'CANCELLED', '2018-09-25 10:47:13', '2018-09-26 18:52:55', NULL, 0),
(7, 'ce1caf55-9c5c-4f2a-847f-ee735ec8b1a9', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 12:11:00', 211670, 0, 0, 'CANCELLED', '2018-09-25 12:11:17', '2018-09-26 18:52:51', NULL, 0),
(8, 'cbe44ba6-8973-4dc6-898c-22e8cb4c0443', 6, NULL, 5, 3, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 12:19:00', 312595, 0, 0, 'CANCELLED', '2018-09-25 12:19:17', '2018-09-26 18:52:44', NULL, 0),
(9, 'd6a1ed56-d5fb-4868-8f20-fc54b748838b', 6, NULL, 5, 3, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 12:20:00', 110939, 0, 0, 'CANCELLED', '2018-09-25 12:20:53', '2018-09-26 18:52:40', NULL, 0),
(10, 'c4bcd5a4-b4c8-4de4-bbde-bb239399a36a', 5, NULL, 4, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 12:48:00', 333551, 0, 0, 'CANCELLED', '2018-09-25 12:48:09', '2018-09-26 18:52:28', NULL, 0),
(11, '2914d8f7-b629-4079-a044-e017c6ac06d3', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 13:13:00', 658780, 0, 0, 'CANCELLED', '2018-09-25 13:13:19', '2018-09-26 18:52:33', NULL, 0),
(12, '5520d337-8370-4251-a488-c5b474e13870', 6, NULL, 5, 3, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 13:14:00', 196032, 0, 0, 'CANCELLED', '2018-09-25 13:14:39', '2018-09-26 18:52:11', NULL, 0),
(13, '933db4f9-7fc1-46e5-94d0-18d1ae124daa', 5, NULL, 4, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 13:15:00', 580824, 0, 0, 'CANCELLED', '2018-09-25 13:15:26', '2018-09-26 18:52:06', NULL, 0),
(14, '53694350-55a0-460a-b4ff-5d981443360e', 3, NULL, 3, 5, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 13:25:00', 358043, 0, 0, 'CANCELLED', '2018-09-25 13:25:51', '2018-09-25 14:01:49', NULL, 0),
(15, 'c6c0ea74-f92d-453c-832e-81d44a4c1208', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 13:28:00', 412487, 0, 0, 'CANCELLED', '2018-09-25 13:28:47', '2018-09-25 14:01:45', NULL, 0),
(16, 'db1123af-0f53-4f9f-8c28-527a732dbcbc', 3, NULL, 3, 3, 2, NULL, NULL, NULL, 'yjftAaatlG', 'CREATED', '2018-09-25 13:36:00', 770285, 10, 0, 'CANCELLED', '2018-09-25 13:36:24', '2018-09-25 19:17:03', NULL, 0),
(17, 'de309dc8-2c46-4d5d-a6bb-94f0ad166378', 6, NULL, 5, 3, NULL, NULL, NULL, NULL, '', 'NODISPUTE', '2018-09-25 13:58:00', 460013, 20, 0, 'CANCELLED', '2018-09-25 13:58:43', '2018-09-25 14:00:59', NULL, 0),
(18, 'ad85a7fe-0fe1-47f4-b437-63d74f71b98b', 3, NULL, 3, 5, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 14:03:00', 145888, 0, 0, 'CANCELLED', '2018-09-25 14:03:44', '2018-09-26 18:52:02', NULL, 0),
(19, '694fe2cb-a52b-447e-a832-148eb7f35ae1', 6, NULL, 5, 3, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 14:06:00', 782192, 25, 0, 'CANCELLED', '2018-09-25 14:06:59', '2018-09-26 18:51:56', NULL, 0),
(20, '00e2ec29-3cc0-451d-807f-d06bf54daa24', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 14:20:00', 886349, 0, 0, 'CANCELLED', '2018-09-25 14:20:21', '2018-09-26 18:51:48', NULL, 0),
(21, '14fb6fda-ea8d-4c61-bac5-938931e7e693', 6, NULL, 5, 5, NULL, NULL, 'test', NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'NODISPUTE', '2018-09-25 14:23:00', 316097, 0, 0, 'CANCELLED', '2018-09-25 14:23:23', '2018-09-25 14:23:53', NULL, 0),
(22, '8b406575-b13d-484f-af71-02fff818aa7f', 6, NULL, 5, 3, NULL, NULL, NULL, NULL, '', 'CREATED', '2018-09-25 14:24:00', 365097, 0, 0, 'CANCELLED', '2018-09-25 14:24:34', '2018-09-26 18:51:43', NULL, 0),
(23, 'f664fdb7-82c9-4197-a094-906c0352a895', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-25 14:31:00', 371558, 0, 0, 'CANCELLED', '2018-09-25 14:31:58', '2018-09-26 18:51:37', NULL, 0),
(24, '0180df44-8e14-4d3e-9625-d6974cad0a72', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'yjftAaatlG', 'NODISPUTE', '2018-09-25 19:12:00', 769402, 10, 0, 'CANCELLED', '2018-09-25 19:12:16', '2018-09-25 19:16:50', NULL, 0),
(25, '7a9f7ec5-340a-4d2f-942b-45d4351e96fb', 3, NULL, 3, 3, 2, NULL, NULL, NULL, 'yjftAaatlG', 'CREATED', '2018-09-25 19:20:00', 197979, 10, 0, 'CANCELLED', '2018-09-25 19:20:14', '2018-09-26 03:57:24', NULL, 0),
(26, '25a4ab02-cec4-4de7-9f0a-7371be4b8aa1', 6, NULL, 5, 5, 2, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-26 03:53:00', 602999, 1, 0, 'CANCELLED', '2018-09-26 03:53:22', '2018-09-26 18:23:04', NULL, 0),
(27, '3f84120d-39fe-4f59-b8f4-250930ef293b', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-26 13:28:00', 630070, 0, 0, 'CANCELLED', '2018-09-26 13:28:55', '2018-09-26 18:51:32', NULL, 0),
(28, '3d8b8208-7da5-43e8-beed-7fbcf013c652', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'yjftAaatlG', 'NODISPUTE', '2018-09-26 17:56:00', 330787, 10, 0, 'CANCELLED', '2018-09-26 17:56:53', '2018-09-26 18:51:27', NULL, 0),
(29, '0e53aa53-799b-4290-9d8a-ccc9244da98b', 3, 4, 3, 3, 2, 2, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'NODISPUTE', '2018-09-26 18:25:00', 167368, 10, 1, 'CANCELLED', '2018-09-26 18:25:11', '2018-09-26 18:53:11', NULL, 0),
(30, '13a17730-a81b-483a-9fa1-217e7bc22a62', 3, 4, 3, 3, 2, 2, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'NODISPUTE', '2018-09-26 18:57:00', 477532, 2, 1, 'CANCELLED', '2018-09-26 18:57:47', '2018-09-26 19:03:09', NULL, 0),
(31, '3a83903c-32ca-42be-8154-0a62d0161e3a', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-26 19:11:00', 457912, 10, 0, 'CANCELLED', '2018-09-26 19:11:05', '2018-09-29 14:16:45', NULL, 0),
(32, '95b2d5c9-59e6-4279-9493-852e5ad205ab', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-26 19:31:00', 223397, 1, 0, 'CANCELLED', '2018-09-26 19:31:01', '2018-09-29 14:41:39', NULL, 0),
(33, 'db29ef10-e51b-4098-a207-f1fe3dc5441d', 6, 1, 5, 5, 3, 1, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'NODISPUTE', '2018-09-26 19:49:00', 660007, 1, 1, 'COMPLETED', '2018-09-26 19:49:33', '2018-09-27 08:03:10', NULL, 0),
(34, 'd9e50387-249f-4c7f-b92a-de8c79432e2f', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-26 21:12:00', 761766, 0, 0, 'CANCELLED', '2018-09-26 21:12:33', '2018-09-29 14:42:08', NULL, 0),
(35, '5d3ca4fd-0f5c-4652-9deb-25346f5e8137', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-26 21:37:00', 475965, 0, 0, 'CANCELLED', '2018-09-26 21:37:28', '2018-09-29 14:42:06', NULL, 0),
(36, 'b7e30c4a-f8a2-4214-836a-66e4e86de6ad', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-27 13:33:00', 817118, 10, 0, 'CANCELLED', '2018-09-27 13:33:53', '2018-09-27 18:43:06', NULL, 0),
(37, '32f3a2e3-16b7-4043-a054-8592199f82e7', 6, 1, 5, 5, 3, 1, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'NODISPUTE', '2018-09-27 14:38:00', 958068, 1, 1, 'COMPLETED', '2018-09-27 14:38:58', '2018-09-27 15:09:58', NULL, 0),
(38, '43953bdc-b580-4646-af1f-91aa7168fb4e', 3, 11, 3, 3, 2, 2, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-27 15:40:00', 460997, 10, 1, 'CANCELLED', '2018-09-27 15:40:00', '2018-09-27 18:42:44', NULL, 0),
(39, '84b9e724-8830-4fc4-93e4-ba7dbb731a7c', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-27 16:13:00', 263731, 1, 0, 'CANCELLED', '2018-09-27 16:13:09', '2018-09-27 18:43:01', NULL, 0),
(40, '3d3e7522-0e87-4126-ac7c-9589e77b2dc7', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-27 17:08:00', 431034, 0, 0, 'CANCELLED', '2018-09-27 17:08:24', '2018-09-27 18:42:57', NULL, 0),
(41, 'cc5c16c9-2c49-4ff9-8ea5-644c25eceb7a', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-27 17:35:00', 573758, 0, 0, 'CANCELLED', '2018-09-27 17:35:06', '2018-09-27 18:42:52', NULL, 0),
(42, '0f8b6049-46c1-4c68-a7b5-5cc97f5910e8', 3, 17, 3, 3, 8, 6, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'NODISPUTE', '2018-09-27 18:48:00', 329400, 20, 1, 'CANCELLED', '2018-09-27 18:48:02', '2018-09-29 14:54:28', NULL, 0),
(43, 'd847f5a3-1040-4bf6-82e3-1dea2b5573a8', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-27 18:58:00', 591282, 0, 0, 'CANCELLED', '2018-09-27 18:58:17', '2018-09-29 14:42:01', NULL, 0),
(44, 'd60e5025-5aab-480a-abd1-778fe5faa749', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-09-27 20:39:00', 407158, 0, 0, 'CANCELLED', '2018-09-27 20:39:04', '2018-09-29 14:41:58', NULL, 0),
(45, '38b31a15-261f-4085-ab65-f39bc8fb2ffb', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-28 17:02:00', 700182, 10, 0, 'CANCELLED', '2018-09-28 17:02:59', '2018-09-29 14:16:33', NULL, 0),
(46, '9cd1c40f-40c1-4b2b-9bf9-8d9f4ff45ad0', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'CREATED', '2018-09-28 19:21:00', 176130, 20, 0, 'CANCELLED', '2018-09-28 19:21:24', '2018-09-29 14:17:51', NULL, 0),
(47, '991ddb06-266c-4a81-80e0-c7fd8fc6936b', 3, NULL, 3, 9, NULL, NULL, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAr@S`EuCa@i@K_@Gm@AeB?sAB]Hm@Ru@z@iBPo@vEjDtBpA@Ib@q@rBgDFOlAyAbBlAOj@Ih@', 'NODISPUTE', '2018-09-29 14:07:00', 436685, 10, 0, 'CANCELLED', '2018-09-29 14:07:29', '2018-09-29 14:41:49', NULL, 0),
(48, '60def357-b785-49f3-9093-6a1f42846ea8', 3, NULL, 7, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGE`AW~AmB|BiAlAgAfCc@|Bo@fDmEDaCGgEC{A?yEJkCD@R@|@B`BZnCP`AT^RbA@\\?nAKpIItCIj@g@h@QBIFKv@WfAo@M{AQaAJiARcBBODaAF_FV\\~A^hC^rAt@fBr@pBHPK`@Wf@', 'NODISPUTE', '2018-09-29 14:20:00', 794041, 1, 0, 'CANCELLED', '2018-09-29 14:20:46', '2018-09-29 14:41:44', NULL, 0),
(49, '328dcce4-1f26-4fae-973f-0bc7c3b23be4', 3, NULL, 6, 9, NULL, NULL, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAo@mBQe@c@_@QQh@_@PUJ]D{@?O?O@]@]@}@?]CiAGuASgDK_A?SkBTiBTKMSSiAo@', 'NODISPUTE', '2018-09-29 14:29:00', 247799, 2, 0, 'CANCELLED', '2018-09-29 14:29:57', '2018-09-29 14:41:53', NULL, 0),
(50, 'eaae5ca9-eecc-4163-94cb-24fea42e06d8', 6, NULL, 5, 3, NULL, NULL, 'sfsddfsdfsd', NULL, '', 'NODISPUTE', '2018-09-29 14:52:00', 427160, 0, 0, 'CANCELLED', '2018-09-29 14:52:28', '2018-09-29 14:52:42', NULL, 0),
(51, '78b1b730-ba0c-48b7-8206-6e13d7c0ed38', 6, 1, 5, 5, 3, 1, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'NODISPUTE', '2018-09-29 14:53:00', 988197, 1, 1, 'COMPLETED', '2018-09-29 14:53:20', '2018-09-29 14:55:28', NULL, 0),
(52, '7a68b1c7-ae80-4ce8-912a-7ce42e0bf68e', 3, NULL, 3, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiFpGWrBMfAGaBwCo@eAa@?kDNoAFa@C@wDFqD?OgGYOA', 'NODISPUTE', '2018-09-29 14:55:00', 747352, 0, 0, 'CANCELLED', '2018-09-29 14:55:43', '2018-09-29 14:56:15', NULL, 0),
(53, '9c7ac9fb-93c7-4855-9d54-1eaa07f74598', 3, 28, 3, 9, 2, 8, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAr@S`EuCa@i@K_@Gm@AeB?sAB]Hm@Ru@z@iBPo@vEjDtBpA@Ib@q@rBgDFOlAyAbBlAOj@Ih@', 'CREATED', '2018-09-29 14:56:00', 330771, 10, 1, 'COMPLETED', '2018-09-29 14:56:49', '2018-09-29 16:56:53', NULL, 0),
(54, 'fbe12ca9-52f4-42a1-acef-2d5b172cdb06', 6, 29, 5, 5, 3, 1, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'NODISPUTE', '2018-09-29 15:03:00', 175571, 1, 1, 'COMPLETED', '2018-09-29 15:03:56', '2018-09-29 15:06:47', NULL, 0),
(55, 'f9d77210-18c1-4881-b791-311da2fc08dc', 3, 28, 7, 9, 2, 8, NULL, NULL, 'k{gtAanplG', 'NODISPUTE', '2018-09-29 16:58:00', 781431, 1, 1, 'COMPLETED', '2018-09-29 16:58:16', '2018-09-29 17:07:27', NULL, 0),
(56, '218bf99e-e668-4352-98f2-514e130f78ac', 3, 28, 3, 9, 2, 8, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAr@S`EuCa@i@K_@Gm@AeB?sAB]Hm@Ru@z@iBPo@vEjDtBpA@Ib@q@rBgDFOlAyAbBlAOj@Ih@', 'NODISPUTE', '2018-09-29 17:10:00', 290775, 10, 0, 'COMPLETED', '2018-09-29 17:10:17', '2018-09-29 17:16:42', NULL, 0),
(57, 'ea5bdbf7-168d-46ac-a58a-9a771ee9eeaa', 3, 28, 6, 3, 2, 8, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QBQaBGaB@s@A?UGuASgDK_A?SkBTiBTKMSSOMy@a@', 'NODISPUTE', '2018-09-29 17:33:00', 550372, 10, 0, 'COMPLETED', '2018-09-29 17:33:03', '2018-09-29 17:37:19', NULL, 0),
(58, '2a76e864-0d1b-453b-b48e-26724e81c083', 3, 28, 6, 9, 2, 8, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAo@mBQe@c@_@QQh@_@PUJ]D{@?O?O@]@]@}@?]CiAGuASgDK_A?SkBTiBTKMSSiAo@', 'NODISPUTE', '2018-09-29 19:16:00', 471373, 10, 0, 'COMPLETED', '2018-09-29 19:16:08', '2018-09-29 19:20:45', NULL, 0),
(59, 'a955ab01-fc89-4047-8f98-5a2c91f21df4', 3, 28, 1, 9, 2, 8, NULL, NULL, 'k{gtAanplG{d@hPkT}HaJk@vNgL_ZqZmg@sT}fB}Se~AiA_jAxOu{An@ivD{@}~@{_@icAa[y[}y@{ZeLgFlI_Jxk@oUhc@eFtN{QnIwMkIka@|HwWgL}L}Ds^bKwl@nPyv@hs@gm@bd@a`@rM_SqSmEuTkAjF}LbN}OiDoKhGaEvAwUwScPy@aLrb@aM`Uaa@{Eqb@uC_NvRqe@pe@al@pY{AvRsHp`@aHaLQrSw\\lJsr@v\\cqBrrBmHdNeKtHml@xF}`A~f@cj@zu@}m@|UguAj_@}|@r[u~@thA_^zVmo@tDgs@{Hgs@lP{{@eNgi@ul@ab@d^s`@|e@|AbVeU~JoK_OiIfH}t@dZ{xAvbAah@}FuYeTkx@xDi[jEwUsOuH{Hyg@gV}g@v`@hCly@qw@zf@oNvIoC|XrAf`@uJhP}Z{Fg^ub@bGkTqZRzEgK}S|Aka@_Kis@kKoMbUe@kJcF{[gZqSuEyEtAmFpCc]eXgh@sHdG}Ge{@gFmH`G{BeGiGlAoC}Akj@rEiKaUaKuCyFz`@ebAjSqq@bX{a@|Agc@nS_QdE}`@_Qy`@uNsN{^eT|Amc@kOyJvHk^jCsWwWhBmS~EwTwRe@}YaXcrApAe[_a@tLcMpI|CmPmMiQ}CkKaXtYo]}f@q[k{@|I}o@w]cJ_Cmc@iSuMrE{i@jFuNbLgKnYiGoEo`@m^mNkPaOrEi|@pFgb@^atAvp@cf@|Xqb@mDqYiXsu@__@gu@xY}`BhRkb@mGyo@giA|@w}Ce]uz@pUw`@|h@cr@dg@wr@jScu@dSuKbB{a@gPqh@qZ_J`FwCpFg\\|g@{h@dp@k\\zOsJpPmQqMyu@_v@su@}t@_n@}jAy[uaAu^i|Aia@sbA}nEtyBqcEzhBy`Cno@ms@zQwKkHiBkkAvCqjCyJouA{d@c~@iKmvAwbBmz@ek@}XyfArAmiBdMep@yGyD{MiMEeSor@}D{k@_s@kx@iy@eR{a@o_@si@mI}Y~So`Als@urA|oAuWx|@yfAlc@on@jTkHnn@ko@`Rwb@dHegA`A_S|YqyAyg@qcBXcoBdKqlBdo@ggCfr@i[fOqFyS_b@aSaRoJ{i@~C{s@jPkQqc@{bAugAyUzIm~@xH}f@cCus@zFgp@lh@il@hg@vNra@kr@fcAi]rRa`@qJupBpXyYzOwn@_IaeApWqh@nf@o|Bfm@izAySq`BluCa{BhrCqvDplD}oAxn@~Mrm@?pf@aZq@qx@}Eu[tXsc@bLep@aA}m@dM{MoKhAtLdDbgB', 'NODISPUTE', '2018-09-29 19:21:00', 997783, 30, 0, 'COMPLETED', '2018-09-29 19:21:52', '2018-09-29 19:24:16', NULL, 0),
(60, 'd8d3a319-d054-4acc-a966-86a595e86ce9', 11, 28, 8, 9, 2, 8, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAr@S`EuCa@i@K_@Gm@AeB?sAB]Hm@Ru@z@iBPo@N_AHo@Ja@Pc@DMaDSiKk@sI[kAU', 'NODISPUTE', '2018-09-29 21:38:00', 644060, 10, 0, 'COMPLETED', '2018-09-29 21:38:15', '2018-09-29 21:42:12', NULL, 0),
(61, 'babf7134-d152-477c-a013-6ab26adb66ed', 11, NULL, 8, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QRu@z@iBPo@N_AHo@Ja@Pc@DMaDSiKk@sI[kAU', 'CREATED', '2018-09-29 21:42:00', 109133, 0, 0, 'CANCELLED', '2018-09-29 21:42:38', '2018-09-30 16:28:06', NULL, 0),
(62, '0b2a3f27-cd4c-4438-a65f-47b4ca8eae20', 12, NULL, 9, 9, NULL, NULL, NULL, NULL, 'k{gtAanplGmyg@nTsdg@`mT_wp@vvQglsApinBamDzpTs`[byAaeMtqNmofAjh@a}`Ae~Ai|kA|fX_~`@dsVuzd@rjBaid@nvIysRbxUgpG`hQi|YzkF{qr@`b_@{~Y~xSgyE~{c@}xV`sz@k{qAzn~@}vjBtm`@coc@|uEuwYpyb@epy@nlNefi@p~PscaAb~w@}rT|}p@eb]voe@_vc@`{`Akky@jqz@yyr@nvp@i{_A|hKoazAhjRy`]bnEw{t@rrAyg_@itMya~@zrNuqoB~ey@inmBfxdAonw@znw@qig@`qiBe|z@`}p@scl@npQ_`^ba@}qkAbwMskYha^__c@`nRkax@vzi@ct_@dwh@ei^~_O}xsA|rk@knaBdssA}a_@bg_@esO|_EtimBn}hEtry@z|bBmrGvsJ{y@pbAup@wCs^|nBt`@fmQxfLhhGejCz}`@tnJleYjvPtfOrwc@tiiA|rf@flz@fiQycE|}ZxzFzha@vzJn_O|sLjr[by\\jeXbCl}^adPfhx@qzSti`Con`@l~x@opLfbB_tFnvqAxwBrcm@cdJtzdAljx@dlc@|tMf}[|ff@w|Xvbl@p`sBhpfCfsx@b~ZrnHijChZcfIhhNxgBhiIn{J`a_@fuQndL~pU`ca@fyYtpk@`jn@nzYh|UxdQfl`@vdTh~Hbo^bpDr`[qsH~eDijTl~DqhO~rFmpAjnEwuIxrUxjMjhY_zCf{UbtLdg[ndN|{x@_jFpnm@u|CvsLt[k{Bqab@dlC{sThb\\cbp@nkSk}r@`qIccI~{LkhZ|oPiaq@bac@srJnve@~bOn}h@|cc@|bTjlu@baSj_@v_PuwJpljAqpa@|}hAirSf_KyqOrid@c~RdqhBcpHrn{@ijjAh_x@ak^xiFcx]jiNgkMfkHo_]p`_@}tp@dro@avg@|qYcuDziVgxHnsSeiO`|q@q_b@fde@so[xyNssPhbBilr@ga@kwj@`|Ikcf@|~IatwAap@s_jAzec@ivN``p@eta@rqM_zW|aYwdKdux@i_i@`fnAwgbBpaX}ujAbiHavO_iAcwLqaFs~FhmEg`JmLoyUk}A{gX`h\\i}\\|}k@swa@vhQen@ptf@~kNbcWztYlxYndWrex@ajJ~m\\evZxlGq|a@|qMioFskCqzNxjQgnLfhQqdY~eX}TfxCsiI`pS|GndXeqBj`h@hxG~bc@w~GvyHumKnit@_{k@ykBooj@|jKowW|iYytFrxb@rpAx~GzgL`zj@hxCvcKrcBtlOibH', 'CREATED', '2018-09-30 14:24:00', 879200, 0, 0, 'CANCELLED', '2018-09-30 14:24:38', '2018-09-30 16:28:01', NULL, 0),
(63, '77caf3e6-5598-48aa-81a8-0b464b3916c1', 13, NULL, 9, 9, NULL, NULL, NULL, NULL, 'k{gtAanplGmyg@nTsdg@`mT_wp@vvQglsApinBamDzpTs`[byAaeMtqNmofAjh@a}`Ae~Ai|kA|fX_~`@dsVuzd@rjBaid@nvIysRbxUgpG`hQi|YzkF{qr@`b_@{~Y~xSgyE~{c@}xV`sz@k{qAzn~@}vjBtm`@coc@|uEuwYpyb@epy@nlNefi@p~PscaAb~w@}rT|}p@eb]voe@_vc@`{`Akky@jqz@yyr@nvp@i{_A|hKoazAhjRy`]bnEw{t@rrAyg_@itMya~@zrNuqoB~ey@inmBfxdAonw@znw@qig@`qiBe|z@`}p@scl@npQ_`^ba@}qkAbwMskYha^__c@`nRkax@vzi@ct_@dwh@ei^~_O}xsA|rk@knaBdssA}a_@bg_@esO|_EtimBn}hEtry@z|bBmrGvsJ{y@pbAup@wCs^|nBt`@fmQxfLhhGejCz}`@tnJleYjvPtfOrwc@tiiA|rf@flz@fiQycE|}ZxzFzha@vzJn_O|sLjr[by\\jeXbCl}^adPfhx@qzSti`Con`@l~x@opLfbB_tFnvqAxwBrcm@cdJtzdAljx@dlc@|tMf}[|ff@w|Xvbl@p`sBhpfCfsx@b~ZrnHijChZcfIhhNxgBhiIn{J`a_@fuQndL~pU`ca@fyYtpk@`jn@nzYh|UxdQfl`@vdTh~Hbo^bpDr`[qsH~eDijTl~DqhO~rFmpAjnEwuIxrUxjMjhY_zCf{UbtLdg[ndN|{x@_jFpnm@u|CvsLt[k{Bqab@dlC{sThb\\cbp@nkSk}r@`qIccI~{LkhZ|oPiaq@bac@srJnve@~bOn}h@|cc@|bTjlu@baSj_@v_PuwJpljAqpa@|}hAirSf_KyqOrid@c~RdqhBcpHrn{@ijjAh_x@ak^xiFcx]jiNgkMfkHo_]p`_@}tp@dro@avg@|qYcuDziVgxHnsSeiO`|q@q_b@fde@so[xyNssPhbBilr@ga@kwj@`|Ikcf@|~IatwAap@s_jAzec@ivN``p@eta@rqM_zW|aYwdKdux@i_i@`fnAwgbBpaX}ujAbiHavO_iAcwLqaFs~FhmEg`JmLoyUk}A{gX`h\\i}\\|}k@swa@vhQen@ptf@~kNbcWztYlxYndWrex@ajJ~m\\evZxlGq|a@|qMioFskCqzNxjQgnLfhQqdY~eX}TfxCsiI`pS|GndXeqBj`h@hxG~bc@w~GvyHumKnit@_{k@ykBooj@|jKowW|iYytFrxb@rpAx~GzgL`zj@hxCvcKrcBtlOibH', 'NODISPUTE', '2018-09-30 16:27:00', 941536, 0, 0, 'CANCELLED', '2018-09-30 16:27:34', '2018-09-30 16:27:55', NULL, 0),
(64, '2d0fbd80-5d13-4488-8874-8c9278963aa8', 13, NULL, 9, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGqeg@reByve@r{Pkel@pdRwrf@hcg@uum@pu`AwyDfzFqdAlmOmtUfsG_mIf{AkcKnvJktl@vpAofy@mxE}m_@`oAud_@f`Lu_{@hfVolMr`Isk\\tQ{|b@npFivTfuRav_@|d_@kg]tvFenWfvRq{k@dsh@}qEdbk@kdMvd\\wng@lcn@_{g@x|Y}pf@pdO{u}@lmIwi~@xfa@sm\\vdYyr`AtcHu{gAjky@_fn@jxxAookAxqgBqr}@fi|@}nw@jg^as~AzsLgad@dlP_bj@uEgn}@}jLepnBrnc@oclBvh|@}cwA~iaAiw_@`}`@ssVfcm@soHlpf@wxr@pf}@clb@tmMstn@lyIyd`AtwMszc@hkP}|[ng\\oa_Ant^{iv@hycAihuAldi@cmiBtgvA_s_@`e`@c|X~hLt~s@vbfBhgoBnmlE}wF|`Fyk@uBs^~nBucBv{ErzMloQkXl|ZjkDtpZhxP`iObui@dpeAtdCjrT`qYtmh@htNf_JrbYytIftu@tjUdiNluUpvRljHpq@lzFdqWnYvtx@wi\\vaqBul_@h}bBwdVdyFqmG~dkAtjCjip@srK~|gAtxx@v`c@tuM`t\\`jd@{bYrxj@jmwAveiBz{o@rdo@hrb@tvKbfJyvB`\\wsH~_NbF|h[rm[|fVphL|e_@p`[xbHdlT~v`@jj`@vkUfkKhx\\drn@xfSxaJnu^dyFlne@_xOlbAyf_@~kEmg@hmSwaHf{]~|CdlZrdMvaYf_Nbo{@gpElaOoSbhc@qbEdqM_eMwvHsa\\bnr@wnjBxsSk`Y~dKwce@ha_@ugh@pxj@tnJ|ug@pc`@jrV|vq@ryJhhUn|_@mvQf}eA_|_@vwiAufU~oa@s`Z~bhAywOx`o@sm@xse@ykn@d|y@snr@zaRgkGjiD{gA|jBebSlvPi|b@nuPm_ZlmTkdd@x_r@kjj@tmq@kpNxxS_pOjzk@koV`y_@w~VrtYon`@hdCmqp@il@{uk@lvSsrhBw`Bu|uAhzGo}Srer@khQtuh@ejm@xtq@azUh}bBoorBpjYosu@vpHqs_@zuEiqO~bDohH_dIgbPxtEolm@u|AuhSztSa|LxgXihQvsXetRd|FeyKjkp@nuSdto@fgf@h`IvsMjbf@efCx}`@upd@l`MyvDru@kpT`tJuqKgXm|PbfXul]t|\\mpHp{J}aJjny@u}Cdp}@drCtxGowMb}f@suZ|zMik\\smDwqOvxWcsh@lwj@u~HhwJx|Izta@`gLlkZ`vCltP_tI', 'NODISPUTE', '2018-09-30 16:28:00', 428769, 0, 0, 'CANCELLED', '2018-09-30 16:28:41', '2018-09-30 16:32:56', NULL, 0),
(65, 'f8850972-d105-4d3b-a4d5-735c54ddad00', 14, NULL, 10, 3, NULL, NULL, NULL, NULL, 'ueftAosrlGqeg@reByve@r{Pkel@pdRwrf@hcg@uum@pu`AwyDfzFqdAlmOmtUfsG_mIf{AkcKnvJktl@vpAofy@mxE}m_@`oAud_@f`Lu_{@hfVolMr`Isk\\tQ{|b@npFivTfuRav_@|d_@kg]tvFenWfvRq{k@dsh@}qEdbk@kdMvd\\wng@lcn@_{g@x|Y}pf@pdO{u}@lmIwi~@xfa@sm\\vdYyr`AtcHu{gAjky@_fn@jxxAookAxqgBqr}@fi|@}nw@jg^as~AzsLgad@dlP_bj@uEgn}@}jLepnBrnc@oclBvh|@}cwA~iaAiw_@`}`@ssVfcm@soHlpf@wxr@pf}@clb@tmMstn@lyIyd`AtwMszc@hkP}|[ng\\oa_Ant^{iv@hycAihuAldi@cmiBtgvA_s_@`e`@c|X~hLt~s@vbfBhgoBnmlE}wF|`Fyk@uBs^~nBucBv{ErzMloQkXl|ZjkDtpZhxP`iObui@dpeAtdCjrT`qYtmh@htNf_JrbYytIftu@tjUdiNluUpvRljHpq@lzFdqWnYvtx@wi\\vaqBul_@h}bBwdVdyFqmG~dkAtjCjip@srK~|gAtxx@v`c@tuM`t\\`jd@{bYrxj@jmwAveiBz{o@rdo@hrb@tvKbfJyvB`\\wsH~_NbF|h[rm[|fVphL|e_@p`[xbHdlT~v`@jj`@vkUfkKhx\\drn@xfSxaJnu^dyFlne@_xOlbAyf_@~kEmg@hmSwaHf{]~|CdlZrdMvaYf_Nbo{@gpElaOoSbhc@qbEdqM_eMwvHsa\\bnr@wnjBxsSk`Y~dKwce@ha_@ugh@pxj@tnJ|ug@pc`@jrV|vq@ryJhhUn|_@mvQf}eA_|_@vwiAufU~oa@s`Z~bhAywOx`o@sm@xse@ykn@d|y@snr@zaRgkGjiD{gA|jBebSlvPi|b@nuPm_ZlmTkdd@x_r@kjj@tmq@kpNxxS_pOjzk@koV`y_@w~VrtYon`@hdCmqp@il@{uk@lvSsrhBw`Bu|uAhzGo}Srer@khQtuh@ejm@xtq@azUh}bBoorBpjYosu@vpHqs_@zuEiqO~bDohH_dIgbPxtEolm@u|AuhSztSa|LxgXihQvsXetRd|FeyKjkp@nuSdto@fgf@h`IvsMjbf@efCx}`@upd@l`MyvDru@kpT`tJuqKgXm|PbfXul]t|\\mpHp{J}aJjny@u}Cdp}@drCtxGowMb}f@suZ|zMik\\smDwqOvxWcsh@lwj@u~HhwJx|Izta@`gLlkZ`vCltP_tI', 'NODISPUTE', '2018-09-30 16:29:00', 411725, 0, 0, 'CANCELLED', '2018-09-30 16:29:31', '2018-09-30 16:32:53', NULL, 0),
(66, '265e809d-70e3-4207-8ada-cb27d18924d4', 14, NULL, 10, 3, 2, NULL, NULL, NULL, 'ueftAosrlGqeg@reByve@r{Pkel@pdRwrf@hcg@uum@pu`AwyDfzFqdAlmOmtUfsG_mIf{AkcKnvJktl@vpAofy@mxE}m_@`oAud_@f`Lu_{@hfVolMr`Isk\\tQ{|b@npFivTfuRav_@|d_@kg]tvFenWfvRq{k@dsh@}qEdbk@kdMvd\\wng@lcn@_{g@x|Y}pf@pdO{u}@lmIwi~@xfa@sm\\vdYyr`AtcHu{gAjky@_fn@jxxAookAxqgBqr}@fi|@}nw@jg^as~AzsLgad@dlP_bj@uEgn}@}jLepnBrnc@oclBvh|@}cwA~iaAiw_@`}`@ssVfcm@soHlpf@wxr@pf}@clb@tmMstn@lyIyd`AtwMszc@hkP}|[ng\\oa_Ant^{iv@hycAihuAldi@cmiBtgvA_s_@`e`@c|X~hLt~s@vbfBhgoBnmlE}wF|`Fyk@uBs^~nBucBv{ErzMloQkXl|ZjkDtpZhxP`iObui@dpeAtdCjrT`qYtmh@htNf_JrbYytIftu@tjUdiNluUpvRljHpq@lzFdqWnYvtx@wi\\vaqBul_@h}bBwdVdyFqmG~dkAtjCjip@srK~|gAtxx@v`c@tuM`t\\`jd@{bYrxj@jmwAveiBz{o@rdo@hrb@tvKbfJyvB`\\wsH~_NbF|h[rm[|fVphL|e_@p`[xbHdlT~v`@jj`@vkUfkKhx\\drn@xfSxaJnu^dyFlne@_xOlbAyf_@~kEmg@hmSwaHf{]~|CdlZrdMvaYf_Nbo{@gpElaOoSbhc@qbEdqM_eMwvHsa\\bnr@wnjBxsSk`Y~dKwce@ha_@ugh@pxj@tnJ|ug@pc`@jrV|vq@ryJhhUn|_@mvQf}eA_|_@vwiAufU~oa@s`Z~bhAywOx`o@sm@xse@ykn@d|y@snr@zaRgkGjiD{gA|jBebSlvPi|b@nuPm_ZlmTkdd@x_r@kjj@tmq@kpNxxS_pOjzk@koV`y_@w~VrtYon`@hdCmqp@il@{uk@lvSsrhBw`Bu|uAhzGo}Srer@khQtuh@ejm@xtq@azUh}bBoorBpjYosu@vpHqs_@zuEiqO~bDohH_dIgbPxtEolm@u|AuhSztSa|LxgXihQvsXetRd|FeyKjkp@nuSdto@fgf@h`IvsMjbf@efCx}`@upd@l`MyvDru@kpT`tJuqKgXm|PbfXul]t|\\mpHp{J}aJjny@u}Cdp}@drCtxGowMb}f@suZ|zMik\\smDwqOvxWcsh@lwj@u~HhwJx|Izta@`gLlkZ`vCltP_tI', 'NODISPUTE', '2018-09-30 16:56:00', 417390, 30, 0, 'CANCELLED', '2018-09-30 16:56:48', '2018-09-30 17:08:04', NULL, 0),
(67, '91e2c1c0-44b9-4417-b114-685005a13668', 14, 30, 10, 3, 9, 9, NULL, NULL, 'ueftAosrlGqeg@reByve@r{Pkel@pdRwrf@hcg@uum@pu`AwyDfzFqdAlmOmtUfsG_mIf{AkcKnvJktl@vpAofy@mxE}m_@`oAud_@f`Lu_{@hfVolMr`Isk\\tQ{|b@npFivTfuRav_@|d_@kg]tvFenWfvRq{k@dsh@}qEdbk@kdMvd\\wng@lcn@_{g@x|Y}pf@pdO{u}@lmIwi~@xfa@sm\\vdYyr`AtcHu{gAjky@_fn@jxxAookAxqgBqr}@fi|@}nw@jg^as~AzsLgad@dlP_bj@uEgn}@}jLepnBrnc@oclBvh|@}cwA~iaAiw_@`}`@ssVfcm@soHlpf@wxr@pf}@clb@tmMstn@lyIyd`AtwMszc@hkP}|[ng\\oa_Ant^{iv@hycAihuAldi@cmiBtgvA_s_@`e`@c|X~hLt~s@vbfBhgoBnmlE}wF|`Fyk@uBs^~nBucBv{ErzMloQkXl|ZjkDtpZhxP`iObui@dpeAtdCjrT`qYtmh@htNf_JrbYytIftu@tjUdiNluUpvRljHpq@lzFdqWnYvtx@wi\\vaqBul_@h}bBwdVdyFqmG~dkAtjCjip@srK~|gAtxx@v`c@tuM`t\\`jd@{bYrxj@jmwAveiBz{o@rdo@hrb@tvKbfJyvB`\\wsH~_NbF|h[rm[|fVphL|e_@p`[xbHdlT~v`@jj`@vkUfkKhx\\drn@xfSxaJnu^dyFlne@_xOlbAyf_@~kEmg@hmSwaHf{]~|CdlZrdMvaYf_Nbo{@gpElaOoSbhc@qbEdqM_eMwvHsa\\bnr@wnjBxsSk`Y~dKwce@ha_@ugh@pxj@tnJ|ug@pc`@jrV|vq@ryJhhUn|_@mvQf}eA_|_@vwiAufU~oa@s`Z~bhAywOx`o@sm@xse@ykn@d|y@snr@zaRgkGjiD{gA|jBebSlvPi|b@nuPm_ZlmTkdd@x_r@kjj@tmq@kpNxxS_pOjzk@koV`y_@w~VrtYon`@hdCmqp@il@{uk@lvSsrhBw`Bu|uAhzGo}Srer@khQtuh@ejm@xtq@azUh}bBoorBpjYosu@vpHqs_@zuEiqO~bDohH_dIgbPxtEolm@u|AuhSztSa|LxgXihQvsXetRd|FeyKjkp@nuSdto@fgf@h`IvsMjbf@efCx}`@upd@l`MyvDru@kpT`tJuqKgXm|PbfXul]t|\\mpHp{J}aJjny@u}Cdp}@drCtxGowMb}f@suZ|zMik\\smDwqOvxWcsh@lwj@u~HhwJx|Izta@`gLlkZ`vCltP_tI', 'NODISPUTE', '2018-09-30 17:08:00', 515576, 20, 0, 'COMPLETED', '2018-09-30 17:08:50', '2018-09-30 17:13:11', NULL, 0),
(68, 'cdbddb98-b094-4c84-bc2c-f986159b0029', 14, 30, 10, 3, 9, 9, NULL, NULL, 'ueftAosrlGqeg@reByve@r{Pkel@pdRwrf@hcg@uum@pu`AwyDfzFqdAlmOmtUfsG_mIf{AkcKnvJktl@vpAofy@mxE}m_@`oAud_@f`Lu_{@hfVolMr`Isk\\tQ{|b@npFivTfuRav_@|d_@kg]tvFenWfvRq{k@dsh@}qEdbk@kdMvd\\wng@lcn@_{g@x|Y}pf@pdO{u}@lmIwi~@xfa@sm\\vdYyr`AtcHu{gAjky@_fn@jxxAookAxqgBqr}@fi|@}nw@jg^as~AzsLgad@dlP_bj@uEgn}@}jLepnBrnc@oclBvh|@}cwA~iaAiw_@`}`@ssVfcm@soHlpf@wxr@pf}@clb@tmMstn@lyIyd`AtwMszc@hkP}|[ng\\oa_Ant^{iv@hycAihuAldi@cmiBtgvA_s_@`e`@c|X~hLt~s@vbfBhgoBnmlE}wF|`Fyk@uBs^~nBucBv{ErzMloQkXl|ZjkDtpZhxP`iObui@dpeAtdCjrT`qYtmh@htNf_JrbYytIftu@tjUdiNluUpvRljHpq@lzFdqWnYvtx@wi\\vaqBul_@h}bBwdVdyFqmG~dkAtjCjip@srK~|gAtxx@v`c@tuM`t\\`jd@{bYrxj@jmwAveiBz{o@rdo@hrb@tvKbfJyvB`\\wsH~_NbF|h[rm[|fVphL|e_@p`[xbHdlT~v`@jj`@vkUfkKhx\\drn@xfSxaJnu^dyFlne@_xOlbAyf_@~kEmg@hmSwaHf{]~|CdlZrdMvaYf_Nbo{@gpElaOoSbhc@qbEdqM_eMwvHsa\\bnr@wnjBxsSk`Y~dKwce@ha_@ugh@pxj@tnJ|ug@pc`@jrV|vq@ryJhhUn|_@mvQf}eA_|_@vwiAufU~oa@s`Z~bhAywOx`o@sm@xse@ykn@d|y@snr@zaRgkGjiD{gA|jBebSlvPi|b@nuPm_ZlmTkdd@x_r@kjj@tmq@kpNxxS_pOjzk@koV`y_@w~VrtYon`@hdCmqp@il@{uk@lvSsrhBw`Bu|uAhzGo}Srer@khQtuh@ejm@xtq@azUh}bBoorBpjYosu@vpHqs_@zuEiqO~bDohH_dIgbPxtEolm@u|AuhSztSa|LxgXihQvsXetRd|FeyKjkp@nuSdto@fgf@h`IvsMjbf@efCx}`@upd@l`MyvDru@kpT`tJuqKgXm|PbfXul]t|\\mpHp{J}aJjny@u}Cdp}@drCtxGowMb}f@suZ|zMik\\smDwqOvxWcsh@lwj@u~HhwJx|Izta@`gLlkZ`vCltP_tI', 'NODISPUTE', '2018-09-30 17:16:00', 832394, 20, 0, 'CANCELLED', '2018-09-30 17:16:07', '2018-09-30 19:28:47', NULL, 0),
(69, '0f8b01d5-c502-4abb-9250-ef23f5654f99', 3, 28, 6, 3, 2, 8, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QBQaBGaB@s@A?UGuASgDK_A?SkBTiBTKMSSOMy@a@', 'NODISPUTE', '2018-10-01 19:00:00', 340881, 10, 0, 'COMPLETED', '2018-10-01 19:00:35', '2018-10-01 19:18:03', NULL, 0),
(70, '7a07f72c-4ae0-4283-a680-261eb433fb73', 3, 28, 6, 3, 2, 8, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QBQaBGaB@s@A?UGuASgDK_A?SkBTiBTKMSSOMy@a@', 'NODISPUTE', '2018-10-01 19:20:00', 881830, 1, 1, 'COMPLETED', '2018-10-01 19:20:51', '2018-10-01 19:23:25', NULL, 0),
(71, '30648263-3755-477e-9384-89b6baa00790', 3, NULL, 6, 3, 8, NULL, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QBQaBGaB@s@A?UGuASgDK_A?SkBTiBTKMSSOMy@a@', 'NODISPUTE', '2018-10-01 19:24:00', 566138, 10, 0, 'CANCELLED', '2018-10-01 19:24:35', '2018-10-01 19:33:56', NULL, 0),
(72, '691072ef-dcf4-4d37-99f6-fb246715fe51', 3, 28, 6, 3, 2, 8, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QBQaBGaB@s@A?UGuASgDK_A?SkBTiBTKMSSOMy@a@', 'NODISPUTE', '2018-10-01 19:35:00', 626992, 1, 0, 'COMPLETED', '2018-10-01 19:35:21', '2018-10-01 19:36:26', NULL, 0),
(73, '9f06387c-e45f-4256-bc05-718192d53d63', 3, NULL, 7, 9, NULL, NULL, NULL, NULL, 'k{gtAanplG', 'NODISPUTE', '2018-10-01 22:08:00', 969536, 1, 0, 'CANCELLED', '2018-10-01 22:08:28', '2018-10-01 22:12:25', NULL, 0),
(74, '122bfd3c-21e9-4b47-bd20-0adb73aab54f', 3, 32, 6, 9, 2, 2, NULL, NULL, 'k{gtAanplGVg@Ja@Jl@DnDGdGEZKVGHGLAPDPJNLDT@LCLKFO@SKYOMCkA@uJEe@Mq@_@mA[o@s@gBUaAg@wC[aBeAiE{AcEg@mAc@{A_@aD[yBsAeFSq@}@yAU_@YUp@cDd@i@xIwGbEmDhEsC~H}EpBcAo@mBQe@c@_@QQh@_@PUJ]D{@?O?O@]@]@}@?]CiAGuASgDK_A?SkBTiBTKMSSiAo@', 'NODISPUTE', '2018-10-01 22:15:00', 892341, 1, 1, 'COMPLETED', '2018-10-01 22:15:30', '2018-10-01 22:19:20', NULL, 0),
(75, '61bfc084-7fc4-4072-aefe-96d938de1d3e', 3, 32, 6, 3, 2, 2, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGmAiF_EVcA@q@y@i@s@k@a@mCkAuDoBi@M_ASkAc@q@u@eAqA@QBQaBGaB@s@A?UGuASgDK_A?SkBTiBTKMSSOMy@a@', 'NODISPUTE', '2018-10-02 00:07:00', 518120, 10, 0, 'COMPLETED', '2018-10-02 00:07:42', '2018-10-02 00:11:50', NULL, 0),
(76, 'b349a7e9-5411-4b6c-8f7a-66bdb9e2ed79', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-10-02 16:09:00', 606407, 0, 0, 'ORDERED', '2018-10-02 16:09:43', '2018-10-07 13:33:43', NULL, 0),
(77, 'a1b723f1-99df-414f-b65f-a74f8c412045', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-10-02 16:10:00', 811077, 0, 0, 'ORDERED', '2018-10-02 16:10:13', '2018-10-07 13:33:43', NULL, 0),
(78, '13c45aec-4fdd-47e6-8084-4aa1b4e913dc', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-10-02 16:26:00', 269051, 0, 0, 'ORDERED', '2018-10-02 16:26:09', '2018-10-07 13:33:49', NULL, 0),
(79, 'e2338af0-530d-437a-b0de-5320c2fd1a7f', 6, NULL, 5, 5, NULL, NULL, NULL, NULL, 'gt|oCivrfPwBnA_CvAiB}Dc@{@_@e@q@c@aAa@cAYy@IwAH_BZaAd@w@d@c@h@Ub@q@~AQx@IhA@`ANzANbAPf@[Nk@x@Ub@G\\Ev@{B@GsGEyBeD@mAiFa@iBeA`@yBbAcAX{@^i@ZKFGHeDdBaD`BqB`A{@`@s@Z}BlAULISOa@G_@QqBo@i]KqIKeAE{@KqDGg@GO[_@}[bAaGNO@IWG[E[Aw@~A}QAK@OXyD@wAAc@EWIMeDOgK[kCKeGo@oFo@_CQsFw@kAO{@EiA@aEVwBL[?IECGk@kIM_BOeBKk@_@yAyHyPgAsCi@yAi@iA}@gAo@c@eA_@iASyGq@oOmAoZqCiSmBq@GeGg@}C]mBS{@KaEQqBW{Ee@sKcA}QiB_BK{AQuIy@cQeBoQiBcAK[DsABy@EeEa@qKgAy@Ou@Ww@[QCWBSHQVO^Gl@IbBIzEK~G@xCShBm@rCUjAYj@u@v@}@j@wDvCuCbCuBjB_BpAyFdFwCvCa@RAD?BFZRr@h@tAzBfE`@h@dAlA`BdBb@j@N\\^vBT~B?bBCp@OdBi@tE]lE_@xBOh@s@tAmDjGcBhC_@p@Yt@y@`CkAxCEj@Bh@Lr@^pAn@vFBv@?PW@qHr@oGf@uI\\mDFoCPkCRu@HAB?BABCFKJQ?MGEEAEoCDsPLoADeDNeDDEACCeB?q@FUDQHYVq@v@i@dAQd@Kh@G`AH|CLzDNzI^dX`E@`BEF~F', 'CREATED', '2018-10-02 16:51:00', 647916, 0, 0, 'ORDERED', '2018-10-02 16:51:33', '2018-10-07 13:33:54', NULL, 0),
(80, 'eb16ea81-9fb0-4b7c-9a82-9d468f0e9c95', 3, 32, 7, 3, 2, 2, NULL, NULL, 'ueftAosrlGd@WJAJ@fA|@PZ?PETC`@v@}@nBgBhB{ArA_An@q@T_@[CUSkIyGE`AW~AmB|BiAlAgAfCc@|Bo@fDmEDaCGgEC{A?yEJkCD@R@|@B`BZnCP`AT^RbA@\\?nAKpIItCIj@g@h@QBIFKv@WfAo@M{AQaAJiARcBBODaAF_FV\\~A^hC^rAt@fBr@pBHPK`@Wf@', 'NODISPUTE', '2018-10-07 13:42:00', 182959, 10, 0, 'COMPLETED', '2018-10-07 13:42:42', '2018-10-07 13:45:50', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_disputes`
--

CREATE TABLE `order_disputes` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_disputehelp_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `transporter_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` enum('user','shop','transporter') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_to` enum('user','shop','transporter','dispatcher') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('CREATED','RESOLVED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_disputes`
--

INSERT INTO `order_disputes` (`id`, `order_id`, `order_disputehelp_id`, `user_id`, `transporter_id`, `shop_id`, `type`, `created_by`, `created_to`, `status`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'RESOLVED', 'Restaurant not received', '2018-09-24 19:24:47', '2018-09-24 19:28:13', NULL),
(2, 1, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-24 19:28:23', '2018-09-24 19:28:23', NULL),
(3, 2, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-24 19:46:56', '2018-09-24 19:46:56', NULL),
(4, 3, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-24 20:11:54', '2018-09-24 20:11:54', NULL),
(5, 4, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 10:25:55', '2018-09-25 10:25:55', NULL),
(6, 5, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 10:25:55', '2018-09-25 10:25:55', NULL),
(7, 6, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 10:47:18', '2018-09-25 10:47:18', NULL),
(8, 7, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 12:11:29', '2018-09-25 12:11:29', NULL),
(9, 8, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 12:19:22', '2018-09-25 12:19:22', NULL),
(10, 9, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 12:20:58', '2018-09-25 12:20:58', NULL),
(11, 10, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 12:48:27', '2018-09-25 12:48:27', NULL),
(12, 11, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:13:26', '2018-09-25 13:13:26', NULL),
(13, 12, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:14:46', '2018-09-25 13:14:46', NULL),
(14, 13, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:15:31', '2018-09-25 13:15:31', NULL),
(15, 14, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'RESOLVED', 'Restaurant not received', '2018-09-25 13:26:41', '2018-09-25 13:35:38', NULL),
(16, 14, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:26:41', '2018-09-25 13:26:41', NULL),
(17, 15, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:29:37', '2018-09-25 13:29:37', NULL),
(18, 14, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:36:30', '2018-09-25 13:36:30', NULL),
(19, 14, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 13:36:30', '2018-09-25 13:36:30', NULL),
(20, 16, 0, 0, 2, 0, 'COMPLAINED', 'transporter', 'transporter', 'CREATED', 'No Delivery receive request', '2018-09-25 13:47:31', '2018-09-25 13:47:31', NULL),
(21, 18, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 14:04:36', '2018-09-25 14:04:36', NULL),
(22, 20, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 14:21:12', '2018-09-25 14:21:12', NULL),
(23, 22, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 14:25:24', '2018-09-25 14:25:24', NULL),
(24, 19, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery people available', '2018-09-25 18:25:06', '2018-09-25 18:25:06', NULL),
(25, 23, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-25 18:25:07', '2018-09-25 18:25:07', NULL),
(26, 25, 0, 0, 2, 0, 'COMPLAINED', 'transporter', 'transporter', 'CREATED', 'No Delivery receive request', '2018-09-25 19:21:10', '2018-09-25 19:21:10', NULL),
(27, 26, 0, 0, 2, 0, 'COMPLAINED', 'transporter', 'transporter', 'CREATED', 'No Delivery receive request', '2018-09-26 03:58:09', '2018-09-26 03:58:09', NULL),
(28, 27, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-26 17:56:10', '2018-09-26 17:56:10', NULL),
(29, 31, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery receive request', '2018-09-26 20:16:37', '2018-09-26 20:16:37', NULL),
(30, 32, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery receive request', '2018-09-26 20:32:36', '2018-09-26 20:32:36', NULL),
(31, 34, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-27 13:33:37', '2018-09-27 13:33:37', NULL),
(32, 35, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-27 13:33:37', '2018-09-27 13:33:37', NULL),
(33, 36, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery people available', '2018-09-27 15:05:08', '2018-09-27 15:05:08', NULL),
(34, 38, 0, 3, 0, 0, 'COMPLAINED', 'user', 'user', 'CREATED', 'ا', '2018-09-27 16:20:51', '2018-09-27 16:20:51', NULL),
(35, 39, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery receive request', '2018-09-27 18:41:22', '2018-09-27 18:41:22', NULL),
(36, 39, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery receive request', '2018-09-27 18:41:22', '2018-09-27 18:41:22', NULL),
(37, 40, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-27 18:41:29', '2018-09-27 18:41:29', NULL),
(38, 41, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-27 18:41:33', '2018-09-27 18:41:33', NULL),
(39, 43, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-27 19:58:18', '2018-09-27 19:58:18', NULL),
(40, 44, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-27 21:39:08', '2018-09-27 21:39:08', NULL),
(41, 45, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery receive request', '2018-09-28 19:20:00', '2018-09-28 19:20:00', NULL),
(42, 46, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'No Delivery people available', '2018-09-28 22:16:13', '2018-09-28 22:16:13', NULL),
(43, 53, 0, 0, 2, 0, 'COMPLAINED', 'transporter', 'transporter', 'CREATED', 'No Delivery receive request', '2018-09-29 16:51:20', '2018-09-29 16:51:20', NULL),
(44, 61, 0, 0, 0, 3, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-30 11:27:50', '2018-09-30 11:27:50', NULL),
(45, 62, 0, 0, 0, 9, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-09-30 16:11:05', '2018-09-30 16:11:05', NULL),
(46, 76, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-10-07 13:33:43', '2018-10-07 13:33:43', NULL),
(47, 77, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-10-07 13:33:43', '2018-10-07 13:33:43', NULL),
(48, 78, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-10-07 13:33:49', '2018-10-07 13:33:49', NULL),
(49, 79, 0, 0, 0, 5, 'COMPLAINED', 'shop', 'shop', 'CREATED', 'Restaurant not received', '2018-10-07 13:33:54', '2018-10-07 13:33:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_dispute_comments`
--

CREATE TABLE `order_dispute_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `order_dispute_id` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_dispute_comments`
--

INSERT INTO `order_dispute_comments` (`id`, `admin_id`, `order_dispute_id`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Order 1 Change Status CREATED To RESOLVED', '2018-09-24 19:28:13', '2018-09-24 19:28:13', NULL),
(2, 1, 2, 'Order 1  Status Updated To ORDERED', '2018-09-24 19:28:56', '2018-09-24 19:28:56', NULL),
(3, 1, 2, 'Order 1  Status Updated To RECEIVED', '2018-09-24 19:33:03', '2018-09-24 19:33:03', NULL),
(4, 1, 2, 'vc', '2018-09-24 19:34:21', '2018-09-24 19:34:21', NULL),
(5, 1, 2, 'Order 1  Status Updated To ORDERED', '2018-09-24 19:43:36', '2018-09-24 19:43:36', NULL),
(6, 1, 4, 'Order 3  Status Updated To ORDERED', '2018-09-24 20:15:13', '2018-09-24 20:15:13', NULL),
(7, 1, 4, 'Order 3  Status Updated To ORDERED', '2018-09-24 21:18:32', '2018-09-24 21:18:32', NULL),
(8, 1, 15, 'Order 14 Change Status CREATED To RESOLVED', '2018-09-25 13:35:38', '2018-09-25 13:35:38', NULL),
(9, 1, 2, 'Order 1  Status Updated To ARRIVED', '2018-09-27 16:20:01', '2018-09-27 16:20:01', NULL),
(10, 1, 33, 'Order 36  Status Updated To RECEIVED', '2018-09-27 16:22:17', '2018-09-27 16:22:17', NULL),
(11, 1, 20, 'Order 16  Status Updated To CANCELLED', '2018-09-27 16:23:25', '2018-09-27 16:23:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_dispute_helps`
--

CREATE TABLE `order_dispute_helps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_invoices`
--

CREATE TABLE `order_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `paid` int(11) NOT NULL DEFAULT '0',
  `gross` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `delivery_charge` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `payable` int(11) NOT NULL DEFAULT '0',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `net` int(11) NOT NULL DEFAULT '0',
  `total_pay` double NOT NULL DEFAULT '0',
  `tender_pay` double NOT NULL DEFAULT '0',
  `ripple_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` enum('cash','stripe','paypal','braintree','wallet','ripple','eather','bitcoin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `DestinationTag` text COLLATE utf8mb4_unicode_ci,
  `payment_id` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','processing','failed','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_invoices`
--

INSERT INTO `order_invoices` (`id`, `order_id`, `quantity`, `paid`, `gross`, `discount`, `delivery_charge`, `wallet_amount`, `payable`, `tax`, `net`, `total_pay`, `tender_pay`, `ripple_price`, `payment_mode`, `DestinationTag`, `payment_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 0, 1500.00, 150.00, 500.00, 0.00, 1850, 0.00, 1850, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-24 19:24:05', '2018-09-24 19:24:05', NULL),
(2, 2, 5, 0, 7500.00, 750.00, 500.00, 0.00, 7250, 0.00, 7250, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-24 19:46:03', '2018-09-24 19:46:03', NULL),
(3, 3, 3, 0, 4500.00, 450.00, 500.00, 0.00, 4550, 0.00, 4550, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-24 20:10:21', '2018-09-24 20:10:21', NULL),
(4, 4, 1, 0, 10.00, 0.10, 500.00, 0.00, 510, 0.00, 510, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 10:21:21', '2018-09-25 10:21:21', NULL),
(5, 5, 1, 0, 10.00, 0.10, 500.00, 0.00, 510, 0.00, 510, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 10:24:17', '2018-09-25 10:24:17', NULL),
(6, 6, 1, 0, 1500.00, 150.00, 500.00, 0.00, 1850, 0.00, 1850, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 10:47:13', '2018-09-25 10:47:13', NULL),
(7, 7, 1, 0, 10.00, 0.10, 500.00, 0.00, 510, 0.00, 510, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 12:11:17', '2018-09-25 12:11:17', NULL),
(8, 8, 1, 0, 1500.00, 150.00, 500.00, 0.00, 1850, 0.00, 1850, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 12:19:17', '2018-09-25 12:19:17', NULL),
(9, 9, 1, 0, 1500.00, 150.00, 500.00, 0.00, 1850, 0.00, 1850, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 12:20:53', '2018-09-25 12:20:53', NULL),
(10, 10, 1, 0, 10.00, 0.10, 500.00, 0.00, 510, 0.00, 510, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 12:48:09', '2018-09-25 12:48:09', NULL),
(11, 11, 1, 0, 10.00, 0.10, 500.00, 0.00, 510, 0.00, 510, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:13:19', '2018-09-25 13:13:19', NULL),
(12, 12, 1, 0, 1500.00, 150.00, 500.00, 0.00, 1850, 0.00, 1850, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:14:39', '2018-09-25 13:14:39', NULL),
(13, 13, 1, 0, 10.00, 0.10, 500.00, 0.00, 510, 0.00, 510, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:15:26', '2018-09-25 13:15:26', NULL),
(14, 14, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:25:51', '2018-09-25 13:25:51', NULL),
(15, 15, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:28:47', '2018-09-25 13:28:47', NULL),
(16, 16, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:36:24', '2018-09-25 13:36:24', NULL),
(17, 17, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 13:58:43', '2018-09-25 13:58:43', NULL),
(18, 18, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 14:03:44', '2018-09-25 14:03:44', NULL),
(19, 19, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 14:06:59', '2018-09-25 14:06:59', NULL),
(20, 20, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 14:20:21', '2018-09-25 14:20:21', NULL),
(21, 21, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 14:23:23', '2018-09-25 14:23:23', NULL),
(22, 22, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 14:24:34', '2018-09-25 14:24:34', NULL),
(23, 23, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 14:31:58', '2018-09-25 14:31:58', NULL),
(24, 24, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 19:12:16', '2018-09-25 19:12:16', NULL),
(25, 25, 3, 0, 4500.00, 450.00, 50.00, 0.00, 4100, 0.00, 4100, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-25 19:20:14', '2018-09-25 19:20:14', NULL),
(26, 26, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 03:53:22', '2018-09-26 03:53:22', NULL),
(27, 27, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 13:28:55', '2018-09-26 13:28:55', NULL),
(28, 28, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 17:56:53', '2018-09-26 17:56:53', NULL),
(29, 29, 2, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 18:25:11', '2018-09-26 18:25:11', NULL),
(30, 30, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 18:57:47', '2018-09-26 18:57:47', NULL),
(31, 31, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 19:11:05', '2018-09-26 19:11:05', NULL),
(32, 32, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 19:31:01', '2018-09-26 19:31:01', NULL),
(33, 33, 1, 1, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 60, 0, '0', 'cash', '', '0', 'success', '2018-09-26 19:49:33', '2018-09-26 20:09:53', NULL),
(34, 34, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 21:12:33', '2018-09-26 21:12:33', NULL),
(35, 35, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-26 21:37:28', '2018-09-26 21:37:28', NULL),
(36, 36, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 13:33:53', '2018-09-27 13:33:53', NULL),
(37, 37, 1, 1, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 60, 0, '0', 'cash', '', '0', 'success', '2018-09-27 14:38:58', '2018-09-27 15:09:56', NULL),
(38, 38, 3, 0, 4500.00, 450.00, 50.00, 0.00, 4100, 0.00, 4100, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 15:40:00', '2018-09-27 15:40:00', NULL),
(39, 39, 3, 0, 4500.00, 450.00, 50.00, 0.00, 4100, 0.00, 4100, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 16:13:09', '2018-09-27 16:13:09', NULL),
(40, 40, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 17:08:24', '2018-09-27 17:08:24', NULL),
(41, 41, 2, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 17:35:06', '2018-09-27 17:35:06', NULL),
(42, 42, 2, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 18:48:02', '2018-09-27 18:48:02', NULL),
(43, 43, 3, 0, 30.00, 0.30, 50.00, 0.00, 80, 0.00, 80, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 18:58:17', '2018-09-27 18:58:17', NULL),
(44, 44, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-27 20:39:04', '2018-09-27 20:39:04', NULL),
(45, 45, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-28 17:02:59', '2018-09-28 17:02:59', NULL),
(46, 46, 1, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-28 19:21:24', '2018-09-28 19:21:24', NULL),
(47, 47, 1, 0, 2750.00, 27.50, 50.00, 0.00, 2773, 0.00, 2773, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-29 14:07:29', '2018-09-29 14:07:29', NULL),
(48, 48, 1, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-29 14:20:46', '2018-09-29 14:20:46', NULL),
(49, 49, 1, 0, 2750.00, 27.50, 50.00, 0.00, 2773, 0.00, 2773, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-29 14:29:57', '2018-09-29 14:29:57', NULL),
(50, 50, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-29 14:52:28', '2018-09-29 14:52:28', NULL),
(51, 51, 1, 1, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 60, 0, '0', 'cash', '', '0', 'success', '2018-09-29 14:53:20', '2018-09-29 14:55:26', NULL),
(52, 52, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-29 14:55:43', '2018-09-29 14:55:43', NULL),
(53, 53, 1, 1, 2750.00, 27.50, 50.00, 0.00, 2773, 0.00, 2773, 2773, 0, '0', 'cash', '', '0', 'success', '2018-09-29 14:56:49', '2018-09-29 16:56:53', NULL),
(54, 54, 1, 1, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 60, 0, '0', 'cash', '', '0', 'success', '2018-09-29 15:03:56', '2018-09-29 15:06:46', NULL),
(55, 55, 3, 1, 7500.00, 75.00, 50.00, 0.00, 7475, 0.00, 7475, 7475, 0, '0', 'cash', '', '0', 'success', '2018-09-29 16:58:16', '2018-09-29 17:07:26', NULL),
(56, 56, 1, 1, 250.00, 2.50, 50.00, 0.00, 298, 0.00, 298, 298, 0, '0', 'cash', '', '0', 'success', '2018-09-29 17:10:17', '2018-09-29 17:16:40', NULL),
(57, 57, 1, 1, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 1400, 0, '0', 'cash', '', '0', 'success', '2018-09-29 17:33:03', '2018-09-29 17:37:19', NULL),
(58, 58, 5, 1, 12500.00, 125.00, 50.00, 0.00, 12425, 0.00, 12425, 12425, 0, '0', 'cash', '', '0', 'success', '2018-09-29 19:16:08', '2018-09-29 19:20:44', NULL),
(59, 59, 2, 1, 5750.00, 57.50, 50.00, 0.00, 5743, 0.00, 5743, 5743, 0, '0', 'cash', '', '0', 'success', '2018-09-29 19:21:52', '2018-09-29 19:24:15', NULL),
(60, 60, 2, 1, 3000.00, 30.00, 50.00, 0.00, 3020, 0.00, 3020, 3020, 0, '0', 'cash', '', '0', 'success', '2018-09-29 21:38:15', '2018-09-29 21:42:11', NULL),
(61, 61, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-29 21:42:38', '2018-09-29 21:42:38', NULL),
(62, 62, 1, 0, 2750.00, 27.50, 50.00, 0.00, 2773, 0.00, 2773, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-30 14:24:38', '2018-09-30 14:24:38', NULL),
(63, 63, 1, 0, 2750.00, 27.50, 50.00, 0.00, 2773, 0.00, 2773, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-30 16:27:34', '2018-09-30 16:27:34', NULL),
(64, 64, 1, 0, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-30 16:28:41', '2018-09-30 16:28:41', NULL),
(65, 65, 2, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-30 16:29:31', '2018-09-30 16:29:31', NULL),
(66, 66, 2, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-09-30 16:56:48', '2018-09-30 16:56:48', NULL),
(67, 67, 3, 1, 4500.00, 450.00, 50.00, 0.00, 4100, 0.00, 4100, 4500, 400, '0', 'cash', '', '0', 'success', '2018-09-30 17:08:51', '2018-09-30 17:13:10', NULL),
(68, 68, 4, 1, 6000.00, 600.00, 50.00, 0.00, 5450, 0.00, 5450, 6000, 550, '0', 'cash', '', '0', 'success', '2018-09-30 17:16:07', '2018-09-30 17:19:52', NULL),
(69, 69, 1, 1, 1500.00, 150.00, 50.00, 0.00, 1400, 0.00, 1400, 1400, 0, '0', 'cash', '', '0', 'success', '2018-10-01 19:00:35', '2018-10-01 19:18:03', NULL),
(70, 70, 3, 1, 4500.00, 450.00, 50.00, 0.00, 4100, 0.00, 4100, 41001, 36901, '0', 'cash', '', '0', 'success', '2018-10-01 19:20:51', '2018-10-01 19:23:24', NULL),
(71, 71, 2, 0, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 0, 0, '0', 'cash', '', '0', 'pending', '2018-10-01 19:24:35', '2018-10-01 19:24:35', NULL),
(72, 72, 2, 1, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 2750, 0, '0', 'cash', '', '0', 'success', '2018-10-01 19:35:21', '2018-10-01 19:36:24', NULL),
(73, 73, 4, 0, 6000.00, 60.00, 50.00, 0.00, 5990, 0.00, 5990, 0, 0, '0', 'cash', '', '0', 'pending', '2018-10-01 22:08:28', '2018-10-01 22:08:28', NULL),
(74, 74, 4, 1, 6000.00, 60.00, 50.00, 0.00, 5990, 0.00, 5990, 5990, 0, '0', 'cash', '', '0', 'success', '2018-10-01 22:15:30', '2018-10-01 22:19:18', NULL),
(75, 75, 2, 1, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 2750, 0, '0', 'cash', '', '0', 'success', '2018-10-02 00:07:42', '2018-10-02 00:11:49', NULL),
(76, 76, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-10-02 16:09:43', '2018-10-02 16:09:43', NULL),
(77, 77, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-10-02 16:10:13', '2018-10-02 16:10:13', NULL),
(78, 78, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-10-02 16:26:09', '2018-10-02 16:26:09', NULL),
(79, 79, 1, 0, 10.00, 0.10, 50.00, 0.00, 60, 0.00, 60, 0, 0, '0', 'cash', '', '0', 'pending', '2018-10-02 16:51:33', '2018-10-02 16:51:33', NULL),
(80, 80, 2, 1, 3000.00, 300.00, 50.00, 0.00, 2750, 0.00, 2750, 2750, 0, '0', 'cash', '', '0', 'success', '2018-10-07 13:42:42', '2018-10-07 13:45:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_ratings`
--

CREATE TABLE `order_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_rating` int(11) DEFAULT NULL,
  `user_comment` text COLLATE utf8mb4_unicode_ci,
  `transporter_id` int(11) DEFAULT NULL,
  `transporter_rating` int(11) DEFAULT NULL,
  `transporter_comment` text COLLATE utf8mb4_unicode_ci,
  `shop_id` int(11) DEFAULT NULL,
  `shop_rating` int(11) DEFAULT NULL,
  `shop_comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_ratings`
--

INSERT INTO `order_ratings` (`id`, `order_id`, `user_id`, `user_rating`, `user_comment`, `transporter_id`, `transporter_rating`, `transporter_comment`, `shop_id`, `shop_rating`, `shop_comment`, `created_at`, `updated_at`) VALUES
(1, 33, 6, 5, 'gbnnj', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-27 08:03:19', '2018-09-27 08:03:19'),
(2, 37, 6, 5, 'great', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-27 15:10:12', '2018-09-27 15:10:12'),
(3, 51, 6, 5, 'great', 3, 5, NULL, NULL, NULL, NULL, '2018-09-29 14:55:36', '2018-09-29 14:55:47'),
(4, 54, 6, 5, 'great service', 3, 5, 'great work', NULL, NULL, NULL, '2018-09-29 15:06:54', '2018-09-29 15:07:11'),
(5, 53, 3, 4, 'جيد', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-29 16:57:07', '2018-09-29 16:57:07'),
(6, 57, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-29 17:37:25', '2018-09-29 17:37:25'),
(7, 58, 3, 5, 'ok', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-29 19:20:56', '2018-09-29 19:20:56'),
(8, 59, 3, 5, NULL, 2, 4, 'very good', 9, 4, 'good', '2018-09-29 19:24:21', '2018-09-29 21:17:19'),
(9, 60, 11, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, '2018-09-29 21:42:16', '2018-09-29 21:42:20'),
(10, 67, 14, 5, NULL, 9, 5, NULL, NULL, NULL, NULL, '2018-09-30 17:13:41', '2018-09-30 17:13:47'),
(11, 68, NULL, NULL, NULL, 9, 5, NULL, NULL, NULL, NULL, '2018-09-30 17:20:17', '2018-09-30 17:20:17'),
(12, 69, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-01 19:18:07', '2018-10-01 19:18:07'),
(13, 70, 3, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, '2018-10-01 19:23:27', '2018-10-01 19:24:18'),
(14, 72, 3, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, '2018-10-01 19:36:27', '2018-10-01 19:36:39'),
(15, 74, 3, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, '2018-10-01 22:19:29', '2018-10-01 22:19:35'),
(16, 75, 3, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, '2018-10-02 00:11:56', '2018-10-02 00:12:05'),
(17, 80, 3, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, '2018-10-07 13:45:52', '2018-10-07 13:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_timings`
--

CREATE TABLE `order_timings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','REACHED','PICKEDUP','ARRIVED','COMPLETED','SEARCHING') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_timings`
--

INSERT INTO `order_timings` (`id`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'ORDERED', '2018-09-24 19:24:05', '2018-09-24 19:24:05'),
(2, 1, 'ORDERED', '2018-09-24 19:28:13', '2018-09-24 19:28:13'),
(3, 1, 'ORDERED', '2018-09-24 19:28:56', '2018-09-24 19:28:56'),
(4, 1, 'CANCELLED', '2018-09-24 19:32:17', '2018-09-24 19:32:17'),
(5, 1, 'RECEIVED', '2018-09-24 19:33:03', '2018-09-24 19:33:03'),
(6, 1, 'ORDERED', '2018-09-24 19:43:36', '2018-09-24 19:43:36'),
(7, 2, 'ORDERED', '2018-09-24 19:46:03', '2018-09-24 19:46:03'),
(8, 3, 'ORDERED', '2018-09-24 20:10:21', '2018-09-24 20:10:21'),
(9, 3, 'ORDERED', '2018-09-24 20:15:13', '2018-09-24 20:15:13'),
(10, 3, 'ORDERED', '2018-09-24 21:18:32', '2018-09-24 21:18:32'),
(11, 4, 'ORDERED', '2018-09-25 10:21:21', '2018-09-25 10:21:21'),
(12, 5, 'ORDERED', '2018-09-25 10:24:17', '2018-09-25 10:24:17'),
(13, 5, 'CANCELLED', '2018-09-25 10:39:51', '2018-09-25 10:39:51'),
(14, 6, 'ORDERED', '2018-09-25 10:47:13', '2018-09-25 10:47:13'),
(15, 7, 'ORDERED', '2018-09-25 12:11:17', '2018-09-25 12:11:17'),
(16, 8, 'ORDERED', '2018-09-25 12:19:17', '2018-09-25 12:19:17'),
(17, 9, 'ORDERED', '2018-09-25 12:20:53', '2018-09-25 12:20:53'),
(18, 10, 'ORDERED', '2018-09-25 12:48:09', '2018-09-25 12:48:09'),
(19, 11, 'ORDERED', '2018-09-25 13:13:19', '2018-09-25 13:13:19'),
(20, 12, 'ORDERED', '2018-09-25 13:14:39', '2018-09-25 13:14:39'),
(21, 13, 'ORDERED', '2018-09-25 13:15:26', '2018-09-25 13:15:26'),
(22, 14, 'ORDERED', '2018-09-25 13:25:51', '2018-09-25 13:25:51'),
(23, 15, 'ORDERED', '2018-09-25 13:28:47', '2018-09-25 13:28:47'),
(24, 14, 'ORDERED', '2018-09-25 13:35:38', '2018-09-25 13:35:38'),
(25, 16, 'ORDERED', '2018-09-25 13:36:24', '2018-09-25 13:36:24'),
(26, 16, 'RECEIVED', '2018-09-25 13:36:54', '2018-09-25 13:36:54'),
(27, 16, 'ASSIGNED', '2018-09-25 13:47:00', '2018-09-25 13:47:00'),
(28, 17, 'ORDERED', '2018-09-25 13:58:43', '2018-09-25 13:58:43'),
(29, 17, 'RECEIVED', '2018-09-25 13:59:02', '2018-09-25 13:59:02'),
(30, 17, 'RECEIVED', '2018-09-25 13:59:04', '2018-09-25 13:59:04'),
(31, 17, 'CANCELLED', '2018-09-25 14:00:59', '2018-09-25 14:00:59'),
(32, 15, 'CANCELLED', '2018-09-25 14:01:45', '2018-09-25 14:01:45'),
(33, 14, 'CANCELLED', '2018-09-25 14:01:49', '2018-09-25 14:01:49'),
(34, 18, 'ORDERED', '2018-09-25 14:03:44', '2018-09-25 14:03:44'),
(35, 19, 'ORDERED', '2018-09-25 14:06:59', '2018-09-25 14:06:59'),
(36, 19, 'RECEIVED', '2018-09-25 14:07:44', '2018-09-25 14:07:44'),
(37, 20, 'ORDERED', '2018-09-25 14:20:21', '2018-09-25 14:20:21'),
(38, 21, 'ORDERED', '2018-09-25 14:23:23', '2018-09-25 14:23:23'),
(39, 21, 'CANCELLED', '2018-09-25 14:23:53', '2018-09-25 14:23:53'),
(40, 22, 'ORDERED', '2018-09-25 14:24:34', '2018-09-25 14:24:34'),
(41, 23, 'ORDERED', '2018-09-25 14:31:58', '2018-09-25 14:31:58'),
(42, 24, 'ORDERED', '2018-09-25 19:12:16', '2018-09-25 19:12:16'),
(43, 24, 'RECEIVED', '2018-09-25 19:12:33', '2018-09-25 19:12:33'),
(44, 24, 'RECEIVED', '2018-09-25 19:12:34', '2018-09-25 19:12:34'),
(45, 24, 'CANCELLED', '2018-09-25 19:16:50', '2018-09-25 19:16:50'),
(46, 16, 'CANCELLED', '2018-09-25 19:17:03', '2018-09-25 19:17:03'),
(47, 25, 'ORDERED', '2018-09-25 19:20:14', '2018-09-25 19:20:14'),
(48, 25, 'RECEIVED', '2018-09-25 19:20:28', '2018-09-25 19:20:28'),
(49, 25, 'ASSIGNED', '2018-09-25 19:20:39', '2018-09-25 19:20:39'),
(50, 26, 'ORDERED', '2018-09-26 03:53:22', '2018-09-26 03:53:22'),
(51, 26, 'RECEIVED', '2018-09-26 03:55:02', '2018-09-26 03:55:02'),
(52, 25, 'CANCELLED', '2018-09-26 03:57:24', '2018-09-26 03:57:24'),
(53, 26, 'ASSIGNED', '2018-09-26 03:57:37', '2018-09-26 03:57:37'),
(54, 27, 'ORDERED', '2018-09-26 13:28:55', '2018-09-26 13:28:55'),
(55, 28, 'ORDERED', '2018-09-26 17:56:53', '2018-09-26 17:56:53'),
(56, 28, 'RECEIVED', '2018-09-26 18:17:51', '2018-09-26 18:17:51'),
(57, 3, 'CANCELLED', '2018-09-26 18:20:09', '2018-09-26 18:20:09'),
(58, 28, 'SEARCHING', '2018-09-26 18:22:54', '2018-09-26 18:22:54'),
(59, 26, 'CANCELLED', '2018-09-26 18:23:04', '2018-09-26 18:23:04'),
(60, 29, 'ORDERED', '2018-09-26 18:25:11', '2018-09-26 18:25:11'),
(61, 29, 'RECEIVED', '2018-09-26 18:25:26', '2018-09-26 18:25:26'),
(62, 29, 'SEARCHING', '2018-09-26 18:35:45', '2018-09-26 18:35:45'),
(63, 29, 'PROCESSING', '2018-09-26 18:49:15', '2018-09-26 18:49:15'),
(64, 1, 'CANCELLED', '2018-09-26 18:51:25', '2018-09-26 18:51:25'),
(65, 28, 'CANCELLED', '2018-09-26 18:51:27', '2018-09-26 18:51:27'),
(66, 27, 'CANCELLED', '2018-09-26 18:51:32', '2018-09-26 18:51:32'),
(67, 23, 'CANCELLED', '2018-09-26 18:51:37', '2018-09-26 18:51:37'),
(68, 22, 'CANCELLED', '2018-09-26 18:51:43', '2018-09-26 18:51:43'),
(69, 20, 'CANCELLED', '2018-09-26 18:51:48', '2018-09-26 18:51:48'),
(70, 19, 'CANCELLED', '2018-09-26 18:51:56', '2018-09-26 18:51:56'),
(71, 18, 'CANCELLED', '2018-09-26 18:52:02', '2018-09-26 18:52:02'),
(72, 13, 'CANCELLED', '2018-09-26 18:52:06', '2018-09-26 18:52:06'),
(73, 12, 'CANCELLED', '2018-09-26 18:52:11', '2018-09-26 18:52:11'),
(74, 2, 'CANCELLED', '2018-09-26 18:52:22', '2018-09-26 18:52:22'),
(75, 10, 'CANCELLED', '2018-09-26 18:52:28', '2018-09-26 18:52:28'),
(76, 11, 'CANCELLED', '2018-09-26 18:52:33', '2018-09-26 18:52:33'),
(77, 9, 'CANCELLED', '2018-09-26 18:52:40', '2018-09-26 18:52:40'),
(78, 8, 'CANCELLED', '2018-09-26 18:52:44', '2018-09-26 18:52:44'),
(79, 7, 'CANCELLED', '2018-09-26 18:52:51', '2018-09-26 18:52:51'),
(80, 6, 'CANCELLED', '2018-09-26 18:52:55', '2018-09-26 18:52:55'),
(81, 4, 'CANCELLED', '2018-09-26 18:52:59', '2018-09-26 18:52:59'),
(82, 29, 'CANCELLED', '2018-09-26 18:53:11', '2018-09-26 18:53:11'),
(83, 30, 'ORDERED', '2018-09-26 18:57:47', '2018-09-26 18:57:47'),
(84, 30, 'RECEIVED', '2018-09-26 18:58:11', '2018-09-26 18:58:11'),
(85, 30, 'SEARCHING', '2018-09-26 18:59:12', '2018-09-26 18:59:12'),
(86, 30, 'PROCESSING', '2018-09-26 19:00:21', '2018-09-26 19:00:21'),
(87, 30, 'CANCELLED', '2018-09-26 19:03:09', '2018-09-26 19:03:09'),
(88, 31, 'ORDERED', '2018-09-26 19:11:05', '2018-09-26 19:11:05'),
(89, 31, 'RECEIVED', '2018-09-26 19:11:34', '2018-09-26 19:11:34'),
(90, 31, 'SEARCHING', '2018-09-26 19:16:34', '2018-09-26 19:16:34'),
(91, 32, 'ORDERED', '2018-09-26 19:31:01', '2018-09-26 19:31:01'),
(92, 32, 'RECEIVED', '2018-09-26 19:31:29', '2018-09-26 19:31:29'),
(93, 32, 'SEARCHING', '2018-09-26 19:32:33', '2018-09-26 19:32:33'),
(94, 33, 'ORDERED', '2018-09-26 19:49:33', '2018-09-26 19:49:33'),
(95, 33, 'RECEIVED', '2018-09-26 19:50:19', '2018-09-26 19:50:19'),
(96, 33, 'SEARCHING', '2018-09-26 19:51:21', '2018-09-26 19:51:21'),
(97, 33, 'PROCESSING', '2018-09-26 19:51:44', '2018-09-26 19:51:44'),
(98, 33, 'REACHED', '2018-09-26 20:09:32', '2018-09-26 20:09:32'),
(99, 33, 'PICKEDUP', '2018-09-26 20:09:33', '2018-09-26 20:09:33'),
(100, 33, 'ARRIVED', '2018-09-26 20:09:45', '2018-09-26 20:09:45'),
(101, 34, 'ORDERED', '2018-09-26 21:12:33', '2018-09-26 21:12:33'),
(102, 35, 'ORDERED', '2018-09-26 21:37:28', '2018-09-26 21:37:28'),
(103, 33, 'COMPLETED', '2018-09-27 08:03:10', '2018-09-27 08:03:10'),
(104, 36, 'ORDERED', '2018-09-27 13:33:53', '2018-09-27 13:33:53'),
(105, 36, 'RECEIVED', '2018-09-27 13:35:23', '2018-09-27 13:35:23'),
(106, 37, 'ORDERED', '2018-09-27 14:38:58', '2018-09-27 14:38:58'),
(107, 37, 'RECEIVED', '2018-09-27 15:04:40', '2018-09-27 15:04:40'),
(108, 37, 'SEARCHING', '2018-09-27 15:06:28', '2018-09-27 15:06:28'),
(109, 37, 'PROCESSING', '2018-09-27 15:07:17', '2018-09-27 15:07:17'),
(110, 37, 'REACHED', '2018-09-27 15:08:43', '2018-09-27 15:08:43'),
(111, 37, 'PICKEDUP', '2018-09-27 15:09:24', '2018-09-27 15:09:24'),
(112, 37, 'ARRIVED', '2018-09-27 15:09:43', '2018-09-27 15:09:43'),
(113, 37, 'COMPLETED', '2018-09-27 15:09:58', '2018-09-27 15:09:58'),
(114, 38, 'ORDERED', '2018-09-27 15:40:00', '2018-09-27 15:40:00'),
(115, 38, 'RECEIVED', '2018-09-27 15:40:24', '2018-09-27 15:40:24'),
(116, 38, 'SEARCHING', '2018-09-27 15:45:24', '2018-09-27 15:45:24'),
(117, 38, 'PROCESSING', '2018-09-27 15:45:54', '2018-09-27 15:45:54'),
(118, 39, 'ORDERED', '2018-09-27 16:13:09', '2018-09-27 16:13:09'),
(119, 39, 'RECEIVED', '2018-09-27 16:13:57', '2018-09-27 16:13:57'),
(120, 39, 'SEARCHING', '2018-09-27 16:14:59', '2018-09-27 16:14:59'),
(121, 1, 'ARRIVED', '2018-09-27 16:20:01', '2018-09-27 16:20:01'),
(122, 36, 'RECEIVED', '2018-09-27 16:22:17', '2018-09-27 16:22:17'),
(123, 16, 'CANCELLED', '2018-09-27 16:23:24', '2018-09-27 16:23:24'),
(124, 40, 'ORDERED', '2018-09-27 17:08:24', '2018-09-27 17:08:24'),
(125, 41, 'ORDERED', '2018-09-27 17:35:06', '2018-09-27 17:35:06'),
(126, 38, 'CANCELLED', '2018-09-27 18:42:44', '2018-09-27 18:42:44'),
(127, 41, 'CANCELLED', '2018-09-27 18:42:52', '2018-09-27 18:42:52'),
(128, 40, 'CANCELLED', '2018-09-27 18:42:57', '2018-09-27 18:42:57'),
(129, 39, 'CANCELLED', '2018-09-27 18:43:01', '2018-09-27 18:43:01'),
(130, 36, 'CANCELLED', '2018-09-27 18:43:06', '2018-09-27 18:43:06'),
(131, 42, 'ORDERED', '2018-09-27 18:48:02', '2018-09-27 18:48:02'),
(132, 42, 'RECEIVED', '2018-09-27 18:48:34', '2018-09-27 18:48:34'),
(133, 43, 'ORDERED', '2018-09-27 18:58:17', '2018-09-27 18:58:17'),
(134, 42, 'SEARCHING', '2018-09-27 18:58:35', '2018-09-27 18:58:35'),
(135, 42, 'PROCESSING', '2018-09-27 18:58:52', '2018-09-27 18:58:52'),
(136, 44, 'ORDERED', '2018-09-27 20:39:04', '2018-09-27 20:39:04'),
(137, 45, 'ORDERED', '2018-09-28 17:02:59', '2018-09-28 17:02:59'),
(138, 45, 'RECEIVED', '2018-09-28 17:04:17', '2018-09-28 17:04:17'),
(139, 45, 'SEARCHING', '2018-09-28 17:23:35', '2018-09-28 17:23:35'),
(140, 46, 'ORDERED', '2018-09-28 19:21:24', '2018-09-28 19:21:24'),
(141, 46, 'RECEIVED', '2018-09-28 19:24:40', '2018-09-28 19:24:40'),
(142, 47, 'ORDERED', '2018-09-29 14:07:29', '2018-09-29 14:07:29'),
(143, 47, 'RECEIVED', '2018-09-29 14:07:48', '2018-09-29 14:07:48'),
(144, 47, 'SEARCHING', '2018-09-29 14:13:54', '2018-09-29 14:13:54'),
(145, 45, 'CANCELLED', '2018-09-29 14:16:33', '2018-09-29 14:16:33'),
(146, 31, 'CANCELLED', '2018-09-29 14:16:45', '2018-09-29 14:16:45'),
(147, 46, 'CANCELLED', '2018-09-29 14:17:51', '2018-09-29 14:17:51'),
(148, 48, 'ORDERED', '2018-09-29 14:20:46', '2018-09-29 14:20:46'),
(149, 48, 'RECEIVED', '2018-09-29 14:22:09', '2018-09-29 14:22:09'),
(150, 48, 'SEARCHING', '2018-09-29 14:23:09', '2018-09-29 14:23:09'),
(151, 49, 'ORDERED', '2018-09-29 14:29:57', '2018-09-29 14:29:57'),
(152, 49, 'RECEIVED', '2018-09-29 14:31:06', '2018-09-29 14:31:06'),
(153, 49, 'SEARCHING', '2018-09-29 14:32:07', '2018-09-29 14:32:07'),
(154, 32, 'CANCELLED', '2018-09-29 14:41:39', '2018-09-29 14:41:39'),
(155, 48, 'CANCELLED', '2018-09-29 14:41:44', '2018-09-29 14:41:44'),
(156, 47, 'CANCELLED', '2018-09-29 14:41:49', '2018-09-29 14:41:49'),
(157, 49, 'CANCELLED', '2018-09-29 14:41:53', '2018-09-29 14:41:53'),
(158, 44, 'CANCELLED', '2018-09-29 14:41:58', '2018-09-29 14:41:58'),
(159, 43, 'CANCELLED', '2018-09-29 14:42:01', '2018-09-29 14:42:01'),
(160, 35, 'CANCELLED', '2018-09-29 14:42:06', '2018-09-29 14:42:06'),
(161, 34, 'CANCELLED', '2018-09-29 14:42:08', '2018-09-29 14:42:08'),
(162, 50, 'ORDERED', '2018-09-29 14:52:28', '2018-09-29 14:52:28'),
(163, 50, 'CANCELLED', '2018-09-29 14:52:42', '2018-09-29 14:52:42'),
(164, 51, 'ORDERED', '2018-09-29 14:53:20', '2018-09-29 14:53:20'),
(165, 51, 'RECEIVED', '2018-09-29 14:53:47', '2018-09-29 14:53:47'),
(166, 42, 'CANCELLED', '2018-09-29 14:54:28', '2018-09-29 14:54:28'),
(167, 51, 'ASSIGNED', '2018-09-29 14:54:48', '2018-09-29 14:54:48'),
(168, 51, 'PROCESSING', '2018-09-29 14:55:02', '2018-09-29 14:55:02'),
(169, 51, 'REACHED', '2018-09-29 14:55:05', '2018-09-29 14:55:05'),
(170, 51, 'PICKEDUP', '2018-09-29 14:55:12', '2018-09-29 14:55:12'),
(171, 51, 'ARRIVED', '2018-09-29 14:55:21', '2018-09-29 14:55:21'),
(172, 51, 'COMPLETED', '2018-09-29 14:55:28', '2018-09-29 14:55:28'),
(173, 52, 'ORDERED', '2018-09-29 14:55:43', '2018-09-29 14:55:43'),
(174, 52, 'CANCELLED', '2018-09-29 14:56:15', '2018-09-29 14:56:15'),
(175, 53, 'ORDERED', '2018-09-29 14:56:49', '2018-09-29 14:56:49'),
(176, 53, 'RECEIVED', '2018-09-29 14:57:06', '2018-09-29 14:57:06'),
(177, 53, 'ASSIGNED', '2018-09-29 14:57:26', '2018-09-29 14:57:26'),
(178, 54, 'ORDERED', '2018-09-29 15:03:56', '2018-09-29 15:03:56'),
(179, 54, 'RECEIVED', '2018-09-29 15:04:43', '2018-09-29 15:04:43'),
(180, 54, 'ASSIGNED', '2018-09-29 15:05:41', '2018-09-29 15:05:41'),
(181, 54, 'PROCESSING', '2018-09-29 15:06:19', '2018-09-29 15:06:19'),
(182, 54, 'REACHED', '2018-09-29 15:06:25', '2018-09-29 15:06:25'),
(183, 54, 'PICKEDUP', '2018-09-29 15:06:35', '2018-09-29 15:06:35'),
(184, 54, 'ARRIVED', '2018-09-29 15:06:41', '2018-09-29 15:06:41'),
(185, 54, 'COMPLETED', '2018-09-29 15:06:47', '2018-09-29 15:06:47'),
(186, 53, 'PROCESSING', '2018-09-29 16:52:07', '2018-09-29 16:52:07'),
(187, 53, 'REACHED', '2018-09-29 16:56:14', '2018-09-29 16:56:14'),
(188, 53, 'PICKEDUP', '2018-09-29 16:56:16', '2018-09-29 16:56:16'),
(189, 53, 'ARRIVED', '2018-09-29 16:56:25', '2018-09-29 16:56:25'),
(190, 53, 'COMPLETED', '2018-09-29 16:56:53', '2018-09-29 16:56:53'),
(191, 55, 'ORDERED', '2018-09-29 16:58:16', '2018-09-29 16:58:16'),
(192, 55, 'RECEIVED', '2018-09-29 17:00:15', '2018-09-29 17:00:15'),
(193, 55, 'ASSIGNED', '2018-09-29 17:00:57', '2018-09-29 17:00:57'),
(194, 55, 'PROCESSING', '2018-09-29 17:03:04', '2018-09-29 17:03:04'),
(195, 55, 'REACHED', '2018-09-29 17:06:21', '2018-09-29 17:06:21'),
(196, 55, 'PICKEDUP', '2018-09-29 17:06:25', '2018-09-29 17:06:25'),
(197, 55, 'ARRIVED', '2018-09-29 17:07:12', '2018-09-29 17:07:12'),
(198, 55, 'COMPLETED', '2018-09-29 17:07:27', '2018-09-29 17:07:27'),
(199, 56, 'ORDERED', '2018-09-29 17:10:17', '2018-09-29 17:10:17'),
(200, 56, 'RECEIVED', '2018-09-29 17:10:26', '2018-09-29 17:10:26'),
(201, 56, 'ASSIGNED', '2018-09-29 17:10:35', '2018-09-29 17:10:35'),
(202, 56, 'PROCESSING', '2018-09-29 17:11:43', '2018-09-29 17:11:43'),
(203, 56, 'PROCESSING', '2018-09-29 17:12:10', '2018-09-29 17:12:10'),
(204, 56, 'PROCESSING', '2018-09-29 17:12:14', '2018-09-29 17:12:14'),
(205, 56, 'REACHED', '2018-09-29 17:15:31', '2018-09-29 17:15:31'),
(206, 56, 'PICKEDUP', '2018-09-29 17:15:33', '2018-09-29 17:15:33'),
(207, 56, 'ARRIVED', '2018-09-29 17:15:35', '2018-09-29 17:15:35'),
(208, 56, 'COMPLETED', '2018-09-29 17:16:42', '2018-09-29 17:16:42'),
(209, 56, 'COMPLETED', '2018-09-29 17:19:58', '2018-09-29 17:19:58'),
(210, 57, 'ORDERED', '2018-09-29 17:33:03', '2018-09-29 17:33:03'),
(211, 57, 'RECEIVED', '2018-09-29 17:34:52', '2018-09-29 17:34:52'),
(212, 57, 'ASSIGNED', '2018-09-29 17:35:59', '2018-09-29 17:35:59'),
(213, 57, 'PROCESSING', '2018-09-29 17:36:22', '2018-09-29 17:36:22'),
(214, 57, 'REACHED', '2018-09-29 17:36:23', '2018-09-29 17:36:23'),
(215, 57, 'PICKEDUP', '2018-09-29 17:36:38', '2018-09-29 17:36:38'),
(216, 57, 'ARRIVED', '2018-09-29 17:37:01', '2018-09-29 17:37:01'),
(217, 57, 'COMPLETED', '2018-09-29 17:37:19', '2018-09-29 17:37:19'),
(218, 58, 'ORDERED', '2018-09-29 19:16:08', '2018-09-29 19:16:08'),
(219, 58, 'RECEIVED', '2018-09-29 19:16:46', '2018-09-29 19:16:46'),
(220, 58, 'ASSIGNED', '2018-09-29 19:17:50', '2018-09-29 19:17:50'),
(221, 58, 'PROCESSING', '2018-09-29 19:19:48', '2018-09-29 19:19:48'),
(222, 58, 'REACHED', '2018-09-29 19:19:58', '2018-09-29 19:19:58'),
(223, 58, 'PICKEDUP', '2018-09-29 19:20:07', '2018-09-29 19:20:07'),
(224, 58, 'ARRIVED', '2018-09-29 19:20:16', '2018-09-29 19:20:16'),
(225, 58, 'COMPLETED', '2018-09-29 19:20:45', '2018-09-29 19:20:45'),
(226, 59, 'ORDERED', '2018-09-29 19:21:52', '2018-09-29 19:21:52'),
(227, 59, 'RECEIVED', '2018-09-29 19:22:05', '2018-09-29 19:22:05'),
(228, 59, 'ASSIGNED', '2018-09-29 19:22:19', '2018-09-29 19:22:19'),
(229, 59, 'PROCESSING', '2018-09-29 19:23:35', '2018-09-29 19:23:35'),
(230, 59, 'PROCESSING', '2018-09-29 19:23:35', '2018-09-29 19:23:35'),
(231, 59, 'REACHED', '2018-09-29 19:23:47', '2018-09-29 19:23:47'),
(232, 59, 'PICKEDUP', '2018-09-29 19:23:53', '2018-09-29 19:23:53'),
(233, 59, 'ARRIVED', '2018-09-29 19:24:03', '2018-09-29 19:24:03'),
(234, 59, 'COMPLETED', '2018-09-29 19:24:16', '2018-09-29 19:24:16'),
(235, 60, 'ORDERED', '2018-09-29 21:38:15', '2018-09-29 21:38:15'),
(236, 60, 'RECEIVED', '2018-09-29 21:40:13', '2018-09-29 21:40:13'),
(237, 60, 'ASSIGNED', '2018-09-29 21:40:31', '2018-09-29 21:40:31'),
(238, 60, 'PROCESSING', '2018-09-29 21:41:08', '2018-09-29 21:41:08'),
(239, 60, 'REACHED', '2018-09-29 21:41:10', '2018-09-29 21:41:10'),
(240, 60, 'PICKEDUP', '2018-09-29 21:41:25', '2018-09-29 21:41:25'),
(241, 60, 'ARRIVED', '2018-09-29 21:41:45', '2018-09-29 21:41:45'),
(242, 60, 'COMPLETED', '2018-09-29 21:42:12', '2018-09-29 21:42:12'),
(243, 61, 'ORDERED', '2018-09-29 21:42:38', '2018-09-29 21:42:38'),
(244, 62, 'ORDERED', '2018-09-30 14:24:38', '2018-09-30 14:24:38'),
(245, 63, 'ORDERED', '2018-09-30 16:27:34', '2018-09-30 16:27:34'),
(246, 63, 'CANCELLED', '2018-09-30 16:27:55', '2018-09-30 16:27:55'),
(247, 62, 'CANCELLED', '2018-09-30 16:28:01', '2018-09-30 16:28:01'),
(248, 61, 'CANCELLED', '2018-09-30 16:28:06', '2018-09-30 16:28:06'),
(249, 64, 'ORDERED', '2018-09-30 16:28:41', '2018-09-30 16:28:41'),
(250, 65, 'ORDERED', '2018-09-30 16:29:31', '2018-09-30 16:29:31'),
(251, 65, 'CANCELLED', '2018-09-30 16:32:53', '2018-09-30 16:32:53'),
(252, 64, 'CANCELLED', '2018-09-30 16:32:56', '2018-09-30 16:32:56'),
(253, 66, 'ORDERED', '2018-09-30 16:56:48', '2018-09-30 16:56:48'),
(254, 66, 'RECEIVED', '2018-09-30 16:57:26', '2018-09-30 16:57:26'),
(255, 66, 'ASSIGNED', '2018-09-30 16:58:04', '2018-09-30 16:58:04'),
(256, 66, 'CANCELLED', '2018-09-30 17:08:04', '2018-09-30 17:08:04'),
(257, 67, 'ORDERED', '2018-09-30 17:08:51', '2018-09-30 17:08:51'),
(258, 67, 'RECEIVED', '2018-09-30 17:10:10', '2018-09-30 17:10:10'),
(259, 67, 'ASSIGNED', '2018-09-30 17:11:02', '2018-09-30 17:11:02'),
(260, 67, 'PROCESSING', '2018-09-30 17:12:03', '2018-09-30 17:12:03'),
(261, 67, 'PROCESSING', '2018-09-30 17:12:03', '2018-09-30 17:12:03'),
(262, 67, 'REACHED', '2018-09-30 17:12:05', '2018-09-30 17:12:05'),
(263, 67, 'PICKEDUP', '2018-09-30 17:12:32', '2018-09-30 17:12:32'),
(264, 67, 'ARRIVED', '2018-09-30 17:12:55', '2018-09-30 17:12:55'),
(265, 67, 'COMPLETED', '2018-09-30 17:13:11', '2018-09-30 17:13:11'),
(266, 68, 'ORDERED', '2018-09-30 17:16:07', '2018-09-30 17:16:07'),
(267, 68, 'RECEIVED', '2018-09-30 17:17:05', '2018-09-30 17:17:05'),
(268, 68, 'ASSIGNED', '2018-09-30 17:17:29', '2018-09-30 17:17:29'),
(269, 68, 'PROCESSING', '2018-09-30 17:18:32', '2018-09-30 17:18:32'),
(270, 68, 'REACHED', '2018-09-30 17:18:58', '2018-09-30 17:18:58'),
(271, 68, 'PICKEDUP', '2018-09-30 17:19:18', '2018-09-30 17:19:18'),
(272, 68, 'ARRIVED', '2018-09-30 17:19:37', '2018-09-30 17:19:37'),
(273, 68, 'COMPLETED', '2018-09-30 17:19:53', '2018-09-30 17:19:53'),
(274, 68, 'CANCELLED', '2018-09-30 19:28:47', '2018-09-30 19:28:47'),
(275, 69, 'ORDERED', '2018-10-01 19:00:35', '2018-10-01 19:00:35'),
(276, 69, 'RECEIVED', '2018-10-01 19:01:01', '2018-10-01 19:01:01'),
(277, 69, 'ASSIGNED', '2018-10-01 19:01:14', '2018-10-01 19:01:14'),
(278, 69, 'PROCESSING', '2018-10-01 19:02:34', '2018-10-01 19:02:34'),
(279, 69, 'REACHED', '2018-10-01 19:02:46', '2018-10-01 19:02:46'),
(280, 69, 'PICKEDUP', '2018-10-01 19:02:56', '2018-10-01 19:02:56'),
(281, 69, 'ARRIVED', '2018-10-01 19:02:58', '2018-10-01 19:02:58'),
(282, 69, 'ARRIVED', '2018-10-01 19:02:59', '2018-10-01 19:02:59'),
(283, 69, 'COMPLETED', '2018-10-01 19:18:03', '2018-10-01 19:18:03'),
(284, 70, 'ORDERED', '2018-10-01 19:20:51', '2018-10-01 19:20:51'),
(285, 70, 'RECEIVED', '2018-10-01 19:21:04', '2018-10-01 19:21:04'),
(286, 70, 'ASSIGNED', '2018-10-01 19:22:44', '2018-10-01 19:22:44'),
(287, 70, 'PROCESSING', '2018-10-01 19:23:07', '2018-10-01 19:23:07'),
(288, 70, 'REACHED', '2018-10-01 19:23:09', '2018-10-01 19:23:09'),
(289, 70, 'PICKEDUP', '2018-10-01 19:23:10', '2018-10-01 19:23:10'),
(290, 70, 'ARRIVED', '2018-10-01 19:23:13', '2018-10-01 19:23:13'),
(291, 70, 'COMPLETED', '2018-10-01 19:23:25', '2018-10-01 19:23:25'),
(292, 71, 'ORDERED', '2018-10-01 19:24:35', '2018-10-01 19:24:35'),
(293, 71, 'RECEIVED', '2018-10-01 19:24:42', '2018-10-01 19:24:42'),
(294, 71, 'ASSIGNED', '2018-10-01 19:25:20', '2018-10-01 19:25:20'),
(295, 71, 'CANCELLED', '2018-10-01 19:33:56', '2018-10-01 19:33:56'),
(296, 72, 'ORDERED', '2018-10-01 19:35:21', '2018-10-01 19:35:21'),
(297, 72, 'RECEIVED', '2018-10-01 19:35:40', '2018-10-01 19:35:40'),
(298, 72, 'ASSIGNED', '2018-10-01 19:35:51', '2018-10-01 19:35:51'),
(299, 72, 'PROCESSING', '2018-10-01 19:36:09', '2018-10-01 19:36:09'),
(300, 72, 'REACHED', '2018-10-01 19:36:11', '2018-10-01 19:36:11'),
(301, 72, 'PICKEDUP', '2018-10-01 19:36:14', '2018-10-01 19:36:14'),
(302, 72, 'ARRIVED', '2018-10-01 19:36:16', '2018-10-01 19:36:16'),
(303, 72, 'COMPLETED', '2018-10-01 19:36:26', '2018-10-01 19:36:26'),
(304, 73, 'ORDERED', '2018-10-01 22:08:28', '2018-10-01 22:08:28'),
(305, 73, 'RECEIVED', '2018-10-01 22:09:24', '2018-10-01 22:09:24'),
(306, 73, 'SEARCHING', '2018-10-01 22:10:25', '2018-10-01 22:10:25'),
(307, 73, 'CANCELLED', '2018-10-01 22:12:25', '2018-10-01 22:12:25'),
(308, 74, 'ORDERED', '2018-10-01 22:15:30', '2018-10-01 22:15:30'),
(309, 74, 'RECEIVED', '2018-10-01 22:15:40', '2018-10-01 22:15:40'),
(310, 74, 'ASSIGNED', '2018-10-01 22:17:12', '2018-10-01 22:17:12'),
(311, 74, 'PROCESSING', '2018-10-01 22:17:43', '2018-10-01 22:17:43'),
(312, 74, 'REACHED', '2018-10-01 22:18:11', '2018-10-01 22:18:11'),
(313, 74, 'PICKEDUP', '2018-10-01 22:18:30', '2018-10-01 22:18:30'),
(314, 74, 'ARRIVED', '2018-10-01 22:18:41', '2018-10-01 22:18:41'),
(315, 74, 'COMPLETED', '2018-10-01 22:19:20', '2018-10-01 22:19:20'),
(316, 75, 'ORDERED', '2018-10-02 00:07:42', '2018-10-02 00:07:42'),
(317, 75, 'RECEIVED', '2018-10-02 00:09:50', '2018-10-02 00:09:50'),
(318, 75, 'ASSIGNED', '2018-10-02 00:10:28', '2018-10-02 00:10:28'),
(319, 75, 'PROCESSING', '2018-10-02 00:10:54', '2018-10-02 00:10:54'),
(320, 75, 'REACHED', '2018-10-02 00:11:14', '2018-10-02 00:11:14'),
(321, 75, 'PICKEDUP', '2018-10-02 00:11:19', '2018-10-02 00:11:19'),
(322, 75, 'ARRIVED', '2018-10-02 00:11:38', '2018-10-02 00:11:38'),
(323, 75, 'COMPLETED', '2018-10-02 00:11:50', '2018-10-02 00:11:50'),
(324, 76, 'ORDERED', '2018-10-02 16:09:43', '2018-10-02 16:09:43'),
(325, 77, 'ORDERED', '2018-10-02 16:10:13', '2018-10-02 16:10:13'),
(326, 78, 'ORDERED', '2018-10-02 16:26:09', '2018-10-02 16:26:09'),
(327, 79, 'ORDERED', '2018-10-02 16:51:33', '2018-10-02 16:51:33'),
(328, 80, 'ORDERED', '2018-10-07 13:42:42', '2018-10-07 13:42:42'),
(329, 80, 'RECEIVED', '2018-10-07 13:43:02', '2018-10-07 13:43:02'),
(330, 80, 'ASSIGNED', '2018-10-07 13:44:33', '2018-10-07 13:44:33'),
(331, 80, 'PROCESSING', '2018-10-07 13:45:19', '2018-10-07 13:45:19'),
(332, 80, 'REACHED', '2018-10-07 13:45:27', '2018-10-07 13:45:27'),
(333, 80, 'PICKEDUP', '2018-10-07 13:45:36', '2018-10-07 13:45:36'),
(334, 80, 'ARRIVED', '2018-10-07 13:45:43', '2018-10-07 13:45:43'),
(335, 80, 'COMPLETED', '2018-10-07 13:45:50', '2018-10-07 13:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `shop_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `food_type` enum('veg','non-veg') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'veg',
  `avalability` tinyint(1) NOT NULL DEFAULT '0',
  `max_quantity` int(11) NOT NULL DEFAULT '10',
  `featured` int(11) NOT NULL DEFAULT '0',
  `addon_status` int(11) NOT NULL DEFAULT '0',
  `out_of_stock` enum('YES','NO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `parent_id`, `shop_id`, `name`, `description`, `position`, `food_type`, `avalability`, `max_quantity`, `featured`, `addon_status`, `out_of_stock`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 1, 'Crispy farm egg gribs', 'special', NULL, 'veg', 0, 10, 0, 0, 'NO', 'enabled', NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(2, 0, 1, 'Coconut thai curry with shirump', 'special', NULL, 'veg', 0, 10, 0, 0, 'NO', 'enabled', NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(3, 0, 1, 'Baked choclate shuffle', 'special', NULL, 'veg', 0, 10, 0, 0, 'NO', 'enabled', NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(4, 0, 2, 'Big mac', 'special', NULL, 'veg', 0, 10, 0, 0, 'NO', 'enabled', NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(5, 0, 2, 'Chicken Sandwitch', 'special', NULL, 'veg', 0, 10, 0, 0, 'NO', 'enabled', NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(6, 0, 2, 'Apple slice', 'special', NULL, 'veg', 0, 10, 0, 0, 'NO', 'enabled', NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(7, NULL, 3, 'لحم حنيذ', 'حنيذ', 2, 'veg', 0, 10, 0, 0, 'NO', 'enabled', '2018-09-24 18:26:04', '2018-09-24 18:26:04', NULL),
(8, NULL, 5, 'chicken fried', 'Test', 1, 'veg', 0, 10, 0, 0, 'NO', 'enabled', '2018-09-25 09:10:32', '2018-09-25 10:15:32', NULL),
(9, NULL, 8, 'p1', 'asdfasdf', 1, 'non-veg', 0, 10, 0, 0, 'NO', 'enabled', '2018-09-25 12:47:46', '2018-09-25 12:47:46', NULL),
(10, NULL, 9, 'ارز', 'ارز', 1, 'veg', 0, 10, 0, 0, 'NO', 'enabled', '2018-09-29 14:03:08', '2018-09-29 14:03:08', NULL),
(11, NULL, 9, 'سمك جحش', 'سمك جحش', 2, 'veg', 0, 10, 0, 0, 'NO', 'enabled', '2018-09-29 14:05:12', '2018-09-29 14:05:12', NULL),
(12, NULL, 6, 'Royal Chicken', 'broasted chicken', 1, 'non-veg', 0, 10, 1, 0, 'NO', 'enabled', '2018-09-30 16:46:01', '2018-09-30 16:46:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `url`, `position`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 'https://saffari.app/storage/products/pOCvVysuuAnMHkZDAx45LYoilhwGI3tqbSHstebr.png', 0, '2018-09-24 18:26:04', '2018-09-24 18:26:04', NULL),
(2, 7, 'https://saffari.app/storage/products/tMpIOkvQBluKqZJ6BkHodA5mReDOpoGiCSQUQI9A.png', 1, '2018-09-24 18:26:04', '2018-09-24 18:26:04', NULL),
(3, 8, 'https://saffari.app/storage/products/jI5agRn4H9Q0J766pogwvw9lLXcwqgvGYYUXUOL2.jpeg', 0, '2018-09-25 09:10:32', '2018-09-25 09:10:32', NULL),
(4, 8, 'https://saffari.app/storage/products/a0uxCfTr6l4S4OJSwBiwX7KEwFDtWZ9Ph6Qv1Lb3.jpeg', 1, '2018-09-25 09:10:32', '2018-09-25 09:10:32', NULL),
(5, 9, 'https://saffari.app/storage/products/Jzn6hGy2O8d7KfHizthHIbpfPdo5YNpmop1n2UPz.png', 0, '2018-09-25 12:47:46', '2018-09-25 12:47:46', NULL),
(6, 9, 'https://saffari.app/storage/products/nlpEBdbbUX8MZZDyRL2GXFUmmtooaqiWxLMy2cQ5.png', 1, '2018-09-25 12:47:46', '2018-09-25 12:47:46', NULL),
(7, 10, 'https://saffari.app/storage/products/BzYXVFxAZqzOGTMjgCPa1UjqKfzA8s8eWcMj7jln.jpeg', 0, '2018-09-29 14:03:08', '2018-09-29 14:03:08', NULL),
(8, 10, 'https://saffari.app/storage/products/XOCwis3OQwNIKuQ5yhJbL3W0WOqfApM71WQwKfdx.jpeg', 1, '2018-09-29 14:03:08', '2018-09-29 14:03:08', NULL),
(9, 11, 'https://saffari.app/storage/products/uh8gAXtZk2nGPs7cHUUl6wQPBfKtqaeaaR7hk6yJ.jpeg', 0, '2018-09-29 14:05:12', '2018-09-29 14:05:12', NULL),
(10, 11, 'https://saffari.app/storage/products/HjV3kvkfVOzCdYLWfptg1u8GzZ596VJCfUW0DttP.jpeg', 1, '2018-09-29 14:05:12', '2018-09-29 14:05:12', NULL),
(11, 12, 'https://saffari.app/storage/products/W5GnP0OPuKWk5jNfsRiwghwiwZxedWao195AWeeO.png', 0, '2018-09-30 16:46:01', '2018-09-30 16:46:01', NULL),
(12, 12, 'https://saffari.app/storage/products/Su7nErjdcf19a9uGOSumv4vrrBVNuN6RG7tYX16t.png', 1, '2018-09-30 16:46:01', '2018-09-30 16:46:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `orignal_price` double(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `discount_type` enum('percentage','amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `price`, `orignal_price`, `currency`, `discount`, `discount_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 100, 0.00, '$', 0, 'percentage', NULL, '2018-10-01 22:11:57', NULL),
(2, 2, 100, 0.00, '$', 0, 'percentage', NULL, '2018-10-01 22:11:57', NULL),
(3, 3, 100, 0.00, '$', 0, 'percentage', NULL, '2018-10-01 22:11:57', NULL),
(4, 4, 100, 0.00, '$', 0, 'percentage', NULL, '2018-10-01 22:11:57', NULL),
(5, 5, 100, 0.00, '$', 0, 'percentage', NULL, '2018-10-01 22:11:57', NULL),
(6, 6, 100, 0.00, '$', 0, 'percentage', NULL, '2018-10-01 22:11:57', NULL),
(7, 7, 1500, 1500.00, '$', 0, 'percentage', '2018-09-24 18:26:04', '2018-10-01 22:11:57', NULL),
(8, 8, 10, 9.90, '$', 1, 'percentage', '2018-09-25 09:10:32', '2018-10-01 22:11:57', NULL),
(9, 9, 2, 1.98, '$', 1, 'percentage', '2018-09-25 12:47:46', '2018-10-01 22:11:57', NULL),
(10, 10, 250, 250.00, '$', 0, 'percentage', '2018-09-29 14:03:08', '2018-10-01 22:11:57', NULL),
(11, 11, 2500, 2500.00, '$', 0, 'percentage', '2018-09-29 14:05:12', '2018-10-01 22:11:57', NULL),
(12, 12, 1200, 1200.00, '$', 0, 'percentage', '2018-09-30 16:46:01', '2018-10-01 22:11:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promocode_type` enum('amount','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `coupon_limit` double(10,2) NOT NULL DEFAULT '0.00',
  `coupon_user_limit` double(10,2) NOT NULL DEFAULT '0.00',
  `avail_from` datetime NOT NULL,
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promocodes`
--

INSERT INTO `promocodes` (`id`, `promo_code`, `promocode_type`, `discount`, `coupon_limit`, `coupon_user_limit`, `avail_from`, `expiration`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '6546', 'amount', 1.00, 3.00, 3.00, '2018-09-23 00:00:00', '2018-09-30 00:00:00', 'ADDED', NULL, '2018-09-24 20:00:55', '2018-09-24 20:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promocode_usages`
--

INSERT INTO `promocode_usages` (`id`, `user_id`, `promocode_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'USED', '2018-09-25 10:44:42', '2018-09-25 10:44:42'),
(2, 3, 1, 'USED', '2018-09-27 19:32:45', '2018-09-27 19:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_filters`
--

INSERT INTO `request_filters` (`id`, `request_id`, `provider_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 28, 7, 0, '2018-09-26 18:22:54', '2018-09-26 18:22:54'),
(9, 39, 3, 0, '2018-09-27 16:14:59', '2018-09-27 16:14:59'),
(12, 45, 2, 0, '2018-09-28 17:23:35', '2018-09-28 17:23:35'),
(13, 73, 8, 0, '2018-10-01 22:10:25', '2018-10-01 22:10:25'),
(14, 73, 9, 0, '2018-10-01 22:10:25', '2018-10-01 22:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `restuarants`
--

CREATE TABLE `restuarants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours_opening` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours_closing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restuarants`
--

INSERT INTO `restuarants` (`id`, `name`, `email`, `phone`, `password`, `hours_opening`, `hours_closing`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Ala', 'adabwan@gmail.com', '733557000', '123456', '09:00', '21:00', 'Yemen, sanaa', '2018-09-24 16:54:01', '2018-09-24 16:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Dispute Manager', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_title', 'Saffari'),
(2, 'site_logo', 'https://saffari.app/uploads/21ae82f432b7dcf0b111f9c1df9d5b96f02156b4.png'),
(3, 'site_favicon', 'https://saffari.app/uploads/5e07a9057d939fe30505aa2be7fe7b33d0e9a2fe.png'),
(4, 'site_copyright', '© 2018 Saffari.app'),
(5, 'delivery_charge', '50'),
(6, 'resturant_response_time', '3600'),
(7, 'currency', '$'),
(8, 'currency_code', 'USD'),
(9, 'search_distance', '1000000'),
(10, 'tax', '0'),
(11, 'payment_mode', 'CASH'),
(12, 'manual_assign', '0'),
(13, 'transporter_response_time', '3600'),
(14, 'GOOGLE_MAP_KEY', 'AIzaSyBDkKetQwosod2SZ7ZGCpxuJdxY3kxo5Po'),
(15, 'TWILIO_SID', 'AC21b5f870d95e6e820be8e471ec22d0b3'),
(16, 'TWILIO_TOKEN', '2735f9ff27e9d3b82cdeffa099b948dd'),
(17, 'TWILIO_FROM', '+16672221763'),
(18, 'PUBNUB_PUB_KEY', 'pub-c-5e89e809-6b9f-4b57-a7f2-f0a605e14312'),
(19, 'PUBNUB_SUB_KEY', 'sub-c-c61e9c22-c1bf-11e8-bc43-06ef4b7244fd'),
(20, 'stripe_charge', '0'),
(21, 'stripe_publishable_key', 'pk_test_39kly6aEfUEfvMpRnN6BnxLb'),
(22, 'stripe_secret_key', 'sk_test_I1OGCnG8zVIXCC7sSImIJsOy'),
(23, 'FB_CLIENT_ID', '320318811857224'),
(24, 'FB_CLIENT_SECRET', '37b9d98490ec8f32ae1a8ad01a7f8a63'),
(25, 'FB_REDIRECT', 'https://saffari.app'),
(26, 'GOOGLE_CLIENT_ID', '23611842572-gqhg8fl4q933sq70gp7fg5ed2sv73b2f.apps.googleusercontent.com'),
(27, 'GOOGLE_CLIENT_SECRET', '6IRhep_3Ysw3GV8ZB7785SQV'),
(28, 'GOOGLE_REDIRECT', 'https://saffari.app'),
(29, 'GOOGLE_API_KEY', 'AIzaSyAKGFZT_5uhpOOkma-GBOPamDw_mRIB-p8'),
(30, 'ANDROID_ENV', 'production'),
(31, 'ANDROID_PUSH_KEY', 'AIzaSyD0_nBsafyRJ4wvy7xlQXocZbUzRzLKC40'),
(32, 'IOS_USER_ENV', 'development'),
(33, 'IOS_PROVIDER_ENV', 'development'),
(34, 'DEMO_MODE', '1'),
(35, 'SUB_CATEGORY', '0'),
(36, 'SCHEDULE_ORDER', '0'),
(37, 'client_id', '2'),
(38, 'client_secret', 'RP6fCLiCGYLC163GLkPWMabusArAVKFX3pxUMkXl'),
(39, 'PRODUCT_ADDONS', '0'),
(40, 'BRAINTREE_ENV', 'sandbox'),
(41, 'BRAINTREE_MERCHANT_ID', 'twbd779hfc859jxq'),
(42, 'BRAINTREE_PUBLIC_KEY', '7bn6hystx7vs2g8r'),
(43, 'BRAINTREE_PRIVATE_KEY', '721e48cc74fdf2dfaacc6c3410de2f27'),
(44, 'RIPPLE_KEY', 'rEsaDShsYPmMZopoG3nNjutWJCk1Zn9cbX'),
(45, 'RIPPLE_BARCODE', 'https://saffari.app/images/ripple.png'),
(46, 'ETHER_ADMIN_KEY', '0x16abb22fd68c25286d72e77226ddaad87323cbb1'),
(47, 'ETHER_KEY', 'R92FW87ER1QZIDYX1UHTVBY625T8HCPKNR'),
(48, 'ETHER_BARCODE', 'https://saffari.app/images/ether.jpeg'),
(49, 'CLIENT_AUTHORIZATION', 'sandbox_v5r97hvk_twbd779hfc859jxq'),
(50, 'SOCIAL_FACEBOOK_LINK', 'http://facebook.com'),
(51, 'SOCIAL_TWITTER_LINK', 'http://twitter.com'),
(52, 'SOCIAL_G-PLUS_LINK', 'http://google.com'),
(53, 'SOCIAL_INSTAGRAM_LINK', 'http://instagram.com'),
(54, 'SOCIAL_PINTEREST_LINK', 'http://pinterest.com'),
(55, 'SOCIAL_VIMEO_LINK', 'http://vimeo.com'),
(56, 'SOCIAL_YOUTUBE_LINK', 'http://youtube.com'),
(57, 'COMMISION_OVER_FOOD', '5'),
(58, 'COMMISION_OVER_DELIVERY_FEE', '10'),
(59, 'APP_STORE_LINK', 'https://itunes.apple.com/us/app/foodie-express-food-delivery/id1296870125?mt=8'),
(60, 'GOOGLE_PLAY_LINK', 'https://play.google.com/store/apps/details?id=com.foodie.app&hl=en');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_min_amount` double(20,2) DEFAULT '0.00',
  `offer_percent` int(11) DEFAULT '0',
  `estimated_delivery_time` int(11) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maps_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `pure_veg` tinyint(1) DEFAULT '0',
  `popular` tinyint(1) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `rating_status` int(11) NOT NULL DEFAULT '0',
  `status` enum('onboarding','banned','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onboarding',
  `device_type` enum('ios','android') COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `email`, `password`, `phone`, `avatar`, `default_banner`, `description`, `offer_min_amount`, `offer_percent`, `estimated_delivery_time`, `otp`, `address`, `maps_address`, `latitude`, `longitude`, `pure_veg`, `popular`, `rating`, `rating_status`, `status`, `device_type`, `device_token`, `device_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gary danko', 'demo@foodie.com-5ba93a03bbf74', '$2y$10$QxSR7Tzqda57O37y2.NBo.O0y1CaKdIg4EfkeVOI4vLletI5tal4e', '8765654345-5ba93a03bbf17', NULL, NULL, 'good resturant', 0.00, 0, 30, NULL, 'Triplicane, Chennai, Tamil Nadu, India', 'Triplicane, Chennai, Tamil Nadu, India', 13.05871070, 80.27570630, 0, 0, 0, 0, 'onboarding', 'ios', NULL, NULL, NULL, NULL, '2018-09-24 19:24:51', '2018-09-24 19:24:51'),
(2, 'Mcdonald', 'demo2@foodie.com-5ba93a05e7b46', '$2y$10$3v4kf8RDM4FIhZBtCx.4duHfwcZdpfq0haI76LmqJLYORLPqymBIS', '8768884345-5ba93a05e7af6', NULL, NULL, 'good resturant', 0.00, 0, 30, NULL, 'Triplicane, Chennai, Tamil Nadu, India', 'Triplicane, Chennai, Tamil Nadu, India', 13.05871070, 80.27570630, 0, 0, 0, 0, 'onboarding', 'ios', NULL, NULL, NULL, NULL, '2018-09-24 19:24:53', '2018-09-24 19:24:53'),
(3, 'الشيباني', 'sh@gmail.com', '$2y$10$X1xHS2/osQSx5zK1Cton4e.4lmN3Jfk7RC2RR9hN99yBFp5NbA/0m', '733474886', 'https://saffari.app/storage/shops/ES83ky5qotbvbsH2POWDPEeX9lq8R0kjI9yvn3WQ.png', NULL, 'سلسلة ومطاعم الشيباني', 1.00, 10, 20, NULL, 'شارع الجامعه، إب، اليَمَن', 'شارع الجامعه، إب، اليَمَن', 13.96330538, 44.17319298, 1, 0, 5, 1, 'active', 'ios', NULL, NULL, '8zP2bXAtS4YDGEg9clDZxLcQn4MGOn9LRDn2uFjrnFRJ8a55AfgFoKJAbfmS', '2018-09-24 18:24:16', '2018-09-30 16:56:18', NULL),
(4, 'الشيباني', 'sh1@gmail.com', '$2y$10$ZzYFuJic3wqSfC8mGV7jJO4yeuA7RXdFJDsXU82v4Tloo6RzsE9hG', '7335557755', 'https://saffari.app/storage/shops/6PW2R8TbVZitqAokr3GYbJMbq2dGkKo8rGzDMCMd.jpeg', NULL, 'fd', 3.00, 1, 8, NULL, 'شارع تعز، إب، اليَمَن', 'شارع تعز، إب، اليَمَن', 13.97051460, 44.18181593, 0, 0, 3, 0, 'active', 'ios', NULL, NULL, 'v4lUAxI5K05xFF1AzP427nO4xjLQyGUeAJc73Y3aweGB8i4HmG1EH2O3y1Bx', '2018-09-24 20:02:11', '2018-09-28 19:23:43', NULL),
(5, 'Test Restaurant-1', 'atha.android@gmail.com', '$2y$10$6.u3rUGFxyDsqll8B7Jb9eXt.PVSZ2Lnr6IumNyGwavsZba5yFE0.', '1710444457', 'https://saffari.app/storage/shops/b4QsTYjQt7TwEyZOSjZC5r0J0RsoSP85VQIygdCL.jpeg', NULL, 'Test', 5.00, 1, 10, NULL, 'Dhanmondi Lake Road, Dhaka, Bangladesh', 'Dhanmondi Lake Road, Dhaka, Bangladesh', 23.74493560, 90.37702200, 0, 0, 5, 0, 'active', 'ios', NULL, NULL, NULL, '2018-09-25 08:39:27', '2018-09-25 10:31:02', NULL),
(6, 'Shamoli Cafe', 'admin@saffari.app', '$2y$10$/J9XHCVcKaBgF9SuIJIomuEkhmxCZIII51FDCNdHEzuIfmSovLKmu', '01674831500', 'https://saffari.app/storage/shops/i1DoAikJZcR5SbkACy7ZMcqmdt9rXjW4NYycW0oe.jpeg', NULL, 'test', 200.00, 10, 30, NULL, 'TNPSC Road, Park Town, V.O.C. Nagar, Chennai, Tamil Nadu 600003, India', 'TNPSC Road, Park Town, V.O.C. Nagar, Chennai, Tamil Nadu 600003, India', 13.08516328, 80.28203487, 0, 0, 0, 0, 'onboarding', 'ios', NULL, NULL, 'n5rOA2BeobBKFOtaCgfqPQNGNCsDNfPuOYumMtv5OTlAsqURp5A7mwqjj2L4', '2018-09-25 11:47:34', '2018-09-25 11:47:34', NULL),
(7, 'Test Restaurant-2', 'atha.java@gmail.com', '$2y$10$RgG4Pf7aLITPaN.fCgHG6ediQqo9pfGPTPRxTFH/MYkrQa5szNVn.', '1710444457', 'https://saffari.app/storage/shops/KH40NXkXHZkiZ76ij6bXZcMlijME1zTyz8bNLkaC.jpeg', NULL, 'Test', 10.00, 1, 10, NULL, 'Uttara Club Limited, Dhaka, Bangladesh', 'Uttara Club Limited, Dhaka, Bangladesh', 23.85802900, 90.40020500, 0, 0, 5, 0, 'active', 'ios', NULL, NULL, NULL, '2018-09-25 12:01:16', '2018-09-25 14:22:19', NULL),
(8, 'Krunal_Test', 'krunaldabhi@gmail.com', '$2y$10$dTymUpP/rwQojwVLOTaf9eV7UKI2IYciKk9qFWvkkGPMwMksrkFB.', '7622023454', 'https://saffari.app/storage/shops/wbn2dQiKk3IQNi48dDTWpybd2WY3K5V99x9Lpgj8.png', NULL, 'asdfasdfasdfasdf', 1.00, 1, 1, NULL, 'Jodhpur, Ahmedabad, Gujarat, India', 'Jodhpur, Ahmedabad, Gujarat, India', 23.01928080, 72.51897420, 0, 0, 0, 0, 'onboarding', 'ios', NULL, NULL, NULL, '2018-09-25 12:35:30', '2018-09-25 12:35:30', NULL),
(9, 'مطعم جلاكسي', 'galaxy@gmail.com', '$2y$10$PDob.1y6.IGWwfm4Q7wkq.NjvBMnHndIHYHd4BN8TOXAiezmoFxN2', '+967777408526', 'https://saffari.app/storage/shops/LCZKs14eHJ2AA17eeWW4TKOO0IwyLh08CqVDb8qv.jpeg', NULL, 'سلسله مطاعم جلاكسي', 10.00, 1, 10, NULL, 'Ibb, إب، Yemen', 'Ibb, إب، Yemen', 13.97209290, 44.16253380, 0, 0, 0, 0, 'active', 'ios', NULL, NULL, '6OZZzaPRKnEiXCfrsxtHWHQDf7V0mLm7KHc9F5k6VM1HNOVDbG5qHXamNYpM', '2018-09-29 13:16:26', '2018-09-29 13:16:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_banners`
--

CREATE TABLE `shop_banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_password_resets`
--

CREATE TABLE `shop_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_timings`
--

CREATE TABLE `shop_timings` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` enum('ALL','SUN','MON','TUE','WED','THU','FRI','SAT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_timings`
--

INSERT INTO `shop_timings` (`id`, `shop_id`, `start_time`, `end_time`, `day`, `created_at`, `updated_at`) VALUES
(1, 1, '08:00', '20:00', 'ALL', NULL, NULL),
(2, 2, '08:00', '20:00', 'ALL', NULL, NULL),
(17, 6, '00:00', '00:00', 'ALL', NULL, NULL),
(19, 8, '10:00', '23:00', 'ALL', NULL, NULL),
(20, 7, '00:00', '23:55', 'ALL', NULL, NULL),
(21, 5, '00:00', '23:59', 'ALL', NULL, NULL),
(23, 4, '01:00', '23:58', 'ALL', NULL, NULL),
(24, 9, '00:00', '23:59', 'ALL', NULL, NULL),
(25, 3, '01:00', '23:48', 'ALL', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `surge_pricings`
--

CREATE TABLE `surge_pricings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporters`
--

CREATE TABLE `transporters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `longitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '5',
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('assessing','banned','online','offline','riding','unsettled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessing',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transporters`
--

INSERT INTO `transporters` (`id`, `name`, `email`, `phone`, `password`, `avatar`, `address`, `latitude`, `longitude`, `otp`, `rating`, `device_token`, `device_id`, `device_type`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Demo User', 'demo@foodie.com-5ba93c179c628', '+919898765654-5ba93c179c5d6', '$2y$10$K/Pfu2m/u/qq9Vi6WU2IdO8.l.Pbt8SGzHvwC4YbIdED4x50G7vwK', NULL, NULL, 0.00000000, 0.00000000, '0', 5, NULL, NULL, NULL, 'assessing', NULL, NULL, '2018-09-24 19:33:43', '2018-09-24 19:33:43'),
(2, 'odai driver', 'odaidriver@gmail.com', '+967733474886', '$2y$10$v4l1Qk9G/ywF3KhhCfduA.vRf1k0eRJj7BPNDJBThcP.wy8tdi/hO', 'https://saffari.app/storage/transporter/profile/VYLSnVSxLnty5xkydZwK1Pkhd4hjyP3dXXRC8Pev.jpeg', 'إب، Ibb, Yemen', 13.97076899, 44.18157419, '0', 5, 'dkiEYWD3GRQ:APA91bGqxx37r4C1ZxVj1vNJLB3KtSzLOK_TyFVHl3z5B2DPpRgwiHdkiq13Go3ZwxzwzpaPxk2FfYbXnIOZW6wOsin48e57w2vcIdb1VgS0TE9LIq2OnUtBV0MF1Y10vJDhv1OtveLq', '36aae32431c83789', 'android', 'online', NULL, '2018-09-24 19:41:40', '2018-10-07 13:45:50', NULL),
(3, 'Tonu', 'tonujewel@gmail.com', '+8801976653445', '$2y$10$zx.XrmJA6.l2B/NBK6lKjuqjvDATOcdgaAoxdZY9/vZKL5MWA.9BC', 'https://saffari.app/storage/transporter/profile/Wp9TPmPEIANHGOB6Ml17LG0iZ8qIrAaa6PMhQBUP.jpeg', 'House-333 Road-5  Avenue 1, Mirpur DOHS', 23.80977100, 90.37714000, '0', 5, 'fa0HshHyf4g:APA91bG50C26QNQfZ0Ir93bnqFUxzjDh0EtgccB5rQWC8BD-701DQ8hpOYfpNRhePz5pZi27hcrcZDN6ZnohVDiVuvsYbHS9VjGU5kfkYV96HOuZK5Oay_33MK4JnC33tc67-mFOn0cx', '78022681aef3ff90', 'android', 'online', NULL, '2018-09-25 07:56:39', '2018-10-07 16:23:55', NULL),
(4, 'test', 'admin@saffari.app-5baa22a346ca4', '120701674831500-5baa22a346c3e', '$2y$10$SOCSqiThUN/gYll2a/kviewB2L2k/OmXZYF/HM8jq88.nL0pPM54m', 'red-dress-scalable-vectorial-image-representing-a-red-dress-isolated-on-white-eps-vectors_csp8347673.jpg', 'TNPSC Road, Park Town, V.O.C. Nagar, Chennai, Tamil Nadu 600003, India', 13.08516328, 80.28203487, '0', 5, NULL, NULL, NULL, 'assessing', NULL, '2018-09-25 11:49:53', '2018-09-25 11:57:23', '2018-09-25 11:57:23'),
(5, 'test', 'mozzammeluiu@gmail.com-5baa22a072fc1', '+88001674831500-5baa22a072f78', '$2y$10$7EjV0sWaAyIHW3R0sixhbuPJYoRidOgRWUStwPPyFnFv2VlD79trG', 'red-dress-scalable-vectorial-image-representing-a-red-dress-isolated-on-white-eps-vectors_csp8347673.jpg', 'TNPSC Road, Park Town, V.O.C. Nagar, Chennai, Tamil Nadu 600003, India', 13.08516328, 80.28203487, '0', 5, NULL, NULL, NULL, 'assessing', NULL, '2018-09-25 11:56:38', '2018-09-25 11:57:20', '2018-09-25 11:57:20'),
(6, 'test', 'ml@gmail.com', '+8801674831500', '$2y$10$gCTuwPb2DPG7D3A3P0zlH.OaUucIq/NDI2XHZAmXJg/7dtstYBT2K', 'red-dress-scalable-vectorial-image-representing-a-red-dress-isolated-on-white-eps-vectors_csp8347673.jpg', 'TNPSC Road, Park Town, V.O.C. Nagar, Chennai, Tamil Nadu 600003, India', 13.08516328, 80.28203487, '0', 5, NULL, NULL, NULL, 'assessing', NULL, '2018-09-25 11:58:30', '2018-09-25 11:58:30', NULL),
(7, 'shafiu alam', 'admin@saffari.app', '+8801717653445', '$2y$10$Pe2n5xC93Qftk2Oc1nv5l.uyH7bBwNBLeq5izMmteWnQZP/2o6IdW', NULL, 'Mirpur DOHS, ঢাকা, বাংলাদেশ', 23.83559833, 90.36620000, '0', 5, '', '', 'android', 'offline', NULL, '2018-09-25 11:59:37', '2018-09-26 19:38:01', NULL),
(8, 'محمد دماج', 'm20202020@gmail.com', '+967772278531', '$2y$10$q2czGIAiGnRlHO8I035Wce2RPWyA4ep0PKN819cViG3xD9Xbn6EWW', 'user1.png', 'شارع العدين، إب، اليَمَن', 13.97075499, 44.18159622, '0', 5, 'c9roT7fw5oY:APA91bFIS30cb_lTC2lpxLO98uqHOFkCYZ0W07WDsiX93F_ByZsKdee2VVvpq05_DK5MVuckhdS-sKKx66UWnyfiP0J-t3wKW8cM-UXDGz3g7f6c9ILQL4ySVZpDed3b50ObNNZgLFsY', '36aae32431c83789', 'android', 'online', NULL, '2018-09-27 18:56:49', '2018-10-01 19:33:56', NULL),
(9, 'Emad', 'emad@gmail.com', '+967933333343', '$2y$10$Cp4NaiJnfz/JKBjEniA9puG0qTb00Pf6OBXhNjqpvZ95imBTfdb5W', 'Royal Broaster.png', 'Bole Road, Addis Ababa, Ethiopia', 8.99023547, 38.78381705, '0', 5, 'dVT4tYPahZA:APA91bFYlE-psI-ouazTLNKqvadf3wKeY_bhbTuDrKAnTT--icyx5u0ICXIVMP2vZZU1G-1XJdaoIb9YcNX_r98PxRcalfFHWNz6IuIO1zKGcrlkZ0k3D6RwmEWmTLwZU05FYstjKNBQ', '9b5b7156281eb9e1', 'android', 'online', NULL, '2018-09-30 17:03:59', '2018-09-30 17:19:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transporter_documents`
--

CREATE TABLE `transporter_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `document_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_locations`
--

CREATE TABLE `transporter_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_password_resets`
--

CREATE TABLE `transporter_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transporter_shifts`
--

CREATE TABLE `transporter_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `transporter_vehicle_id` int(11) NOT NULL,
  `total_order` int(11) NOT NULL DEFAULT '0',
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transporter_shifts`
--

INSERT INTO `transporter_shifts` (`id`, `transporter_id`, `transporter_vehicle_id`, `total_order`, `start_time`, `end_time`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 28, '2018-09-25 10:13:54', '2018-09-29 14:56:25', '2018-09-29 15:01:50', '2018-09-25 10:13:54', '2018-09-29 15:01:50'),
(2, 2, 2, 0, '2018-09-25 13:46:43', NULL, '2018-09-25 19:17:18', '2018-09-25 13:46:43', '2018-09-25 19:17:18'),
(3, 7, 3, 0, '2018-09-25 14:45:51', NULL, '2018-09-26 04:01:55', '2018-09-25 14:45:51', '2018-09-26 04:01:55'),
(4, 2, 2, 0, '2018-09-25 19:18:21', NULL, '2018-09-26 19:15:19', '2018-09-25 19:18:21', '2018-09-26 19:15:19'),
(5, 7, 4, 0, '2018-09-26 04:02:05', NULL, NULL, '2018-09-26 04:02:05', '2018-09-26 04:02:05'),
(6, 2, 5, 0, '2018-09-26 19:15:52', NULL, '2018-09-26 19:16:14', '2018-09-26 19:15:52', '2018-09-26 19:16:14'),
(7, 2, 2, 0, '2018-09-26 19:16:22', NULL, '2018-09-26 19:17:41', '2018-09-26 19:16:22', '2018-09-26 19:17:41'),
(8, 2, 5, 0, '2018-09-26 19:17:55', NULL, '2018-09-26 19:21:28', '2018-09-26 19:17:55', '2018-09-26 19:21:28'),
(9, 2, 2, 0, '2018-09-26 19:21:35', NULL, '2018-09-27 13:39:06', '2018-09-26 19:21:35', '2018-09-27 13:39:06'),
(10, 2, 2, 0, '2018-09-27 13:39:13', NULL, '2018-09-27 15:40:48', '2018-09-27 13:39:13', '2018-09-27 15:40:48'),
(11, 2, 2, 0, '2018-09-27 15:41:19', NULL, '2018-09-27 17:09:57', '2018-09-27 15:41:19', '2018-09-27 17:09:57'),
(12, 2, 2, 0, '2018-09-27 17:10:05', NULL, '2018-09-27 18:49:17', '2018-09-27 17:10:05', '2018-09-27 18:49:17'),
(13, 2, 2, 0, '2018-09-27 18:49:24', NULL, '2018-09-27 18:50:28', '2018-09-27 18:49:24', '2018-09-27 18:50:28'),
(14, 2, 5, 0, '2018-09-27 18:50:39', NULL, '2018-09-27 18:53:41', '2018-09-27 18:50:39', '2018-09-27 18:53:41'),
(15, 2, 2, 0, '2018-09-27 18:53:47', NULL, '2018-09-27 18:54:45', '2018-09-27 18:53:47', '2018-09-27 18:54:45'),
(16, 2, 5, 0, '2018-09-27 18:54:58', NULL, '2018-09-28 17:14:34', '2018-09-27 18:54:58', '2018-09-28 17:14:34'),
(17, 8, 6, 0, '2018-09-27 18:57:48', NULL, NULL, '2018-09-27 18:57:48', '2018-09-27 18:57:48'),
(18, 2, 2, 0, '2018-09-28 17:14:42', NULL, '2018-09-28 17:22:06', '2018-09-28 17:14:42', '2018-09-28 17:22:06'),
(19, 2, 5, 0, '2018-09-28 17:22:12', NULL, '2018-09-28 19:25:57', '2018-09-28 17:22:12', '2018-09-28 19:25:57'),
(20, 2, 2, 0, '2018-09-28 19:26:06', NULL, '2018-09-28 19:28:03', '2018-09-28 19:26:06', '2018-09-28 19:28:03'),
(21, 2, 7, 0, '2018-09-28 19:28:17', NULL, '2018-09-29 14:08:58', '2018-09-28 19:28:17', '2018-09-29 14:08:58'),
(22, 2, 7, 0, '2018-09-29 14:09:05', NULL, '2018-09-29 14:12:03', '2018-09-29 14:09:05', '2018-09-29 14:12:03'),
(23, 2, 7, 0, '2018-09-29 14:12:10', NULL, '2018-09-29 14:19:06', '2018-09-29 14:12:10', '2018-09-29 14:19:06'),
(24, 2, 2, 0, '2018-09-29 14:19:14', NULL, '2018-09-29 14:22:42', '2018-09-29 14:19:14', '2018-09-29 14:22:42'),
(25, 2, 2, 0, '2018-09-29 14:22:48', NULL, '2018-09-29 14:24:35', '2018-09-29 14:22:48', '2018-09-29 14:24:35'),
(26, 2, 2, 0, '2018-09-29 14:24:59', NULL, '2018-09-29 14:38:58', '2018-09-29 14:24:59', '2018-09-29 14:38:58'),
(27, 2, 2, 0, '2018-09-29 14:39:04', NULL, '2018-09-29 14:41:34', '2018-09-29 14:39:04', '2018-09-29 14:41:34'),
(28, 2, 8, 11, '2018-09-29 14:41:59', '2018-10-01 22:07:01', '2018-10-01 22:16:31', '2018-09-29 14:41:59', '2018-10-01 22:16:31'),
(29, 3, 1, 1, '2018-09-29 15:05:26', '2018-09-30 06:23:42', '2018-10-01 10:33:10', '2018-09-29 15:05:26', '2018-10-01 10:33:10'),
(30, 9, 9, 2, '2018-09-30 17:07:29', NULL, NULL, '2018-09-30 17:07:29', '2018-09-30 17:19:52'),
(31, 3, 1, 0, '2018-10-01 10:57:18', NULL, NULL, '2018-10-01 10:57:18', '2018-10-01 10:57:18'),
(32, 2, 2, 3, '2018-10-01 22:16:56', NULL, NULL, '2018-10-01 22:16:56', '2018-10-07 13:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `transporter_shift_timings`
--

CREATE TABLE `transporter_shift_timings` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_shift_id` int(11) NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transporter_shift_timings`
--

INSERT INTO `transporter_shift_timings` (`id`, `transporter_shift_id`, `start_time`, `end_time`, `order_count`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2018-09-25 10:22:36', '2018-09-25 14:18:27', 0, '2018-09-25 10:22:36', '2018-09-25 14:18:27', '2018-09-25 14:18:27'),
(2, 1, '2018-09-25 14:18:32', '2018-09-25 14:18:38', 0, '2018-09-25 14:18:32', '2018-09-25 14:18:39', '2018-09-25 14:18:39'),
(3, 1, '2018-09-25 14:44:59', '2018-09-26 19:48:57', 0, '2018-09-25 14:44:59', '2018-09-26 19:48:57', '2018-09-26 19:48:57'),
(4, 3, '2018-09-26 03:56:39', '2018-09-26 03:56:43', 0, '2018-09-26 03:56:39', '2018-09-26 03:56:43', '2018-09-26 03:56:43'),
(5, 3, '2018-09-26 03:57:09', '2018-09-26 03:57:13', 0, '2018-09-26 03:57:09', '2018-09-26 03:57:13', '2018-09-26 03:57:13'),
(6, 4, '2018-09-26 18:48:36', '2018-09-26 19:14:08', 0, '2018-09-26 18:48:36', '2018-09-26 19:14:08', '2018-09-26 19:14:08'),
(7, 4, '2018-09-26 19:14:21', '2018-09-26 19:14:31', 0, '2018-09-26 19:14:21', '2018-09-26 19:14:31', '2018-09-26 19:14:31'),
(8, 4, '2018-09-26 19:14:34', '2018-09-26 19:14:42', 0, '2018-09-26 19:14:34', '2018-09-26 19:14:42', '2018-09-26 19:14:42'),
(9, 7, '2018-09-26 19:16:28', '2018-09-26 19:17:11', 0, '2018-09-26 19:16:28', '2018-09-26 19:17:11', '2018-09-26 19:17:11'),
(10, 5, '2018-09-26 19:35:27', '2018-09-26 19:35:32', 0, '2018-09-26 19:35:27', '2018-09-26 19:35:32', '2018-09-26 19:35:32'),
(11, 5, '2018-09-26 19:35:33', '2018-09-26 19:35:34', 0, '2018-09-26 19:35:33', '2018-09-26 19:35:35', '2018-09-26 19:35:35'),
(12, 5, '2018-09-26 19:37:52', NULL, 0, '2018-09-26 19:37:52', '2018-09-26 19:37:52', NULL),
(13, 1, '2018-09-26 20:34:39', '2018-09-26 20:34:43', 13, '2018-09-26 20:34:39', '2018-09-26 20:34:43', '2018-09-26 20:34:43'),
(14, 1, '2018-09-27 05:20:04', '2018-09-27 10:38:19', 9, '2018-09-27 05:20:04', '2018-09-27 10:38:19', '2018-09-27 10:38:19'),
(15, 1, '2018-09-27 10:50:28', '2018-09-27 14:34:18', 4, '2018-09-27 10:50:28', '2018-09-27 14:34:18', '2018-09-27 14:34:18'),
(16, 10, '2018-09-27 13:39:24', '2018-09-27 15:38:08', 0, '2018-09-27 13:39:24', '2018-09-27 15:38:08', '2018-09-27 15:38:08'),
(17, 1, '2018-09-27 14:34:43', '2018-09-27 14:34:55', 0, '2018-09-27 14:34:43', '2018-09-27 14:34:55', '2018-09-27 14:34:55'),
(18, 13, '2018-09-27 18:49:53', '2018-09-27 18:50:04', 0, '2018-09-27 18:49:53', '2018-09-27 18:50:04', '2018-09-27 18:50:04'),
(19, 22, '2018-09-29 14:09:56', '2018-09-29 14:10:09', 0, '2018-09-29 14:09:56', '2018-09-29 14:10:09', '2018-09-29 14:10:09'),
(20, 25, '2018-09-29 14:23:29', '2018-09-29 14:23:31', 0, '2018-09-29 14:23:29', '2018-09-29 14:23:31', '2018-09-29 14:23:31'),
(21, 30, '2018-09-30 17:08:42', '2018-09-30 17:10:44', 0, '2018-09-30 17:08:42', '2018-09-30 17:10:44', '2018-09-30 17:10:44'),
(22, 31, '2018-10-01 10:58:24', '2018-10-01 10:58:31', 0, '2018-10-01 10:58:24', '2018-10-01 10:58:31', '2018-10-01 10:58:31'),
(23, 31, '2018-10-01 10:58:33', '2018-10-01 11:24:03', 0, '2018-10-01 10:58:33', '2018-10-01 11:24:03', '2018-10-01 11:24:03'),
(24, 31, '2018-10-01 11:24:23', '2018-10-07 16:23:50', 0, '2018-10-01 11:24:23', '2018-10-07 16:23:50', '2018-10-07 16:23:50'),
(25, 28, '2018-10-01 19:23:49', '2018-10-01 19:25:55', 10, '2018-10-01 19:23:49', '2018-10-01 19:25:55', '2018-10-01 19:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `transporter_vehicles`
--

CREATE TABLE `transporter_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `vehicle_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transporter_vehicles`
--

INSERT INTO `transporter_vehicles` (`id`, `transporter_id`, `vehicle_no`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'HSISVSJ', '2018-09-25 10:13:54', '2018-09-25 10:13:54', NULL),
(2, 2, '654', '2018-09-25 13:46:43', '2018-09-25 13:46:43', NULL),
(3, 7, '1111', '2018-09-25 14:45:51', '2018-09-25 14:45:51', NULL),
(4, 7, '111', '2018-09-26 04:02:05', '2018-09-26 04:02:05', NULL),
(5, 2, '432', '2018-09-26 19:15:52', '2018-09-26 19:15:52', NULL),
(6, 8, '7543255', '2018-09-27 18:57:48', '2018-09-27 18:57:48', NULL),
(7, 2, '7654', '2018-09-28 19:28:17', '2018-09-28 19:28:17', NULL),
(8, 2, '4322', '2018-09-29 14:41:59', '2018-09-29 14:41:59', NULL),
(9, 9, '123', '2018-09-30 17:07:29', '2018-09-30 17:07:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_cust_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `braintree_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `avatar`, `password`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `stripe_cust_id`, `wallet_balance`, `otp`, `braintree_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Demo User', 'demo@foodie.com-5ba93c220c896', '+915454545454-5ba93c220c849', NULL, '$2y$10$uHhEOuGCIHwYV8AcGqyO0.gRL4Re4yOWWGohs/7eREq8zak3hRZw6', NULL, NULL, 'ios', 'manual', '-5ba93c220c8de', NULL, 0.00, '0', NULL, NULL, NULL, '2018-09-24 19:33:54', '2018-09-24 19:33:54'),
(2, 'Marseel Yaseen', 'marseel1111@gmail.com', '+966737911101', NULL, '$2y$10$Da4hyJhwSEbR0LIVPZdfMu7VMdh8ov1kagQXqMRYc9a0gLVlqYTDm', NULL, NULL, 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-24 17:44:03', '2018-09-24 17:44:03', NULL),
(3, 'odai yasser naji dammag', 'odai.dammag@gmail.com', '+967733474886', NULL, '$2y$10$r95KX7LZGCqNS1vNiyViuuwyzxMbiQY/qmzGl5VgZTpDo70ymr4X6', 'fh3MpwiwQuQ:APA91bHxuPtPkp16yNbUMa5a2rTnujMg2cjer9n61b0jeMjbfsfH-EBy2DIdsUwrwuuF_BPTJrTFWdFW7xXzdy944HZmJMvEIR5anJyG4wZ5WQcqtUkO5tknmFtknAKFDSO2SLmct-XN', '36aae32431c83789', 'android', 'manual', '', NULL, 1.00, '0', NULL, 'tNJ3LqkKrYPTqB4AR4DvBvCa2gQT8xLVfmwYsz185RH52ztUFo8YzC6jbjYc', '2018-09-24 18:16:43', '2018-09-27 19:32:45', NULL),
(4, 'عدي', 'odai.dammag1@gmail.com', '+967733335555', NULL, '$2y$10$qnqGCdFxNSnxO0pfdZuKxuAAKbistxZX5dDiXqRWI6OMLHdNbqqda', NULL, NULL, 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-24 21:29:08', '2018-09-24 21:29:08', NULL),
(5, 'Jewel Rana', 'tonujewel@gmail.com', '+8801744960015', NULL, '$2y$10$82dNz.edRtiLkC5HrNrXKeMdej7CN89hWZW2LF1laedKFSC.aZxpK', 'd05tJ2Y58QI:APA91bEM2PXA8tRarJP6b4zdXpYuzFL5i3G-o_gUa82w9ml-p4DiQwU5lIGJ-gOIZwfEWlzK8EAf59hR1EQyJ_sB3o-0M9Ic7E_CjA8XrzmpsjUBh2gg4HNRLFF2Yg4Mb6XTsOEwPB8Z', '78022681aef3ff90', 'android', 'manual', '', NULL, 1.00, '0', NULL, NULL, '2018-09-25 10:08:59', '2018-09-27 10:51:43', NULL),
(6, 'Biplob', 'javaorjava@gmail.com', '+88001717653445', 'https://saffari.app/storage/user/profile/jbMQ4fROym5R9YgJpWgTObNli80IgFASAmuGaSgA.png', '$2y$10$adLKlcA7/W8gcUFCSuZkretLvOB17zIM4aFMhH/QmjpfIOkqKbsnm', 'f-gFEJ1QpyE:APA91bHKCytFxPO_nbi_fHTF_Pmgr7Y-eOZpvkObP-EVaAWeUpdQZyQ7ksC-rwwTUc_rL2Kl9JjfjdD547-ORfgO2asOrEIjv-lUsskXo5xD9fLiw77nlaYKFXDmKgHnn-rxM-mNEvlw', '5ff01ed1f178b8ba', 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-25 12:09:59', '2018-10-02 19:18:46', NULL),
(7, 'Shohel Rana', 'shohel925@gmail.com', '+8801615960015', NULL, '$2y$10$tB3adCIfwEfXHo6Tu2aKrOrDtIMNjVXOcuOhnY24zS2UG7B6LEKhq', 'deRMOYqIjgQ:APA91bHO_7Gir19QBuN7vHSbqgK1y7cKloz67QPCr7kj-Pdvs_nDRmMpND7BY1T2jLdDzjQe3ebfyPVILvgdzZogJU5rlguJvU6lVpvtzy3_BZ35UQQX5r1IgXkvqvCaS_mRKqRQzPge', 'fbfa4776c8cab182', 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-25 12:37:45', '2018-09-25 12:37:46', NULL),
(8, 'Mamun Hoque', 'mamun3137@gmail.com', '+8801726703137', NULL, '$2y$10$TMVvQKY36V6ackMFhbYl7..eEjYFJK2jq8FqC0rkFRkuEN2jsvVEi', NULL, NULL, 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-25 12:47:25', '2018-09-25 12:47:25', NULL),
(9, 'Krunal', 'krunaldabhi@gmail.com', '+917622023454', NULL, '$2y$10$q0T2gVkcHSnf1HkdWICequFHNB8YAnLSEoZ1.wOh80D2.9sACrXYO', NULL, NULL, 'android', 'manual', '', NULL, 0.00, '286679', NULL, NULL, '2018-09-25 12:49:42', '2018-09-25 13:47:29', NULL),
(10, 'Nilesh', 'asterismtechamd@gmail.com', '+918141230710', NULL, '$2y$10$SSkXesOegRLale/bqhtg9OyqJIVDZj42ThzC7wOm86NiBeyG8Rcl6', NULL, NULL, 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-25 13:48:26', '2018-09-25 13:48:26', NULL),
(11, 'محمد احمد', 'm@gmail.com', '+967772278531', NULL, '$2y$10$FulL5xfXv4Ti2YLMADCyYOY/AHIOHqtkGjwRKck1sSpCS3zGWY1fS', 'deGf_bRZjMk:APA91bH614rSVFiW9rUJcywcYFVXJF9nEp-FmFNM0iZSAtUmpd-5UH7WEMT8vxsr5lBUvjzJ9oT-XCgHku61rgX7I829H7UhGS9_N2UbAde_DCteWlR-bcxNrY-1vELc-2o2pZBgCBDy', '9a4e7ec58cef097c', 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-29 21:35:12', '2018-09-29 21:35:13', NULL),
(12, 'hani', 'hanidammag36@gmail.com', '+1775005499', NULL, '$2y$10$5oVaRBs/Lfw7HmAT/s/SD.FplbbIzQoAGq7bSaDPc3UpLtKO8wwCq', 'enqtKHF9338:APA91bGz6KIxw75nS_ex63O6qfqpMTKOOUzW9Llw3zZEjdeFTFAhZvWwcV8zwUoItq8_ZatsMH5oA71rZ81Z38r0fERqC6rB2P1qthgc-niXLMyDHva3ZTb9QmhhZjoDhg30k3qXE6aA', '69f9b59b1dd4e701', 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-30 11:26:25', '2018-09-30 11:26:26', NULL),
(13, 'su', 'dsohailh@gmail.com', '+967775005499', NULL, '$2y$10$WNwbqXphS21YRpwcbeuOo.Wl4trIrtL9xT6dyYDGXp0CwIgq094sW', 'enqtKHF9338:APA91bGz6KIxw75nS_ex63O6qfqpMTKOOUzW9Llw3zZEjdeFTFAhZvWwcV8zwUoItq8_ZatsMH5oA71rZ81Z38r0fERqC6rB2P1qthgc-niXLMyDHva3ZTb9QmhhZjoDhg30k3qXE6aA', '69f9b59b1dd4e701', 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-30 16:23:50', '2018-09-30 16:23:50', NULL),
(14, 'Amr', 'amr.altech@gmail.com', '+9670933333311', NULL, '$2y$10$yZC/gtPpxcTViqRiroQoW.3aH.ZwXDOlfTBv/XRErVv5VwMFps0oe', 'eQFvKsBOplc:APA91bE9a4ZYuNep6PXQKNwfri_nPVRgCo2YqDxFa7an6-gGbBGB7hibSxwQ73b8wgigjzakf-EmwK6m_CT7raCXy_n6OVqGv0gxgRc9dZTE_1EIZMTAlwu0rili0sfR_eSF_HSLVMJv', '5515edccbebeff48', 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-30 16:25:03', '2018-09-30 16:27:15', NULL),
(15, 'emad', 'emadgnid@gmail.com', '+967770119434', NULL, '$2y$10$JLzF4UyjU6kf0sBXzN0rvu7CoNcWApdsnd/wg7oHMLhQKG8Og11p6', NULL, NULL, 'android', 'manual', '', NULL, 0.00, '0', NULL, NULL, '2018-09-30 16:32:23', '2018-09-30 16:32:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `building`, `street`, `city`, `state`, `country`, `pincode`, `landmark`, `map_address`, `latitude`, `longitude`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '76', NULL, 'Ibb', 'Ibb Governorate', 'Yemen', NULL, '776', 'Old N1, Ibb, Yemen', 13.98025500, 44.18526050, 'الصفحة الرئيسية', '2018-09-24 18:21:21', '2018-10-01 19:29:28', NULL),
(2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ibb, اليَمَن', 13.97209290, 44.16253380, 'work', '2018-09-24 18:41:03', '2018-09-24 18:41:03', NULL),
(3, 3, '4', NULL, NULL, NULL, NULL, NULL, NULL, 'شارع تعز، إب، اليَمَن', 13.96412790, 44.18081170, 'other', '2018-09-24 19:45:54', '2018-09-24 19:45:54', NULL),
(4, 5, '333', NULL, 'Dhaka', 'Dhaka Division', 'Bangladesh', NULL, 'yvyvyv', 'Main Road, Dhaka, Bangladesh', 23.83570970, 90.36602670, 'other', '2018-09-25 10:21:09', '2018-09-25 10:21:09', NULL),
(5, 6, '333', NULL, 'Dhaka', 'Dhaka Division', 'Bangladesh', NULL, 'home', 'Main Road, Dhaka, Bangladesh', 23.83570970, 90.36602670, 'home', '2018-09-25 12:11:08', '2018-09-25 12:11:08', NULL),
(6, 3, '٧', NULL, 'Ibb', 'Ibb Governorate', 'Yemen', NULL, '٨٧', 'Taiz St, Ibb, Yemen', 13.97084640, 44.18237020, 'اخرى', '2018-09-27 19:31:03', '2018-09-27 19:31:03', NULL),
(7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ibb, إب، Yemen', 13.97209290, 44.16253380, 'other', '2018-09-29 14:20:33', '2018-09-29 14:20:33', NULL),
(8, 11, '1', NULL, 'إب', 'محافظة إب', 'اليَمَن', NULL, '1', 'شارع تعز، إب، اليَمَن', 13.97191460, 44.18279310, 'اخرى', '2018-09-29 21:37:53', '2018-09-29 21:37:53', NULL),
(9, 12, 'Boston', NULL, 'አዲስ አበባ', 'አዲስ አበባ', 'Ethiopia', NULL, 'Boston spa', 'Haile Alem Building, Airport Rd, Addis Ababa, Ethiopia', 8.99028170, 38.78486850, 'other', '2018-09-30 14:23:08', '2018-09-30 14:23:08', NULL),
(10, 14, '101', NULL, 'አዲስ አበባ', 'አዲስ አበባ', 'Ethiopia', NULL, '12', 'Haile Alem Building, Airport Rd, Addis Ababa, Ethiopia', 8.99028170, 38.78486850, 'other', '2018-09-30 16:26:33', '2018-09-30 16:26:33', NULL),
(11, 13, 'Boston', NULL, 'አዲስ አበባ', 'አዲስ አበባ', 'إثيوبيا', NULL, 'Boston spa', 'Haile Alem Building, Airport Rd, Addis Ababa, إثيوبيا', 8.99028170, 38.78486850, 'other', '2018-09-30 16:32:44', '2018-09-30 16:32:44', NULL),
(12, 14, '102', NULL, 'አዲስ አበባ', 'አዲስ አበባ', 'Ethiopia', NULL, '20', 'Tahreer St., Sana\'a', 8.99028170, 38.78486850, 'Work place', '2018-09-30 16:50:03', '2018-09-30 16:50:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_carts`
--

CREATE TABLE `user_carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `savedforlater` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_carts`
--

INSERT INTO `user_carts` (`id`, `user_id`, `product_id`, `promocode_id`, `order_id`, `quantity`, `note`, `savedforlater`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, NULL, NULL, 1, NULL, 0, '2018-09-24 18:20:20', '2018-09-24 18:26:40', '2018-09-24 18:26:40'),
(2, 3, 7, NULL, NULL, 1, NULL, 0, '2018-09-24 18:26:44', '2018-09-24 18:40:12', '2018-09-24 18:40:12'),
(3, 3, 7, NULL, NULL, 1, NULL, 0, '2018-09-24 18:40:16', '2018-09-24 18:42:22', '2018-09-24 18:42:22'),
(4, 3, 7, NULL, NULL, 1, NULL, 0, '2018-09-24 18:45:31', '2018-09-24 19:18:15', '2018-09-24 19:18:15'),
(5, 3, 7, NULL, NULL, 1, NULL, 0, '2018-09-24 19:19:15', '2018-09-24 19:23:46', '2018-09-24 19:23:46'),
(6, 3, 7, NULL, 1, 1, NULL, 0, '2018-09-24 19:23:49', '2018-09-24 19:24:05', '2018-09-24 19:24:05'),
(7, 3, 7, NULL, 2, 5, NULL, 0, '2018-09-24 19:45:26', '2018-09-24 19:46:03', '2018-09-24 19:46:03'),
(8, 3, 7, NULL, 3, 3, NULL, 0, '2018-09-24 20:09:54', '2018-09-24 20:10:21', '2018-09-24 20:10:21'),
(9, 5, 8, NULL, 4, 1, NULL, 0, '2018-09-25 10:20:36', '2018-09-25 10:21:21', '2018-09-25 10:21:21'),
(10, 5, 8, NULL, 5, 1, NULL, 0, '2018-09-25 10:24:03', '2018-09-25 10:24:18', '2018-09-25 10:24:18'),
(11, 5, 7, NULL, 6, 1, NULL, 0, '2018-09-25 10:47:03', '2018-09-25 10:47:13', '2018-09-25 10:47:13'),
(12, 6, 8, NULL, 7, 1, NULL, 0, '2018-09-25 12:10:43', '2018-09-25 12:11:17', '2018-09-25 12:11:17'),
(13, 6, 7, NULL, 8, 1, NULL, 0, '2018-09-25 12:19:03', '2018-09-25 12:19:17', '2018-09-25 12:19:17'),
(14, 6, 7, NULL, 9, 1, NULL, 0, '2018-09-25 12:20:39', '2018-09-25 12:20:54', '2018-09-25 12:20:54'),
(15, 5, 8, NULL, 10, 1, NULL, 0, '2018-09-25 12:48:02', '2018-09-25 12:48:09', '2018-09-25 12:48:09'),
(16, 8, 8, NULL, NULL, 1, NULL, 0, '2018-09-25 12:48:58', '2018-09-25 12:48:58', NULL),
(17, 6, 8, NULL, 11, 1, NULL, 0, '2018-09-25 12:51:37', '2018-09-25 13:13:19', '2018-09-25 13:13:19'),
(18, 6, 7, NULL, 12, 1, NULL, 0, '2018-09-25 13:14:30', '2018-09-25 13:14:39', '2018-09-25 13:14:39'),
(19, 5, 8, NULL, 13, 1, NULL, 0, '2018-09-25 13:15:16', '2018-09-25 13:15:26', '2018-09-25 13:15:26'),
(20, 3, 8, NULL, 14, 1, NULL, 0, '2018-09-25 13:25:38', '2018-09-25 13:25:51', '2018-09-25 13:25:51'),
(21, 6, 8, NULL, 15, 1, NULL, 0, '2018-09-25 13:28:34', '2018-09-25 13:28:47', '2018-09-25 13:28:47'),
(22, 3, 7, NULL, 16, 1, NULL, 0, '2018-09-25 13:36:14', '2018-09-25 13:36:24', '2018-09-25 13:36:24'),
(23, 6, 7, NULL, 17, 1, NULL, 0, '2018-09-25 13:58:35', '2018-09-25 13:58:44', '2018-09-25 13:58:44'),
(24, 3, 8, NULL, NULL, 1, NULL, 0, '2018-09-25 14:02:49', '2018-09-25 14:03:08', '2018-09-25 14:03:08'),
(25, 3, 8, NULL, 18, 1, NULL, 0, '2018-09-25 14:03:34', '2018-09-25 14:03:44', '2018-09-25 14:03:44'),
(26, 6, 7, NULL, 19, 1, NULL, 0, '2018-09-25 14:06:50', '2018-09-25 14:06:59', '2018-09-25 14:06:59'),
(27, 6, 8, NULL, 20, 1, NULL, 0, '2018-09-25 14:20:13', '2018-09-25 14:20:22', '2018-09-25 14:20:22'),
(28, 6, 8, NULL, 21, 1, NULL, 0, '2018-09-25 14:23:12', '2018-09-25 14:23:23', '2018-09-25 14:23:23'),
(29, 6, 7, NULL, 22, 1, NULL, 0, '2018-09-25 14:24:26', '2018-09-25 14:24:34', '2018-09-25 14:24:34'),
(30, 6, 8, NULL, 23, 1, NULL, 0, '2018-09-25 14:31:51', '2018-09-25 14:31:58', '2018-09-25 14:31:58'),
(31, 3, 7, NULL, 24, 1, NULL, 0, '2018-09-25 19:11:35', '2018-09-25 19:12:16', '2018-09-25 19:12:16'),
(32, 3, 7, NULL, 25, 3, NULL, 0, '2018-09-25 19:18:47', '2018-09-25 19:20:14', '2018-09-25 19:20:14'),
(33, 3, 7, NULL, 28, 1, NULL, 0, '2018-09-25 19:22:28', '2018-09-26 17:56:53', '2018-09-26 17:56:53'),
(34, 6, 8, NULL, 26, 1, NULL, 0, '2018-09-26 03:53:12', '2018-09-26 03:53:22', '2018-09-26 03:53:22'),
(35, 6, 8, NULL, 27, 1, NULL, 0, '2018-09-26 13:28:13', '2018-09-26 13:28:55', '2018-09-26 13:28:55'),
(36, 3, 7, NULL, 29, 2, NULL, 0, '2018-09-26 18:24:59', '2018-09-26 18:25:11', '2018-09-26 18:25:11'),
(37, 3, 7, NULL, 30, 1, NULL, 0, '2018-09-26 18:57:37', '2018-09-26 18:57:47', '2018-09-26 18:57:47'),
(38, 3, 7, NULL, 31, 1, NULL, 0, '2018-09-26 19:10:48', '2018-09-26 19:11:05', '2018-09-26 19:11:05'),
(39, 6, 8, NULL, 32, 1, NULL, 0, '2018-09-26 19:30:50', '2018-09-26 19:31:01', '2018-09-26 19:31:01'),
(40, 6, 8, NULL, 33, 1, NULL, 0, '2018-09-26 19:49:24', '2018-09-26 19:49:34', '2018-09-26 19:49:34'),
(41, 6, 8, NULL, 34, 1, NULL, 0, '2018-09-26 21:12:18', '2018-09-26 21:12:33', '2018-09-26 21:12:33'),
(42, 6, 8, NULL, 35, 1, NULL, 0, '2018-09-26 21:37:13', '2018-09-26 21:37:28', '2018-09-26 21:37:28'),
(43, 3, 7, NULL, 36, 1, NULL, 0, '2018-09-27 13:33:37', '2018-09-27 13:33:53', '2018-09-27 13:33:53'),
(44, 6, 8, NULL, 37, 1, NULL, 0, '2018-09-27 14:38:51', '2018-09-27 14:38:58', '2018-09-27 14:38:58'),
(45, 3, 7, NULL, 38, 3, NULL, 0, '2018-09-27 15:39:42', '2018-09-27 15:40:00', '2018-09-27 15:40:00'),
(46, 3, 7, NULL, 39, 3, NULL, 0, '2018-09-27 16:13:00', '2018-09-27 16:13:09', '2018-09-27 16:13:09'),
(47, 3, 7, NULL, 40, 1, NULL, 0, '2018-09-27 17:08:14', '2018-09-27 17:08:24', '2018-09-27 17:08:24'),
(48, 3, 7, NULL, 41, 2, NULL, 0, '2018-09-27 17:34:43', '2018-09-27 17:35:06', '2018-09-27 17:35:06'),
(49, 3, 7, NULL, 42, 2, NULL, 0, '2018-09-27 18:47:43', '2018-09-27 18:48:02', '2018-09-27 18:48:02'),
(50, 6, 8, NULL, 43, 3, NULL, 0, '2018-09-27 18:57:16', '2018-09-27 18:58:17', '2018-09-27 18:58:17'),
(51, 6, 8, NULL, 44, 1, NULL, 0, '2018-09-27 20:38:52', '2018-09-27 20:39:04', '2018-09-27 20:39:04'),
(52, 6, 7, NULL, 50, 1, NULL, 0, '2018-09-27 20:42:00', '2018-09-29 14:52:28', '2018-09-29 14:52:28'),
(53, 3, 7, NULL, 45, 1, NULL, 0, '2018-09-28 17:02:49', '2018-09-28 17:02:59', '2018-09-28 17:02:59'),
(54, 3, 7, NULL, 46, 1, NULL, 0, '2018-09-28 19:21:00', '2018-09-28 19:21:24', '2018-09-28 19:21:24'),
(55, 3, 7, NULL, 46, 1, NULL, 0, '2018-09-28 19:21:13', '2018-09-28 19:21:24', '2018-09-28 19:21:24'),
(56, 3, 11, NULL, 47, 1, NULL, 0, '2018-09-29 14:05:30', '2018-09-29 14:07:29', '2018-09-29 14:07:29'),
(57, 3, 10, NULL, 47, 1, NULL, 0, '2018-09-29 14:05:35', '2018-09-29 14:07:29', '2018-09-29 14:07:29'),
(58, 3, 7, NULL, 48, 1, NULL, 0, '2018-09-29 14:20:04', '2018-09-29 14:20:46', '2018-09-29 14:20:46'),
(59, 3, 7, NULL, 48, 1, NULL, 0, '2018-09-29 14:20:04', '2018-09-29 14:20:46', '2018-09-29 14:20:46'),
(60, 3, 11, NULL, 49, 1, NULL, 0, '2018-09-29 14:29:44', '2018-09-29 14:29:57', '2018-09-29 14:29:57'),
(61, 3, 10, NULL, 49, 1, NULL, 0, '2018-09-29 14:29:45', '2018-09-29 14:29:57', '2018-09-29 14:29:57'),
(62, 6, 8, NULL, 51, 1, NULL, 0, '2018-09-29 14:53:11', '2018-09-29 14:53:20', '2018-09-29 14:53:20'),
(63, 3, 7, NULL, 52, 1, NULL, 0, '2018-09-29 14:55:31', '2018-09-29 14:55:43', '2018-09-29 14:55:43'),
(64, 3, 11, NULL, 53, 1, NULL, 0, '2018-09-29 14:56:40', '2018-09-29 14:56:49', '2018-09-29 14:56:49'),
(65, 3, 10, NULL, 53, 1, NULL, 0, '2018-09-29 14:56:43', '2018-09-29 14:56:49', '2018-09-29 14:56:49'),
(66, 6, 8, NULL, 54, 1, NULL, 0, '2018-09-29 15:03:34', '2018-09-29 15:03:56', '2018-09-29 15:03:56'),
(67, 3, 11, NULL, 55, 3, NULL, 0, '2018-09-29 16:57:56', '2018-09-29 16:58:16', '2018-09-29 16:58:16'),
(68, 3, 10, NULL, 56, 1, NULL, 0, '2018-09-29 17:09:54', '2018-09-29 17:10:17', '2018-09-29 17:10:17'),
(69, 3, 7, NULL, 57, 1, NULL, 0, '2018-09-29 17:32:55', '2018-09-29 17:33:03', '2018-09-29 17:33:03'),
(70, 3, 11, NULL, 58, 5, NULL, 0, '2018-09-29 19:15:53', '2018-09-29 19:16:09', '2018-09-29 19:16:09'),
(71, 3, 10, NULL, 59, 3, NULL, 0, '2018-09-29 19:21:21', '2018-09-29 19:21:52', '2018-09-29 19:21:52'),
(72, 3, 11, NULL, 59, 2, NULL, 0, '2018-09-29 19:21:32', '2018-09-29 19:21:52', '2018-09-29 19:21:52'),
(73, 11, 11, NULL, 60, 1, NULL, 0, '2018-09-29 21:36:27', '2018-09-29 21:38:15', '2018-09-29 21:38:15'),
(74, 11, 10, NULL, 60, 2, NULL, 0, '2018-09-29 21:36:31', '2018-09-29 21:38:15', '2018-09-29 21:38:15'),
(75, 11, 7, NULL, 61, 1, NULL, 0, '2018-09-29 21:42:30', '2018-09-29 21:42:38', '2018-09-29 21:42:38'),
(76, 12, 11, NULL, 62, 1, NULL, 0, '2018-09-30 14:19:58', '2018-09-30 14:24:38', '2018-09-30 14:24:38'),
(77, 12, 10, NULL, 62, 1, NULL, 0, '2018-09-30 14:20:01', '2018-09-30 14:24:38', '2018-09-30 14:24:38'),
(78, 13, 11, NULL, 63, 1, NULL, 0, '2018-09-30 16:27:15', '2018-09-30 16:27:34', '2018-09-30 16:27:34'),
(79, 13, 10, NULL, 63, 1, NULL, 0, '2018-09-30 16:27:17', '2018-09-30 16:27:34', '2018-09-30 16:27:34'),
(80, 14, 7, NULL, 65, 2, NULL, 0, '2018-09-30 16:27:51', '2018-09-30 16:29:32', '2018-09-30 16:29:32'),
(81, 13, 7, NULL, 64, 1, NULL, 0, '2018-09-30 16:28:20', '2018-09-30 16:28:41', '2018-09-30 16:28:41'),
(82, 13, 11, NULL, NULL, 1, NULL, 0, '2018-09-30 16:30:35', '2018-09-30 16:30:35', NULL),
(83, 13, 10, NULL, NULL, 1, NULL, 0, '2018-09-30 16:30:36', '2018-09-30 16:30:36', NULL),
(84, 14, 12, NULL, NULL, 1, NULL, 0, '2018-09-30 16:47:33', '2018-09-30 16:55:47', '2018-09-30 16:55:47'),
(85, 14, 7, NULL, 66, 2, NULL, 0, '2018-09-30 16:56:35', '2018-09-30 16:56:48', '2018-09-30 16:56:48'),
(86, 14, 7, NULL, 67, 3, NULL, 0, '2018-09-30 17:08:39', '2018-09-30 17:08:51', '2018-09-30 17:08:51'),
(87, 14, 7, NULL, 68, 4, NULL, 0, '2018-09-30 17:15:56', '2018-09-30 17:16:08', '2018-09-30 17:16:08'),
(88, 3, 7, NULL, 69, 1, NULL, 0, '2018-10-01 19:00:09', '2018-10-01 19:00:35', '2018-10-01 19:00:35'),
(89, 3, 7, NULL, 70, 3, NULL, 0, '2018-10-01 19:20:31', '2018-10-01 19:20:51', '2018-10-01 19:20:51'),
(90, 3, 7, NULL, 71, 2, NULL, 0, '2018-10-01 19:24:24', '2018-10-01 19:24:35', '2018-10-01 19:24:35'),
(91, 3, 7, NULL, 72, 2, NULL, 0, '2018-10-01 19:35:15', '2018-10-01 19:35:21', '2018-10-01 19:35:21'),
(92, 3, 11, NULL, 73, 2, NULL, 0, '2018-10-01 22:07:51', '2018-10-01 22:08:28', '2018-10-01 22:08:28'),
(93, 3, 10, NULL, 73, 4, NULL, 0, '2018-10-01 22:07:53', '2018-10-01 22:08:28', '2018-10-01 22:08:28'),
(94, 3, 11, NULL, 74, 2, NULL, 0, '2018-10-01 22:15:20', '2018-10-01 22:15:30', '2018-10-01 22:15:30'),
(95, 3, 10, NULL, 74, 4, NULL, 0, '2018-10-01 22:15:20', '2018-10-01 22:15:30', '2018-10-01 22:15:30'),
(96, 3, 7, NULL, 75, 2, NULL, 0, '2018-10-02 00:07:17', '2018-10-02 00:07:42', '2018-10-02 00:07:42'),
(97, 6, 8, NULL, 76, 1, NULL, 0, '2018-10-02 16:09:19', '2018-10-02 16:09:43', '2018-10-02 16:09:43'),
(98, 6, 8, NULL, 77, 1, NULL, 0, '2018-10-02 16:10:04', '2018-10-02 16:10:14', '2018-10-02 16:10:14'),
(99, 6, 8, NULL, 78, 1, NULL, 0, '2018-10-02 16:26:03', '2018-10-02 16:26:09', '2018-10-02 16:26:09'),
(100, 6, 8, NULL, 79, 1, NULL, 0, '2018-10-02 16:51:24', '2018-10-02 16:51:33', '2018-10-02 16:51:33'),
(101, 6, 8, NULL, NULL, 1, NULL, 0, '2018-10-02 16:55:25', '2018-10-02 16:55:25', NULL),
(102, 3, 7, NULL, 80, 2, NULL, 0, '2018-10-07 13:42:24', '2018-10-07 13:42:42', '2018-10-07 13:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_passbooks`
--

CREATE TABLE `wallet_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_passbooks`
--

INSERT INTO `wallet_passbooks` (`id`, `user_id`, `amount`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, '1', 'wallet Credited  Using Promocode 6546', 'CREDITED', '2018-09-25 10:44:42', '2018-09-25 10:44:42', NULL),
(2, 3, '1', 'wallet Credited  Using Promocode 6546', 'CREDITED', '2018-09-27 19:32:45', '2018-09-27 19:32:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `north_east_lat` double(15,8) NOT NULL,
  `north_east_lng` double(15,8) NOT NULL,
  `south_west_lat` double(15,8) NOT NULL,
  `south_west_lng` double(15,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_products`
--
ALTER TABLE `addon_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_addons`
--
ALTER TABLE `cart_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_images`
--
ALTER TABLE `category_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisine_shop`
--
ALTER TABLE `cuisine_shop`
  ADD PRIMARY KEY (`shop_id`,`cuisine_id`),
  ADD KEY `cuisine_shop_cuisine_id_foreign` (`cuisine_id`);

--
-- Indexes for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_transporters`
--
ALTER TABLE `enquiry_transporters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_access_token_providers`
--
ALTER TABLE `oauth_access_token_providers`
  ADD PRIMARY KEY (`oauth_access_token_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_disputes`
--
ALTER TABLE `order_disputes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_dispute_comments`
--
ALTER TABLE `order_dispute_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_dispute_helps`
--
ALTER TABLE `order_dispute_helps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_invoices`
--
ALTER TABLE `order_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_ratings`
--
ALTER TABLE `order_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_timings`
--
ALTER TABLE `order_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restuarants`
--
ALTER TABLE `restuarants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restuarants_email_unique` (`email`),
  ADD UNIQUE KEY `restuarants_phone_unique` (`phone`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_email_unique` (`email`);

--
-- Indexes for table `shop_banners`
--
ALTER TABLE `shop_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_password_resets`
--
ALTER TABLE `shop_password_resets`
  ADD KEY `shop_password_resets_email_index` (`email`),
  ADD KEY `shop_password_resets_token_index` (`token`);

--
-- Indexes for table `shop_timings`
--
ALTER TABLE `shop_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surge_pricings`
--
ALTER TABLE `surge_pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporters`
--
ALTER TABLE `transporters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transporters_email_unique` (`email`),
  ADD UNIQUE KEY `transporters_phone_unique` (`phone`);

--
-- Indexes for table `transporter_documents`
--
ALTER TABLE `transporter_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_locations`
--
ALTER TABLE `transporter_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_password_resets`
--
ALTER TABLE `transporter_password_resets`
  ADD KEY `transporter_password_resets_email_index` (`email`),
  ADD KEY `transporter_password_resets_token_index` (`token`);

--
-- Indexes for table `transporter_shifts`
--
ALTER TABLE `transporter_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_shift_timings`
--
ALTER TABLE `transporter_shift_timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporter_vehicles`
--
ALTER TABLE `transporter_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_carts`
--
ALTER TABLE `user_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `addon_products`
--
ALTER TABLE `addon_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart_addons`
--
ALTER TABLE `cart_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `category_images`
--
ALTER TABLE `category_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enquiry_transporters`
--
ALTER TABLE `enquiry_transporters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `order_disputes`
--
ALTER TABLE `order_disputes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `order_dispute_comments`
--
ALTER TABLE `order_dispute_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `order_dispute_helps`
--
ALTER TABLE `order_dispute_helps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_invoices`
--
ALTER TABLE `order_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `order_ratings`
--
ALTER TABLE `order_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `order_timings`
--
ALTER TABLE `order_timings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `restuarants`
--
ALTER TABLE `restuarants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `shop_banners`
--
ALTER TABLE `shop_banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_timings`
--
ALTER TABLE `shop_timings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `surge_pricings`
--
ALTER TABLE `surge_pricings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporters`
--
ALTER TABLE `transporters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `transporter_documents`
--
ALTER TABLE `transporter_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporter_locations`
--
ALTER TABLE `transporter_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transporter_shifts`
--
ALTER TABLE `transporter_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `transporter_shift_timings`
--
ALTER TABLE `transporter_shift_timings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `transporter_vehicles`
--
ALTER TABLE `transporter_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_carts`
--
ALTER TABLE `user_carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cuisine_shop`
--
ALTER TABLE `cuisine_shop`
  ADD CONSTRAINT `cuisine_shop_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuisine_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_access_token_providers`
--
ALTER TABLE `oauth_access_token_providers`
  ADD CONSTRAINT `oauth_access_token_providers_oauth_access_token_id_foreign` FOREIGN KEY (`oauth_access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

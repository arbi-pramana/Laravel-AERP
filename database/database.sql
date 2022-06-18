-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table laravel_erp.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(16,2) NOT NULL DEFAULT '0.00',
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.bank_accounts: ~2 rows (approximately)
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
REPLACE INTO `bank_accounts` (`id`, `holder_name`, `bank_name`, `account_number`, `opening_balance`, `contact_number`, `bank_address`, `created_by`, `created_at`, `updated_at`) VALUES
	(2, 'Evelyn Ray', 'Phyllis Dalton', '740', 90000.00, '253123555', 'Eu aut expedita cum', 1, '2022-06-17 10:05:04', '2022-06-17 10:05:04'),
	(3, 'Kerry Lucas', 'Cecilia Carpenter', '3862444556888', 54000.00, '710789444', 'Sit velit a libero', 1, '2022-06-17 10:05:26', '2022-06-17 10:05:26');
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#fc544b',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `name`, `type`, `color`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Food', '1', '#80ff80', 1, '2022-06-15 15:38:07', '2022-06-16 03:51:59'),
	(2, 'Income', '2', '#0080ff', 1, '2022-06-15 15:38:43', '2022-06-15 15:38:43'),
	(3, 'Expense', '3', '#ff8080', 1, '2022-06-15 15:39:03', '2022-06-15 15:39:03'),
	(4, 'Beverage', '1', '#80ff80', 1, '2022-06-16 03:52:13', '2022-06-16 03:52:23');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.chart_of_accounts
CREATE TABLE IF NOT EXISTS `chart_of_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `sub_type` int(11) NOT NULL DEFAULT '0',
  `is_enabled` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.chart_of_accounts: ~32 rows (approximately)
/*!40000 ALTER TABLE `chart_of_accounts` DISABLE KEYS */;
REPLACE INTO `chart_of_accounts` (`id`, `name`, `code`, `type`, `sub_type`, `is_enabled`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Accounts Receivable', 120, 1, 1, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(2, 'Computer Equipment', 160, 1, 2, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(3, 'Office Equipment', 150, 1, 2, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(4, 'Inventory', 140, 1, 3, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(5, 'Budget - Finance Staff', 857, 1, 6, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(6, 'Accumulated Depreciation', 170, 1, 7, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(7, 'Accounts Payable', 200, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(8, 'Accruals', 205, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(9, 'Office Equipment', 150, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(10, 'Clearing Account', 855, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(11, 'Employee Benefits Payable', 235, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(12, 'Employee Deductions payable', 236, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(13, 'Historical Adjustments', 255, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(14, 'Revenue Received in Advance', 835, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(15, 'Rounding', 260, 2, 8, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(16, 'Costs of Goods Sold', 500, 3, 11, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(17, 'Advertising', 600, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(18, 'Automobile Expenses', 644, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(19, 'Bad Debts', 684, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(20, 'Bank Revaluations', 810, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(21, 'Bank Service Charges', 605, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(22, 'Consulting & Accounting', 615, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(23, 'Depreciation', 700, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(24, 'General Expenses', 628, 3, 12, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(25, 'Interest Income', 460, 4, 13, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(26, 'Other Revenue', 470, 4, 13, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(27, 'Purchase Discount', 475, 4, 13, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(28, 'Sales', 400, 4, 13, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(29, 'Common Stock', 330, 5, 16, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(30, 'Owners Contribution', 300, 5, 16, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(31, 'Owners Draw', 310, 5, 16, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41'),
	(32, 'Retained Earnings', 320, 5, 16, 1, NULL, 1, '2022-06-15 03:01:41', '2022-06-15 03:01:41');
/*!40000 ALTER TABLE `chart_of_accounts` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.chart_of_account_sub_types
CREATE TABLE IF NOT EXISTS `chart_of_account_sub_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.chart_of_account_sub_types: ~16 rows (approximately)
/*!40000 ALTER TABLE `chart_of_account_sub_types` DISABLE KEYS */;
REPLACE INTO `chart_of_account_sub_types` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
	(1, 'Current Asset', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(2, 'Fixed Asset', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(3, 'Inventory', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(4, 'Non-current Asset', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(5, 'Prepayment', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(6, 'Bank & Cash', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(7, 'Depreciation', 2, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(8, 'Current Liability', 2, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(9, 'Liability', 2, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(10, 'Non-current Liability', 2, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(11, 'Direct Costs', 3, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(12, 'Expense', 3, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(13, 'Revenue', 4, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(14, 'Sales', 4, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(15, 'Other Income', 4, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(16, 'Equity', 5, '2022-06-15 03:01:40', '2022-06-15 03:01:40');
/*!40000 ALTER TABLE `chart_of_account_sub_types` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.chart_of_account_types
CREATE TABLE IF NOT EXISTS `chart_of_account_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.chart_of_account_types: ~5 rows (approximately)
/*!40000 ALTER TABLE `chart_of_account_types` DISABLE KEYS */;
REPLACE INTO `chart_of_account_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Assets', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(2, 'Liabilities', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(3, 'Expenses', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(4, 'Income', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40'),
	(5, 'Equity', 1, '2022-06-15 03:01:40', '2022-06-15 03:01:40');
/*!40000 ALTER TABLE `chart_of_account_types` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.credit_notes
CREATE TABLE IF NOT EXISTS `credit_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `amount` double(15,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.credit_notes: ~1 rows (approximately)
/*!40000 ALTER TABLE `credit_notes` DISABLE KEYS */;
REPLACE INTO `credit_notes` (`id`, `invoice_id`, `customer_id`, `amount`, `date`, `description`, `created_at`, `updated_at`) VALUES
	(26, 18, 2, 100.00, '2022-06-17', 'DP 1', '2022-06-17 16:19:25', '2022-06-17 16:19:25');
/*!40000 ALTER TABLE `credit_notes` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `customers_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.customers: ~3 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
REPLACE INTO `customers` (`id`, `name`, `email`, `tax_number`, `password`, `contact`, `avatar`, `created_by`, `is_active`, `email_verified_at`, `billing_name`, `billing_country`, `billing_state`, `billing_city`, `billing_phone`, `billing_zip`, `billing_address`, `shipping_name`, `shipping_country`, `shipping_state`, `shipping_city`, `shipping_phone`, `shipping_zip`, `shipping_address`, `lang`, `balance`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Ali Casey', 'kogawu@mailinator.com', '67', '$2y$10$CyNtk7dXBwO/GHg/t/FxH.OmowFAKbpQFxoGuC7J0ThvVXqpbanf6', '+1 (849) 873-8305', 'customers\\June2022\\glu1VSsUnL5OkaYQd4B5.png', 1, 0, NULL, 'Owen Medina', 'Dicta explicabo Sit', 'Officiis voluptatibu', 'Et reprehenderit ips', '+1 (849) 873-8305', '41364', 'Consequuntur delenit', NULL, NULL, 'Ex pariatur Consequ', 'Placeat laboriosam', '+1 (188) 789-1718', '14715', 'Et lorem nostrud ad', 'en', 0.00, NULL, '2022-06-16 03:06:08', '2022-06-18 05:49:39'),
	(2, 'Unity Copeland', 'lezeva@mailinator.com', '118', '$2y$10$AW2jyBCf7r1s/LtLKNlJG.ot5ZPMCFoeBX0ev0Q..hzM/PKLc5stO', '+1 (866) 144-6451', 'customers\\June2022\\vj7v3iKGumE3YiezUtsF.png', 1, 0, NULL, 'Vanna Barron', 'Alias est quis imped', 'Cumque et dolore qui', 'Ipsum voluptatibus e', '+1 (866) 144-6451', '79746', 'Qui est facere nost', 'Tatum House', 'Aliquam consequatur', 'Distinctio Commodi', 'A laborum enim dolor', '+1 (431) 934-6578', '77955', 'Est fuga Accusamus', 'en', 0.00, NULL, '2022-06-16 03:08:41', '2022-06-17 03:39:11'),
	(3, 'Keith Melendez', 'qynubeteto@mailinator.com', '669', '$2y$10$QILxBPrTQoH.J2g2nNIiGOe7UztR7uH2BWXziCA1CwoqBp6/FQpfi', '+1 (948) 864-8236', 'customers\\June2022\\NNHMZbL8rrTkU6njqvWc.png', 1, 0, NULL, 'Griffin Higgins', 'Non in voluptas culp', 'Adipisicing veniam', 'Modi excepturi eveni', '+1 (948) 864-8236', '23766', 'Accusamus est do ven', 'Ishmael Salazar', 'Aut aut recusandae', 'Corrupti et quam ea', 'Sit laborum qui vero', '+1 (559) 739-3123', '32946', 'Sed ut et rerum sit', 'en', 0.00, NULL, '2022-06-16 03:08:50', '2022-06-17 03:39:53'),
	(4, 'Ebony Cain', 'vunit@mailinator.com', '491', '$2y$10$Ofg.cCUCkH/pzxR7gDb3AOZ9sjVrNdxGwFD8MwojQBFyBIcxaigO6', 'Est et id eiusmod qu', 'customers\\June2022\\rdmFpSbiGzpOUvfDwSSI.png', 1, 1, NULL, 'Jackson Puckett', 'Aut praesentium temp', 'Doloribus pariatur', 'Laudantium id ut es', '+1 (706) 537-9406', '78641', 'Ex totam ducimus op', 'Venus Johnston', 'Consequuntur quis vo', 'Ut ipsa amet quae', 'Pariatur Molestiae', '+1 (952) 759-7039', '74245', 'Quidem incididunt qu', 'en', 0.00, NULL, '2022-06-18 05:29:48', '2022-06-18 05:29:48');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.data_rows: ~179 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
REPLACE INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(57, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(58, 8, 'rate', 'number', 'Tax Rate (%)', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(59, 8, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 4),
	(60, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(61, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(62, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(63, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(64, 9, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{"default":"1","options":{"1":"Product & Service","2":"Income","3":"Expense"},"validation":{"rule":"required"}}', 3),
	(65, 9, 'color', 'color', 'Color', 1, 1, 1, 1, 1, 1, '{}', 4),
	(66, 9, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 5),
	(67, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(68, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
	(69, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(70, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(71, 10, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 3),
	(72, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(73, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(74, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(75, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"display":{"width":"12","id":"customer_name"},"validation":{"rule":"required"}}', 2),
	(76, 12, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(77, 12, 'tax_number', 'text', 'Tax Number', 0, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 5),
	(78, 12, 'password', 'password', 'Password', 1, 0, 1, 1, 1, 1, '{}', 6),
	(79, 12, 'contact', 'text', 'Contact', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(80, 12, 'avatar', 'image', 'Avatar', 1, 0, 1, 1, 1, 1, '{}', 7),
	(81, 12, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 27),
	(82, 12, 'is_active', 'select_dropdown', 'Is Active', 1, 0, 1, 1, 1, 1, '{"default":"0","options":{"0":"Active","1":"Non-Active"},"validation":{"rule":"required"}}', 8),
	(83, 12, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(84, 12, 'billing_name', 'text', 'Billing Name', 1, 0, 1, 1, 1, 1, '{"display":{"width":"12","id":"billing_name"},"validation":{"rule":"required"}}', 10),
	(85, 12, 'billing_country', 'text', 'Billing Country', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 11),
	(86, 12, 'billing_state', 'text', 'Billing State', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 12),
	(87, 12, 'billing_city', 'text', 'Billing City', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 13),
	(88, 12, 'billing_phone', 'text', 'Billing Phone', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 14),
	(89, 12, 'billing_zip', 'text', 'Billing Zip', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 15),
	(90, 12, 'billing_address', 'text_area', 'Billing Address', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 16),
	(91, 12, 'shipping_name', 'text', 'Shipping Name', 0, 0, 1, 1, 1, 1, '{}', 17),
	(92, 12, 'shipping_country', 'text', 'Shipping Country', 0, 0, 1, 1, 1, 1, '{}', 18),
	(93, 12, 'shipping_state', 'text', 'Shipping State', 0, 0, 1, 1, 1, 1, '{}', 19),
	(94, 12, 'shipping_city', 'text', 'Shipping City', 0, 0, 1, 1, 1, 1, '{}', 20),
	(95, 12, 'shipping_phone', 'text', 'Shipping Phone', 0, 0, 1, 1, 1, 1, '{}', 21),
	(96, 12, 'shipping_zip', 'text', 'Shipping Zip', 0, 0, 1, 1, 1, 1, '{}', 22),
	(97, 12, 'shipping_address', 'text_area', 'Shipping Address', 0, 0, 1, 1, 1, 1, '{}', 23),
	(98, 12, 'lang', 'text', 'Lang', 1, 0, 0, 0, 0, 0, '{}', 24),
	(99, 12, 'balance', 'text', 'Balance', 1, 0, 0, 0, 0, 0, '{}', 25),
	(100, 12, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 26),
	(101, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 28),
	(102, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 29),
	(103, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(105, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"display":{"width":"12","id":"vendor_name"}}', 3),
	(106, 13, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 5),
	(107, 13, 'tax_number', 'text', 'Tax Number', 0, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 6),
	(108, 13, 'password', 'password', 'Password', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 7),
	(109, 13, 'contact', 'text', 'Contact', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(110, 13, 'avatar', 'image', 'Avatar', 1, 0, 1, 1, 1, 1, '{}', 8),
	(111, 13, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 27),
	(112, 13, 'is_active', 'select_dropdown', 'Is Active', 1, 0, 1, 1, 1, 1, '{"default":"0","options":{"0":"Active","1":"Non-Active"},"validation":{"rule":"required"}}', 9),
	(113, 13, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 1, '{}', 10),
	(114, 13, 'billing_name', 'text', 'Billing Name', 1, 0, 1, 1, 1, 1, '{"display":{"width":"12","id":"vendor_billing_name"}}', 11),
	(115, 13, 'billing_country', 'text', 'Billing Country', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 12),
	(116, 13, 'billing_state', 'text', 'Billing State', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 13),
	(117, 13, 'billing_city', 'text', 'Billing City', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 14),
	(118, 13, 'billing_phone', 'text', 'Billing Phone', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 15),
	(119, 13, 'billing_zip', 'text', 'Billing Zip', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 16),
	(120, 13, 'billing_address', 'text_area', 'Billing Address', 1, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 17),
	(121, 13, 'shipping_name', 'text', 'Shipping Name', 0, 0, 1, 1, 1, 1, '{"display":{"width":"12","id":"vendor_shipping_name"}}', 18),
	(122, 13, 'shipping_country', 'text', 'Shipping Country', 0, 0, 1, 1, 1, 1, '{}', 19),
	(123, 13, 'shipping_state', 'text', 'Shipping State', 0, 0, 1, 1, 1, 1, '{}', 20),
	(124, 13, 'shipping_city', 'text', 'Shipping City', 0, 0, 1, 1, 1, 1, '{}', 21),
	(125, 13, 'shipping_phone', 'text', 'Shipping Phone', 0, 0, 1, 1, 1, 1, '{}', 22),
	(126, 13, 'shipping_zip', 'text', 'Shipping Zip', 0, 0, 1, 1, 1, 1, '{}', 23),
	(127, 13, 'shipping_address', 'text_area', 'Shipping Address', 0, 0, 1, 1, 1, 1, '{}', 24),
	(128, 13, 'lang', 'text', 'Lang', 1, 0, 0, 0, 0, 0, '{}', 25),
	(129, 13, 'balance', 'text', 'Balance', 1, 0, 0, 0, 0, 0, '{}', 26),
	(130, 13, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 28),
	(131, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 29),
	(132, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 30),
	(133, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(134, 14, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(135, 14, 'sku', 'text', 'Sku', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(136, 14, 'sale_price', 'number', 'Sale Price', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(137, 14, 'purchase_price', 'number', 'Purchase Price', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 5),
	(138, 14, 'quantity', 'text', 'Quantity', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 9),
	(139, 14, 'tax_id', 'text', 'Tax Id', 0, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 6),
	(140, 14, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/products\\/product_category","validation":{"rule":"required"}}', 8),
	(141, 14, 'unit_id', 'text', 'Unit Id', 0, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 10),
	(142, 14, 'type', 'radio_btn', 'Type', 1, 1, 1, 1, 1, 1, '{"default":"0","options":{"0":"Product","1":"Service"},"validation":{"rule":"required"}}', 13),
	(143, 14, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 12),
	(144, 14, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 14),
	(145, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 15),
	(146, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
	(148, 14, 'product_belongsto_unit_relationship', 'relationship', 'units', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Unit","table":"units","type":"belongsTo","column":"unit_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 11),
	(149, 14, 'product_belongsto_tax_relationship', 'relationship', 'taxes', 0, 0, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Tax","table":"taxes","type":"belongsTo","column":"tax_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 7),
	(150, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(151, 17, 'customer_id', 'text', 'Customer Id', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(152, 17, 'issue_date', 'date', 'Issue Date', 1, 1, 1, 1, 1, 1, '{"format":"%B %d, %Y","validation":{"rule":"required"}}', 4),
	(153, 17, 'due_date', 'date', 'Due Date', 1, 1, 1, 1, 1, 1, '{"format":"%B %d, %Y","validation":{"rule":"required"}}', 5),
	(154, 17, 'send_date', 'hidden', 'Send Date', 0, 0, 0, 1, 1, 1, '{"format":"%B %d, %Y","validation":{"rule":"required"}}', 6),
	(155, 17, 'category_id', 'text', 'Category Id', 1, 0, 0, 1, 1, 1, '{"validation":{"rule":"required"}}', 7),
	(156, 17, 'ref_number', 'text', 'Ref Number', 0, 0, 0, 1, 1, 1, '{"validation":{"rule":"required"}}', 8),
	(157, 17, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"0","options":{"0":"Draft","1":"Sent","2":"Partially Paid","3":"Paid"}}', 9),
	(158, 17, 'shipping_display', 'select_dropdown', 'Shipping Display', 1, 0, 0, 1, 1, 1, '{"default":"0","options":{"0":"No","1":"Yes"}}', 10),
	(159, 17, 'discount_apply', 'text', 'Discount Apply', 0, 0, 0, 1, 1, 1, '{}', 11),
	(160, 17, 'created_by', 'number', 'Created By', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 13),
	(161, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 14),
	(162, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
	(163, 17, 'invoice_belongsto_customer_relationship', 'relationship', 'Customers', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Customer","table":"customers","type":"belongsTo","column":"customer_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 2),
	(164, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(165, 19, 'invoice_id', 'text', 'Invoice', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/credit_notes\\/invoice"}', 3),
	(166, 19, 'customer_id', 'text', 'Customer', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/credit_notes\\/customer"}', 5),
	(167, 19, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/credit_notes\\/amount"}', 6),
	(168, 19, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, '{"format":"%B %d, %Y","validation":{"rule":"required"}}', 7),
	(169, 19, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 8),
	(170, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(171, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
	(173, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(174, 20, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(175, 20, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(176, 20, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/chart_of_accounts\\/type"}', 5),
	(177, 20, 'sub_type', 'text', 'Sub Type', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/chart_of_accounts\\/sub_type"}', 7),
	(178, 20, 'is_enabled', 'select_dropdown', 'Is Enabled', 1, 1, 1, 1, 1, 1, '{"default":"1","options":{"0":"Disabled","1":"Enabled"},"validation":{"rule":"required"}}', 8),
	(179, 20, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 9),
	(180, 20, 'created_by', 'hidden', 'Created By', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 10),
	(181, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 11),
	(182, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
	(185, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 0),
	(186, 22, 'invoice_id', 'text', 'Invoice ID', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/invoice_payments\\/invoice_id"}', 2),
	(187, 22, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(188, 22, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(189, 22, 'account_id', 'text', 'Account', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/invoice_payments\\/account"}', 5),
	(190, 22, 'payment_method', 'text', 'Payment Method', 1, 0, 0, 0, 0, 0, '{"validation":{"rule":"required"}}', 6),
	(191, 22, 'receipt', 'hidden', 'Receipt', 0, 1, 1, 1, 1, 1, '{}', 7),
	(192, 22, 'payment_type', 'text', 'Payment Type', 1, 0, 0, 0, 0, 0, '{}', 8),
	(193, 22, 'txn_id', 'text', 'Txn Id', 0, 0, 0, 0, 0, 0, '{}', 9),
	(194, 22, 'currency', 'hidden', 'Currency', 0, 1, 1, 1, 1, 1, '{}', 10),
	(195, 22, 'order_id', 'text', 'Order Id', 0, 0, 0, 0, 0, 0, '{}', 11),
	(196, 22, 'reference', 'text', 'Reference', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 12),
	(197, 22, 'add_receipt', 'file', 'Add Receipt', 0, 1, 1, 1, 1, 1, '{}', 13),
	(198, 22, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 14),
	(199, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 15),
	(200, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
	(201, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(202, 23, 'holder_name', 'text', 'Holder Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(203, 23, 'bank_name', 'text', 'Bank Name', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(204, 23, 'account_number', 'text', 'Account Number', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 4),
	(205, 23, 'opening_balance', 'number', 'Current Balance', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 5),
	(206, 23, 'contact_number', 'text', 'Contact Number', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 6),
	(207, 23, 'bank_address', 'text_area', 'Bank Address', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 7),
	(208, 23, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 8),
	(209, 23, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(210, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
	(211, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(212, 25, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 2),
	(213, 25, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 3),
	(214, 25, 'account_id', 'text', 'Account', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/revenues\\/account"}', 4),
	(215, 25, 'customer_id', 'text', 'Customer', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 6),
	(216, 25, 'category_id', 'text', 'Category', 1, 1, 1, 1, 1, 1, '{"view":"custom_forms\\/revenues\\/category"}', 7),
	(217, 25, 'payment_method', 'text', 'Payment Method', 1, 0, 0, 0, 0, 0, '{"validation":{"rule":"required"}}', 8),
	(218, 25, 'reference', 'text', 'Reference', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 9),
	(219, 25, 'add_receipt', 'file', 'Add Receipt', 0, 1, 1, 1, 1, 1, '{}', 10),
	(220, 25, 'description', 'text_area', 'Description', 1, 1, 1, 1, 1, 1, '{"validation":{"rule":"required"}}', 11),
	(221, 25, 'created_by', 'hidden', 'Created By', 1, 0, 1, 1, 1, 1, '{"view":"custom_forms\\/created_by"}', 12),
	(222, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 13),
	(223, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
	(224, 25, 'revenue_belongsto_customer_relationship', 'relationship', 'Customers', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Models\\\\Customer","table":"customers","type":"belongsTo","column":"customer_id","key":"id","label":"name","pivot_table":"bank_accounts","pivot":"0","taggable":"0"}', 5),
	(225, 17, 'due_amount', 'text', 'Due Amount', 0, 1, 0, 0, 0, 0, '{"view":"custom_forms\\/invoices\\/due_amount"}', 12);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.data_types: ~15 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
REPLACE INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-06-15 13:57:55', '2022-06-15 13:57:55'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-06-15 13:57:55', '2022-06-15 13:57:55'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-06-15 13:57:55', '2022-06-15 13:57:55'),
	(8, 'taxes', 'taxes', 'Tax', 'Taxes', NULL, 'App\\Models\\Tax', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-15 14:54:59', '2022-06-18 06:05:09'),
	(9, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Models\\Category', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-15 15:37:27', '2022-06-18 06:05:36'),
	(10, 'units', 'units', 'Unit', 'Units', NULL, 'App\\Models\\Unit', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-15 15:41:46', '2022-06-18 06:05:49'),
	(12, 'customers', 'customers', 'Customer', 'Customers', 'voyager-people', 'App\\Models\\Customer', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-15 16:15:49', '2022-06-18 05:49:15'),
	(13, 'vendors', 'vendors', 'Vendor', 'Vendors', 'voyager-people', 'App\\Models\\Vendor', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-15 16:48:52', '2022-06-18 05:47:26'),
	(14, 'products', 'products', 'Product', 'Products', 'voyager-list-add', 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-16 03:32:12', '2022-06-18 05:23:47'),
	(17, 'invoices', 'invoices', 'Invoice', 'Invoices', NULL, 'App\\Models\\Invoice', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-16 04:49:25', '2022-06-18 05:30:58'),
	(19, 'credit_notes', 'credit-notes', 'Credit Note', 'Credit Notes', NULL, 'App\\Models\\CreditNote', NULL, 'App\\Http\\Controllers\\Admin\\CreditNoteController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-16 14:54:58', '2022-06-18 05:44:01'),
	(20, 'chart_of_accounts', 'chart-of-accounts', 'Chart Of Account', 'Chart Of Accounts', NULL, 'App\\Models\\ChartOfAccount', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-17 07:01:25', '2022-06-18 05:52:13'),
	(22, 'invoice_payments', 'invoice-payments', 'Invoice Payment', 'Invoice Payments', NULL, 'App\\Models\\InvoicePayment', NULL, 'App\\Http\\Controllers\\Admin\\InvoicePaymentController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-17 08:32:55', '2022-06-18 05:41:25'),
	(23, 'bank_accounts', 'bank-accounts', 'Bank Account', 'Bank Accounts', NULL, 'App\\Models\\BankAccount', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-17 10:01:44', '2022-06-18 05:51:06'),
	(25, 'revenues', 'revenues', 'Revenue', 'Revenues', NULL, 'App\\Models\\Revenue', NULL, 'App\\Http\\Controllers\\Admin\\RevenueController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2022-06-17 15:13:28', '2022-06-18 05:35:48');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `ref_number` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=draft,1=approved,2=partially_paid,3=paid',
  `shipping_display` int(11) NOT NULL DEFAULT '1',
  `discount_apply` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `due_amount` double(20,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.invoices: ~2 rows (approximately)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
REPLACE INTO `invoices` (`id`, `customer_id`, `issue_date`, `due_date`, `send_date`, `category_id`, `ref_number`, `status`, `shipping_display`, `discount_apply`, `created_by`, `due_amount`, `created_at`, `updated_at`) VALUES
	(18, 2, '2010-08-12', '1974-06-19', NULL, 2, '347', 3, 1, NULL, 1, 0.00, '2022-06-17 15:56:56', '2022-06-18 05:45:43'),
	(20, 1, '2022-06-18', '2022-06-18', NULL, 2, '-', 0, 1, NULL, 1, 0.00, '2022-06-18 05:33:04', '2022-06-18 05:48:25');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.invoice_payments
CREATE TABLE IF NOT EXISTS `invoice_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `account_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL DEFAULT '0',
  `receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manually',
  `txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.invoice_payments: ~0 rows (approximately)
/*!40000 ALTER TABLE `invoice_payments` DISABLE KEYS */;
REPLACE INTO `invoice_payments` (`id`, `invoice_id`, `date`, `amount`, `account_id`, `payment_method`, `receipt`, `payment_type`, `txn_id`, `currency`, `order_id`, `reference`, `add_receipt`, `description`, `created_at`, `updated_at`) VALUES
	(2, 18, '2022-06-17', 100000.00, 2, 0, NULL, 'Manually', NULL, 'IDR', NULL, 'Reference 1', '[]', 'Payment 1', '2022-06-18 05:44:54', '2022-06-18 05:44:54'),
	(3, 18, '2022-06-18', 131901.00, 2, 0, NULL, 'Manually', NULL, 'IDR', NULL, 'Reference 2', '[]', 'Lunas', '2022-06-18 05:45:43', '2022-06-18 05:45:43');
/*!40000 ALTER TABLE `invoice_payments` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.invoice_products
CREATE TABLE IF NOT EXISTS `invoice_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `discount` double(16,2) NOT NULL DEFAULT '0.00',
  `price` double(16,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.invoice_products: ~4 rows (approximately)
/*!40000 ALTER TABLE `invoice_products` DISABLE KEYS */;
REPLACE INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `quantity`, `tax`, `discount`, `price`, `description`, `created_at`, `updated_at`) VALUES
	(61, 18, 3, 290, '0', 2.00, 215.00, 'Et sint ut non est i', '2022-06-17 15:56:56', '2022-06-17 15:56:56'),
	(62, 18, 4, 155, '0', 100.00, 80.00, 'Id dolor fugiat ut', '2022-06-17 15:56:56', '2022-06-17 15:56:56'),
	(63, 18, 3, 732, '0', 27.00, 215.00, 'Praesentium eveniet', '2022-06-17 15:56:56', '2022-06-17 15:56:56'),
	(66, 20, 1, 1, '10', 0.00, 933.00, '-', '2022-06-18 05:48:25', '2022-06-18 05:48:25');
/*!40000 ALTER TABLE `invoice_products` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.menus: ~0 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
REPLACE INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2022-06-15 13:57:56', '2022-06-15 13:57:56');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.menu_items: ~24 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
REPLACE INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 7, '2022-06-15 13:57:56', '2022-06-17 10:02:50', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 14, 5, '2022-06-15 13:57:56', '2022-06-15 17:07:18', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 14, 4, '2022-06-15 13:57:56', '2022-06-15 17:07:16', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-06-15 13:57:56', '2022-06-17 10:02:50', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-06-15 13:57:56', '2022-06-15 14:49:59', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-06-15 13:57:56', '2022-06-15 14:49:59', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-06-15 13:57:56', '2022-06-15 14:50:00', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-06-15 13:57:56', '2022-06-15 14:50:00', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2022-06-15 13:57:56', '2022-06-17 10:02:50', 'voyager.settings.index', NULL),
	(14, 1, 'Data Master', '#', '_self', 'voyager-archive', '#000000', NULL, 8, '2022-06-15 14:49:52', '2022-06-17 10:02:50', NULL, ''),
	(16, 1, 'Taxes', '', '_self', NULL, NULL, 14, 1, '2022-06-15 14:54:59', '2022-06-15 15:14:39', 'voyager.taxes.index', NULL),
	(17, 1, 'Categories', '', '_self', NULL, NULL, 14, 2, '2022-06-15 15:37:27', '2022-06-15 15:37:36', 'voyager.categories.index', NULL),
	(18, 1, 'Units', '', '_self', NULL, NULL, 14, 3, '2022-06-15 15:41:46', '2022-06-15 15:41:58', 'voyager.units.index', NULL),
	(20, 1, 'Customers', '', '_self', 'voyager-people', '#000000', 22, 1, '2022-06-15 16:15:50', '2022-06-15 17:02:25', 'voyager.customers.index', 'null'),
	(21, 1, 'Vendors', '', '_self', 'voyager-people', '#000000', 23, 1, '2022-06-15 16:48:52', '2022-06-15 17:02:31', 'voyager.vendors.index', 'null'),
	(22, 1, 'Sales', '#', '_self', 'voyager-receipt', '#000000', NULL, 3, '2022-06-15 17:01:31', '2022-06-17 07:10:01', NULL, ''),
	(23, 1, 'Purchase', '#', '_self', 'voyager-buy', '#000000', NULL, 4, '2022-06-15 17:01:53', '2022-06-17 07:10:01', NULL, ''),
	(25, 1, 'Products', '', '_self', 'voyager-list-add', NULL, NULL, 2, '2022-06-16 03:32:13', '2022-06-17 07:16:11', 'voyager.products.index', NULL),
	(26, 1, 'Invoices', '', '_self', NULL, NULL, 22, 2, '2022-06-16 04:49:26', '2022-06-16 13:40:51', 'voyager.invoices.index', NULL),
	(27, 1, 'Credit Notes', '', '_self', NULL, NULL, 22, 4, '2022-06-16 14:54:58', '2022-06-17 15:45:51', 'voyager.credit-notes.index', NULL),
	(28, 1, 'Chart Of Accounts', '', '_self', NULL, NULL, 29, 1, '2022-06-17 07:01:25', '2022-06-17 07:09:36', 'voyager.chart-of-accounts.index', NULL),
	(29, 1, 'Double Entry', '#', '_self', 'voyager-pen', '#000000', NULL, 6, '2022-06-17 07:09:21', '2022-06-17 10:02:50', NULL, ''),
	(31, 1, 'Bank Accounts', '', '_self', NULL, NULL, 32, 1, '2022-06-17 10:01:44', '2022-06-17 10:02:54', 'voyager.bank-accounts.index', NULL),
	(32, 1, 'Banking', '#', '_self', 'voyager-dollar', '#000000', NULL, 5, '2022-06-17 10:02:41', '2022-06-17 10:03:13', NULL, ''),
	(33, 1, 'Revenues', '', '_self', NULL, NULL, 22, 3, '2022-06-17 15:13:28', '2022-06-17 15:45:51', 'voyager.revenues.index', NULL),
	(34, 1, 'Dashboard', '#', '_self', 'voyager-dashboard', '#000000', NULL, 1, '2022-06-17 15:46:34', '2022-06-17 15:46:42', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.migrations: ~28 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2019_08_19_000000_create_failed_jobs_table', 1),
	(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(25, '2016_01_01_000000_create_pages_table', 2),
	(26, '2016_01_01_000000_create_posts_table', 2),
	(27, '2016_02_15_204651_create_categories_table', 2),
	(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.permissions: ~83 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
REPLACE INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(2, 'browse_bread', NULL, '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(3, 'browse_database', NULL, '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(4, 'browse_media', NULL, '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(5, 'browse_compass', NULL, '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(6, 'browse_menus', 'menus', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(7, 'read_menus', 'menus', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(8, 'edit_menus', 'menus', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(9, 'add_menus', 'menus', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(10, 'delete_menus', 'menus', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(11, 'browse_roles', 'roles', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(12, 'read_roles', 'roles', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(13, 'edit_roles', 'roles', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(14, 'add_roles', 'roles', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(15, 'delete_roles', 'roles', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(16, 'browse_users', 'users', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(17, 'read_users', 'users', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(18, 'edit_users', 'users', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(19, 'add_users', 'users', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(20, 'delete_users', 'users', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(21, 'browse_settings', 'settings', '2022-06-15 13:57:57', '2022-06-15 13:57:57'),
	(22, 'read_settings', 'settings', '2022-06-15 13:57:57', '2022-06-15 13:57:57'),
	(23, 'edit_settings', 'settings', '2022-06-15 13:57:57', '2022-06-15 13:57:57'),
	(24, 'add_settings', 'settings', '2022-06-15 13:57:57', '2022-06-15 13:57:57'),
	(25, 'delete_settings', 'settings', '2022-06-15 13:57:57', '2022-06-15 13:57:57'),
	(41, 'browse_taxes', 'taxes', '2022-06-15 14:54:59', '2022-06-15 14:54:59'),
	(42, 'read_taxes', 'taxes', '2022-06-15 14:54:59', '2022-06-15 14:54:59'),
	(43, 'edit_taxes', 'taxes', '2022-06-15 14:54:59', '2022-06-15 14:54:59'),
	(44, 'add_taxes', 'taxes', '2022-06-15 14:54:59', '2022-06-15 14:54:59'),
	(45, 'delete_taxes', 'taxes', '2022-06-15 14:54:59', '2022-06-15 14:54:59'),
	(46, 'browse_categories', 'categories', '2022-06-15 15:37:27', '2022-06-15 15:37:27'),
	(47, 'read_categories', 'categories', '2022-06-15 15:37:27', '2022-06-15 15:37:27'),
	(48, 'edit_categories', 'categories', '2022-06-15 15:37:27', '2022-06-15 15:37:27'),
	(49, 'add_categories', 'categories', '2022-06-15 15:37:27', '2022-06-15 15:37:27'),
	(50, 'delete_categories', 'categories', '2022-06-15 15:37:27', '2022-06-15 15:37:27'),
	(51, 'browse_units', 'units', '2022-06-15 15:41:46', '2022-06-15 15:41:46'),
	(52, 'read_units', 'units', '2022-06-15 15:41:46', '2022-06-15 15:41:46'),
	(53, 'edit_units', 'units', '2022-06-15 15:41:46', '2022-06-15 15:41:46'),
	(54, 'add_units', 'units', '2022-06-15 15:41:46', '2022-06-15 15:41:46'),
	(55, 'delete_units', 'units', '2022-06-15 15:41:46', '2022-06-15 15:41:46'),
	(56, 'browse_customers', 'customers', '2022-06-15 16:15:50', '2022-06-15 16:15:50'),
	(57, 'read_customers', 'customers', '2022-06-15 16:15:50', '2022-06-15 16:15:50'),
	(58, 'edit_customers', 'customers', '2022-06-15 16:15:50', '2022-06-15 16:15:50'),
	(59, 'add_customers', 'customers', '2022-06-15 16:15:50', '2022-06-15 16:15:50'),
	(60, 'delete_customers', 'customers', '2022-06-15 16:15:50', '2022-06-15 16:15:50'),
	(61, 'browse_vendors', 'vendors', '2022-06-15 16:48:52', '2022-06-15 16:48:52'),
	(62, 'read_vendors', 'vendors', '2022-06-15 16:48:52', '2022-06-15 16:48:52'),
	(63, 'edit_vendors', 'vendors', '2022-06-15 16:48:52', '2022-06-15 16:48:52'),
	(64, 'add_vendors', 'vendors', '2022-06-15 16:48:52', '2022-06-15 16:48:52'),
	(65, 'delete_vendors', 'vendors', '2022-06-15 16:48:52', '2022-06-15 16:48:52'),
	(66, 'browse_products', 'products', '2022-06-16 03:32:12', '2022-06-16 03:32:12'),
	(67, 'read_products', 'products', '2022-06-16 03:32:12', '2022-06-16 03:32:12'),
	(68, 'edit_products', 'products', '2022-06-16 03:32:12', '2022-06-16 03:32:12'),
	(69, 'add_products', 'products', '2022-06-16 03:32:12', '2022-06-16 03:32:12'),
	(70, 'delete_products', 'products', '2022-06-16 03:32:12', '2022-06-16 03:32:12'),
	(71, 'browse_invoices', 'invoices', '2022-06-16 04:49:26', '2022-06-16 04:49:26'),
	(72, 'read_invoices', 'invoices', '2022-06-16 04:49:26', '2022-06-16 04:49:26'),
	(73, 'edit_invoices', 'invoices', '2022-06-16 04:49:26', '2022-06-16 04:49:26'),
	(74, 'add_invoices', 'invoices', '2022-06-16 04:49:26', '2022-06-16 04:49:26'),
	(75, 'delete_invoices', 'invoices', '2022-06-16 04:49:26', '2022-06-16 04:49:26'),
	(76, 'browse_credit_notes', 'credit_notes', '2022-06-16 14:54:58', '2022-06-16 14:54:58'),
	(77, 'read_credit_notes', 'credit_notes', '2022-06-16 14:54:58', '2022-06-16 14:54:58'),
	(78, 'edit_credit_notes', 'credit_notes', '2022-06-16 14:54:58', '2022-06-16 14:54:58'),
	(79, 'add_credit_notes', 'credit_notes', '2022-06-16 14:54:58', '2022-06-16 14:54:58'),
	(80, 'delete_credit_notes', 'credit_notes', '2022-06-16 14:54:58', '2022-06-16 14:54:58'),
	(81, 'browse_chart_of_accounts', 'chart_of_accounts', '2022-06-17 07:01:25', '2022-06-17 07:01:25'),
	(82, 'read_chart_of_accounts', 'chart_of_accounts', '2022-06-17 07:01:25', '2022-06-17 07:01:25'),
	(83, 'edit_chart_of_accounts', 'chart_of_accounts', '2022-06-17 07:01:25', '2022-06-17 07:01:25'),
	(84, 'add_chart_of_accounts', 'chart_of_accounts', '2022-06-17 07:01:25', '2022-06-17 07:01:25'),
	(85, 'delete_chart_of_accounts', 'chart_of_accounts', '2022-06-17 07:01:25', '2022-06-17 07:01:25'),
	(86, 'browse_invoice_payments', 'invoice_payments', '2022-06-17 08:32:55', '2022-06-17 08:32:55'),
	(87, 'read_invoice_payments', 'invoice_payments', '2022-06-17 08:32:55', '2022-06-17 08:32:55'),
	(88, 'edit_invoice_payments', 'invoice_payments', '2022-06-17 08:32:55', '2022-06-17 08:32:55'),
	(89, 'add_invoice_payments', 'invoice_payments', '2022-06-17 08:32:55', '2022-06-17 08:32:55'),
	(90, 'delete_invoice_payments', 'invoice_payments', '2022-06-17 08:32:55', '2022-06-17 08:32:55'),
	(91, 'browse_bank_accounts', 'bank_accounts', '2022-06-17 10:01:44', '2022-06-17 10:01:44'),
	(92, 'read_bank_accounts', 'bank_accounts', '2022-06-17 10:01:44', '2022-06-17 10:01:44'),
	(93, 'edit_bank_accounts', 'bank_accounts', '2022-06-17 10:01:44', '2022-06-17 10:01:44'),
	(94, 'add_bank_accounts', 'bank_accounts', '2022-06-17 10:01:44', '2022-06-17 10:01:44'),
	(95, 'delete_bank_accounts', 'bank_accounts', '2022-06-17 10:01:44', '2022-06-17 10:01:44'),
	(96, 'browse_revenues', 'revenues', '2022-06-17 15:13:28', '2022-06-17 15:13:28'),
	(97, 'read_revenues', 'revenues', '2022-06-17 15:13:28', '2022-06-17 15:13:28'),
	(98, 'edit_revenues', 'revenues', '2022-06-17 15:13:28', '2022-06-17 15:13:28'),
	(99, 'add_revenues', 'revenues', '2022-06-17 15:13:28', '2022-06-17 15:13:28'),
	(100, 'delete_revenues', 'revenues', '2022-06-17 15:13:28', '2022-06-17 15:13:28');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.permission_role: ~85 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
REPLACE INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(89, 1),
	(90, 1),
	(91, 1),
	(92, 1),
	(93, 1),
	(94, 1),
	(95, 1),
	(96, 1),
	(97, 1),
	(98, 1),
	(99, 1),
	(100, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` double(20,2) NOT NULL DEFAULT '0.00',
  `purchase_price` double(20,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `tax_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.products: ~5 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
REPLACE INTO `products` (`id`, `name`, `sku`, `sale_price`, `purchase_price`, `quantity`, `tax_id`, `category_id`, `unit_id`, `type`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Product 2', 'Eumquaerateaidma', 933.00, 2350.00, 247, 2, 1, 1, '0', 'Distinctio At recus', 1, '2022-06-16 03:49:48', '2022-06-16 07:42:42'),
	(2, 'Product 1', 'Quisenimvoluptatem', 919.00, 5170.00, 686, 1, 1, 1, '0', 'Nulla ut vel est sap', 1, '2022-06-16 03:58:05', '2022-06-16 03:58:19'),
	(3, 'Service 1', 'Corruptidoloreut', 215.00, 860.00, 48, 1, 4, 1, '1', 'Id necessitatibus ad', 1, '2022-06-16 03:58:55', '2022-06-16 04:14:05'),
	(4, 'Service 2', 'Veritatisquiaaliqu', 80.00, 833.00, 258, 1, 4, 1, '1', 'Deserunt quia volupt', 1, '2022-06-16 03:59:40', '2022-06-16 04:13:57'),
	(7, 'Product 3', 'Esseillumconsequu', 130.00, 11.00, 297, 1, 1, 1, '0', 'Ut ut illum enim qu', 1, '2022-06-18 05:25:00', '2022-06-18 05:25:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.revenues
CREATE TABLE IF NOT EXISTS `revenues` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT '0.00',
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.revenues: ~2 rows (approximately)
/*!40000 ALTER TABLE `revenues` DISABLE KEYS */;
REPLACE INTO `revenues` (`id`, `date`, `amount`, `account_id`, `customer_id`, `category_id`, `payment_method`, `reference`, `add_receipt`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
	(5, '2022-06-17', 1000000.00, 2, 1, 2, 0, 'Reference', '[{"download_link":"revenues\\\\June2022\\\\ot6hIq8DgVHKG7FlgYvX.png","original_name":"visa.png"}]', 'Description Description Description', 1, '2022-06-17 15:45:14', '2022-06-17 15:45:14');
/*!40000 ALTER TABLE `revenues` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2022-06-15 13:57:56', '2022-06-15 13:57:56'),
	(2, 'user', 'Normal User', '2022-06-15 13:57:56', '2022-06-15 13:57:56');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.settings: ~34 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
REPLACE INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
	(11, 'system-setting.currency', 'Currency', 'IDR', NULL, 'text', 6, 'System Setting'),
	(12, 'system-setting.currency_symbol', 'Currency Symbol', 'Rp.', NULL, 'text', 7, 'System Setting'),
	(14, 'system-setting.currency_symbol_position', 'Currency Symbol Position', 'pre', '{\r\n    "default" : "Pre",\r\n    "options" : {\r\n        "pre": "Pre",\r\n        "post": "Post"\r\n    }\r\n}', 'radio_btn', 8, 'System Setting'),
	(15, 'system-setting.date_format', 'Date Format', 'M j, Y', '{\r\n    "default" : "M j, Y",\r\n    "options" : {\r\n        "M j, Y": "Jan 1, 2015",\r\n        "d-m-Y": "d-m-Y",\r\n        "m-d-Y": "m-d-Y",\r\n        "Y-m-d": "Y-m-d"\r\n    }\r\n}', 'select_dropdown', 10, 'System Setting'),
	(16, 'system-setting.time_format', 'Time Format', 'g:i A', '{\r\n    "default" : "g:i A",\r\n    "options" : {\r\n        "g:i A": "10:30 PM",\r\n        "g:i a": "10:30 pm",\r\n        "H:i": "22:30"\r\n    }\r\n}', 'select_dropdown', 11, 'System Setting'),
	(17, 'system-setting.invoice_prefix', 'Invoice Prefix', '#INV', NULL, 'text', 12, 'System Setting'),
	(18, 'system-setting.proposal_prefix', 'Proposal Prefix', NULL, NULL, 'text', 13, 'System Setting'),
	(19, 'system-setting.bill_prefix', 'Bill Prefix', NULL, NULL, 'text', 14, 'System Setting'),
	(20, 'system-setting.customer_prefix', 'Customer Prefix', NULL, NULL, 'text', 15, 'System Setting'),
	(21, 'system-setting.vendor_prefix', 'Vendor Prefix', NULL, NULL, 'text', 16, 'System Setting'),
	(22, 'system-setting.footer_title', 'Invoice/Bill Footer Title', NULL, NULL, 'text', 18, 'System Setting'),
	(24, 'system-setting.journal_prefix', 'Journal Prefix', NULL, NULL, 'text', 19, 'System Setting'),
	(25, 'system-setting.shipping_display', 'Shipping Display in Proposal / Invoice / Bill ?', '0', '{\r\n    "default" : "0",\r\n    "options" : {\r\n        "0": "No",\r\n        "1": "Yes"\r\n    }\r\n}', 'select_dropdown', 20, 'System Setting'),
	(26, 'system-setting.footer_notes', 'Invoice/Bill Footer Notes', NULL, NULL, 'text_area', 34, 'System Setting'),
	(27, 'company-setting.company_name', 'Company Name *', NULL, NULL, 'text', 21, 'Company Setting'),
	(28, 'company-setting.address', 'Address', NULL, NULL, 'text', 22, 'Company Setting'),
	(29, 'company-setting.city', 'City', NULL, NULL, 'text', 23, 'Company Setting'),
	(30, 'company-setting.state', 'State', NULL, NULL, 'text', 24, 'Company Setting'),
	(31, 'company-setting.zip_code', 'Zip/Post Code', NULL, NULL, 'text', 25, 'Company Setting'),
	(32, 'company-setting.country', 'Country', NULL, NULL, 'text', 26, 'Company Setting'),
	(33, 'company-setting.telephone', 'Telephone', NULL, NULL, 'text', 27, 'Company Setting'),
	(34, 'company-setting.system_email', 'System Email *', NULL, NULL, 'text', 28, 'Company Setting'),
	(35, 'company-setting.email_from_name', 'Email (From Name) *', NULL, NULL, 'text', 29, 'Company Setting'),
	(36, 'company-setting.company_registration_number', 'Company Registration Number *', NULL, NULL, 'text', 30, 'Company Setting'),
	(37, 'company-setting.vat_gst_number', 'VAT/GST Number', NULL, NULL, 'text', 31, 'Company Setting'),
	(38, 'company-setting.company_start_time', 'Company Start Time *', NULL, NULL, 'text', 32, 'Company Setting'),
	(39, 'company-setting.company_end_time', 'Company End Time *', NULL, NULL, 'text', 33, 'Company Setting'),
	(40, 'system-setting.decimal_number_format', 'Decimal Number Format', '2', NULL, 'text', 9, 'System Setting');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.taxes
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.taxes: ~0 rows (approximately)
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
REPLACE INTO `taxes` (`id`, `name`, `rate`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Default', '0', 1, '2022-06-15 15:22:45', '2022-06-15 15:22:45'),
	(2, 'PPN', '10', 1, '2022-06-16 14:42:24', '2022-06-16 14:42:24');
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.transactions: ~2 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
REPLACE INTO `transactions` (`id`, `user_id`, `user_type`, `account`, `type`, `amount`, `description`, `date`, `created_by`, `payment_id`, `category`, `created_at`, `updated_at`) VALUES
	(16, 1, 'Customer', 2, 'Revenue', 1000000.00, 'Description Description Description', '2022-06-17', 1, 5, 'Income', '2022-06-17 15:45:14', '2022-06-17 15:45:14'),
	(19, 2, 'Customer', 2, 'Partial', 100000.00, 'Payment 1', '2022-06-17', 1, 2, 'Invoice', '2022-06-18 05:44:54', '2022-06-18 05:44:54'),
	(20, 2, 'Customer', 2, 'Partial', 131901.00, 'Lunas', '2022-06-18', 1, 3, 'Invoice', '2022-06-18 05:45:43', '2022-06-18 05:45:43');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.translations: ~30 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
REPLACE INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-06-15 13:58:01', '2022-06-15 13:58:01'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-06-15 13:58:01', '2022-06-15 13:58:01');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.units: ~0 rows (approximately)
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
REPLACE INTO `units` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'pcs', 1, '2022-06-16 03:05:43', '2022-06-16 03:05:43');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Ozpaacn2G9HscftP6TDAfeqxtVCZGL1fL0DgCiNXIMqwsjR0VBcTe', '7pQaN5f5D5SiOfaQLGb5foHUVFlYunlEuDWeUMVVq2nQ0nsb7rRAQyrEXVu0', NULL, '2022-06-15 13:58:00', '2022-06-15 13:58:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
REPLACE INTO `user_roles` (`user_id`, `role_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for table laravel_erp.vendors
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `venders_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_erp.vendors: ~2 rows (approximately)
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
REPLACE INTO `vendors` (`id`, `name`, `email`, `tax_number`, `password`, `contact`, `avatar`, `created_by`, `is_active`, `email_verified_at`, `billing_name`, `billing_country`, `billing_state`, `billing_city`, `billing_phone`, `billing_zip`, `billing_address`, `shipping_name`, `shipping_country`, `shipping_state`, `shipping_city`, `shipping_phone`, `shipping_zip`, `shipping_address`, `lang`, `balance`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Leonard Huffman', 'tuqu@mailinator.com', '203', '$2y$10$h9zIs7qPlSk.omGYZsHbS.xX/7Vg09zq0bsw7wxGLqhruUW1QE3CS', 'Laborum labore assum', 'vendors\\June2022\\fLCwl8dQ767RjjIZK7fZ.png', 1, 1, '2022-06-16 10:06:00', 'Keelie Saunders', 'Nisi fugiat dolorem', 'Aut quam enim nihil', 'Est amet sit cum', '+1 (329) 391-2752', '28734', 'Qui obcaecati cupida', 'Zachary Fuentes', 'Beatae dolor ipsum', 'Quia in soluta labor', 'In optio illo minus', '+1 (861) 156-7258', '19400', 'Tempor quod lorem mo', 'en', 0.00, NULL, '2022-06-16 03:07:00', '2022-06-16 03:07:00'),
	(2, 'Gemma Brooks', 'garodu@mailinator.com', '745', '$2y$10$7DowpHawTIKO9qQWCl/3a.oMEV3uPlaZ2yEbhwdOxfiJ1MuZ9Q6ju', 'Enim est tempore re', 'vendors\\June2022\\tzHgpf1SEGhYXGIAZsP8.png', 1, 0, NULL, 'Myles Brock', 'Veniam nulla dolore', 'Minim est qui velit', 'Ut iste assumenda hi', '+1 (683) 437-5608', '18409', 'Sed anim velit in et', 'Driscoll Cannon', 'Pariatur Voluptate', 'Est consequatur volu', 'Dolore corrupti del', '+1 (587) 987-7629', '48463', 'Officia minus incidi', 'en', 0.00, NULL, '2022-06-16 03:08:05', '2022-06-16 03:08:05'),
	(3, 'Rowan Abbott', 'lego@mailinator.com', '237', '$2y$10$0SsAqcvt2nOGGKAOf6SY3eOXRSD6DQ0gkQv7hYuoNpdew/.iqemtq', 'Obcaecati explicabo', 'vendors\\June2022\\ePawgG31h5MI8pCqmwZh.png', 1, 0, NULL, 'Amir Roman', 'Quas magna quos non', 'Dicta sed rerum faci', 'Eum laboris incidunt', '+1 (994) 342-2584', '11199', 'Non praesentium aut', 'Gail Cleveland', 'Ea voluptatem Tempo', 'Et qui dolore molest', 'Amet eligendi do at', '+1 (713) 944-6032', '11681', 'Ipsa molestiae temp', 'en', 0.00, NULL, '2022-06-16 03:08:15', '2022-06-16 03:08:15');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

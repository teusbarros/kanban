
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL,
  `column_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_column_id_foreign` (`column_id`),
  CONSTRAINT `cards_column_id_foreign` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'Autem','Labore omnis ipsum magnam alias sit incidunt. Enim sint accusamus mollitia eius dolorem ipsam quia. Sed velit aliquam sequi aut. Sit qui eveniet omnis enim.',2,3,NULL,'2023-01-12 18:04:16','2023-01-12 18:19:29'),(2,'Eius','Repellendus aspernatur illo sequi qui expedita natus porro. Eaque voluptas aut assumenda atque cum. Fugit impedit deleniti quo et voluptatem. Et rem vitae tempora ab aut sint aut odit.',1,3,NULL,'2023-01-12 18:04:16','2023-01-12 18:19:29'),(3,'Et','Rerum qui iure perspiciatis incidunt. Voluptatem vel soluta vitae accusamus minus. Doloribus velit inventore voluptatem occaecati. Ipsam corrupti fuga minus distinctio numquam.',1,2,'2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(4,'Ipsam','Eum tempore magni distinctio sit eum odio debitis rem. Aspernatur aliquid quis aut laudantium omnis illum. Architecto temporibus qui exercitationem exercitationem sit.',2,2,'2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(5,'Dolor','Iusto officiis odio eaque corporis sed libero aperiam corrupti. Est doloremque et dolorem fugiat rerum. Dolor expedita quidem quibusdam omnis quia repellendus.',2,1,NULL,'2023-01-12 18:04:16','2023-01-12 18:17:32'),(6,'Velit','Maxime dolorum ipsa sed molestiae odit modi. Rem adipisci maxime veritatis in occaecati omnis et. Quisquam voluptatem magnam qui sapiente incidunt ratione totam.',3,3,NULL,'2023-01-12 18:04:16','2023-01-12 18:19:29'),(7,'Incidunt','Tenetur aut enim expedita. Consequuntur ab eos qui optio quisquam et ut. Debitis reiciendis sit at. Hic culpa optio pariatur non.',3,1,NULL,'2023-01-12 18:04:16','2023-01-12 18:17:32'),(8,'Quia','Soluta inventore et officia vel deleniti velit. Rerum tempore dolor eligendi. Alias illo et asperiores eaque atque maxime aspernatur enim. Facilis tempora voluptatum nobis illum.',3,2,'2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(9,'Ex','Minus sint cum voluptatem illo quis. Deserunt voluptas vitae facilis voluptatibus perferendis repellat. Sunt dolorem et nemo ipsum. Sit et fugit nesciunt incidunt esse.',8,1,NULL,'2023-01-12 18:04:16','2023-01-12 18:19:32'),(10,'Commodi','Omnis dolor et nihil eum et consectetur. Nobis enim id aut sunt facilis eveniet assumenda dolor. Blanditiis similique vel necessitatibus maiores.',4,1,NULL,'2023-01-12 18:04:16','2023-01-12 18:17:32'),(11,'Sit','Sit laudantium quia dicta et quia voluptas quos. Eos sed a et iste eaque at. Est amet illum est officiis ex. Ut neque odit nisi eligendi deserunt. Expedita quisquam eius consectetur et sed.',4,2,'2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(12,'Et','Non optio in quia perferendis. Sed veritatis dicta est praesentium placeat praesentium et cumque. Sint recusandae commodi voluptas fuga voluptatem. Occaecati amet libero illum sint accusantium.',5,2,'2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(13,'Et','Ut ut commodi iste eum eos in cupiditate. Delectus rerum consectetur minus illo.',5,1,NULL,'2023-01-12 18:04:16','2023-01-12 18:17:32'),(14,'Accusamus','Perferendis qui et consequuntur. Odit sed et dignissimos ratione provident error corporis sed. Cupiditate reprehenderit esse corrupti non quia omnis maxime. Vitae sapiente aut iste eligendi.',6,1,NULL,'2023-01-12 18:04:16','2023-01-12 18:17:32'),(15,'Provident','In non dolor error sed fuga. Voluptate itaque eos doloremque quo et maiores. Harum quia saepe aperiam velit. Quaerat quos quae voluptas sint quam non sed.',6,2,'2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(16,'Suscipit','Qui sapiente eaque et consequatur ad. Non eum illum ratione aut aliquid sed. Distinctio qui aut nisi in est ipsa voluptatem.',4,3,NULL,'2023-01-12 18:04:16','2023-01-12 18:19:32'),(17,'Et','Aut autem quia repellendus sapiente. Nemo omnis dicta eos quod. Iure tempore in porro repudiandae rerum vel veritatis. Esse nam asperiores accusamus.',5,3,NULL,'2023-01-12 18:04:17','2023-01-12 18:19:32'),(18,'Repellendus','Vero id distinctio officiis nemo. Consequatur ut nisi sunt nobis.',7,2,'2023-01-12 18:10:53','2023-01-12 18:04:17','2023-01-12 18:10:53'),(19,'Non','Dolorum dolores rerum consequatur omnis. Eaque aperiam ea praesentium blanditiis. Perferendis qui repudiandae recusandae sit accusantium recusandae esse. In eaque quia necessitatibus et quos soluta.',7,1,NULL,'2023-01-12 18:04:17','2023-01-12 18:17:32'),(20,'Voluptas','Commodi quis ratione minima suscipit doloribus temporibus cumque. Dolores sit illum ipsam et quia dolore mollitia. Eum quae sit non quisquam est et.',8,2,'2023-01-12 18:10:53','2023-01-12 18:04:17','2023-01-12 18:10:53'),(21,'Novo','novo',1,1,NULL,'2023-01-12 18:17:25','2023-01-12 18:17:32'),(22,'asdfa','asdfa',6,3,NULL,'2023-01-12 18:20:35','2023-01-12 18:20:35');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
INSERT INTO `columns` VALUES (1,'Vitae',NULL,'2023-01-12 18:04:16','2023-01-12 18:04:16'),(2,'Cupiditate','2023-01-12 18:10:53','2023-01-12 18:04:16','2023-01-12 18:10:53'),(3,'Ut',NULL,'2023-01-12 18:04:16','2023-01-12 18:04:16'),(4,'asdfasd',NULL,'2023-01-12 18:20:22','2023-01-12 18:20:22');
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (73,'2014_10_12_000000_create_users_table',1),(74,'2014_10_12_100000_create_password_resets_table',1),(75,'2019_08_19_000000_create_failed_jobs_table',1),(76,'2019_12_14_000001_create_personal_access_tokens_table',1),(77,'2023_01_11_163833_create_columns_table',1),(78,'2023_01_11_164135_create_cards_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


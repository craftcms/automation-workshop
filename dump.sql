/*
 Navicat Premium Data Transfer

 Source Server         : applefakenews.ddev.site
 Source Server Type    : MySQL
 Source Server Version : 100425 (10.4.25-MariaDB-1:10.4.25+maria~focal-log)
 Source Host           : localhost:55036
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 100425 (10.4.25-MariaDB-1:10.4.25+maria~focal-log)
 File Encoding         : 65001

 Date: 19/09/2022 17:29:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hxgakfkegvhapptmjgzorskpukdyeskefius` (`ownerId`),
  CONSTRAINT `fk_hxgakfkegvhapptmjgzorskpukdyeskefius` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mykejudwwubhmalndpfbiraxpmlilxyylujq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wokrndlqufpbshsxltdlkmaphdzcohmvcrgk` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_wprxcdqtfpvjnqexkvaqbtfthehoczskvexi` (`dateRead`),
  KEY `fk_mbvjjrzanqkxxhvkfbfguxndzsqlfdgfrizw` (`pluginId`),
  CONSTRAINT `fk_mbvjjrzanqkxxhvkfbfguxndzsqlfdgfrizw` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ufmkpjwtocnbmvfrawsgppswthhtikdejwqh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcements
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for applenews_articles
-- ----------------------------
DROP TABLE IF EXISTS `applenews_articles`;
CREATE TABLE `applenews_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `channelId` char(36) NOT NULL,
  `articleId` char(36) DEFAULT NULL,
  `revisionId` char(24) DEFAULT NULL,
  `isSponsored` tinyint(1) NOT NULL DEFAULT 0,
  `isPreview` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(255) NOT NULL,
  `shareUrl` varchar(255) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dnfkjnvbsvofmyiloeyoyrlciykspwiiosxy` (`entryId`,`channelId`),
  KEY `idx_msiyqluiddmkfuoslugelfevsxhyfghqmsza` (`entryId`,`channelId`,`state`),
  CONSTRAINT `fk_eezqptwwglvpdnagisbflnzueaqepjpfvqnh` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applenews_articles
-- ----------------------------
BEGIN;
INSERT INTO `applenews_articles` (`id`, `entryId`, `channelId`, `articleId`, `revisionId`, `isSponsored`, `isPreview`, `state`, `shareUrl`, `response`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 4, '22b3609e-f0a6-4c2a-8002-c44cff67868c', 'c167004c-d4a5-4658-9a8b-266e928aa1c7', 'AAAAAAAAAAD//////////w==', 0, 0, 'PROCESSING', 'https://apple.news/AwWcATNSlRliaiyZukoqhxw', '{\"data\":{\"createdAt\":\"2022-09-18T23:58:16Z\",\"modifiedAt\":\"2022-09-18T23:58:16Z\",\"id\":\"c167004c-d4a5-4658-9a8b-266e928aa1c7\",\"type\":\"article\",\"shareUrl\":\"https://apple.news/AwWcATNSlRliaiyZukoqhxw\",\"links\":{\"channel\":\"https://news-api.apple.com/channels/22b3609e-f0a6-4c2a-8002-c44cff67868c\",\"self\":\"https://news-api.apple.com/articles/c167004c-d4a5-4658-9a8b-266e928aa1c7\",\"sections\":[\"https://news-api.apple.com/sections/10870cb1-807f-38d4-9801-56280eb56b78\"]},\"document\":{\"version\":\"1.1\",\"identifier\":\"4\",\"title\":\"fdssdf\",\"language\":\"en_US\",\"layout\":{\"columns\":12,\"width\":1024,\"margin\":65,\"gutter\":20},\"metadata\":{\"authors\":[\"admin\"],\"canonicalURL\":\"https://applefakenews.ddev.site/news/fdssdf\",\"dateCreated\":\"2022-09-18T15:50:30-07:00\",\"dateModified\":\"2022-09-18T16:28:15-07:00\",\"datePublished\":\"2022-09-18T16:01:00-07:00\",\"excerpt\":\"aoeuaoeuaoeufds\",\"keywords\":[\"aoeuaoeuaoeufds\"],\"thumbnailURL\":null,\"generatorIdentifier\":\"CraftCMS\",\"generatorName\":\"Craft CMS\",\"generatorVersion\":\"4.2.4 (Apple News dev-master)\"},\"components\":[{\"role\":\"section\",\"layout\":{\"columnStart\":0,\"columnSpan\":12},\"components\":[{\"role\":\"title\",\"layout\":\"titleLayout\",\"text\":\"fdssdf\",\"textStyle\":\"titleTextStyle\"},{\"role\":\"byline\",\"textStyle\":\"bylineTextStyle\",\"layout\":\"bylineLayout\",\"text\":\"admin | 9/18/2022\"}]},{\"role\":\"container\",\"layout\":\"subscribeContainerLayout\",\"style\":\"subscribeContainerStyle\",\"components\":[{\"role\":\"body\",\"textStyle\":\"subscribeTextText\",\"layout\":\"subscribeLayout\",\"format\":\"markdown\",\"text\":\"[**Subscribe** to this newsletter for up to the minute news.](https://craftcms.com)\"}]}],\"componentLayouts\":{\"headerLayout\":{\"ignoreDocumentMargin\":true,\"margin\":{\"bottom\":40},\"minimumHeight\":\"70vh\"},\"titleLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":0}},\"bylineLayout\":{\"margin\":{\"bottom\":30}},\"bodyLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":35}},\"pullquoteContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":{\"top\":false,\"bottom\":false},\"margin\":{\"bottom\":40,\"top\":0}},\"pullquoteLayout\":{\"margin\":{\"top\":0,\"bottom\":0},\"columnStart\":0,\"columnSpan\":12},\"pullquoteAuthorLayout\":{\"margin\":{\"top\":0,\"bottom\":0}},\"photoLayout\":{\"columnSpan\":12,\"ignoreDocumentMargin\":true,\"margin\":{\"top\":20,\"bottom\":20}},\"photoWithCaptionLayout\":{\"columnSpan\":12,\"ignoreDocumentMargin\":true,\"margin\":{\"top\":20}},\"captionContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":{\"top\":false,\"bottom\":false},\"margin\":{\"bottom\":50}},\"captionTitleLayout\":{\"margin\":{\"top\":15,\"bottom\":15}},\"headingLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":10}},\"galleryLayout\":{\"margin\":{\"top\":10,\"bottom\":40}},\"subscribeContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":true},\"subscribeLayout\":{\"margin\":{\"top\":15,\"bottom\":15}}},\"componentStyles\":{\"captionContainerStyle\":{\"backgroundColor\":\"#EEEEEE\"},\"subscribeContainerStyle\":{\"backgroundColor\":\"#EEEEEE\"}},\"componentTextStyles\":{\"titleTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":75,\"lineHeight\":70,\"textAlignment\":\"center\"},\"bylineTextStyle\":{\"fontName\":\"AppleSDGothicNeo-Regular\",\"textColor\":\"#2A2A2A\",\"fontSize\":13,\"textAlignment\":\"center\"},\"bodyTextStyle\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#4A4A4A\",\"fontSize\":18,\"lineHeight\":28,\"hyphenation\":false,\"linkStyle\":{\"textColor\":\"#0072AD\",\"underline\":true}},\"dropcapBodyTextStyle\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#4A4A4A\",\"fontSize\":18,\"lineHeight\":28,\"hyphenation\":false,\"linkStyle\":{\"textColor\":\"#0072AD\",\"underline\":true},\"dropCapStyle\":{\"numberOfLines\":3,\"numberOfCharacters\":1,\"padding\":0,\"fontName\":\"AvenirNext-DemiBold\",\"textColor\":\"#2A2A2A\"}},\"pullquoteTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":65,\"lineHeight\":72,\"textAlignment\":\"center\"},\"pullquoteTextAuthor\":{\"fontName\":\"AppleSDGothicNeo-Regular\",\"textColor\":\"#676767\",\"fontSize\":13,\"textAlignment\":\"center\"},\"photoTextCaption\":{\"fontName\":\"AvenirNext-DemiBold\",\"textColor\":\"#2A2A2A\",\"textAlignment\":\"center\",\"fontSize\":18},\"headingTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":36,\"lineHeight\":42},\"subscribeTextText\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#2A2A2A\",\"textAlignment\":\"center\",\"fontSize\":18}}},\"revision\":\"AAAAAAAAAAD//////////w==\",\"state\":\"PROCESSING\",\"accessoryText\":null,\"title\":\"fdssdf\",\"maturityRating\":\"GENERAL\",\"warnings\":[{\"keypath\":[\"componentLayouts\",4],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":{\\\"top\\\":false,\\\"bottom\\\":false},\\\"margin\\\":{\\\"bottom\\\":40,\\\"top\\\":0},\\\"identifier\\\":\\\"pullquoteContainerLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",7],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"columnSpan\\\":12,\\\"ignoreDocumentMargin\\\":true,\\\"margin\\\":{\\\"top\\\":20,\\\"bottom\\\":20},\\\"identifier\\\":\\\"photoLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",8],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"columnSpan\\\":12,\\\"ignoreDocumentMargin\\\":true,\\\"margin\\\":{\\\"top\\\":20},\\\"identifier\\\":\\\"photoWithCaptionLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",9],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":{\\\"top\\\":false,\\\"bottom\\\":false},\\\"margin\\\":{\\\"bottom\\\":50},\\\"identifier\\\":\\\"captionContainerLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",13],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":true,\\\"identifier\\\":\\\"subscribeContainerLayout\\\"}.\"},{\"keypath\":[\"en-US\"],\"value\":\"en\",\"message\":\"The article’s language doesn’t match the channel’s language. Article language: en-US. Channel language: en.\"}],\"targetTerritoryCountryCodes\":[\"HK\",\"PS\",\"PT\",\"HN\",\"PW\",\"PY\",\"HR\",\"YE\",\"HU\",\"QA\",\"ID\",\"IE\",\"IL\",\"AE\",\"IN\",\"AG\",\"ZA\",\"AI\",\"IS\",\"AL\",\"IT\",\"AM\",\"AO\",\"AR\",\"AT\",\"AU\",\"AZ\",\"ZW\",\"RO\",\"BB\",\"RS\",\"BD\",\"JM\",\"RU\",\"BE\",\"BF\",\"JO\",\"BG\",\"JP\",\"BH\",\"BJ\",\"BM\",\"BN\",\"BO\",\"SA\",\"SB\",\"SC\",\"BR\",\"BS\",\"BT\",\"SE\",\"SG\",\"BW\",\"SI\",\"BY\",\"BZ\",\"SK\",\"SL\",\"KE\",\"SN\",\"KG\",\"KH\",\"CA\",\"SR\",\"ST\",\"SV\",\"KN\",\"CG\",\"CH\",\"CI\",\"SZ\",\"KR\",\"CL\",\"CM\",\"CN\",\"KW\",\"CO\",\"KY\",\"TC\",\"KZ\",\"CR\",\"TD\",\"CV\",\"TH\",\"LA\",\"CY\",\"LB\",\"TJ\",\"CZ\",\"LC\",\"TM\",\"TN\",\"LI\",\"TR\",\"LK\",\"TT\",\"DE\",\"TW\",\"TZ\",\"LR\",\"DK\",\"LT\",\"DM\",\"LU\",\"LV\",\"DO\",\"UA\",\"LY\",\"UG\",\"DZ\",\"MD\",\"MG\",\"US\",\"MK\",\"EC\",\"ML\",\"EE\",\"MM\",\"MN\",\"MO\",\"EG\",\"UY\",\"MR\",\"UZ\",\"MS\",\"MT\",\"MU\",\"MV\",\"MW\",\"MX\",\"MY\",\"VC\",\"MZ\",\"ES\",\"ET\",\"VE\",\"VG\",\"NA\",\"NE\",\"VN\",\"NG\",\"NI\",\"NL\",\"NO\",\"NP\",\"FI\",\"FJ\",\"FM\",\"NZ\",\"FR\",\"GB\",\"GD\",\"OM\",\"GH\",\"GM\",\"GR\",\"GT\",\"GW\",\"PA\",\"GY\",\"PE\",\"PG\",\"PH\",\"PK\",\"PL\",\"XT\"],\"isCandidateToBeFeatured\":false,\"isSponsored\":false,\"isPreview\":false,\"isDevelopingStory\":false,\"isHidden\":false},\"meta\":{\"throttling\":{\"isThrottled\":false,\"queueSize\":0,\"estimatedDelayInSeconds\":0,\"quotaAvailable\":200}}}', '2022-09-18 23:01:11', '2022-09-18 23:58:16', 'fe774076-c2e9-4661-b91e-759a3b4a9751');
INSERT INTO `applenews_articles` (`id`, `entryId`, `channelId`, `articleId`, `revisionId`, `isSponsored`, `isPreview`, `state`, `shareUrl`, `response`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 11, '22b3609e-f0a6-4c2a-8002-c44cff67868c', NULL, NULL, 0, 0, 'QUEUED', NULL, NULL, '2022-09-18 23:29:27', '2022-09-18 23:29:27', '46bf05b6-8e22-4ba5-90c2-f5acdfdb411a');
INSERT INTO `applenews_articles` (`id`, `entryId`, `channelId`, `articleId`, `revisionId`, `isSponsored`, `isPreview`, `state`, `shareUrl`, `response`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 17, '22b3609e-f0a6-4c2a-8002-c44cff67868c', NULL, NULL, 0, 0, 'QUEUED', NULL, NULL, '2022-09-18 23:42:12', '2022-09-18 23:42:12', '77ddb7d7-3244-46fb-beb7-b9e1eee7a79d');
INSERT INTO `applenews_articles` (`id`, `entryId`, `channelId`, `articleId`, `revisionId`, `isSponsored`, `isPreview`, `state`, `shareUrl`, `response`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 19, '22b3609e-f0a6-4c2a-8002-c44cff67868c', '333f8fc4-e7f0-4688-a429-2607e45d05f2', 'AAAAAAAAAAD//////////w==', 0, 0, 'PROCESSING', 'https://apple.news/AMz-PxOfwRoikKSYH5F0F8g', '{\"data\":{\"createdAt\":\"2022-09-19T00:00:22Z\",\"modifiedAt\":\"2022-09-19T00:00:22Z\",\"id\":\"333f8fc4-e7f0-4688-a429-2607e45d05f2\",\"type\":\"article\",\"shareUrl\":\"https://apple.news/AMz-PxOfwRoikKSYH5F0F8g\",\"links\":{\"channel\":\"https://news-api.apple.com/channels/22b3609e-f0a6-4c2a-8002-c44cff67868c\",\"self\":\"https://news-api.apple.com/articles/333f8fc4-e7f0-4688-a429-2607e45d05f2\",\"sections\":[\"https://news-api.apple.com/sections/10870cb1-807f-38d4-9801-56280eb56b78\"]},\"document\":{\"version\":\"1.1\",\"identifier\":\"19\",\"title\":\"fdsfsd\",\"language\":\"en_US\",\"layout\":{\"columns\":12,\"width\":1024,\"margin\":65,\"gutter\":20},\"metadata\":{\"authors\":[\"admin\"],\"canonicalURL\":\"https://applefakenews.ddev.site/news/fdsfsd\",\"dateCreated\":\"2022-09-18T17:00:17-07:00\",\"dateModified\":\"2022-09-18T17:00:20-07:00\",\"datePublished\":\"2022-09-18T17:00:00-07:00\",\"excerpt\":null,\"keywords\":[],\"thumbnailURL\":null,\"generatorIdentifier\":\"CraftCMS\",\"generatorName\":\"Craft CMS\",\"generatorVersion\":\"4.2.4 (Apple News dev-master)\"},\"components\":[{\"role\":\"section\",\"layout\":{\"columnStart\":0,\"columnSpan\":12},\"components\":[{\"role\":\"title\",\"layout\":\"titleLayout\",\"text\":\"fdsfsd\",\"textStyle\":\"titleTextStyle\"},{\"role\":\"byline\",\"textStyle\":\"bylineTextStyle\",\"layout\":\"bylineLayout\",\"text\":\"admin | 9/18/2022\"}]},{\"role\":\"container\",\"layout\":\"subscribeContainerLayout\",\"style\":\"subscribeContainerStyle\",\"components\":[{\"role\":\"body\",\"textStyle\":\"subscribeTextText\",\"layout\":\"subscribeLayout\",\"format\":\"markdown\",\"text\":\"[**Subscribe** to this newsletter for up to the minute news.](https://craftcms.com)\"}]}],\"componentLayouts\":{\"headerLayout\":{\"ignoreDocumentMargin\":true,\"margin\":{\"bottom\":40},\"minimumHeight\":\"70vh\"},\"titleLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":0}},\"bylineLayout\":{\"margin\":{\"bottom\":30}},\"bodyLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":35}},\"pullquoteContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":{\"top\":false,\"bottom\":false},\"margin\":{\"bottom\":40,\"top\":0}},\"pullquoteLayout\":{\"margin\":{\"top\":0,\"bottom\":0},\"columnStart\":0,\"columnSpan\":12},\"pullquoteAuthorLayout\":{\"margin\":{\"top\":0,\"bottom\":0}},\"photoLayout\":{\"columnSpan\":12,\"ignoreDocumentMargin\":true,\"margin\":{\"top\":20,\"bottom\":20}},\"photoWithCaptionLayout\":{\"columnSpan\":12,\"ignoreDocumentMargin\":true,\"margin\":{\"top\":20}},\"captionContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":{\"top\":false,\"bottom\":false},\"margin\":{\"bottom\":50}},\"captionTitleLayout\":{\"margin\":{\"top\":15,\"bottom\":15}},\"headingLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":10}},\"galleryLayout\":{\"margin\":{\"top\":10,\"bottom\":40}},\"subscribeContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":true},\"subscribeLayout\":{\"margin\":{\"top\":15,\"bottom\":15}}},\"componentStyles\":{\"captionContainerStyle\":{\"backgroundColor\":\"#EEEEEE\"},\"subscribeContainerStyle\":{\"backgroundColor\":\"#EEEEEE\"}},\"componentTextStyles\":{\"titleTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":75,\"lineHeight\":70,\"textAlignment\":\"center\"},\"bylineTextStyle\":{\"fontName\":\"AppleSDGothicNeo-Regular\",\"textColor\":\"#2A2A2A\",\"fontSize\":13,\"textAlignment\":\"center\"},\"bodyTextStyle\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#4A4A4A\",\"fontSize\":18,\"lineHeight\":28,\"hyphenation\":false,\"linkStyle\":{\"textColor\":\"#0072AD\",\"underline\":true}},\"dropcapBodyTextStyle\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#4A4A4A\",\"fontSize\":18,\"lineHeight\":28,\"hyphenation\":false,\"linkStyle\":{\"textColor\":\"#0072AD\",\"underline\":true},\"dropCapStyle\":{\"numberOfLines\":3,\"numberOfCharacters\":1,\"padding\":0,\"fontName\":\"AvenirNext-DemiBold\",\"textColor\":\"#2A2A2A\"}},\"pullquoteTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":65,\"lineHeight\":72,\"textAlignment\":\"center\"},\"pullquoteTextAuthor\":{\"fontName\":\"AppleSDGothicNeo-Regular\",\"textColor\":\"#676767\",\"fontSize\":13,\"textAlignment\":\"center\"},\"photoTextCaption\":{\"fontName\":\"AvenirNext-DemiBold\",\"textColor\":\"#2A2A2A\",\"textAlignment\":\"center\",\"fontSize\":18},\"headingTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":36,\"lineHeight\":42},\"subscribeTextText\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#2A2A2A\",\"textAlignment\":\"center\",\"fontSize\":18}}},\"revision\":\"AAAAAAAAAAD//////////w==\",\"state\":\"PROCESSING\",\"accessoryText\":null,\"title\":\"fdsfsd\",\"maturityRating\":\"GENERAL\",\"warnings\":[{\"keypath\":[\"componentLayouts\",4],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":{\\\"top\\\":false,\\\"bottom\\\":false},\\\"margin\\\":{\\\"bottom\\\":40,\\\"top\\\":0},\\\"identifier\\\":\\\"pullquoteContainerLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",7],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"columnSpan\\\":12,\\\"ignoreDocumentMargin\\\":true,\\\"margin\\\":{\\\"top\\\":20,\\\"bottom\\\":20},\\\"identifier\\\":\\\"photoLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",8],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"columnSpan\\\":12,\\\"ignoreDocumentMargin\\\":true,\\\"margin\\\":{\\\"top\\\":20},\\\"identifier\\\":\\\"photoWithCaptionLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",9],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":{\\\"top\\\":false,\\\"bottom\\\":false},\\\"margin\\\":{\\\"bottom\\\":50},\\\"identifier\\\":\\\"captionContainerLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",13],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":true,\\\"identifier\\\":\\\"subscribeContainerLayout\\\"}.\"},{\"keypath\":[\"en-US\"],\"value\":\"en\",\"message\":\"The article’s language doesn’t match the channel’s language. Article language: en-US. Channel language: en.\"}],\"targetTerritoryCountryCodes\":[\"HK\",\"PS\",\"PT\",\"HN\",\"PW\",\"PY\",\"HR\",\"YE\",\"HU\",\"QA\",\"ID\",\"IE\",\"IL\",\"AE\",\"IN\",\"AG\",\"ZA\",\"AI\",\"IS\",\"AL\",\"IT\",\"AM\",\"AO\",\"AR\",\"AT\",\"AU\",\"AZ\",\"ZW\",\"RO\",\"BB\",\"RS\",\"BD\",\"JM\",\"RU\",\"BE\",\"BF\",\"JO\",\"BG\",\"JP\",\"BH\",\"BJ\",\"BM\",\"BN\",\"BO\",\"SA\",\"SB\",\"SC\",\"BR\",\"BS\",\"BT\",\"SE\",\"SG\",\"BW\",\"SI\",\"BY\",\"BZ\",\"SK\",\"SL\",\"KE\",\"SN\",\"KG\",\"KH\",\"CA\",\"SR\",\"ST\",\"SV\",\"KN\",\"CG\",\"CH\",\"CI\",\"SZ\",\"KR\",\"CL\",\"CM\",\"CN\",\"KW\",\"CO\",\"KY\",\"TC\",\"KZ\",\"CR\",\"TD\",\"CV\",\"TH\",\"LA\",\"CY\",\"LB\",\"TJ\",\"CZ\",\"LC\",\"TM\",\"TN\",\"LI\",\"TR\",\"LK\",\"TT\",\"DE\",\"TW\",\"TZ\",\"LR\",\"DK\",\"LT\",\"DM\",\"LU\",\"LV\",\"DO\",\"UA\",\"LY\",\"UG\",\"DZ\",\"MD\",\"MG\",\"US\",\"MK\",\"EC\",\"ML\",\"EE\",\"MM\",\"MN\",\"MO\",\"EG\",\"UY\",\"MR\",\"UZ\",\"MS\",\"MT\",\"MU\",\"MV\",\"MW\",\"MX\",\"MY\",\"VC\",\"MZ\",\"ES\",\"ET\",\"VE\",\"VG\",\"NA\",\"NE\",\"VN\",\"NG\",\"NI\",\"NL\",\"NO\",\"NP\",\"FI\",\"FJ\",\"FM\",\"NZ\",\"FR\",\"GB\",\"GD\",\"OM\",\"GH\",\"GM\",\"GR\",\"GT\",\"GW\",\"PA\",\"GY\",\"PE\",\"PG\",\"PH\",\"PK\",\"PL\",\"XT\"],\"isCandidateToBeFeatured\":false,\"isSponsored\":false,\"isPreview\":false,\"isDevelopingStory\":false,\"isHidden\":false},\"meta\":{\"throttling\":{\"isThrottled\":false,\"queueSize\":0,\"estimatedDelayInSeconds\":0,\"quotaAvailable\":199}}}', '2022-09-19 00:00:20', '2022-09-19 00:00:22', '181ea104-aa41-4ed0-a1ca-aa91071fac53');
INSERT INTO `applenews_articles` (`id`, `entryId`, `channelId`, `articleId`, `revisionId`, `isSponsored`, `isPreview`, `state`, `shareUrl`, `response`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 68, '22b3609e-f0a6-4c2a-8002-c44cff67868c', 'fa7bf387-448c-4ab9-9a89-2135d3b48996', 'AAAAAAAAAAD//////////w==', 0, 0, 'LIVE', 'https://apple.news/A-nvzh0SMSrmaiSE107SJlg', '{\"data\":{\"createdAt\":\"2022-09-19T00:42:44Z\",\"modifiedAt\":\"2022-09-19T00:43:11Z\",\"id\":\"fa7bf387-448c-4ab9-9a89-2135d3b48996\",\"type\":\"article\",\"shareUrl\":\"https://apple.news/A-nvzh0SMSrmaiSE107SJlg\",\"links\":{\"channel\":\"https://news-api.apple.com/channels/22b3609e-f0a6-4c2a-8002-c44cff67868c\",\"self\":\"https://news-api.apple.com/articles/fa7bf387-448c-4ab9-9a89-2135d3b48996\",\"sections\":[\"https://news-api.apple.com/sections/10870cb1-807f-38d4-9801-56280eb56b78\"]},\"document\":{\"version\":\"1.1\",\"identifier\":\"68\",\"title\":\"This is an important Fake News post!\",\"language\":\"en_US\",\"layout\":{\"columns\":12,\"width\":1024,\"margin\":65,\"gutter\":20},\"metadata\":{\"authors\":[\"admin\"],\"canonicalURL\":\"https://applefakenews.ddev.site/news/this-is-an-important-fake-news-post\",\"dateCreated\":\"2022-09-18T17:24:48-07:00\",\"dateModified\":\"2022-09-18T17:35:24-07:00\",\"datePublished\":\"2022-09-18T17:35:00-07:00\",\"excerpt\":\"You\'ve got to see this news post!\",\"keywords\":[\"youve\",\"got\",\"to\",\"see\",\"this\",\"news\",\"post\"],\"thumbnailURL\":\"bundle://shinybrad.png\",\"generatorIdentifier\":\"CraftCMS\",\"generatorName\":\"Craft CMS\",\"generatorVersion\":\"4.2.4 (Apple News dev-master)\"},\"components\":[{\"role\":\"section\",\"layout\":{\"columnStart\":0,\"columnSpan\":12,\"ignoreDocumentMargin\":true},\"scene\":{\"type\":\"parallax_scale\"},\"components\":[{\"role\":\"header\",\"layout\":\"headerLayout\",\"style\":{\"fill\":{\"type\":\"image\",\"URL\":\"bundle://shinybrad.png\",\"fillMode\":\"cover\",\"verticalAlignment\":\"top\"}},\"components\":[{\"role\":\"container\",\"anchor\":{\"targetAnchorPosition\":\"bottom\",\"originAnchorPosition\":\"bottom\"},\"style\":{\"fill\":{\"type\":\"linear_gradient\",\"colorStops\":[{\"color\":\"#00000000\",\"location\":50},{\"color\":\"#00000080\"}]}},\"layout\":{\"ignoreDocumentMargin\":true,\"minimumHeight\":\"70vh\"},\"components\":[{\"role\":\"container\",\"anchor\":{\"targetAnchorPosition\":\"bottom\",\"originAnchorPosition\":\"bottom\"},\"components\":[{\"role\":\"title\",\"layout\":\"titleLayout\",\"text\":\"This is an important Fake News post!\",\"textStyle\":\"titleTextStyle\"},{\"role\":\"byline\",\"textStyle\":\"bylineTextStyle\",\"layout\":\"bylineLayout\",\"text\":\"admin | 9/18/2022\"}]}]}]}]},{\"role\":\"heading\",\"layout\":\"headingLayout\",\"textStyle\":\"headingTextStyle\",\"text\":\"Heading 1\"},{\"role\":\"body\",\"text\":\"Text 1\",\"format\":\"markdown\",\"layout\":\"bodyLayout\",\"textStyle\":\"dropcapBodyTextStyle\"},{\"role\":\"container\",\"layout\":\"pullquoteContainerLayout\",\"components\":[{\"role\":\"pullquote\",\"textStyle\":\"pullquoteTextStyle\",\"layout\":\"pullquoteLayout\",\"text\":\"“\\\"Shiny Brad saved my life!\\\"”\",\"animation\":{\"type\":\"fade_in\"}}]},{\"role\":\"container\",\"layout\":{\"ignoreDocumentMargin\":true},\"components\":[{\"role\":\"photo\",\"URL\":\"bundle://ryan-reynolds.png\",\"layout\":\"photoWithCaptionLayout\",\"caption\":\"That doesn\'t look like Ryan Reynolds.\"},{\"role\":\"container\",\"layout\":\"captionContainerLayout\",\"style\":\"captionContainerStyle\",\"components\":[{\"role\":\"caption\",\"textStyle\":\"photoTextCaption\",\"layout\":\"captionTitleLayout\",\"format\":\"markdown\",\"text\":\"That doesn\'t look like Ryan Reynolds.\"}]}]},{\"role\":\"gallery\",\"layout\":\"galleryLayout\",\"items\":[{\"URL\":\"bundle://skis.jpg\",\"caption\":null},{\"URL\":\"bundle://sports-r-us-thumb.jpg\",\"caption\":null},{\"URL\":\"bundle://sportsrus-bigfeature.jpg\",\"caption\":null}]},{\"role\":\"container\",\"layout\":\"pullquoteContainerLayout\",\"components\":[{\"role\":\"pullquote\",\"textStyle\":\"pullquoteTextStyle\",\"layout\":\"pullquoteLayout\",\"text\":\"“\\\"Incredible\\\"”\",\"animation\":{\"type\":\"fade_in\"}},{\"role\":\"pullquote\",\"textStyle\":\"pullquoteTextAuthor\",\"layout\":\"pullquoteAuthorLayout\",\"text\":\"Brad\"}]},{\"role\":\"container\",\"layout\":\"subscribeContainerLayout\",\"style\":\"subscribeContainerStyle\",\"components\":[{\"role\":\"body\",\"textStyle\":\"subscribeTextText\",\"layout\":\"subscribeLayout\",\"format\":\"markdown\",\"text\":\"[**Subscribe** to this newsletter for up to the minute news.](https://craftcms.com)\"}]}],\"componentLayouts\":{\"headerLayout\":{\"ignoreDocumentMargin\":true,\"margin\":{\"bottom\":40},\"minimumHeight\":\"70vh\"},\"titleLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":0}},\"bylineLayout\":{\"margin\":{\"bottom\":30}},\"bodyLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":35}},\"pullquoteContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":{\"top\":false,\"bottom\":false},\"margin\":{\"bottom\":40,\"top\":0}},\"pullquoteLayout\":{\"margin\":{\"top\":0,\"bottom\":0},\"columnStart\":0,\"columnSpan\":12},\"pullquoteAuthorLayout\":{\"margin\":{\"top\":0,\"bottom\":0}},\"photoLayout\":{\"columnSpan\":12,\"ignoreDocumentMargin\":true,\"margin\":{\"top\":20,\"bottom\":20}},\"photoWithCaptionLayout\":{\"columnSpan\":12,\"ignoreDocumentMargin\":true,\"margin\":{\"top\":20}},\"captionContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":{\"top\":false,\"bottom\":false},\"margin\":{\"bottom\":50}},\"captionTitleLayout\":{\"margin\":{\"top\":15,\"bottom\":15}},\"headingLayout\":{\"columnStart\":1,\"columnSpan\":10,\"margin\":{\"bottom\":10}},\"galleryLayout\":{\"margin\":{\"top\":10,\"bottom\":40}},\"subscribeContainerLayout\":{\"ignoreDocumentMargin\":true,\"columnSpan\":12,\"contentInset\":true},\"subscribeLayout\":{\"margin\":{\"top\":15,\"bottom\":15}}},\"componentStyles\":{\"captionContainerStyle\":{\"backgroundColor\":\"#EEEEEE\"},\"subscribeContainerStyle\":{\"backgroundColor\":\"#EEEEEE\"}},\"componentTextStyles\":{\"titleTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#FFF\",\"fontSize\":75,\"lineHeight\":70,\"textAlignment\":\"center\"},\"bylineTextStyle\":{\"fontName\":\"AppleSDGothicNeo-Regular\",\"textColor\":\"#FFF\",\"fontSize\":13,\"textAlignment\":\"center\"},\"bodyTextStyle\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#4A4A4A\",\"fontSize\":18,\"lineHeight\":28,\"hyphenation\":false,\"linkStyle\":{\"textColor\":\"#0072AD\",\"underline\":true}},\"dropcapBodyTextStyle\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#4A4A4A\",\"fontSize\":18,\"lineHeight\":28,\"hyphenation\":false,\"linkStyle\":{\"textColor\":\"#0072AD\",\"underline\":true},\"dropCapStyle\":{\"numberOfLines\":3,\"numberOfCharacters\":1,\"padding\":0,\"fontName\":\"AvenirNext-DemiBold\",\"textColor\":\"#2A2A2A\"}},\"pullquoteTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":65,\"lineHeight\":72,\"textAlignment\":\"center\"},\"pullquoteTextAuthor\":{\"fontName\":\"AppleSDGothicNeo-Regular\",\"textColor\":\"#676767\",\"fontSize\":13,\"textAlignment\":\"center\"},\"photoTextCaption\":{\"fontName\":\"AvenirNext-DemiBold\",\"textColor\":\"#2A2A2A\",\"textAlignment\":\"center\",\"fontSize\":18},\"headingTextStyle\":{\"fontName\":\"AvenirNext-Bold\",\"textColor\":\"#2A2A2A\",\"fontSize\":36,\"lineHeight\":42},\"subscribeTextText\":{\"fontName\":\"AvenirNext-Medium\",\"textColor\":\"#2A2A2A\",\"textAlignment\":\"center\",\"fontSize\":18}}},\"revision\":\"AAAAAAAAAAD//////////w==\",\"state\":\"LIVE\",\"accessoryText\":null,\"title\":\"This is an important Fake News post!\",\"maturityRating\":\"GENERAL\",\"warnings\":[{\"keypath\":[\"componentLayouts\",4],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":{\\\"top\\\":false,\\\"bottom\\\":false},\\\"margin\\\":{\\\"bottom\\\":40,\\\"top\\\":0},\\\"identifier\\\":\\\"pullquoteContainerLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",7],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"columnSpan\\\":12,\\\"ignoreDocumentMargin\\\":true,\\\"margin\\\":{\\\"top\\\":20,\\\"bottom\\\":20},\\\"identifier\\\":\\\"photoLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",8],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"columnSpan\\\":12,\\\"ignoreDocumentMargin\\\":true,\\\"margin\\\":{\\\"top\\\":20},\\\"identifier\\\":\\\"photoWithCaptionLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",9],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":{\\\"top\\\":false,\\\"bottom\\\":false},\\\"margin\\\":{\\\"bottom\\\":50},\\\"identifier\\\":\\\"captionContainerLayout\\\"}.\"},{\"keypath\":[\"componentLayouts\",13],\"value\":null,\"message\":\"Missing value for columnStart property{\\\"ignoreDocumentMargin\\\":true,\\\"columnSpan\\\":12,\\\"contentInset\\\":true,\\\"identifier\\\":\\\"subscribeContainerLayout\\\"}.\"},{\"keypath\":[\"components\",4,\"components\",0],\"value\":null,\"message\":\"Image width is 84 px and should be greater than or equal to 640 px.\"},{\"keypath\":[\"components\",5,\"items\",1],\"value\":null,\"message\":\"Image width is 283 px and should be greater than or equal to 640 px.\"},{\"keypath\":[\"components\",5,\"items\",2],\"value\":null,\"message\":\"Image aspect ratio is 3.39 and should be greater than 0.5 and less than 3.0.\"},{\"keypath\":[\"en-US\"],\"value\":\"en\",\"message\":\"The article’s language doesn’t match the channel’s language. Article language: en-US. Channel language: en.\"}],\"targetTerritoryCountryCodes\":[\"HK\",\"PS\",\"PT\",\"HN\",\"PW\",\"PY\",\"HR\",\"YE\",\"HU\",\"QA\",\"ID\",\"IE\",\"IL\",\"AE\",\"IN\",\"AG\",\"ZA\",\"AI\",\"IS\",\"AL\",\"IT\",\"AM\",\"AO\",\"AR\",\"AT\",\"AU\",\"AZ\",\"ZW\",\"RO\",\"BB\",\"RS\",\"BD\",\"JM\",\"RU\",\"BE\",\"BF\",\"JO\",\"BG\",\"JP\",\"BH\",\"BJ\",\"BM\",\"BN\",\"BO\",\"SA\",\"SB\",\"SC\",\"BR\",\"BS\",\"BT\",\"SE\",\"SG\",\"BW\",\"SI\",\"BY\",\"BZ\",\"SK\",\"SL\",\"KE\",\"SN\",\"KG\",\"KH\",\"CA\",\"SR\",\"ST\",\"SV\",\"KN\",\"CG\",\"CH\",\"CI\",\"SZ\",\"KR\",\"CL\",\"CM\",\"CN\",\"KW\",\"CO\",\"KY\",\"TC\",\"KZ\",\"CR\",\"TD\",\"CV\",\"TH\",\"LA\",\"CY\",\"LB\",\"TJ\",\"CZ\",\"LC\",\"TM\",\"TN\",\"LI\",\"TR\",\"LK\",\"TT\",\"DE\",\"TW\",\"TZ\",\"LR\",\"DK\",\"LT\",\"DM\",\"LU\",\"LV\",\"DO\",\"UA\",\"LY\",\"UG\",\"DZ\",\"MD\",\"MG\",\"US\",\"MK\",\"EC\",\"ML\",\"EE\",\"MM\",\"MN\",\"MO\",\"EG\",\"UY\",\"MR\",\"UZ\",\"MS\",\"MT\",\"MU\",\"MV\",\"MW\",\"MX\",\"MY\",\"VC\",\"MZ\",\"ES\",\"ET\",\"VE\",\"VG\",\"NA\",\"NE\",\"VN\",\"NG\",\"NI\",\"NL\",\"NO\",\"NP\",\"FI\",\"FJ\",\"FM\",\"NZ\",\"FR\",\"GB\",\"GD\",\"OM\",\"GH\",\"GM\",\"GR\",\"GT\",\"GW\",\"PA\",\"GY\",\"PE\",\"PG\",\"PH\",\"PK\",\"PL\",\"XT\"],\"isCandidateToBeFeatured\":false,\"isSponsored\":false,\"isPreview\":false,\"isDevelopingStory\":false,\"isHidden\":false}}', '2022-09-19 00:35:25', '2022-09-19 00:43:26', 'eba24911-cf6a-4458-8184-f12f7ee2b5e2');
COMMIT;

-- ----------------------------
-- Table structure for assetindexdata
-- ----------------------------
DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_voxhpchrdukrcsmyducvvnwsqrpoxdkdepkc` (`sessionId`,`volumeId`),
  KEY `idx_tgsbhdkrgkmjagwpenessjwyqskjrmofwdnx` (`volumeId`),
  CONSTRAINT `fk_fvcojhujaqvpjmnqeiyywlakcdqsbsbpcymu` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pynghuwgdxvoiameiycaitvyerocfxunlebr` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assetindexdata
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for assetindexingsessions
-- ----------------------------
DROP TABLE IF EXISTS `assetindexingsessions`;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assetindexingsessions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yolpcdipokqgdzmjmcqguxnucijsxhmmnrvv` (`filename`,`folderId`),
  KEY `idx_spkqonawlueohmkmupxsezkzwzxtouhilxis` (`folderId`),
  KEY `idx_rxfzstknqnofiastbbicmdasjfirovosvbci` (`volumeId`),
  KEY `fk_evegykddyasgmqwunjkwugruvwpjcghumxxx` (`uploaderId`),
  CONSTRAINT `fk_bwugxoswwovazbpkwjlzetmdkyczmgloeptr` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eghiwpifnxeghseflgslcngvggqvldsohwls` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_evegykddyasgmqwunjkwugruvwpjcghumxxx` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qwehaxnqtlbfuxuajqjphpgawkulqkkytkzy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets
-- ----------------------------
BEGIN;
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (69, 1, 1, NULL, 'app-development.jpg', 'image', NULL, 284, 204, 354634, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:20', '2022-09-19 00:32:20');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (70, 1, 1, NULL, 'augmented-reality-icons.png', 'image', NULL, 960, 102, 4733, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:20', '2022-09-19 00:32:20');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (71, 1, 1, NULL, 'augmented-reality.jpg', 'image', NULL, 1420, 1020, 121601, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:20', '2022-09-19 00:32:20');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (72, 1, 1, NULL, 'awesome-cities.jpg', 'image', NULL, 416, 215, 34386, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:20', '2022-09-19 00:32:20');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (73, 1, 1, NULL, 'bar.jpg', 'image', NULL, 960, 463, 94182, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:20', '2022-09-19 00:32:20');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (74, 1, 1, NULL, 'bike.jpg', 'image', NULL, 283, 273, 30193, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (75, 1, 1, NULL, 'bob-guff.png', 'image', NULL, 84, 84, 148537, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (76, 1, 1, NULL, 'chicago-office.jpg', 'image', NULL, 700, 424, 408964, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (77, 1, 1, NULL, 'coffee-shop.jpg', 'image', NULL, 1420, 1360, 344802, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (78, 1, 1, NULL, 'create-genius.jpg', 'image', NULL, 1200, 394, 392282, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (79, 1, 1, NULL, 'development.jpg', 'image', NULL, 284, 204, 344439, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (80, 1, 1, NULL, 'discover.jpg', 'image', NULL, 1200, 394, 372014, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (81, 1, 1, NULL, 'diva-bigimage.jpg', 'image', NULL, 1500, 493, 410298, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (82, 1, 1, NULL, 'diva-cover.jpg', 'image', NULL, 570, 345, 392042, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (83, 1, 1, NULL, 'diva-interface-detail.png', 'image', NULL, 622, 331, 603612, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (84, 1, 1, NULL, 'diva-interface-work.jpg', 'image', NULL, 1400, 324, 50231, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (85, 1, 1, NULL, 'diva-mobile-detail.png', 'image', NULL, 640, 1136, 108139, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (86, 1, 1, NULL, 'email-marketing.jpg', 'image', NULL, 284, 204, 352431, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (87, 1, 1, NULL, 'explore.jpg', 'image', NULL, 1200, 394, 378032, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:21', '2022-09-19 00:32:21');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (88, 1, 1, NULL, 'fist.jpg', 'image', NULL, 1420, 904, 254933, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (89, 1, 1, NULL, 'gallery.png', 'image', NULL, 1440, 480, 715290, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (90, 1, 1, NULL, 'glasses.jpg', 'image', NULL, 283, 273, 22694, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (91, 1, 1, NULL, 'hero-image.jpg', 'image', NULL, 1450, 916, 246984, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (92, 1, 1, NULL, 'laptop-desk.jpg', 'image', NULL, 440, 250, 23028, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (93, 1, 1, NULL, 'larry-page.png', 'image', NULL, 84, 84, 151220, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (94, 1, 1, NULL, 'macbook-table.jpg', 'image', NULL, 363, 255, 385499, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (95, 1, 1, NULL, 'macbook.jpg', 'image', NULL, 440, 284, 23739, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (96, 1, 1, NULL, 'moosic-app-ui.jpg', 'image', NULL, 700, 522, 394407, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (97, 1, 1, NULL, 'news-entry-1-image.jpg', 'image', NULL, 283, 204, 382424, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (98, 1, 1, NULL, 'news-link-1-image.jpg', 'image', NULL, 283, 204, 369861, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (99, 1, 1, NULL, 'news-link-2-image.jpg', 'image', NULL, 283, 204, 367515, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (100, 1, 1, NULL, 'on-track-thumb.jpg', 'image', NULL, 284, 204, 140750, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (101, 1, 1, NULL, 'ontrack-bigimage.jpg', 'image', NULL, 1500, 493, 404370, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (102, 1, 1, NULL, 'pong.png', 'image', NULL, 1420, 394, 6575, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:22', '2022-09-19 00:32:22');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (103, 1, 1, NULL, 'ryan-reynolds.png', 'image', NULL, 84, 84, 150711, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (104, 1, 1, NULL, 'seo.jpg', 'image', NULL, 284, 204, 356107, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (105, 1, 1, NULL, 'shinybrad.png', 'image', NULL, 460, 460, 54690, NULL, NULL, NULL, '2022-09-18 21:10:10', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (106, 1, 1, NULL, 'skateboard.jpg', 'image', NULL, 283, 273, 14841, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (107, 1, 1, NULL, 'skis.jpg', 'image', NULL, 800, 800, 379214, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (108, 1, 1, NULL, 'sports-r-us-thumb.jpg', 'image', NULL, 283, 204, 139546, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (109, 1, 1, NULL, 'sportsrus-bigfeature.jpg', 'image', NULL, 1513, 446, 382101, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (110, 1, 10, NULL, 'crystal.jpg', 'image', NULL, 560, 560, 66055, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (111, 1, 10, NULL, 'liz.jpg', 'image', NULL, 560, 560, 80728, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (112, 1, 10, NULL, 'travis.jpg', 'image', NULL, 560, 560, 91101, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (113, 1, 1, NULL, 'strategy.jpg', 'image', NULL, 284, 204, 366918, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (114, 1, 1, NULL, 'video.jpg', 'image', NULL, 440, 250, 10690, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES (115, 1, 1, NULL, 'water-barley-hops.jpg', 'image', NULL, 1420, 728, 182308, NULL, NULL, NULL, '2022-09-16 00:28:55', '2022-09-19 00:32:23', '2022-09-19 00:32:23');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ixhhdltghqawrjrqgipwcgkivksvuxucsjib` (`groupId`),
  KEY `fk_oiwmgfdquufnipaybeeaueagzhuipziajipd` (`parentId`),
  CONSTRAINT `fk_oiwmgfdquufnipaybeeaueagzhuipziajipd` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tkwjogftwnvctnvxszhpbjaspobsoghstoxs` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpxjacbyjhoiyodtqvewjiixyuurgdrvyzib` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categorygroups
-- ----------------------------
DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scjsjuhgdjbjmmdxkiqxkfumlrowpnrkerda` (`name`),
  KEY `idx_hfizljfralcoadrilqppbzusyjdcmccddbcr` (`handle`),
  KEY `idx_ujrcmzdlwmuocsjnlbncffpssyuoojfayski` (`structureId`),
  KEY `idx_njksrequswgsxosvqfdibhgldzdfpazzcatf` (`fieldLayoutId`),
  KEY `idx_wryleqqrtrbygvmtmsvploudfolvzjmrfoth` (`dateDeleted`),
  CONSTRAINT `fk_cdlzxfdgnkwyujcbbdzecoxakcnbarnuqwfu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mhohzczbzfucvuxtqcjacrwfakagjpwocsqj` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorygroups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categorygroups_sites
-- ----------------------------
DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pmvvoiwtoryijajhauydrwpejneocphceuci` (`groupId`,`siteId`),
  KEY `idx_ogpbrzajisdpqctbqsriwzcpngiewfiontac` (`siteId`),
  CONSTRAINT `fk_anjqcqagohrysiwdpapcfctghrxoqwuiqjte` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zakkbuztpzalektvzqfvktosxxblvpkxlrjd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorygroups_sites
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for changedattributes
-- ----------------------------
DROP TABLE IF EXISTS `changedattributes`;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ppuxmxvmwoctngukfftweknseiyvwxvxhpfg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_koglurueumpjfhfspfznaxcccgorgjhhwvpi` (`siteId`),
  KEY `fk_mybnpebsmaqoedolncvpskdjusfknszozolg` (`userId`),
  CONSTRAINT `fk_eilnhtvoidhvdrypibqqlgzvyodxtopahzgn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_koglurueumpjfhfspfznaxcccgorgjhhwvpi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mybnpebsmaqoedolncvpskdjusfknszozolg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changedattributes
-- ----------------------------
BEGIN;
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 'fieldLayoutId', '2022-09-18 22:32:23', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 'postDate', '2022-09-18 22:37:14', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 'slug', '2022-09-18 22:41:50', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 'title', '2022-09-18 22:37:11', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 'typeId', '2022-09-18 22:32:23', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 'uri', '2022-09-18 22:41:50', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (4, 1, 'postDate', '2022-09-18 23:01:11', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (4, 1, 'slug', '2022-09-18 23:01:08', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (4, 1, 'title', '2022-09-18 23:01:08', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (4, 1, 'uri', '2022-09-18 23:01:08', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (11, 1, 'postDate', '2022-09-18 23:29:27', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (11, 1, 'slug', '2022-09-18 23:29:25', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (11, 1, 'title', '2022-09-18 23:29:25', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (11, 1, 'uri', '2022-09-18 23:29:25', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (17, 1, 'postDate', '2022-09-18 23:41:47', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (17, 1, 'slug', '2022-09-18 23:41:40', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (17, 1, 'title', '2022-09-18 23:41:40', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (17, 1, 'uri', '2022-09-18 23:41:40', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (19, 1, 'postDate', '2022-09-19 00:00:20', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (19, 1, 'slug', '2022-09-19 00:00:19', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (19, 1, 'title', '2022-09-19 00:00:19', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (19, 1, 'uri', '2022-09-19 00:00:19', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 'postDate', '2022-09-19 00:35:24', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 'slug', '2022-09-19 00:25:02', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 'title', '2022-09-19 00:25:02', 0, 1);
INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 'uri', '2022-09-19 00:25:02', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for changedfields
-- ----------------------------
DROP TABLE IF EXISTS `changedfields`;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_fpgehrlksegkmovryxydesukjmielvsycysi` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_lnpnngnzxrwygoakrwnajlwfaebfmdodlppb` (`siteId`),
  KEY `fk_cdlxfqjfhddlvpvswcnfjouhuregzhbnkbbe` (`fieldId`),
  KEY `fk_ithxiaalqksehhotgppporhnjopouromrpjq` (`userId`),
  CONSTRAINT `fk_cdlxfqjfhddlvpvswcnfjouhuregzhbnkbbe` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ithxiaalqksehhotgppporhnjopouromrpjq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_lnpnngnzxrwygoakrwnajlwfaebfmdodlppb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yqdimedcaueagpkfpknkicbxzwgniqivnjxw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changedfields
-- ----------------------------
BEGIN;
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (2, 1, 20, '2022-09-18 22:41:50', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (4, 1, 3, '2022-09-18 23:19:48', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (11, 1, 3, '2022-09-18 23:33:04', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (17, 1, 3, '2022-09-18 23:41:42', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 1, '2022-09-19 00:25:03', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 2, '2022-09-19 00:32:52', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 3, '2022-09-19 00:33:05', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 4, '2022-09-19 00:33:37', 0, 1);
INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES (68, 1, 6, '2022-09-19 00:35:22', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_featuredEntry_kauxckir` tinyint(1) DEFAULT NULL,
  `field_shortDescription_skftcfss` text DEFAULT NULL,
  `field_heading_osfcbmcs` varchar(1020) DEFAULT NULL,
  `field_subheading_fihbeuel` varchar(1020) DEFAULT NULL,
  `field_linkUrl_urvisobw` varchar(1020) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fruprrwzmhiswbwkwepnoychbnlstiyikpug` (`elementId`,`siteId`),
  KEY `idx_zueeyhwokgnuudjofwkhrlpqtsxauskzodji` (`siteId`),
  KEY `idx_iuakzqroqhcvleopwhyisyyezskmkvioposo` (`title`),
  CONSTRAINT `fk_jjeyvcypdbltjkfjwjvixrxhaaxgawpxwlde` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uokbjeqjuhsazwwnifomliycafsftbsetkmr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
BEGIN;
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (1, 1, 1, NULL, '2022-09-16 01:42:56', '2022-09-16 01:42:56', '32e04aba-0e73-4508-bdd5-b72865aa1151', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (2, 2, 1, 'Test', '2022-09-18 22:31:53', '2022-09-18 22:41:50', 'fe2a631b-ee9e-471e-8bd5-b54dfcf2a4b8', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (3, 3, 1, 'Test', '2022-09-18 22:41:50', '2022-09-18 22:41:50', '8dd0c710-8229-47e5-9624-e3e28becfe06', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (4, 4, 1, 'fdssdf', '2022-09-18 22:50:30', '2022-09-18 23:28:15', 'f5ec87ad-0d62-430c-ba12-b5d8fc7b5a4a', 0, '<p>aoeuaoeuaoeufds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (5, 5, 1, 'fdssdf', '2022-09-18 23:01:11', '2022-09-18 23:01:11', 'e450422e-4bc8-4636-8ec6-95eea6fd693e', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (7, 7, 1, 'fdssdf', '2022-09-18 23:19:48', '2022-09-18 23:19:48', 'f874544e-0e09-4ce7-a5cd-13532bc3fbc9', 0, '<p>aoeuaoeuaoeufds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (8, 8, 1, 'fdssdf', '2022-09-18 23:21:34', '2022-09-18 23:21:34', '3c897dad-5e0d-4746-8508-522d71418ac9', 0, '<p>aoeuaoeuaoeufds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (9, 9, 1, 'fdssdf', '2022-09-18 23:22:55', '2022-09-18 23:22:55', 'ee13432c-a95c-4b92-b840-550d8243175b', 0, '<p>aoeuaoeuaoeufds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (10, 10, 1, 'fdssdf', '2022-09-18 23:28:15', '2022-09-18 23:28:15', '53b3ac5c-e040-45b8-becb-2d82c845f73d', 0, '<p>aoeuaoeuaoeufds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (11, 11, 1, 'fds', '2022-09-18 23:29:23', '2022-09-18 23:33:04', 'dcaff1e3-ecee-455d-b678-4f530f537b8b', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (12, 12, 1, 'fds', '2022-09-18 23:29:27', '2022-09-18 23:29:27', '6d4a32ab-5733-41ff-b963-21176c0af5b6', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (14, 14, 1, 'fds', '2022-09-18 23:31:02', '2022-09-18 23:31:02', 'f4ff6158-149d-4673-92db-f0395fe917a6', 0, '<p>fds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (16, 16, 1, 'fds', '2022-09-18 23:33:04', '2022-09-18 23:33:04', 'cda7719b-98ce-4f91-89ef-5e55ab4a3227', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (17, 17, 1, 'fds', '2022-09-18 23:41:31', '2022-09-18 23:41:47', '58b1ff48-6181-4808-93fb-afe9aabd4eb0', 0, '<p>fds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (18, 18, 1, 'fds', '2022-09-18 23:42:12', '2022-09-18 23:42:12', '6788ee6a-8b85-48de-a5e4-25a4a79ac227', 0, '<p>fds</p>', NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (19, 19, 1, 'fdsfsd', '2022-09-19 00:00:17', '2022-09-19 00:00:20', '292b04f2-72e0-4f9a-a4e4-8569322ecd2d', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (20, 20, 1, 'fdsfsd', '2022-09-19 00:00:20', '2022-09-19 00:00:20', '63a18a18-36a0-4ad2-a40b-45fa55b8c6e5', 0, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (68, 68, 1, 'This is an important Fake News post!', '2022-09-19 00:24:48', '2022-09-19 00:35:24', 'ad463ea2-36a1-4e93-8b05-23fb06141943', 1, '<p>You\'ve <em>got</em> to see this news post!</p>', 'You won\'t believe these 10 tricks to lose weight while still drinking!', NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (69, 69, 1, 'App development', '2022-09-19 00:32:20', '2022-09-19 00:32:20', '9daf0dd2-85c3-402d-8822-56897630aaa7', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (70, 70, 1, 'Augmented reality icons', '2022-09-19 00:32:20', '2022-09-19 00:32:20', 'b7e0fc32-f4df-4004-a981-ee092a9cbffe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (71, 71, 1, 'Augmented reality', '2022-09-19 00:32:20', '2022-09-19 00:32:20', '429d4a36-f797-4f9e-880d-4fcf042a41fa', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (72, 72, 1, 'Awesome cities', '2022-09-19 00:32:20', '2022-09-19 00:32:20', 'a5f6bfdc-4661-43cc-97ab-69101872628e', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (73, 73, 1, 'Bar', '2022-09-19 00:32:20', '2022-09-19 00:32:20', '5559c6f8-0d20-4d3e-8f27-8a5d6f9e071a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (74, 74, 1, 'Bike', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'cdc78a65-9aa7-4acc-96e6-409ee96f6ff6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (75, 75, 1, 'Bob guff', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'fea97268-d56c-4b79-85ec-f82604cde934', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (76, 76, 1, 'Chicago office', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '3d2f4d3a-34a0-4f35-bab2-0c7211406238', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (77, 77, 1, 'Coffee shop', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'a67cb53f-c266-40e3-8d27-565f6f22c7c3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (78, 78, 1, 'Create genius', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'aeaeb043-9029-4e0c-bd02-777a4fe2e282', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (79, 79, 1, 'Development', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '42400edd-46d3-4e84-9361-df976c59fd0d', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (80, 80, 1, 'Discover', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'cdf4b5af-4f5c-49a6-be8a-2ab45c0afdb4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (81, 81, 1, 'Diva bigimage', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '712e6434-60db-4055-a582-06c8c19e198d', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (82, 82, 1, 'Diva cover', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'a1c165ff-2f3b-4b00-9131-484085176fdf', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (83, 83, 1, 'Diva interface detail', '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'ec755506-d496-4cd0-8da2-858b11dcd27f', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (84, 84, 1, 'Diva interface work', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '9a445482-81ea-42fa-8b5d-e71bcbdc467f', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (85, 85, 1, 'Diva mobile detail', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '13d82c53-44bf-4329-9b39-df6c01a7156b', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (86, 86, 1, 'Email marketing', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '1a617941-9467-48e2-bef7-3d7266f222cb', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (87, 87, 1, 'Explore', '2022-09-19 00:32:21', '2022-09-19 00:32:21', '256f6024-e0b0-4e65-b094-e616c9b79b53', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (88, 88, 1, 'Fist', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'ac7ae74f-955b-46d8-b7d1-e23b8840f195', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (89, 89, 1, 'Gallery', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'c1c8a831-e8c8-45ff-9c59-4a88eaf8eccc', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (90, 90, 1, 'Glasses', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'af1f7b4a-a2db-48ba-a0f1-ba6b6f2ecd5b', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (91, 91, 1, 'Hero image', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '1bee36b1-875b-4412-831b-c440d5fa2ca8', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (92, 92, 1, 'Laptop desk', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'a0f597ff-9a5c-4192-9e4d-658f4e1c171b', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (93, 93, 1, 'Larry page', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'aa2c7bc2-4545-4e5b-84e6-eeb81bca49eb', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (94, 94, 1, 'Macbook table', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '473125d3-7408-40fb-ac92-0b482c472121', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (95, 95, 1, 'Macbook', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '76f0f2b8-df7e-4f6c-87dc-5b8e3d6bd8af', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (96, 96, 1, 'Moosic app ui', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '133e3a0e-3cc8-4c9f-be74-33b5dc433604', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (97, 97, 1, 'News entry 1 image', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '9573e785-d27d-43ff-aacc-ba3f05e66186', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (98, 98, 1, 'News link 1 image', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '7e0ceeb5-b4c6-4cd4-9741-311f626e7918', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (99, 99, 1, 'News link 2 image', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'e14ac143-199b-4026-8509-0295dbc4573a', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (100, 100, 1, 'On track thumb', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '900fe9ca-bd62-49a7-9cd0-6c84842a28ab', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (101, 101, 1, 'Ontrack bigimage', '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'da8763ba-e32a-43c6-a427-33546688dcf0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (102, 102, 1, 'Pong', '2022-09-19 00:32:22', '2022-09-19 00:32:22', '391fcbbc-d9db-42d7-979e-d3e562f5eefb', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (103, 103, 1, 'Ryan reynolds', '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'c8f08e89-e970-475a-86ff-df81f5bac52d', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (104, 104, 1, 'Seo', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '08178580-36e8-420a-8deb-dfe70a98b433', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (105, 105, 1, 'Shinybrad', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '8616bcdd-455f-44fe-897c-acf216662ffc', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (106, 106, 1, 'Skateboard', '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'aee54845-38d1-4c45-80c5-b9d46e904ed9', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (107, 107, 1, 'Skis', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '091819fa-ddec-4116-979b-e2957df7a610', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (108, 108, 1, 'Sports r us thumb', '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'd7bef480-9d3a-4e35-8ff7-9b2de455ee87', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (109, 109, 1, 'Sportsrus bigfeature', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '00285ed7-a696-40b1-8112-05a59a8246be', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (110, 110, 1, 'Crystal', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '5f1925cb-6e9a-4105-bbf5-6e6bf9e8c471', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (111, 111, 1, 'Liz', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '9d94772b-fc3c-4379-9611-c821d8d9eb0b', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (112, 112, 1, 'Travis', '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'ef52ac8e-0686-44c2-bac4-2d485c18b91f', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (113, 113, 1, 'Strategy', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '79a56184-e1be-410c-b46f-bca33f6bab9d', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (114, 114, 1, 'Video', '2022-09-19 00:32:23', '2022-09-19 00:32:23', '7bf1286d-fa71-4c09-a95e-78190eb58cc0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (115, 115, 1, 'Water barley hops', '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'd57f04cb-6a7e-48ee-9d37-a0f7b6b2f4ec', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_featuredEntry_kauxckir`, `field_shortDescription_skftcfss`, `field_heading_osfcbmcs`, `field_subheading_fihbeuel`, `field_linkUrl_urvisobw`) VALUES (116, 210, 1, 'This is an important Fake News post!', '2022-09-19 00:35:25', '2022-09-19 00:35:25', '61e222ff-5538-4ed7-ab81-4681d5edb228', 1, '<p>You\'ve <em>got</em> to see this news post!</p>', 'You won\'t believe these 10 tricks to lose weight while still drinking!', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for craftidtokens
-- ----------------------------
DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_chgcrypdnckucptrjhcoydjuhqploaghycqn` (`userId`),
  CONSTRAINT `fk_chgcrypdnckucptrjhcoydjuhqploaghycqn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of craftidtokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for deprecationerrors
-- ----------------------------
DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rhbccdcdypspusisxujorbsfcohiftfvxskw` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deprecationerrors
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for drafts
-- ----------------------------
DROP TABLE IF EXISTS `drafts`;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_egdurfomxcfoubjzntejbouhxbgeshphdspo` (`creatorId`,`provisional`),
  KEY `idx_uvqlspwekcirjuwskgqscayyilthxsofmccf` (`saved`),
  KEY `fk_jkuxpuwmjoifglqioizgwpbhgriffcelmiui` (`canonicalId`),
  CONSTRAINT `fk_jkuxpuwmjoifglqioizgwpbhgriffcelmiui` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kzmzzvxljqdadwxhvpbjawwbrjnsdkcifflm` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drafts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for elements
-- ----------------------------
DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wogefoxumfpjokbxejilubwqckodluscfwhc` (`dateDeleted`),
  KEY `idx_pjjlahobfbrlkxwvncjgbbziqgubzadcyxys` (`fieldLayoutId`),
  KEY `idx_wqvqhkwytgeokskzwwipaldukedijkdfharf` (`type`),
  KEY `idx_hzyywjcgetyvtqnbhicaewlmyxdhxgdqrumb` (`enabled`),
  KEY `idx_xmusetkefmegapgywadlrjitchgrzjhcsqau` (`archived`,`dateCreated`),
  KEY `idx_jfatkvqotojsxohpaxnzvumsosdlreedsdyn` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_pveakhrfhhwpbkfoyonnmkxnoekwfkofgsnq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_uyokiiphfzgifngbwhquonoffjuxlcfgaroe` (`canonicalId`),
  KEY `fk_genhnlakyxyvplwqdsolxkxkbkjurfuxmsvq` (`draftId`),
  KEY `fk_qplvtucktqwcjdyxdbxecufdfzkpwgdootkq` (`revisionId`),
  CONSTRAINT `fk_genhnlakyxyvplwqdsolxkxkbkjurfuxmsvq` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mxmxbeomfccpgfjjfizhaeednsglauweuylo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qplvtucktqwcjdyxdbxecufdfzkpwgdootkq` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uyokiiphfzgifngbwhquonoffjuxlcfgaroe` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elements
-- ----------------------------
BEGIN;
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-09-16 01:42:56', '2022-09-16 01:42:56', NULL, NULL, '56766f11-b12b-4db4-80cb-6db9d9a61061');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (2, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2022-09-18 22:31:53', '2022-09-18 22:41:50', NULL, NULL, '4d249f81-931e-472e-aacc-4b0179c892bb');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (3, 2, NULL, 1, 2, 'craft\\elements\\Entry', 1, 0, '2022-09-18 22:41:50', '2022-09-18 22:41:50', NULL, NULL, '5680b3df-5fe2-4e74-b1f8-60062f8fd03a');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (4, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 22:50:30', '2022-09-18 23:28:15', NULL, NULL, 'dc42cfc9-9388-4a84-ac4c-717c53e21ac7');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (5, 4, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:01:11', '2022-09-18 23:01:11', NULL, NULL, '762a9f11-eae8-49fc-88e5-b967f0865944');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (7, 4, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:19:48', '2022-09-18 23:19:48', NULL, NULL, '7c666003-7c65-497e-bd0c-babb37461680');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (8, 4, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:20:00', '2022-09-18 23:21:34', NULL, NULL, 'ed8e4543-a6ec-4380-a084-1f2563098bfe');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (9, 4, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:22:51', '2022-09-18 23:22:55', NULL, NULL, 'd88b348d-818c-4250-bd89-536b9a7a5a43');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (10, 4, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:28:15', '2022-09-18 23:28:15', NULL, NULL, 'fa9f34c1-1839-49b4-9807-024bf2092eb7');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (11, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:29:23', '2022-09-18 23:33:04', NULL, NULL, '7af345a7-49bd-48d7-b298-4798d440a938');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (12, 11, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:29:27', '2022-09-18 23:29:27', NULL, NULL, '1b301e1d-ad73-40b9-a532-981032cfaf58');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (14, 11, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:31:02', '2022-09-18 23:31:02', NULL, NULL, '72bbd517-1528-4f33-8fda-e70e0c063011');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (16, 11, NULL, 9, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:33:04', '2022-09-18 23:33:04', NULL, NULL, '92e3df73-e277-49e1-89d2-e823433ac2e4');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (17, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:41:31', '2022-09-18 23:41:47', NULL, NULL, '29d89cb5-717d-4ee2-b754-09f2d30f3986');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (18, 17, NULL, 10, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-18 23:41:47', '2022-09-18 23:42:12', NULL, NULL, '2a64366e-5027-4cef-8848-cdd523fa46b5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (19, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-19 00:00:17', '2022-09-19 00:00:20', NULL, NULL, '290239fe-bfcf-4b15-a697-466889f95a94');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (20, 19, NULL, 11, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-19 00:00:20', '2022-09-19 00:00:20', NULL, NULL, '1d66c9bb-966e-4301-b2e5-e51990e3ed9f');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (68, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-19 00:24:48', '2022-09-19 00:35:24', NULL, NULL, 'c8afca22-5737-4668-8614-2303cc3a58bb');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (69, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:20', '2022-09-19 00:32:20', NULL, NULL, '8b8dc6e3-0d15-4b2c-aa93-4b8e5cb4fb84');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (70, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:20', '2022-09-19 00:32:20', NULL, NULL, '24bc9572-8160-4340-885a-0c9ecdf4fc16');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (71, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:20', '2022-09-19 00:32:20', NULL, NULL, 'b9c8e93f-8050-4fde-87e1-4f5495536e9b');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (72, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:20', '2022-09-19 00:32:20', NULL, NULL, '6c7f216b-7cc4-4686-aaf6-1b29a8bc7ca3');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (73, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:20', '2022-09-19 00:32:20', NULL, NULL, '02d85a14-9fe3-4f98-907a-8628e52f2276');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (74, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '8beb5dc5-a23d-4a7a-9a00-4fba3b21a33f');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (75, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '7ebc5462-face-4866-8b21-b194b5593246');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (76, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '5543dde6-ef5a-45fa-8d07-4732cdb53695');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (77, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '45aeab4a-1a4c-4736-9489-dc5fc54271f2');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (78, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '3380207b-c36b-436d-91bb-97ed24f46b25');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (79, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'bb93a224-5221-418f-8a8e-10766b1d9db3');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (80, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'b93f03cc-75d9-4c8c-9682-54c5728afc8b');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (81, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'e4926859-b61d-49d8-9245-37941021ea95');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (82, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '66e04bb6-d6cc-4bcb-8396-77576a238b4e');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (83, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, '5efb3f18-d9a5-4baf-9543-784c1b1e2e03');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (84, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'ff3b1658-49bf-4027-b590-39729527e60a');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (85, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'c8265ff6-7830-44c7-bef3-d773b2805600');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (86, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'c840b61e-a669-4d39-aab8-5f0ba88e49ef');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (87, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:21', '2022-09-19 00:32:21', NULL, NULL, 'a80a487e-58a9-4e89-8ee9-dd656e45283a');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (88, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '1b604371-f8fe-4abf-bf4c-ca02f7a085fa');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (89, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '318d5dc5-2ad6-4a57-a354-7cf5beebfd90');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (90, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, 'cc9dd13e-9874-4659-b188-38a8102a027c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (91, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, 'cb2ca38b-cc1e-46e0-bd6e-877aeb4f062c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (92, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '599d6b23-7961-4ea9-8c8e-b9d9c4297307');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (93, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, 'b0f85c4b-5fe8-48ca-890b-6c7f196be5ed');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (94, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '2ca51770-8c19-43e7-b84f-8e84ebe0c3ea');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (95, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, 'acebd7af-4304-4045-88ef-bfbd5a5fb05d');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (96, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '1ecb11b0-fcd7-48f0-bab8-e06ae8482967');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (97, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, 'cd0510e5-670f-4590-bc76-ad61c78c3618');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (98, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '4591e69b-caa5-41b3-b922-df0d6c9ae4cc');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (99, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, 'ca369077-9942-4c26-a25d-6ab5e78d800a');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (100, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '5277e4cf-f253-48f5-bc16-db7106193d43');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (101, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '49a4e6c1-3090-4704-abdf-477a7e069f39');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (102, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:22', '2022-09-19 00:32:22', NULL, NULL, '47bc5134-cdbc-4b1d-93b1-8bd07a481f59');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (103, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, 'a154c43e-6f25-4e02-b1ec-ed87f14f8036');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (104, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, 'c48a0e42-30a1-4026-b6c5-de4f67dd0f17');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (105, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '22704dcb-6628-4cdd-974c-8148a623822e');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (106, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, 'ad7baf58-58d5-4909-8324-6e210740c705');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (107, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '041fa6e3-447a-415f-9618-3f4325fae4a3');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (108, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '41cd0c01-ae7e-4fc8-98f9-df0249f95a8c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (109, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '53b114ed-a8a2-4fe9-a8e9-329bb8bdb193');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (110, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '8f61bdcf-0fea-48b8-9001-d4cd9d3f0edd');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (111, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '85bcfbfb-74fe-46cd-a94f-4dd5b74ccbc5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (112, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, '1f111241-aa44-48ed-90eb-b78284d6bceb');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (113, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, 'a9e98dfd-9c5a-4a65-b6d1-63098730a8f5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (114, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, 'f6f50a6d-36cc-42bb-a4d8-6de80a5b51f5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (115, NULL, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2022-09-19 00:32:23', '2022-09-19 00:32:23', NULL, NULL, 'd2f9854b-f967-405e-87c4-fc5cf475ef7e');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (116, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:06', '2022-09-19 00:34:06', NULL, '2022-09-19 00:34:12', '771bc30f-998e-4a56-b8d3-da27e19c1763');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (117, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:11', '2022-09-19 00:34:11', NULL, '2022-09-19 00:34:12', '0e4ff175-8b8b-4a2d-944d-cabc08aeb679');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (118, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:12', '2022-09-19 00:34:12', NULL, '2022-09-19 00:34:17', 'a8dd1c10-b749-4c81-882a-0c38bea8831d');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (119, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:12', '2022-09-19 00:34:12', NULL, '2022-09-19 00:34:17', 'cbdc663f-dc91-43d6-b411-f1521ef3dc14');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (120, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:17', '2022-09-19 00:34:17', NULL, '2022-09-19 00:34:18', 'fe4b69b0-0ab3-436b-8ddb-2313b399031c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (121, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:17', '2022-09-19 00:34:17', NULL, '2022-09-19 00:34:18', '1a29a739-2193-4193-a078-f036c5995128');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (122, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:18', '2022-09-19 00:34:18', NULL, '2022-09-19 00:34:20', '8f1b1474-03b6-44a5-925e-41a73c3f37e6');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (123, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:18', '2022-09-19 00:34:18', NULL, '2022-09-19 00:34:20', '9cb1f627-6273-4d43-bae4-7ea07031950f');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (124, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:18', '2022-09-19 00:34:18', NULL, '2022-09-19 00:34:20', 'da6330e2-b1e1-4987-8434-d72baaaf6b47');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (125, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:20', '2022-09-19 00:34:20', NULL, '2022-09-19 00:34:24', 'efbc1494-c65d-4d3a-9a08-4bd71d501aae');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (126, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:20', '2022-09-19 00:34:20', NULL, '2022-09-19 00:34:24', '46742ee4-3c6a-4a3e-a9da-039745ba0252');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (127, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:20', '2022-09-19 00:34:20', NULL, '2022-09-19 00:34:24', '12c5316f-abbd-408d-bbf8-e16a1f4fe69b');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (128, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:24', '909db08b-d751-4fd3-b7fb-6a40224b93d9');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (129, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:24', 'c71b9ed9-cb97-4b3c-81ae-23bc3322ed9d');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (130, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:24', '24045e81-6bec-4b47-b1da-df61a12b9647');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (131, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:26', '3038337d-2e17-49a7-bdff-2f09441604d2');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (132, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:26', '6d703275-eb69-483d-9b7f-c8dde9d3bc74');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (133, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:26', '8651ba02-6ed1-4a07-85ae-de8d340a3735');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (134, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24', NULL, '2022-09-19 00:34:26', '8fb22178-b620-453d-ad43-986ebe2416e4');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (135, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26', NULL, '2022-09-19 00:34:30', '0191e15d-a6c7-4403-9c6c-05bbe6953667');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (136, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26', NULL, '2022-09-19 00:34:30', '2e243382-cf0a-4f19-944b-ad3c53e71b82');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (137, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26', NULL, '2022-09-19 00:34:30', 'ed00fa8e-3216-461a-9b53-1543fdf66a59');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (138, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26', NULL, '2022-09-19 00:34:30', 'c3e4b18e-6dc7-44d5-a7e5-e3306b733b5c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (139, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30', NULL, '2022-09-19 00:34:35', '34b373cc-c9c2-4dde-90df-1e0673c14d46');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (140, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30', NULL, '2022-09-19 00:34:35', 'be6a4505-970e-441e-b65c-eddc831318b7');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (141, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30', NULL, '2022-09-19 00:34:35', '42ddc220-3745-4aea-8177-4b4c128b2603');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (142, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30', NULL, '2022-09-19 00:34:35', 'b4379170-1a9e-4d60-b656-e7abffa96c4f');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (143, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35', NULL, '2022-09-19 00:34:36', '6c3cd1c5-a47d-49c4-a9c0-b9ae9751b7ce');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (144, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35', NULL, '2022-09-19 00:34:36', 'ed792cad-ff73-4708-ba09-5d3ebfd9fa55');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (145, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35', NULL, '2022-09-19 00:34:36', '5ad8fb1f-4e7c-4939-9c1a-fbbc2c51f786');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (146, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35', NULL, '2022-09-19 00:34:36', '03baa6e6-c34e-43f1-be58-5eb202b843ca');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (147, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36', NULL, '2022-09-19 00:34:42', 'ddf9016d-cc0a-44e7-a1ab-19c67973382e');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (148, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36', NULL, '2022-09-19 00:34:42', 'e615c98c-47bb-49dc-88f7-b76a3cfca594');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (149, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36', NULL, '2022-09-19 00:34:42', 'fbe6c7a5-4c99-4c83-a0c9-22bc068ce871');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (150, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36', NULL, '2022-09-19 00:34:42', '122ee422-b250-4ad7-add0-586a3ab33c6c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (151, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36', NULL, '2022-09-19 00:34:42', '4ddec303-b71b-4292-8f21-6def008d653e');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (152, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42', NULL, '2022-09-19 00:34:46', 'dc89ea29-f0aa-4db8-b949-b3f6daa96bc4');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (153, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42', NULL, '2022-09-19 00:34:46', 'feeb6895-8fdd-4304-b1bf-d73ad62612f5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (154, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42', NULL, '2022-09-19 00:34:46', '2a950d5f-6835-4b54-ad53-b26c2fb792bc');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (155, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42', NULL, '2022-09-19 00:34:46', 'cbe2afd2-3aa2-432d-9eec-de7a8362da90');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (156, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42', NULL, '2022-09-19 00:34:46', '1c9069f3-77f2-46e4-af9a-e7ff118c688c');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (157, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46', NULL, '2022-09-19 00:34:48', '9b8ae871-6eeb-491b-9ab0-b3c57707936d');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (158, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46', NULL, '2022-09-19 00:34:48', '3fb7bc86-453f-4491-87fe-bef5f685692b');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (159, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46', NULL, '2022-09-19 00:34:48', 'bbf98a7a-1117-40b4-97d3-7e8fbd01951f');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (160, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46', NULL, '2022-09-19 00:34:48', '6e03aafa-4f4d-4ea1-8b12-643d788de052');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (161, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46', NULL, '2022-09-19 00:34:48', 'd6f109bf-6061-42fa-a1a2-cd2d1fe82ee2');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (162, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48', NULL, '2022-09-19 00:34:52', '617b9f27-6955-46fd-a98f-e53fd68167d5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (163, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48', NULL, '2022-09-19 00:34:52', '8af5768e-e1bf-4280-b2b2-d8e1a7f8b1b5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (164, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48', NULL, '2022-09-19 00:34:52', 'b815aabb-5475-4ebe-80c4-71c852f696d9');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (165, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48', NULL, '2022-09-19 00:34:52', '829073a0-270c-45ef-81d4-531ca5fd163a');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (166, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48', NULL, '2022-09-19 00:34:52', '092c096b-6354-4cb7-889b-ee0485c6714e');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (167, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52', NULL, '2022-09-19 00:34:57', '16771f99-8f52-4766-b06a-c21f594e2d23');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (168, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52', NULL, '2022-09-19 00:34:57', '1565c500-c48b-453c-9a96-b4917ca0ca97');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (169, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52', NULL, '2022-09-19 00:34:57', '7846f8be-bea2-4672-a581-204bea498a9b');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (170, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52', NULL, '2022-09-19 00:34:57', '6780e4e4-9a19-4341-aa3b-59bcc5f5c994');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (171, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52', NULL, '2022-09-19 00:34:57', '84a6ffc5-1750-4fad-9908-b225a4cce9af');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (172, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57', NULL, '2022-09-19 00:35:00', '6b937a31-e53d-4e18-becc-6a6168333461');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (173, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57', NULL, '2022-09-19 00:35:00', '3cfd7307-ce2c-4fe0-840e-e597487dda6a');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (174, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57', NULL, '2022-09-19 00:35:00', '9a313a43-440b-4168-80d2-f680e2ea9627');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (175, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57', NULL, '2022-09-19 00:35:00', '3569601e-c0df-456a-9d10-a5149219edf8');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (176, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57', NULL, '2022-09-19 00:35:00', '3aa737bb-b23c-4eaa-a1d6-b0348f0065f0');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (177, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00', NULL, '2022-09-19 00:35:08', '7d2ad36f-31d0-44ab-b8c1-4c59ffe9e451');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (178, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00', NULL, '2022-09-19 00:35:08', '2b20e2b9-3402-44df-ae4e-0d99138209da');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (179, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00', NULL, '2022-09-19 00:35:08', '0721cfc7-7894-4358-853f-c192e8958a78');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (180, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00', NULL, '2022-09-19 00:35:08', '048aefe9-fd4f-49dc-88b2-a3b085da071f');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (181, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00', NULL, '2022-09-19 00:35:08', 'b5cbeeda-d261-416b-8f8d-6430ded0c7a5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (182, NULL, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00', NULL, '2022-09-19 00:35:08', '8655628f-cbe0-45fd-aea2-750728eb95fa');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (183, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08', NULL, '2022-09-19 00:35:12', 'e0b894f8-ef00-4d6d-957e-9549273334d2');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (184, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08', NULL, '2022-09-19 00:35:12', '84e5af6f-a90a-42ee-9d09-63914bc1d141');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (185, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08', NULL, '2022-09-19 00:35:12', '746cabf0-effc-46f5-bb83-bdead18242d0');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (186, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08', NULL, '2022-09-19 00:35:12', 'e8dd7488-8b61-4443-b9cf-3445c7279723');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (187, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08', NULL, '2022-09-19 00:35:12', '33ad30d3-bc06-4314-b677-a577d7699916');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (188, NULL, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08', NULL, '2022-09-19 00:35:12', 'a8e9ecfd-5783-416e-bf23-72549ca95308');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (189, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:11', '2022-09-19 00:35:11', NULL, '2022-09-19 00:35:19', '9146d581-0d28-43d8-8b72-6fd2b15e3b05');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (190, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12', NULL, '2022-09-19 00:35:19', '1f81002a-df32-451d-900b-ec18b70ebde3');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (191, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12', NULL, '2022-09-19 00:35:19', 'd002df9a-2bda-4c7f-a9df-e263270a24bc');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (192, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12', NULL, '2022-09-19 00:35:19', '7e908e0a-9944-4dc6-bcfe-637e618a9947');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (193, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12', NULL, '2022-09-19 00:35:19', '81f8e5f6-7556-480f-b344-89666c5c7ab3');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (194, NULL, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12', NULL, '2022-09-19 00:35:19', '41a4189b-c415-439f-ab48-da8303bc16b4');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (195, NULL, NULL, NULL, 10, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12', NULL, '2022-09-19 00:35:19', '0efb95e2-1c94-4677-8913-7035db1813c7');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (196, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', 'c397bdc6-a5b3-4bba-9249-c1759ed92212');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (197, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', '9d13ca4b-6625-4a75-b187-a84a5c94a474');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (198, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', '39eed6bc-f337-4f96-bc06-ca0d77646a61');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (199, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', '3710e91d-bebc-4c46-8f69-f43104da68c8');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (200, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', 'df436a54-be4a-4953-b884-8d1214333d13');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (201, NULL, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', '6dbf5ac2-1e9d-4d52-aa6e-c7541e34f38d');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (202, NULL, NULL, NULL, 10, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19', NULL, '2022-09-19 00:35:22', '2d931048-4cd4-4f77-a800-3c0631642189');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (203, NULL, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, 'a7ce6e6a-82c6-4b42-8076-c6cf9fbfca88');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (204, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, 'e3492219-ab75-4813-aae8-677b4c1016b9');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (205, NULL, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, '08efc96e-aee7-4074-9b14-599fde2d536d');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (206, NULL, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, 'dfed2406-3273-49d0-ac54-7313196b30b8');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (207, NULL, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, 'dbe30081-6f4f-4eea-900b-793747623ecf');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (208, NULL, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, '7c1901b5-72b8-4d42-913e-971e93758545');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (209, NULL, NULL, NULL, 10, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:21', NULL, NULL, '6dc860cf-0e3c-40dd-8d85-c56acc6faac2');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (210, 68, NULL, 12, 1, 'craft\\elements\\Entry', 1, 0, '2022-09-19 00:35:24', '2022-09-19 00:35:25', NULL, NULL, 'ccbdd043-4358-4955-94e5-65a3f22c82dd');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (211, 203, NULL, 13, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, '6cb5e4c0-2a6a-4eb4-adcf-ab80893b04d7');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (212, 204, NULL, 14, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, '8a9e46fc-88ca-47e6-90c2-70780ec530ed');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (213, 205, NULL, 15, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, '09637ac3-822a-474b-a7fc-b10a54ac59c5');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (214, 206, NULL, 16, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, 'e63350e9-b1f6-4f44-90e8-f8fe362452ef');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (215, 207, NULL, 17, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, '9318df00-4928-45a6-a946-8933727d0e83');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (216, 208, NULL, 18, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, 'b1a59f0e-8a9b-4f58-ae6a-5cc345bf4cac');
INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES (217, 209, NULL, 19, 10, 'craft\\elements\\MatrixBlock', 1, 0, '2022-09-19 00:35:21', '2022-09-19 00:35:25', NULL, NULL, '99f6ad56-2d97-493b-8e74-f94cdc90256e');
COMMIT;

-- ----------------------------
-- Table structure for elements_sites
-- ----------------------------
DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rcnnedfhetadzplcbfekxgsiqhsvjubdhewl` (`elementId`,`siteId`),
  KEY `idx_hexwntoxddcglsmihqulurygkafiljwanrsj` (`siteId`),
  KEY `idx_dawrcpyrfoodyjrjjuaztydtzimovyfzbzhn` (`slug`,`siteId`),
  KEY `idx_zqfqsnfhpxlqwvehlcuxqydxlpacencroxih` (`enabled`),
  KEY `idx_mpfruxtnunztjthhiyfnmpyfepkzdgfeeujg` (`uri`,`siteId`),
  CONSTRAINT `fk_evmozqgurcveabwnusycptljcatwguasvydv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_inhcsxwzjbkxhfgvzwqkrhomoepqodahjjeh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elements_sites
-- ----------------------------
BEGIN;
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 1, 1, NULL, NULL, 1, '2022-09-16 01:42:56', '2022-09-16 01:42:56', '6a1af663-d1ba-436c-850f-f6b74a183349');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 2, 1, 'test', 'news/test', 1, '2022-09-18 22:31:53', '2022-09-18 22:41:50', '8c6515ca-0be3-4e44-9d44-466e0a088312');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 3, 1, 'test', 'news/test', 1, '2022-09-18 22:41:50', '2022-09-18 22:41:50', '9ace5a90-e6c2-4d62-aa43-c5f1b7a5d567');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 4, 1, 'fdssdf', 'news/fdssdf', 1, '2022-09-18 22:50:30', '2022-09-18 23:01:08', 'ee7399fd-632e-4570-804c-0810153982b5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 5, 1, 'fdssdf', 'news/fdssdf', 1, '2022-09-18 23:01:11', '2022-09-18 23:01:11', '83cc44cd-384d-41e7-9123-99a860b0bbae');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 7, 1, 'fdssdf', 'news/fdssdf', 1, '2022-09-18 23:19:48', '2022-09-18 23:19:48', '4faebec1-2118-4fdf-8f51-ac853250b21a');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, 8, 1, 'fdssdf', 'news/fdssdf', 1, '2022-09-18 23:21:34', '2022-09-18 23:21:34', '407f4a9e-e2a4-49ca-8dcc-9b0236de52ba');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, 9, 1, 'fdssdf', 'news/fdssdf', 1, '2022-09-18 23:22:55', '2022-09-18 23:22:55', 'ed9c6b74-742c-4279-aac9-fb14d05e19b0');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 10, 1, 'fdssdf', 'news/fdssdf', 1, '2022-09-18 23:28:15', '2022-09-18 23:28:15', '1ef937e7-0a8a-478b-b73a-5422318718ee');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, 11, 1, 'fds', 'news/fds', 1, '2022-09-18 23:29:23', '2022-09-18 23:29:25', '2b2428be-a1b1-4542-8165-521c502c9f2c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, 12, 1, 'fds', 'news/fds', 1, '2022-09-18 23:29:27', '2022-09-18 23:29:27', 'dbccea2c-9365-4964-916e-1a7f89af8577');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, 14, 1, 'fds', 'news/fds', 1, '2022-09-18 23:31:02', '2022-09-18 23:31:02', '82fd0fac-6b17-42cd-9153-f696209675f3');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, 16, 1, 'fds', 'news/fds', 1, '2022-09-18 23:33:04', '2022-09-18 23:33:04', '5cd5cfa6-db13-4bb2-8d8f-e5841da161af');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (17, 17, 1, 'fds-2', 'news/fds-2', 1, '2022-09-18 23:41:31', '2022-09-18 23:41:40', '24b4a7d8-514f-45f2-87c0-d5a63f3afaab');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (18, 18, 1, 'fds-2', 'news/fds-2', 1, '2022-09-18 23:42:12', '2022-09-18 23:42:12', '8cd9d3e0-088a-4358-b5a5-2ac25aaedb7c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (19, 19, 1, 'fdsfsd', 'news/fdsfsd', 1, '2022-09-19 00:00:17', '2022-09-19 00:00:19', '4be97879-9451-424b-b7df-e37a0b34d756');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (20, 20, 1, 'fdsfsd', 'news/fdsfsd', 1, '2022-09-19 00:00:20', '2022-09-19 00:00:20', '5b4d5c5b-f93f-423c-8e40-727632f94f43');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (68, 68, 1, 'this-is-an-important-fake-news-post', 'news/this-is-an-important-fake-news-post', 1, '2022-09-19 00:24:48', '2022-09-19 00:25:02', '3a3f4208-ec3e-43e6-b972-c5493d5304f7');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (69, 69, 1, NULL, NULL, 1, '2022-09-19 00:32:20', '2022-09-19 00:32:20', '0610b1c1-4632-43c8-9ce3-3ef1e80bbd9c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (70, 70, 1, NULL, NULL, 1, '2022-09-19 00:32:20', '2022-09-19 00:32:20', 'a2a62239-9320-4bc7-9615-7ab859d96768');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (71, 71, 1, NULL, NULL, 1, '2022-09-19 00:32:20', '2022-09-19 00:32:20', 'c1b7b577-e4be-4023-aed2-38ebea0ff54e');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (72, 72, 1, NULL, NULL, 1, '2022-09-19 00:32:20', '2022-09-19 00:32:20', 'e8e2ffa3-7c56-40b4-805e-1abc446751f9');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (73, 73, 1, NULL, NULL, 1, '2022-09-19 00:32:20', '2022-09-19 00:32:20', 'cb775ae2-32f2-4988-a80a-e828cafd2dd7');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (74, 74, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'e0bd2f9d-0a8c-47c6-aa83-50fb5de4f685');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (75, 75, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '135224f0-0d37-430b-99bd-31e7cc41d755');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (76, 76, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '7a8c65d5-c588-4921-b811-bbf2024cba1b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (77, 77, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '5a96b299-48ff-4e9f-a791-77d10a50ad44');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (78, 78, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '041bfa34-e184-4db4-b4dd-da7c3ff0158b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (79, 79, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '44582f3d-e1ee-49b1-9499-b4378116ca38');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (80, 80, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '7414586f-b828-40c5-bc48-fd51a7dec29a');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (81, 81, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '0a9fa7c6-3cba-4ba2-8e5c-021bdab0588c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (82, 82, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '9aa1cbe0-e657-4268-9c66-48d3d37ebb5e');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (83, 83, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '9fa30c4a-878e-481e-8a92-632a9b0178eb');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (84, 84, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '84e3261e-2107-4033-a683-4c671e0e454c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (85, 85, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', '82e472ba-8d5f-4ea1-ab71-95826f65fe01');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (86, 86, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'dba77e6f-4024-4e2b-ad73-3c16faf7b9f5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (87, 87, 1, NULL, NULL, 1, '2022-09-19 00:32:21', '2022-09-19 00:32:21', 'e1fe4a56-a62b-44a5-82fb-028d6c4a92ea');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (88, 88, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'dad7d657-fed9-4dff-aff1-bae8870f3a9e');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (89, 89, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '07a1d422-149f-442f-a9f2-58b17c7eb68b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (90, 90, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '0506b969-cd26-4071-9213-e34691f68c78');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (91, 91, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'bb3607a0-4d79-4ce1-8aee-7b0d397ba83c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (92, 92, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '15c34223-4fa0-4324-921e-f5e59b8af1e7');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (93, 93, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '67b37577-cb04-4aca-8cdf-bcdaadce3c23');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (94, 94, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'ac055eac-f82e-4700-bf08-c3ccf31e20ab');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (95, 95, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '4d3d9d08-a8d3-484d-be1e-b16f8a6ebea5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (96, 96, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'f716f028-ede7-4700-adfc-a505c64f444f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (97, 97, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '61256a97-4c44-4606-88a2-f8c934b4df71');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (98, 98, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', 'd9f76336-14e9-44be-a108-a242be239f16');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (99, 99, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '90d4246b-fe87-47d4-b59f-9355e544697b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (100, 100, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '53ec8c4a-a240-4de0-afa0-983e3b39f606');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (101, 101, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '768d3c6f-48b8-461f-b48b-9e1f663f44f6');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (102, 102, 1, NULL, NULL, 1, '2022-09-19 00:32:22', '2022-09-19 00:32:22', '69fa099a-52dc-485d-a3e6-360306d4ecfa');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (103, 103, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'c7bb2e65-c2ec-4e86-aa89-434f14529361');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (104, 104, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '4d7d2250-303a-4265-b7f5-66e549000e71');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (105, 105, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'b9d9400b-17a2-48a5-950b-77cb0ef53ffc');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (106, 106, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '5a3e7c7e-91af-4ae9-9bf1-d14e69f99079');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (107, 107, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '60c40c59-ef92-4344-bb8e-c436b07b45f4');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (108, 108, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'db2aef44-233f-4c57-ad8d-73ff8bdf175a');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (109, 109, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '61fad36b-8f90-458c-ae56-e386b39ec856');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (110, 110, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'b30add08-8c59-4ce8-ad37-9348bf6950af');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (111, 111, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '5683cb0b-6a8b-4419-9370-798a52a4a692');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (112, 112, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'fbf21685-0241-4861-a503-1e68d8950b8c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (113, 113, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'b4134f79-5afe-4c47-836a-31042b0d9bc8');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (114, 114, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '6dd9b00d-8e6e-4e9b-858d-efd8cbe4f9a3');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (115, 115, 1, NULL, NULL, 1, '2022-09-19 00:32:23', '2022-09-19 00:32:23', '050347db-3a5e-4623-a55b-a141203ec1a7');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (116, 116, 1, NULL, NULL, 1, '2022-09-19 00:34:06', '2022-09-19 00:34:06', 'a75ca334-ddf8-49f9-8440-97d5eee23b55');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (117, 117, 1, NULL, NULL, 1, '2022-09-19 00:34:11', '2022-09-19 00:34:11', '0514d3c0-d303-4f5a-b468-6f3a47aaf91e');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (118, 118, 1, NULL, NULL, 1, '2022-09-19 00:34:12', '2022-09-19 00:34:12', 'f4c214b5-48b3-49c2-ba2a-418c3b5ff84d');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (119, 119, 1, NULL, NULL, 1, '2022-09-19 00:34:12', '2022-09-19 00:34:12', '93d2e530-5f95-44b4-a88b-60102da82b28');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (120, 120, 1, NULL, NULL, 1, '2022-09-19 00:34:17', '2022-09-19 00:34:17', '4b898453-1f5b-4d0f-b21d-cc2b8a54e6aa');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (121, 121, 1, NULL, NULL, 1, '2022-09-19 00:34:17', '2022-09-19 00:34:17', '49d07814-70d9-4b3c-bc97-49096e21d1d7');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (122, 122, 1, NULL, NULL, 1, '2022-09-19 00:34:18', '2022-09-19 00:34:18', 'aa02bc62-f205-4a4f-9700-ba67bc0898a5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (123, 123, 1, NULL, NULL, 1, '2022-09-19 00:34:18', '2022-09-19 00:34:18', '4d1e6919-ad9b-419f-8b32-6f04bc8712c1');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (124, 124, 1, NULL, NULL, 1, '2022-09-19 00:34:18', '2022-09-19 00:34:18', 'ffceb05c-d28d-408a-b31e-39a571f54e5c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (125, 125, 1, NULL, NULL, 1, '2022-09-19 00:34:20', '2022-09-19 00:34:20', '188669e6-441e-4026-9f3e-a3740e8daced');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (126, 126, 1, NULL, NULL, 1, '2022-09-19 00:34:20', '2022-09-19 00:34:20', 'e5709a33-6d4a-40e5-9020-af6ede4e0120');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (127, 127, 1, NULL, NULL, 1, '2022-09-19 00:34:20', '2022-09-19 00:34:20', '477f243e-1045-4719-90b6-65c3dc71ae36');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (128, 128, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '0d9c8aeb-3d92-4521-8e5b-0bae05bcd4c4');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (129, 129, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', 'fd135c41-d788-4e23-b805-dfebc2ef81f1');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (130, 130, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '7a610b7d-21e1-4ae4-8cfe-4d973f05e361');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (131, 131, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', 'd32115ba-6100-4c79-9765-93dec28250fb');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (132, 132, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', 'd1682468-6ccb-4044-bd20-2ec140e9637d');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (133, 133, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '7bb3fba8-c832-4f47-a639-a80e1cb239a9');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (134, 134, 1, NULL, NULL, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '06511007-ce57-4637-bb32-412c160f0ae1');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (135, 135, 1, NULL, NULL, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', '1878d6cc-6fcd-438a-92a1-2526dd5c9fad');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (136, 136, 1, NULL, NULL, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', '5b067081-2512-4e54-ba63-d2346ca9d76c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (137, 137, 1, NULL, NULL, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', 'd0a5dcc3-695e-41b8-9491-dd6fbe8a9bb8');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (138, 138, 1, NULL, NULL, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', '42f5198a-015d-47f3-a3f1-dc1b95cdfa17');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (139, 139, 1, NULL, NULL, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', '450358e2-efde-4dda-8452-1584e225587e');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (140, 140, 1, NULL, NULL, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', '445b6ba5-b5e9-48ad-80e0-ceab0d6bf1e6');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (141, 141, 1, NULL, NULL, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', '185a919f-de26-4227-9327-3d16ab43a08f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (142, 142, 1, NULL, NULL, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', 'b0af7253-3a10-4768-99f3-bf03343a63f8');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (143, 143, 1, NULL, NULL, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', '42997f17-c5a3-439a-8534-1d6befe09a49');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (144, 144, 1, NULL, NULL, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', 'b6bbd3ac-1941-42c0-b43f-62cb842993d6');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (145, 145, 1, NULL, NULL, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', 'd1c1e0c7-4fc0-420f-b045-747dbce94fa5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (146, 146, 1, NULL, NULL, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', '867a14ca-f022-4421-90f7-fe9c61d79ead');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (147, 147, 1, NULL, NULL, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '68e491fd-fa5b-4e4c-9442-016c0bd0d27b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (148, 148, 1, NULL, NULL, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', 'fb8ee6ef-e47b-40a1-9e5e-fcdd004a8fc9');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (149, 149, 1, NULL, NULL, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '5f5197e1-c9b1-43f5-a594-3c2add309ac5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (150, 150, 1, NULL, NULL, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', 'b278f62c-2241-49c1-9146-37830ccc7cb1');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (151, 151, 1, NULL, NULL, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '6bd97fb0-fa17-4068-b97c-ca49ae18b93d');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (152, 152, 1, NULL, NULL, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '9fd2bf11-a811-40a5-af3e-f61e01890107');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (153, 153, 1, NULL, NULL, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '5f31cc58-3dcc-4189-a6df-53c55424332a');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (154, 154, 1, NULL, NULL, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', 'f3cb701a-e5d0-4f3c-98e9-a169cd2cbb45');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (155, 155, 1, NULL, NULL, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '38d83f7c-9821-4f34-a369-fed6b4a443b3');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (156, 156, 1, NULL, NULL, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '4c2c957a-0530-4c41-b3b0-e815175f976f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (157, 157, 1, NULL, NULL, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '106bf737-690b-438c-86ed-2f17cd90d41c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (158, 158, 1, NULL, NULL, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '5e19023e-b1c5-42b6-83bf-817d5bebd31b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (159, 159, 1, NULL, NULL, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '42aa6278-da7e-4adf-8743-4d28f49b3426');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (160, 160, 1, NULL, NULL, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', 'a784a21f-29ba-472e-9452-532add25653f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (161, 161, 1, NULL, NULL, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '15432f0b-fc03-4d57-adf7-3b3fd381886f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (162, 162, 1, NULL, NULL, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', 'd4b9c6f4-6845-49a2-a755-1accf8fd8568');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (163, 163, 1, NULL, NULL, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '0d9ef8d7-5d0e-43fb-afac-44a41799df51');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (164, 164, 1, NULL, NULL, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '3703293c-b915-48e8-9acb-e048bf65ebbe');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (165, 165, 1, NULL, NULL, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', 'bb467106-0cee-4ec4-9917-bf53875d5245');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (166, 166, 1, NULL, NULL, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '1194baba-cd74-4b6e-bc49-643d60676e66');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (167, 167, 1, NULL, NULL, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '2191620f-023f-4b00-9e3a-72f65884d218');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (168, 168, 1, NULL, NULL, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '73fed9d9-3386-4294-b87d-be67e5f10d82');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (169, 169, 1, NULL, NULL, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '6aea1f9a-3b11-4b0d-8523-1c1588b1007c');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (170, 170, 1, NULL, NULL, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', 'ba07d13d-84d7-4acd-bf89-29c010c24828');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (171, 171, 1, NULL, NULL, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', 'e35dcda5-ce14-4ae3-b76c-e4c79c7f624e');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (172, 172, 1, NULL, NULL, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '69cf454d-d7eb-461f-a9e6-436e106adfb4');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (173, 173, 1, NULL, NULL, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '667d9e8a-ad34-4389-bcae-0bd69081b049');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (174, 174, 1, NULL, NULL, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '0f52a2b8-ad23-43f2-b4ef-512fb2ed0949');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (175, 175, 1, NULL, NULL, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '98e470c2-b490-492e-ac13-0b5b117cae15');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (176, 176, 1, NULL, NULL, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '42999002-df2b-403b-936c-293d70aaa475');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (177, 177, 1, NULL, NULL, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '6782b233-407e-4cce-92f1-04f18e0b0ffd');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (178, 178, 1, NULL, NULL, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '1e63a9e6-0120-4d79-90bc-cd154e3a0178');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (179, 179, 1, NULL, NULL, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '8d79575a-9048-46a1-ae29-47f0def5edf6');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (180, 180, 1, NULL, NULL, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '454eb1cb-ac7a-4307-8284-dc8a24d67e8d');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (181, 181, 1, NULL, NULL, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '01c0e6cb-b7f3-4084-aa12-c6c92fbf16a5');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (182, 182, 1, NULL, NULL, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '7a49aca1-0f59-401b-b59b-ef5d39524f01');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (183, 183, 1, NULL, NULL, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'b0286ec9-a393-4e89-b39c-fa138ee1d845');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (184, 184, 1, NULL, NULL, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '5a12f2f6-8d07-4022-a312-1b4f78e8e1e7');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (185, 185, 1, NULL, NULL, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '75b07331-2155-43eb-bbf4-f79449b8fc0f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (186, 186, 1, NULL, NULL, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'f183c901-ee62-4cba-9932-49dcf4760797');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (187, 187, 1, NULL, NULL, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '7ecd39e7-1ad6-48ba-a33e-0ab65b2c8a85');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (188, 188, 1, NULL, NULL, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '850dd449-980f-450b-8fa9-b70c80d7e013');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (189, 189, 1, NULL, NULL, 1, '2022-09-19 00:35:11', '2022-09-19 00:35:11', 'b81e5a98-9acd-48d3-883d-60ec1f2c247a');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (190, 190, 1, NULL, NULL, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '4d317d1b-3083-4bfd-a2d5-3c893fad3db3');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (191, 191, 1, NULL, NULL, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'ac53e196-8f8d-491d-8c35-a959fdd3520b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (192, 192, 1, NULL, NULL, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '8c8663d0-c389-4317-91ee-0693732be4ca');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (193, 193, 1, NULL, NULL, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'd2908dda-3d7b-40db-8c8b-529ddcd03ab3');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (194, 194, 1, NULL, NULL, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '97e94fc4-4841-4868-a127-143983ba08c8');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (195, 195, 1, NULL, NULL, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '38324a46-bcda-4633-b00d-afc30cad0227');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (196, 196, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'fed277ea-da70-4583-9d8a-314eefb73572');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (197, 197, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '06b082ad-ed36-4413-b1b1-d2642f8390de');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (198, 198, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '00a7ab82-c3ef-432d-bfac-84ab6ca5b2e2');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (199, 199, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '93262ad7-8678-44f5-839f-d59f781f0981');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (200, 200, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'fc243ae5-7060-4d1f-818b-cd1c25657cff');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (201, 201, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '7a3e49f8-b67c-4a74-8119-cd8b549fb915');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (202, 202, 1, NULL, NULL, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'cbd2f642-7c85-4a06-b1d7-b6b4ef9298b0');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (203, 203, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'b5e98d94-fe13-47a8-ad14-f4e145a8e4fa');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (204, 204, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '1575b929-cc1f-4ba0-8881-c100a8fcc07a');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (205, 205, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '3d53b4f9-83e1-4046-97f7-a0bd7e9973a2');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (206, 206, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '6c6ee6eb-11f8-4a48-9711-430240825b1b');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (207, 207, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '9104c25c-870c-4232-a70b-a45848a74c81');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (208, 208, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '0fb9a17e-f3c8-437c-824e-6f681d0c0cf9');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (209, 209, 1, NULL, NULL, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'e9f8b27a-81f1-4bfd-85da-bb0cec818942');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (210, 210, 1, 'this-is-an-important-fake-news-post', 'news/this-is-an-important-fake-news-post', 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '4dde03ee-d9ee-4c10-9e3f-27de70ff4f37');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (211, 211, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '609895a1-bca7-4fa3-9f3d-c02c6310cdbf');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (212, 212, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '89d21463-33dc-4d28-a0ab-131b22e29b4f');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (213, 213, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '536819af-c1ae-481e-9b52-6020423e60c3');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (214, 214, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '9515c912-0536-4152-a73b-458288d22d34');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (215, 215, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '2b4b52d4-91f2-4182-bb05-cc383a2799f4');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (216, 216, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '4a1e4436-6cb2-4fe6-b9e8-54c0a11010b9');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (217, 217, 1, NULL, NULL, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '2d555f1b-f468-4bac-9903-3f6cfebc93bc');
COMMIT;

-- ----------------------------
-- Table structure for entries
-- ----------------------------
DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gpkhxcrkjamaxupboanyqrnycgrdytvulsbm` (`postDate`),
  KEY `idx_mxgxqekjarwqtcmklfdorifeywjighyyqcar` (`expiryDate`),
  KEY `idx_wjfpcbrfvmzrrqvqksaipkormqzwaliytmby` (`authorId`),
  KEY `idx_mzlievpayxtyraqgqxifhsvwdvzbbuemmcrf` (`sectionId`),
  KEY `idx_cfvgclxjeydjrgoreqyyrxgzgygeumccpthu` (`typeId`),
  KEY `fk_fyvwwckzwnwzkxqpkxfhhnoaftvkfjotoapk` (`parentId`),
  CONSTRAINT `fk_fyvwwckzwnwzkxqpkxfhhnoaftvkfjotoapk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hwqxmsmyekctewmofchebwdtvzrcuxqtyhdp` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kcexqhbnfwjaljhhcrmhswwtoqtjaavexjeb` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kvsguqmmuxufjkykcqhgtffvzlbabunjmktf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrnkgrmqfhyexuoiwxixelcnotlpojjjqibx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entries
-- ----------------------------
BEGIN;
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (2, 1, NULL, 2, 1, '2022-09-18 22:37:00', NULL, NULL, '2022-09-18 22:31:53', '2022-09-18 22:37:14');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (3, 1, NULL, 2, 1, '2022-09-18 22:37:00', NULL, NULL, '2022-09-18 22:41:50', '2022-09-18 22:41:50');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (4, 1, NULL, 1, 1, '2022-09-18 23:01:00', NULL, NULL, '2022-09-18 22:50:30', '2022-09-18 23:01:11');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (5, 1, NULL, 1, 1, '2022-09-18 23:01:00', NULL, NULL, '2022-09-18 23:01:11', '2022-09-18 23:01:11');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (7, 1, NULL, 1, 1, '2022-09-18 23:01:00', NULL, NULL, '2022-09-18 23:19:48', '2022-09-18 23:19:48');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (8, 1, NULL, 1, 1, '2022-09-18 23:01:00', NULL, NULL, '2022-09-18 23:21:34', '2022-09-18 23:21:34');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (9, 1, NULL, 1, 1, '2022-09-18 23:01:00', NULL, NULL, '2022-09-18 23:22:55', '2022-09-18 23:22:55');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (10, 1, NULL, 1, 1, '2022-09-18 23:01:00', NULL, NULL, '2022-09-18 23:28:15', '2022-09-18 23:28:15');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (11, 1, NULL, 1, 1, '2022-09-18 23:29:00', NULL, NULL, '2022-09-18 23:29:23', '2022-09-18 23:29:27');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (12, 1, NULL, 1, 1, '2022-09-18 23:29:00', NULL, NULL, '2022-09-18 23:29:27', '2022-09-18 23:29:27');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (14, 1, NULL, 1, 1, '2022-09-18 23:29:00', NULL, NULL, '2022-09-18 23:31:02', '2022-09-18 23:31:02');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (16, 1, NULL, 1, 1, '2022-09-18 23:29:00', NULL, NULL, '2022-09-18 23:33:04', '2022-09-18 23:33:04');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (17, 1, NULL, 1, 1, '2022-09-18 23:41:00', NULL, NULL, '2022-09-18 23:41:31', '2022-09-18 23:41:47');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (18, 1, NULL, 1, 1, '2022-09-18 23:41:00', NULL, NULL, '2022-09-18 23:42:12', '2022-09-18 23:42:12');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (19, 1, NULL, 1, 1, '2022-09-19 00:00:00', NULL, NULL, '2022-09-19 00:00:17', '2022-09-19 00:00:20');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (20, 1, NULL, 1, 1, '2022-09-19 00:00:00', NULL, NULL, '2022-09-19 00:00:20', '2022-09-19 00:00:20');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (68, 1, NULL, 1, 1, '2022-09-19 00:35:00', NULL, NULL, '2022-09-19 00:24:48', '2022-09-19 00:35:24');
INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES (210, 1, NULL, 1, 1, '2022-09-19 00:35:00', NULL, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
COMMIT;

-- ----------------------------
-- Table structure for entrytypes
-- ----------------------------
DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dpxvgzficwzghxfadxbjclzinyewldcvrohj` (`name`,`sectionId`),
  KEY `idx_zbzzzfugdfyyrcdqsopwdqsoqahgwrmyehrj` (`handle`,`sectionId`),
  KEY `idx_uvnamfezhwtjdrrqagtjpvrshagldksmnvkq` (`sectionId`),
  KEY `idx_yikuagixteheyzblkxdirkkzufdbaavsemjl` (`fieldLayoutId`),
  KEY `idx_lxhocgzmxsyycryvhiexdlbbuexbwylavnmk` (`dateDeleted`),
  CONSTRAINT `fk_tcjdemsyhskorgbanzmujnociiyepiveepzs` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xdcrrgixbklfljzqqfcmsssdvtjnouwskxle` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrytypes
-- ----------------------------
BEGIN;
INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, 1, 1, 'Article', 'article', 1, 'site', NULL, NULL, 1, '2022-09-16 01:52:02', '2022-09-16 01:52:22', NULL, '7a39f5f8-8818-478a-8784-d69d59fd58c4');
INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (2, 1, 2, 'Link', 'link', 1, 'site', NULL, NULL, 2, '2022-09-16 01:52:32', '2022-09-16 01:52:32', NULL, 'abc2b959-7a28-4878-b81d-08ac81f3362d');
COMMIT;

-- ----------------------------
-- Table structure for fieldgroups
-- ----------------------------
DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmxmvzfwqhzyplzaybjaqqpxigsliydusozi` (`name`),
  KEY `idx_zouewjzpuebkpypedfcqqramfwdrvmdsfzvo` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldgroups
-- ----------------------------
BEGIN;
INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, 'Common', '2022-09-16 01:42:56', '2022-09-16 01:42:56', NULL, 'd527ecd7-601c-4525-9238-9d4b0c7d299c');
COMMIT;

-- ----------------------------
-- Table structure for fieldlayoutfields
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayoutfields`;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tbrmadnnfqckkqidwbvyimciybjabdqafrot` (`layoutId`,`fieldId`),
  KEY `idx_unubudmhuztfdoatedtxlwnduhxhfwvhokjs` (`sortOrder`),
  KEY `idx_cxibwynuaviarwzbkutxqdtwauflyxxnppqh` (`tabId`),
  KEY `idx_ezsjirhdrqtltjwjjsvuxsfcfzmbgqitdwiw` (`fieldId`),
  CONSTRAINT `fk_hfnkgjbpqssasartswcqalwmudyjhwggkyaj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oewncgwthlbgmzokqujswswnveskytertjoy` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uszxuqojqrocwttpilndrzuhnecdvbtzivnq` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldlayoutfields
-- ----------------------------
BEGIN;
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 4, 5, 7, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'fc803327-d532-4498-ad75-ee1ed12b4941');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 5, 6, 8, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '74c1f16f-8dd1-43af-9e77-294cd1b7d8e6');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 6, 7, 9, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'e5d7b700-94d3-460d-8a61-3503c8fa4043');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 6, 7, 10, 0, 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'fe058057-5d9f-47e9-82ed-09bd3f904b54');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 7, 8, 11, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '086e5fbf-ab61-43c9-8b0b-9f0dad61ff6e');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 7, 8, 12, 0, 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '0bec8513-1483-43bc-9d66-321737579750');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 8, 9, 14, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'd3662974-c1f4-4db0-9ba0-33047e267d07');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, 8, 9, 13, 0, 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '8f72768d-ceca-4651-8f3c-74abd989da5f');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, 8, 9, 15, 0, 2, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'fa0ecaa0-492e-4eb4-a77a-e4fc3393f567');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 9, 10, 16, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '1447a423-483b-430a-89f6-df559f8cb891');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, 10, 11, 18, 0, 0, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '9afeaee1-a05c-4bab-ba27-4beb45c01abe');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, 10, 11, 19, 0, 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '0791336d-c08b-404b-a2bc-2ef7c571f3ac');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (13, 10, 11, 17, 0, 2, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '9a7ce734-93d8-44fc-ae05-dbac2d1ccd74');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, 1, 12, 1, 0, 1, '2022-09-16 03:57:10', '2022-09-16 03:57:10', '61e65e22-bc51-4130-862d-c9567750de0f');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (15, 1, 12, 2, 0, 2, '2022-09-16 03:57:10', '2022-09-16 03:57:10', '3768e9ec-8646-4dd6-bdad-2053e2632f6b');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, 1, 12, 3, 0, 3, '2022-09-16 03:57:10', '2022-09-16 03:57:10', 'e1b2374f-184e-46f3-9738-f67047866fb1');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (17, 1, 12, 4, 0, 4, '2022-09-16 03:57:10', '2022-09-16 03:57:10', 'b98045e5-4a1a-4722-9d73-a7fa9b134b0d');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (18, 1, 12, 5, 0, 5, '2022-09-16 03:57:10', '2022-09-16 03:57:10', '7611e9c4-ad21-4a38-99af-9221f3412e6e');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (19, 1, 12, 6, 0, 6, '2022-09-16 03:57:10', '2022-09-16 03:57:10', '1f514650-51cf-4f07-96a5-76dccecdc2f6');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (22, 2, 14, 3, 0, 1, '2022-09-16 04:02:35', '2022-09-16 04:02:35', 'd3d993c3-41e1-445d-b4a4-c66d9f8c89f3');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (23, 2, 14, 2, 0, 2, '2022-09-16 04:02:35', '2022-09-16 04:02:35', '3f25833c-4a1f-4f40-8bb4-052307be1db9');
INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (24, 2, 14, 20, 0, 3, '2022-09-16 04:02:35', '2022-09-16 04:02:35', 'a8668e8d-6d96-4785-a14b-cc88f7b906fc');
COMMIT;

-- ----------------------------
-- Table structure for fieldlayouts
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ynprcvailbyhgiewcsaienvecltvbnvveqpv` (`dateDeleted`),
  KEY `idx_vcycaplvenzskdysqfsvwicyhmipplpxvtqv` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldlayouts
-- ----------------------------
BEGIN;
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, 'craft\\elements\\Entry', '2022-09-16 01:52:02', '2022-09-16 01:52:02', NULL, 'cbebb587-8212-43f1-824b-d86bcf4e6ae7');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (2, 'craft\\elements\\Entry', '2022-09-16 01:52:32', '2022-09-16 01:52:32', NULL, 'be2cf232-c499-4179-bd32-f7dfad9feeb6');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (3, 'craft\\elements\\Asset', '2022-09-16 03:21:39', '2022-09-16 03:21:39', NULL, 'bc57fee0-8843-4327-8dbc-68030f642d20');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (4, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, '4686de90-ac4b-4e03-a140-f2a876425a66');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (5, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, '0bd133c6-8a5c-4da2-a689-124cd4f35b1a');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (6, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, '4dda3694-1544-44fd-bd77-5fb9cc27e607');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (7, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, 'd3b775eb-0988-4710-9911-ed24789059e4');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (8, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, 'ad9f2509-36fe-49a0-a45d-7cb1d9e90c81');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (9, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, '6090dcd3-6dbb-444a-8a05-4fd3392a0c2f');
INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (10, 'craft\\elements\\MatrixBlock', '2022-09-16 03:56:18', '2022-09-16 03:56:18', NULL, 'f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f');
COMMIT;

-- ----------------------------
-- Table structure for fieldlayouttabs
-- ----------------------------
DROP TABLE IF EXISTS `fieldlayouttabs`;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bsrikdsnbntqhczazxgfepzhgpaydsijanko` (`sortOrder`),
  KEY `idx_qenmblmgrhlplvkeovssphvpxqhkhepqdrgq` (`layoutId`),
  CONSTRAINT `fk_omtcnvwcrttgpigzfqmxthqnxzinrxzwvrjj` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fieldlayouttabs
-- ----------------------------
BEGIN;
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 4, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"70fec59d-1c31-4fcd-8ef2-75f926458097\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'de1b1c1a-f6fc-46db-9c44-340c03dc7891');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 5, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"9039417c-c093-4a85-af41-eb6a0c9d9dc2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1943ce5d-58b3-45ca-b9c3-aae2a6d73130\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'ce938455-0bbc-4f7b-ba37-788c322396c0');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 6, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0f622dd3-3d3f-43c1-a273-8fc274aae7b8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"54074c51-7ba2-4505-82f3-b87fe64290e6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2bf39068-5cf6-4695-9109-412e6a88171f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c7558099-aeb6-4dae-acad-adea485ea6df\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '336284b0-c5cb-4ec6-a157-eb0f35a7d838');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, 7, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"43de91a6-79a4-4234-819d-de832f53b8eb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4edc15d6-7d35-4fb9-af0e-0dd07d4176ba\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a3128bc7-cc24-43f7-b607-850b23f05814\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cfda19f6-1110-4779-a1f3-eb3139f6d55b\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'd656d5ca-370c-4a7c-8798-054029865f16');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, 8, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"53a72f01-7639-44a1-a7c0-d54c3ec153b0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5a236b1b-00c7-4038-9264-b4e97830be5f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f491488e-41a5-42f6-81e5-86682f34ff99\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1ee0eb29-ceaf-45d6-b31d-d4335d7d001c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"50a3a363-0652-4d56-8bde-f13a08e5ed49\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"942f10b8-e7c1-4108-9fc2-c0b240787526\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'a9cda519-3ae0-44c1-92a6-680dde1e5027');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 9, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"91ccbdd8-f32c-4e2c-9422-6ffe09db1c1b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5f7e4f6d-4c20-402f-b540-19a74d527a52\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'de22f21d-3285-433e-88a8-b880930fa943');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, 10, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"40b3bb4e-5fed-4c5e-9069-d413bddaa9a1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"60d2ec68-884d-4556-93c7-059ae103830c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f1b9aa8c-4b6a-47c5-b910-404351c22dd2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"789299f8-0aeb-4555-8ceb-6b8f9a027268\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4c7d5aca-267c-4dd6-853f-d48019a8dff1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4bf0c4ac-93f4-4124-a602-acf797318279\"}]', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '9a41b5ff-afe8-40b9-b21d-aef10758533f');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, 1, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"dae142cb-0098-455f-a25f-d4f72c0d24cf\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6334718f-cbdb-4429-abd4-1e1bc5197588\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"76d19faa-e79e-4b31-96fb-8b8cfdd6813a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5012d5ab-ef53-438b-98c3-7d34bf27eccc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d933902b-f4fa-4ad5-8f8d-ae7007c2f35c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"342a4445-e3ed-4039-bcf1-6732df1b6d57\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ef56cbc5-4025-4527-b5e0-738658d937a0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"095e54ef-bcdc-401a-a03b-2120f01d3702\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e56edffe-2920-4056-9e5d-87c5b13fc4c2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"47846779-5fa3-401e-a371-b35f76aea647\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"13f97339-0c1c-414a-94ea-0927daa24137\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3044fea3-33de-4f52-b582-abca78cbfff9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"}]', 1, '2022-09-16 03:57:10', '2022-09-16 03:57:10', '5aef19ea-cff3-450d-80fb-485d9febf11b');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, 2, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"3de4b4df-5589-429c-933b-1a2c12e7bcdd\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"45ba2da5-4dd1-4446-b5e7-37cfd79cee00\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ef56cbc5-4025-4527-b5e0-738658d937a0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4a052e8b-dd2a-402c-b667-52e2fcfe646f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d933902b-f4fa-4ad5-8f8d-ae7007c2f35c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"27cff30d-92ff-4dac-93d8-b08395b1dba2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e957f5b5-7e61-4328-a8c4-c28bd224ec3b\"}]', 1, '2022-09-16 04:02:35', '2022-09-16 04:02:35', 'd591728c-0aa0-4911-aee2-2bfe6f649847');
INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, 3, 'Content', '{\"userCondition\":null,\"elementCondition\":null}', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"508fa209-e1e5-4130-90cf-bfaab8290f6d\",\"userCondition\":null,\"elementCondition\":null}]', 1, '2022-09-19 00:23:00', '2022-09-19 00:23:00', '65b71133-c775-443f-a596-5eb3f5b0c8ec');
COMMIT;

-- ----------------------------
-- Table structure for fields
-- ----------------------------
DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pkqncivdoahdotjlvpynncunghxrztzxmaag` (`handle`,`context`),
  KEY `idx_kuaofpqjrpvwbnfeuuqiashncnwfxflybcnx` (`groupId`),
  KEY `idx_jnsghtsnrvorewodeduvytqryzkkhgthagab` (`context`),
  CONSTRAINT `fk_voheadohcxmhubtengkfkjdxvwlqhyqjeame` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fields
-- ----------------------------
BEGIN;
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 1, 'Featured?', 'featuredEntry', 'global', 'kauxckir', 'Should this entry be featured on the listing page?', 1, 'none', NULL, 'craft\\fields\\Lightswitch', '{\"default\":false,\"offLabel\":null,\"onLabel\":null}', '2022-09-16 03:13:33', '2022-09-16 03:13:33', '76d19faa-e79e-4b31-96fb-8b8cfdd6813a');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 1, 'Featured Image', 'featuredImage', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":2,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"source\":null,\"sources\":[\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2022-09-16 03:38:56', '2022-09-16 03:38:56', 'd933902b-f4fa-4ad5-8f8d-ae7007c2f35c');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 1, 'Short Description', 'shortDescription', 'global', 'skftcfss', 'Short description for use in index regions.', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":true,\"removeInlineStyles\":true,\"removeNbsp\":true,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"uiMode\":\"enlarged\"}', '2022-09-16 03:42:53', '2022-09-16 03:42:53', 'ef56cbc5-4025-4527-b5e0-738658d937a0');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 1, 'Heading', 'heading', 'global', 'osfcbmcs', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":255,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:43:26', '2022-09-16 03:43:26', 'e56edffe-2920-4056-9e5d-87c5b13fc4c2');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 1, 'Subheading', 'subheading', 'global', 'fihbeuel', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":255,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:44:10', '2022-09-16 03:44:10', '13f97339-0c1c-414a-94ea-0927daa24137');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 1, 'Article Body', 'articleBody', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_articlebody}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '8fee31db-d190-4758-b1e3-f9a7420aa68a');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, NULL, 'Section Heading', 'sectionHeading', 'matrixBlockType:28edd4e2-705d-42cd-a7ef-4335ee740396', 'rlpkpuzy', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":255,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, NULL, 'Heading', 'heading', 'matrixBlockType:1c1599e0-d8b9-4998-ba29-325ca9a07706', 'uqezzqmi', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":255,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '1943ce5d-58b3-45ca-b9c3-aae2a6d73130');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, NULL, 'Text', 'text', 'matrixBlockType:4340da97-d0fe-4316-81e1-e36d87af24d6', 'cwwaqfyp', NULL, 1, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":true,\"removeInlineStyles\":true,\"removeNbsp\":true,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"uiMode\":\"enlarged\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '54074c51-7ba2-4505-82f3-b87fe64290e6');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, NULL, 'Position', 'position', 'matrixBlockType:4340da97-d0fe-4316-81e1-e36d87af24d6', 'dyezfneq', NULL, 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'c7558099-aeb6-4dae-acad-adea485ea6df');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, NULL, 'Pull Quote', 'pullQuote', 'matrixBlockType:9dea68d8-b4a3-4f50-b66d-d77ca664129d', 'ftiedmuu', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '4edc15d6-7d35-4fb9-af0e-0dd07d4176ba');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, NULL, 'Position', 'position', 'matrixBlockType:9dea68d8-b4a3-4f50-b66d-d77ca664129d', 'njbygknw', NULL, 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'cfda19f6-1110-4779-a1f3-eb3139f6d55b');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (13, NULL, 'Caption', 'caption', 'matrixBlockType:627b9203-93fb-4981-b7fb-f7079c41a453', 'snpssndc', NULL, 1, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"uiMode\":\"enlarged\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '1ee0eb29-ceaf-45d6-b31d-d4335d7d001c');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, NULL, 'Image', 'image', 'matrixBlockType:627b9203-93fb-4981-b7fb-f7079c41a453', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"source\":null,\"sources\":[\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '5a236b1b-00c7-4038-9264-b4e97830be5f');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (15, NULL, 'Position', 'position', 'matrixBlockType:627b9203-93fb-4981-b7fb-f7079c41a453', 'ouedvvhm', NULL, 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '942f10b8-e7c1-4108-9fc2-c0b240787526');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, NULL, 'Images', 'images', 'matrixBlockType:6a978d79-1a76-491f-9a71-7f0ca9e43efd', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":3,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"source\":null,\"sources\":[\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '5f7e4f6d-4c20-402f-b540-19a74d527a52');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (17, NULL, 'Position', 'position', 'matrixBlockType:cbf2ad31-610c-490c-b71e-c9bcf86a0919', 'dlvemyui', NULL, 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '4bf0c4ac-93f4-4124-a602-acf797318279');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (18, NULL, 'Quote', 'quote', 'matrixBlockType:cbf2ad31-610c-490c-b71e-c9bcf86a0919', 'ufnodjav', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '60d2ec68-884d-4556-93c7-059ae103830c');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (19, NULL, 'Attribution', 'attribution', 'matrixBlockType:cbf2ad31-610c-490c-b71e-c9bcf86a0919', 'rzxtexda', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-09-16 03:56:18', '2022-09-16 03:56:18', '789299f8-0aeb-4555-8ceb-6b8f9a027268');
INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES (20, 1, 'Link URL', 'linkUrl', 'global', 'urvisobw', NULL, 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":255,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":\"e.g. http://example.com\",\"uiMode\":\"normal\"}', '2022-09-16 04:02:18', '2022-09-16 04:02:18', 'e957f5b5-7e61-4328-a8c4-c28bd224ec3b');
COMMIT;

-- ----------------------------
-- Table structure for globalsets
-- ----------------------------
DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nrpirgousduluojrokuuflpattogaxhwiuft` (`name`),
  KEY `idx_uqgmqavxqrhrpzodnvfunyjjercazpztdoxw` (`handle`),
  KEY `idx_wmodvghtjrjszekbtovxhnhynycktyoebyeq` (`fieldLayoutId`),
  KEY `idx_nnwkszhdpaygoqoelpsrnsjmkyqwcwyyiuqi` (`sortOrder`),
  CONSTRAINT `fk_irbqqfvcoyfehfrrfiezvoxkwagdcpezkcih` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uqmejgwnagpbrwvbfktnexpdhkpaxzhmogbh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of globalsets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gqlschemas
-- ----------------------------
DROP TABLE IF EXISTS `gqlschemas`;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gqlschemas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gqltokens
-- ----------------------------
DROP TABLE IF EXISTS `gqltokens`;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yoflaccvsneczgcsxoavtiszmmysdvyrvmju` (`accessToken`),
  UNIQUE KEY `idx_ekfasryurbweaiplsxjdtifkjivkasmkncoc` (`name`),
  KEY `fk_inhsvvvgiptxvmloqvypkkbwhgodnqnynzwn` (`schemaId`),
  CONSTRAINT `fk_inhsvvvgiptxvmloqvypkkbwhgodnqnynzwn` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gqltokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for imagetransformindex
-- ----------------------------
DROP TABLE IF EXISTS `imagetransformindex`;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dezggkrrdtiletgnqoglrmalcsnpdvoqysts` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagetransformindex
-- ----------------------------
BEGIN;
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 103, 'craft\\imagetransforms\\ImageTransformer', 'ryan-reynolds.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '92141889-9d46-4f40-8ccd-817c1c4fbe5f');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 103, 'craft\\imagetransforms\\ImageTransformer', 'ryan-reynolds.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'd705f2d4-e392-4710-b446-64170d448592');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 104, 'craft\\imagetransforms\\ImageTransformer', 'seo.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '2fe012e9-d11d-4461-8fb1-8c0667c70807');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 104, 'craft\\imagetransforms\\ImageTransformer', 'seo.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '58b386aa-bb70-47b8-a47f-b9ed30669623');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 105, 'craft\\imagetransforms\\ImageTransformer', 'shinybrad.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '6b8fb7bf-63fc-407f-940b-5cc31703d7eb');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 105, 'craft\\imagetransforms\\ImageTransformer', 'shinybrad.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'b59e7fd8-e33a-4245-b6a5-0cd51d1cef19');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 106, 'craft\\imagetransforms\\ImageTransformer', 'skateboard.jpg', NULL, '_34x32_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'a4eeea67-c090-4bc2-ae7e-4d035f5ff669');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, 106, 'craft\\imagetransforms\\ImageTransformer', 'skateboard.jpg', NULL, '_68x65_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '2c75d2c8-9562-409b-82c7-ad11db8f8db5');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, 107, 'craft\\imagetransforms\\ImageTransformer', 'skis.jpg', NULL, '_34x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'c221c5e5-770e-40ac-9982-479687737d10');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 107, 'craft\\imagetransforms\\ImageTransformer', 'skis.jpg', NULL, '_68x68_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '67881a5a-3038-4a2b-a7bd-4b312b3dfbdf');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, 108, 'craft\\imagetransforms\\ImageTransformer', 'sports-r-us-thumb.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'aed1575b-a715-4e8d-a898-d7aaa4c8b7c5');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, 108, 'craft\\imagetransforms\\ImageTransformer', 'sports-r-us-thumb.jpg', NULL, '_68x49_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'eb215c6e-966d-4c96-93d4-7eed1f232e93');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (13, 109, 'craft\\imagetransforms\\ImageTransformer', 'sportsrus-bigfeature.jpg', NULL, '_34x10_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'c8ba6157-d35e-4f4d-982d-dcb4d2956dd2');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, 109, 'craft\\imagetransforms\\ImageTransformer', 'sportsrus-bigfeature.jpg', NULL, '_68x20_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '35cb5108-98a0-4553-847c-79a41bd45beb');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (15, 113, 'craft\\imagetransforms\\ImageTransformer', 'strategy.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '5052872e-a36e-451f-886d-0b5cdd49a41b');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, 113, 'craft\\imagetransforms\\ImageTransformer', 'strategy.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '412f7928-e37c-4424-8b0f-95ce005e71fa');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (17, 114, 'craft\\imagetransforms\\ImageTransformer', 'video.jpg', NULL, '_34x19_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '3b8ac469-8ec0-4d55-958c-1f7ac7878911');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (18, 114, 'craft\\imagetransforms\\ImageTransformer', 'video.jpg', NULL, '_68x38_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'e9dc5fc7-17fd-4e16-af73-8181eb4fe818');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (19, 115, 'craft\\imagetransforms\\ImageTransformer', 'water-barley-hops.jpg', NULL, '_34x17_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', '26030a9f-688f-4f8d-b856-2a17d60f989d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (20, 115, 'craft\\imagetransforms\\ImageTransformer', 'water-barley-hops.jpg', NULL, '_68x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:31', '2022-09-19 00:32:31', '2022-09-19 00:32:32', 'e25ef387-ddfd-4b67-9b5e-4e3794c6112d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (21, 88, 'craft\\imagetransforms\\ImageTransformer', 'fist.jpg', NULL, '_34x21_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', 'de17a357-04f2-420c-aa00-e734e83f3667');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (22, 88, 'craft\\imagetransforms\\ImageTransformer', 'fist.jpg', NULL, '_68x43_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', '4a84f9de-d9ff-422a-b9f4-b1cdbb768c24');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (23, 89, 'craft\\imagetransforms\\ImageTransformer', 'gallery.png', NULL, '_34x11_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', '1f8a48dc-f7ce-4dcd-9b27-88d5e9cfbb57');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (24, 89, 'craft\\imagetransforms\\ImageTransformer', 'gallery.png', NULL, '_68x22_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', '9a2062a2-f646-4d0b-9062-4e60b60893a0');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (25, 90, 'craft\\imagetransforms\\ImageTransformer', 'glasses.jpg', NULL, '_34x32_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'e63dc319-ef00-4744-bfe1-7054fbc380af');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (26, 90, 'craft\\imagetransforms\\ImageTransformer', 'glasses.jpg', NULL, '_68x65_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', 'b7ff9a90-ef27-40d3-85cb-f024dab8cc8e');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (27, 91, 'craft\\imagetransforms\\ImageTransformer', 'hero-image.jpg', NULL, '_34x21_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '75c0fdd8-fcc3-4f2c-a9f8-7e84d1ed756a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (28, 91, 'craft\\imagetransforms\\ImageTransformer', 'hero-image.jpg', NULL, '_68x42_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', 'af28986e-c14c-4f6e-b407-7569a226f924');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (29, 92, 'craft\\imagetransforms\\ImageTransformer', 'laptop-desk.jpg', NULL, '_34x19_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'fc60b2b2-4643-4877-a81c-84acde811c63');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (30, 92, 'craft\\imagetransforms\\ImageTransformer', 'laptop-desk.jpg', NULL, '_68x38_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:32', '79227724-cc33-48c6-ad30-73a0c0cfbbe3');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (31, 93, 'craft\\imagetransforms\\ImageTransformer', 'larry-page.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '027c53a0-af20-4730-a6dc-d0e88bb538ac');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (32, 93, 'craft\\imagetransforms\\ImageTransformer', 'larry-page.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '69d1551d-8866-4597-9666-1f661a8f6f3a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (33, 94, 'craft\\imagetransforms\\ImageTransformer', 'macbook-table.jpg', NULL, '_34x23_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'cb57606c-afe5-41c9-82fc-2d1fabd9291b');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (34, 94, 'craft\\imagetransforms\\ImageTransformer', 'macbook-table.jpg', NULL, '_68x47_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'ddf100e8-fa50-4b77-82a2-37fa7f7ad512');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (35, 95, 'craft\\imagetransforms\\ImageTransformer', 'macbook.jpg', NULL, '_34x21_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '5ddbcfa4-677c-49fc-9773-fc095fcf6190');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (36, 95, 'craft\\imagetransforms\\ImageTransformer', 'macbook.jpg', NULL, '_68x43_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '6ec7d13b-6d09-4108-afe8-f5f4e7f9a046');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (37, 96, 'craft\\imagetransforms\\ImageTransformer', 'moosic-app-ui.jpg', NULL, '_34x25_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'fb79b06d-24fd-4294-8f8d-190997acf65f');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (38, 96, 'craft\\imagetransforms\\ImageTransformer', 'moosic-app-ui.jpg', NULL, '_68x50_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '8fe93424-7be3-4669-a24c-4a3094b38c28');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (39, 97, 'craft\\imagetransforms\\ImageTransformer', 'news-entry-1-image.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'eba029dc-31ce-45eb-b96d-c47276b16222');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (40, 97, 'craft\\imagetransforms\\ImageTransformer', 'news-entry-1-image.jpg', NULL, '_68x49_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '7e534426-63d9-4bcb-ac81-a419d6e1f2b3');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (41, 98, 'craft\\imagetransforms\\ImageTransformer', 'news-link-1-image.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '461c2c76-8aee-4b85-9e2e-159ee0102425');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (42, 98, 'craft\\imagetransforms\\ImageTransformer', 'news-link-1-image.jpg', NULL, '_68x49_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '83847b59-442e-43af-8aa6-498c512b9490');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (43, 99, 'craft\\imagetransforms\\ImageTransformer', 'news-link-2-image.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'a15796c7-f4b0-43dd-acfc-44168705b44e');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (44, 99, 'craft\\imagetransforms\\ImageTransformer', 'news-link-2-image.jpg', NULL, '_68x49_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '8da61e01-6468-4070-b5ca-fa704764cf46');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (45, 100, 'craft\\imagetransforms\\ImageTransformer', 'on-track-thumb.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '74033e95-bac4-4771-ba55-27e6a8fb864a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (46, 100, 'craft\\imagetransforms\\ImageTransformer', 'on-track-thumb.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', 'a6a961bc-e4c8-4e03-8261-cea821375581');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (47, 101, 'craft\\imagetransforms\\ImageTransformer', 'ontrack-bigimage.jpg', NULL, '_34x11_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '2ffb7cae-6356-4822-b3fe-16ac269b164b');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (48, 101, 'craft\\imagetransforms\\ImageTransformer', 'ontrack-bigimage.jpg', NULL, '_68x22_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '7cf41d39-59af-4e68-9ec7-a6bda5f1b697');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (49, 102, 'craft\\imagetransforms\\ImageTransformer', 'pong.png', NULL, '_34x9_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '8cc94ef2-b39a-4708-9ca9-47f107f42f93');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (50, 102, 'craft\\imagetransforms\\ImageTransformer', 'pong.png', NULL, '_68x18_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '92a39821-e894-4f26-a101-a9ce2766aa1d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (51, 74, 'craft\\imagetransforms\\ImageTransformer', 'bike.jpg', NULL, '_34x32_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'd034023c-ad81-47fd-a193-484dbb14f100');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (52, 74, 'craft\\imagetransforms\\ImageTransformer', 'bike.jpg', NULL, '_68x65_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '502d6eea-db46-4562-8f37-a0825bf78f47');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (53, 75, 'craft\\imagetransforms\\ImageTransformer', 'bob-guff.png', NULL, '_34x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '8f8ba574-1d44-407a-8fe5-bd1e86d5e2d3');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (54, 75, 'craft\\imagetransforms\\ImageTransformer', 'bob-guff.png', NULL, '_68x68_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '2b6e78e4-de0e-4610-89e7-cf7d1ac11cd3');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (55, 76, 'craft\\imagetransforms\\ImageTransformer', 'chicago-office.jpg', NULL, '_34x20_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '9db0af5d-f8f0-4348-81f5-d81b747b9965');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (56, 76, 'craft\\imagetransforms\\ImageTransformer', 'chicago-office.jpg', NULL, '_68x41_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '6cf8f8e2-abad-44b8-b175-10d3112b154f');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (57, 77, 'craft\\imagetransforms\\ImageTransformer', 'coffee-shop.jpg', NULL, '_34x32_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'ebfe0bac-d11c-4c10-9dc9-65fbe6252b40');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (58, 77, 'craft\\imagetransforms\\ImageTransformer', 'coffee-shop.jpg', NULL, '_68x65_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '31b4fef2-1015-430c-97e4-d872a46201ec');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (59, 78, 'craft\\imagetransforms\\ImageTransformer', 'create-genius.jpg', NULL, '_34x11_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '6f1a5912-92c4-4289-bf3c-6d9ff010feb2');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (60, 78, 'craft\\imagetransforms\\ImageTransformer', 'create-genius.jpg', NULL, '_68x22_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:33', '1536e955-0687-4a77-8455-f839c7f69041');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (61, 79, 'craft\\imagetransforms\\ImageTransformer', 'development.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', 'a08b1001-0994-4bca-a505-a3cbe1b7e91c');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (62, 79, 'craft\\imagetransforms\\ImageTransformer', 'development.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'e1582eac-2a03-4c7f-a7b8-749991a7653e');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (63, 80, 'craft\\imagetransforms\\ImageTransformer', 'discover.jpg', NULL, '_34x11_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', '7a0e8f23-d80f-474b-8760-dafd93314275');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (64, 80, 'craft\\imagetransforms\\ImageTransformer', 'discover.jpg', NULL, '_68x22_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '570b60b2-b013-4bc9-9846-3908f3d3150d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (65, 81, 'craft\\imagetransforms\\ImageTransformer', 'diva-bigimage.jpg', NULL, '_34x11_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', '87017999-b709-440e-861a-59d967dccd02');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (66, 81, 'craft\\imagetransforms\\ImageTransformer', 'diva-bigimage.jpg', NULL, '_68x22_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'ee922d79-e08f-4cec-9331-9993c6a77ff3');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (67, 82, 'craft\\imagetransforms\\ImageTransformer', 'diva-cover.jpg', NULL, '_34x20_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', 'ba94b9d4-01c5-4ad9-b1f8-f88e4613580a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (68, 82, 'craft\\imagetransforms\\ImageTransformer', 'diva-cover.jpg', NULL, '_68x41_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '2c7952ae-9276-4900-8af5-469784d259b0');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (69, 83, 'craft\\imagetransforms\\ImageTransformer', 'diva-interface-detail.png', NULL, '_34x18_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', '702e5c63-16fd-49a8-b884-37132396915d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (70, 83, 'craft\\imagetransforms\\ImageTransformer', 'diva-interface-detail.png', NULL, '_68x36_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '27117727-c40d-44b4-9335-3841e2f8339b');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (71, 84, 'craft\\imagetransforms\\ImageTransformer', 'diva-interface-work.jpg', NULL, '_34x7_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', 'fbd84191-c80c-4850-a95a-81dd1213f5d7');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (72, 84, 'craft\\imagetransforms\\ImageTransformer', 'diva-interface-work.jpg', NULL, '_68x15_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '56c481b6-75e7-448d-8185-17afc75d8de5');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (73, 85, 'craft\\imagetransforms\\ImageTransformer', 'diva-mobile-detail.png', NULL, '_19x34_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', '10a66fa9-2df1-4d55-bf76-929deb2a8a47');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (74, 85, 'craft\\imagetransforms\\ImageTransformer', 'diva-mobile-detail.png', NULL, '_38x68_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '1b0d16d5-0665-45f4-98f7-858417f0c760');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (75, 86, 'craft\\imagetransforms\\ImageTransformer', 'email-marketing.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:25', '5789f7c9-07d7-4fc1-b76e-37961b67eb0a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (76, 86, 'craft\\imagetransforms\\ImageTransformer', 'email-marketing.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'fe7ce4a3-481e-4e30-989d-df957a965d37');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (77, 87, 'craft\\imagetransforms\\ImageTransformer', 'explore.jpg', NULL, '_34x11_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:26', '6f180b37-a519-4baf-a472-60bc2366e618');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (78, 87, 'craft\\imagetransforms\\ImageTransformer', 'explore.jpg', NULL, '_68x22_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'bce4abb5-f7a9-4a1c-b48b-c2f5b8329626');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (79, 69, 'craft\\imagetransforms\\ImageTransformer', 'app-development.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:26', '79da822c-861b-475b-bb90-686f1fb4f28d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (80, 69, 'craft\\imagetransforms\\ImageTransformer', 'app-development.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'b4726d9b-3263-4484-894f-31faa0246e0d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (81, 70, 'craft\\imagetransforms\\ImageTransformer', 'augmented-reality-icons.png', NULL, '_34x3_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:26', '83fe595c-7a3c-4050-9044-468d3a2643b2');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (82, 70, 'craft\\imagetransforms\\ImageTransformer', 'augmented-reality-icons.png', NULL, '_68x7_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '9ccf15be-5fde-483c-8952-a264f87ff11a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (83, 71, 'craft\\imagetransforms\\ImageTransformer', 'augmented-reality.jpg', NULL, '_34x24_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:26', 'ece4162a-17a2-4d98-8c09-420f2e849e8a');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (84, 71, 'craft\\imagetransforms\\ImageTransformer', 'augmented-reality.jpg', NULL, '_68x48_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '1d331f8b-5ad3-4a43-ac9b-f10f50d555c3');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (85, 72, 'craft\\imagetransforms\\ImageTransformer', 'awesome-cities.jpg', NULL, '_34x17_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:26', 'c196c6f4-821f-4d6b-9baa-352417258f49');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (86, 72, 'craft\\imagetransforms\\ImageTransformer', 'awesome-cities.jpg', NULL, '_68x35_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', '19ae46c0-2087-4641-a71a-369363873a11');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (87, 73, 'craft\\imagetransforms\\ImageTransformer', 'bar.jpg', NULL, '_34x16_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:35:26', '2d6e1bf1-542d-4b14-a4e9-00c63519c77d');
INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES (88, 73, 'craft\\imagetransforms\\ImageTransformer', 'bar.jpg', NULL, '_68x32_crop_center-center_none', 1, 0, 0, '2022-09-19 00:32:32', '2022-09-19 00:32:32', '2022-09-19 00:32:34', 'bbc5522d-440f-4d4b-bee1-687f199fd3f8');
COMMIT;

-- ----------------------------
-- Table structure for imagetransforms
-- ----------------------------
DROP TABLE IF EXISTS `imagetransforms`;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_geseebbrlbczghqnyyhazgqstjhdyaalarpk` (`name`),
  KEY `idx_xyvusitoivkpkbfwmpqwvwqvsrgpoqxgvuwy` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagetransforms
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
BEGIN;
INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, '4.2.4', '4.0.0.9', 0, 'anoikcyxvrmr', '3@suazzwopqh', '2022-09-16 01:42:56', '2022-09-19 00:24:34', '9be878ea-acd9-4a6d-a405-8f0af95158c2');
COMMIT;

-- ----------------------------
-- Table structure for matrixblocks
-- ----------------------------
DROP TABLE IF EXISTS `matrixblocks`;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uglrrkgqnkyargmusuvsaeybkiosopprxrsx` (`primaryOwnerId`),
  KEY `idx_khiupcxrsqvntchnzpipyysbyvrxzavbslwi` (`fieldId`),
  KEY `idx_bxqthgpkggovoepzfghnlrjpyfbyubsmyfqm` (`typeId`),
  CONSTRAINT `fk_eacvucxupobgtvndtztwlzjnohyjesvzwans` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ehnmwallwgnzltwoxhgicfovcgmerlozqhtc` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nljpqgmnsnabidrqgyhiyicgydeujkdlnuoi` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xvjthlpcuefmgxxgwuzzdcvjxquajiooytvk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixblocks
-- ----------------------------
BEGIN;
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (116, 68, 6, 1, 0, '2022-09-19 00:34:06', '2022-09-19 00:34:06');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (117, 68, 6, 1, 0, '2022-09-19 00:34:11', '2022-09-19 00:34:11');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (118, 68, 6, 1, 0, '2022-09-19 00:34:12', '2022-09-19 00:34:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (119, 68, 6, 2, 0, '2022-09-19 00:34:12', '2022-09-19 00:34:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (120, 68, 6, 1, 0, '2022-09-19 00:34:17', '2022-09-19 00:34:17');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (121, 68, 6, 2, 0, '2022-09-19 00:34:17', '2022-09-19 00:34:17');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (122, 68, 6, 1, 0, '2022-09-19 00:34:18', '2022-09-19 00:34:18');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (123, 68, 6, 2, 0, '2022-09-19 00:34:18', '2022-09-19 00:34:18');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (124, 68, 6, 3, 0, '2022-09-19 00:34:18', '2022-09-19 00:34:18');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (125, 68, 6, 1, 0, '2022-09-19 00:34:20', '2022-09-19 00:34:20');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (126, 68, 6, 2, 0, '2022-09-19 00:34:20', '2022-09-19 00:34:20');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (127, 68, 6, 3, 0, '2022-09-19 00:34:20', '2022-09-19 00:34:20');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (128, 68, 6, 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (129, 68, 6, 2, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (130, 68, 6, 3, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (131, 68, 6, 1, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (132, 68, 6, 2, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (133, 68, 6, 3, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (134, 68, 6, 4, 0, '2022-09-19 00:34:24', '2022-09-19 00:34:24');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (135, 68, 6, 1, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (136, 68, 6, 2, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (137, 68, 6, 3, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (138, 68, 6, 4, 0, '2022-09-19 00:34:26', '2022-09-19 00:34:26');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (139, 68, 6, 1, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (140, 68, 6, 2, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (141, 68, 6, 3, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (142, 68, 6, 4, 0, '2022-09-19 00:34:30', '2022-09-19 00:34:30');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (143, 68, 6, 1, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (144, 68, 6, 2, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (145, 68, 6, 3, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (146, 68, 6, 4, 0, '2022-09-19 00:34:35', '2022-09-19 00:34:35');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (147, 68, 6, 1, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (148, 68, 6, 2, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (149, 68, 6, 3, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (150, 68, 6, 4, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (151, 68, 6, 5, 0, '2022-09-19 00:34:36', '2022-09-19 00:34:36');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (152, 68, 6, 1, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (153, 68, 6, 2, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (154, 68, 6, 3, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (155, 68, 6, 4, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (156, 68, 6, 5, 0, '2022-09-19 00:34:42', '2022-09-19 00:34:42');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (157, 68, 6, 1, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (158, 68, 6, 2, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (159, 68, 6, 3, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (160, 68, 6, 4, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (161, 68, 6, 5, 0, '2022-09-19 00:34:46', '2022-09-19 00:34:46');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (162, 68, 6, 1, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (163, 68, 6, 2, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (164, 68, 6, 3, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (165, 68, 6, 4, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (166, 68, 6, 5, 0, '2022-09-19 00:34:48', '2022-09-19 00:34:48');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (167, 68, 6, 1, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (168, 68, 6, 2, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (169, 68, 6, 3, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (170, 68, 6, 4, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (171, 68, 6, 5, 0, '2022-09-19 00:34:52', '2022-09-19 00:34:52');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (172, 68, 6, 1, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (173, 68, 6, 2, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (174, 68, 6, 3, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (175, 68, 6, 4, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (176, 68, 6, 5, 0, '2022-09-19 00:34:57', '2022-09-19 00:34:57');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (177, 68, 6, 1, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (178, 68, 6, 2, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (179, 68, 6, 3, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (180, 68, 6, 4, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (181, 68, 6, 5, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (182, 68, 6, 6, 0, '2022-09-19 00:35:00', '2022-09-19 00:35:00');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (183, 68, 6, 1, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (184, 68, 6, 2, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (185, 68, 6, 3, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (186, 68, 6, 4, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (187, 68, 6, 5, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (188, 68, 6, 6, 0, '2022-09-19 00:35:08', '2022-09-19 00:35:08');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (189, 68, 6, 1, 0, '2022-09-19 00:35:11', '2022-09-19 00:35:11');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (190, 68, 6, 2, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (191, 68, 6, 3, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (192, 68, 6, 4, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (193, 68, 6, 5, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (194, 68, 6, 6, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (195, 68, 6, 7, 0, '2022-09-19 00:35:12', '2022-09-19 00:35:12');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (196, 68, 6, 1, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (197, 68, 6, 2, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (198, 68, 6, 3, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (199, 68, 6, 4, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (200, 68, 6, 5, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (201, 68, 6, 6, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (202, 68, 6, 7, 0, '2022-09-19 00:35:19', '2022-09-19 00:35:19');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (203, 68, 6, 1, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (204, 68, 6, 2, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (205, 68, 6, 3, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (206, 68, 6, 4, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (207, 68, 6, 5, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (208, 68, 6, 6, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (209, 68, 6, 7, NULL, '2022-09-19 00:35:21', '2022-09-19 00:35:21');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (211, 210, 6, 1, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (212, 210, 6, 2, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (213, 210, 6, 3, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (214, 210, 6, 4, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (215, 210, 6, 5, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (216, 210, 6, 6, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
INSERT INTO `matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`) VALUES (217, 210, 6, 7, NULL, '2022-09-19 00:35:25', '2022-09-19 00:35:25');
COMMIT;

-- ----------------------------
-- Table structure for matrixblocks_owners
-- ----------------------------
DROP TABLE IF EXISTS `matrixblocks_owners`;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_ykzslrvgvqffswdzimrfxhokgyxroabopswe` (`ownerId`),
  CONSTRAINT `fk_izytzzzifpllrhcyxdelwtrjzixcgwnkahmq` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ykzslrvgvqffswdzimrfxhokgyxroabopswe` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixblocks_owners
-- ----------------------------
BEGIN;
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (116, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (117, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (118, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (119, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (120, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (121, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (122, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (123, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (124, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (125, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (126, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (127, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (128, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (129, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (130, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (131, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (132, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (133, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (134, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (135, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (136, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (137, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (138, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (139, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (140, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (141, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (142, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (143, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (144, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (145, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (146, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (147, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (148, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (149, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (150, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (151, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (152, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (153, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (154, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (155, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (156, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (157, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (158, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (159, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (160, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (161, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (162, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (163, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (164, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (165, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (166, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (167, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (168, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (169, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (170, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (171, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (172, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (173, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (174, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (175, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (176, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (177, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (178, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (179, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (180, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (181, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (182, 68, 6);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (183, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (184, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (185, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (186, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (187, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (188, 68, 6);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (189, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (190, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (191, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (192, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (193, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (194, 68, 6);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (195, 68, 7);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (196, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (197, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (198, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (199, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (200, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (201, 68, 6);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (202, 68, 7);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (203, 68, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (204, 68, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (205, 68, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (206, 68, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (207, 68, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (208, 68, 6);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (209, 68, 7);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (211, 210, 1);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (212, 210, 2);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (213, 210, 3);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (214, 210, 4);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (215, 210, 5);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (216, 210, 6);
INSERT INTO `matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`) VALUES (217, 210, 7);
COMMIT;

-- ----------------------------
-- Table structure for matrixblocktypes
-- ----------------------------
DROP TABLE IF EXISTS `matrixblocktypes`;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_smxnyzmcvxbulrncefnvkvvaxhohndunrone` (`name`,`fieldId`),
  KEY `idx_arohwwhlztbtwtnezdrlzpoadkvkepauqtbm` (`handle`,`fieldId`),
  KEY `idx_tpzunuiirnddrkzicigozishukzptelvfzag` (`fieldId`),
  KEY `idx_faycielzszykafhtyfjluzwrrbnsnsgzgpou` (`fieldLayoutId`),
  CONSTRAINT `fk_lylpuqyownbsyjbjmvjndiiunwsabsevxqyd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mqxdxblxawnowcfxipdcahtogpjfrkjolkuh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixblocktypes
-- ----------------------------
BEGIN;
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 6, 4, 'New Section', 'newSection', 1, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '28edd4e2-705d-42cd-a7ef-4335ee740396');
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 6, 5, 'Heading', 'heading', 2, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '1c1599e0-d8b9-4998-ba29-325ca9a07706');
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 6, 6, 'Text', 'text', 3, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '4340da97-d0fe-4316-81e1-e36d87af24d6');
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 6, 7, 'Pull Quote', 'pullQuote', 4, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '9dea68d8-b4a3-4f50-b66d-d77ca664129d');
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 6, 8, 'Image', 'image', 5, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '627b9203-93fb-4981-b7fb-f7079c41a453');
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 6, 9, 'Gallery', 'gallery', 6, '2022-09-16 03:56:18', '2022-09-16 03:56:18', '6a978d79-1a76-491f-9a71-7f0ca9e43efd');
INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 6, 10, 'Quote', 'quote', 7, '2022-09-16 03:56:18', '2022-09-16 03:56:18', 'cbf2ad31-610c-490c-b71e-c9bcf86a0919');
COMMIT;

-- ----------------------------
-- Table structure for matrixcontent_articlebody
-- ----------------------------
DROP TABLE IF EXISTS `matrixcontent_articlebody`;
CREATE TABLE `matrixcontent_articlebody` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_newSection_sectionHeading_rlpkpuzy` varchar(1020) DEFAULT NULL,
  `field_heading_heading_uqezzqmi` varchar(1020) DEFAULT NULL,
  `field_text_text_cwwaqfyp` text DEFAULT NULL,
  `field_text_position_dyezfneq` varchar(255) DEFAULT NULL,
  `field_pullQuote_pullQuote_ftiedmuu` text DEFAULT NULL,
  `field_pullQuote_position_njbygknw` varchar(255) DEFAULT NULL,
  `field_image_caption_snpssndc` text DEFAULT NULL,
  `field_image_position_ouedvvhm` varchar(255) DEFAULT NULL,
  `field_quote_position_dlvemyui` varchar(255) DEFAULT NULL,
  `field_quote_quote_ufnodjav` text DEFAULT NULL,
  `field_quote_attribution_rzxtexda` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vrtvqrkmydznhibmkoyytfmwkilulogbgevf` (`elementId`,`siteId`),
  KEY `fk_jupncstbveemcjcelafznznciwapymzvgzbx` (`siteId`),
  CONSTRAINT `fk_jupncstbveemcjcelafznznciwapymzvgzbx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rlawgcjqqgfkiyjfvnajcrbawauajckhwrea` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matrixcontent_articlebody
-- ----------------------------
BEGIN;
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (1, 116, 1, '2022-09-19 00:34:06', '2022-09-19 00:34:06', '821bcb5c-03c6-4172-9725-eba25748f610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (2, 117, 1, '2022-09-19 00:34:11', '2022-09-19 00:34:11', 'bb88a2c3-364a-4c5b-8dce-f99c746e535c', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (3, 118, 1, '2022-09-19 00:34:12', '2022-09-19 00:34:12', '23df2547-3289-4a8b-8d77-ae6cda695fc6', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (4, 119, 1, '2022-09-19 00:34:12', '2022-09-19 00:34:12', '42bb2720-b7d7-4215-b211-dd147009fd4c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (5, 120, 1, '2022-09-19 00:34:17', '2022-09-19 00:34:17', '6ddb1904-4ecc-4970-a5dd-e4c722a9c9d3', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (6, 121, 1, '2022-09-19 00:34:17', '2022-09-19 00:34:17', 'fae2c2b7-9cbd-48a8-a57d-59fcfcb2d5c0', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (7, 122, 1, '2022-09-19 00:34:18', '2022-09-19 00:34:18', 'f4916499-bd63-4366-973e-d658c7f3b373', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (8, 123, 1, '2022-09-19 00:34:18', '2022-09-19 00:34:18', '4c849984-3956-469b-a4f6-0a05ad3a56dd', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (9, 124, 1, '2022-09-19 00:34:18', '2022-09-19 00:34:18', '329fe9b9-5da3-4d0b-adb5-4d4c1b9d7109', NULL, NULL, NULL, 'left', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (10, 125, 1, '2022-09-19 00:34:20', '2022-09-19 00:34:20', 'c51d1278-cb70-4ebb-86b8-57e5a52164e8', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (11, 126, 1, '2022-09-19 00:34:20', '2022-09-19 00:34:20', 'aabcd684-d861-4821-a0c2-115c2f04c8ec', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (12, 127, 1, '2022-09-19 00:34:20', '2022-09-19 00:34:20', '8b69924c-2e44-47fc-89f0-c115801817a6', NULL, NULL, '<p>Text 1</p>', 'left', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (13, 128, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', 'c3148e5f-edcc-48b1-afeb-cb51284c335e', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (14, 129, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '741cf72a-2df0-4d79-a31a-c409464df6f4', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (15, 130, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '60267262-27f8-42f3-9c5a-456c4a320f76', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (16, 131, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '933bf474-7e47-4d3d-83d9-42ccf54fa347', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (17, 132, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', 'f1f449ef-6686-4544-afb3-b8170ad47991', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (18, 133, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', '6b0e9b5d-fd5a-48e7-a350-77c9eca98354', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (19, 134, 1, '2022-09-19 00:34:24', '2022-09-19 00:34:24', 'd89c6a7d-e885-48d5-88ed-703c32c18507', NULL, NULL, NULL, NULL, NULL, 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (20, 135, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', '70e569a2-2916-434b-9dac-e367ad06d2ca', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (21, 136, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', 'f7cfe7ae-687f-4847-ba9c-df9498dd84a7', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (22, 137, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', 'bed41414-f7bb-479c-9bc4-31f311be34d3', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (23, 138, 1, '2022-09-19 00:34:26', '2022-09-19 00:34:26', 'b2d91c66-e2b3-4635-be21-b3d5133952f3', NULL, NULL, NULL, NULL, '\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (24, 139, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', '463d538a-89c7-468e-aeb5-fa777c7e55b6', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (25, 140, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', '1d7a4d8a-adfc-4971-9847-23d42067b333', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (26, 141, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', 'df025bf8-f893-4954-ad0d-21f7fe6ecd29', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (27, 142, 1, '2022-09-19 00:34:30', '2022-09-19 00:34:30', '673065d0-41f3-4e02-bf92-a3064b95a422', NULL, NULL, NULL, NULL, '\"Shiny Brad saved', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (28, 143, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', '97fdb4c3-1e78-4f70-bc85-855ae3254dfd', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (29, 144, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', '27a74e37-996f-48b5-b26a-ec55e96ee698', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (30, 145, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', '3bcf09b0-ee10-411f-ab04-aba54381a705', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (31, 146, 1, '2022-09-19 00:34:35', '2022-09-19 00:34:35', '9d98750e-ae92-4618-8687-1979634bf889', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (32, 147, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '32867bf8-60d9-4b19-bb3a-77cb35d82a15', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (33, 148, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '80055278-e40b-470c-80ab-94ac45ba1f52', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (34, 149, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '4da0a177-0361-489c-8076-c3c03462508a', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (35, 150, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', 'ed18e463-65e6-46f7-ac87-13165d12e3cf', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (36, 151, 1, '2022-09-19 00:34:36', '2022-09-19 00:34:36', '30f97b48-038f-4772-af6f-d7d6de7e1c29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (37, 152, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', 'b02fb6e1-e722-49b2-9eca-54a5aa1f8d5d', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (38, 153, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', 'f18e94e5-0fed-457d-b859-a005d5e6a765', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (39, 154, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '7c65022d-8383-4df7-85f9-4f8515474908', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (40, 155, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', 'a39800d9-a2b3-479c-bfa6-d0396d34199d', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (41, 156, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '05ee923d-4f99-426d-83aa-2264407f9b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (42, 157, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '4688e245-fae6-4758-9a12-97af95fe6e7d', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (43, 158, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', 'e2a5021d-c026-4c5f-855c-5442aad3f8a1', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (44, 159, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', 'd19ac872-9ed1-46d8-bee8-6919d4ada2c6', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (45, 160, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '9264ca71-7421-4c17-93fe-e24a517e6bea', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (46, 161, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', 'a19463f6-371a-4b84-8741-40ef130f9ef1', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t </p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (47, 162, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '4eca2760-26df-4cdc-bc7e-762b1786ab6a', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (48, 163, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '1d2b3d72-2414-42c4-8fad-e37a2c5d8b49', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (49, 164, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '5e2c7a41-4652-4040-9973-9e5bd85cd16d', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (50, 165, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '2263e1f6-8e79-40e3-af11-517f16830ff4', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (51, 166, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '97401c5d-a773-4b37-a0a9-b87f90f44b5b', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t <em>look</em></p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (52, 167, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '710a7997-0efd-4948-a8a5-24245a110be7', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (53, 168, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '5bfff478-9877-4c56-b733-ed0aeb52028c', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (54, 169, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '03048434-4f22-47d3-b8d7-066ebad3e7fa', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (55, 170, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', 'e030dbc0-fb6e-496c-b601-c227db57860d', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (56, 171, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', 'de0eb586-0b4c-4734-9797-5cc8a4a74879', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t <em></em></p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (57, 172, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', 'fa963405-e94b-4cf7-b517-69e42c95114d', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (58, 173, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '4aa3caba-4ce8-4a7b-bd76-b8f0db7dbdf5', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (59, 174, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', 'a84c889f-165a-46e1-9759-5cd00edca183', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (60, 175, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', 'f839ac32-f157-404b-b897-bcdfaf92f8f9', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (61, 176, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', 'ac566b22-dd73-407b-ace4-47fb936e3f8d', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (62, 177, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '37362e78-b690-4dc7-9f88-401ad1e73a4b', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (63, 178, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '02b9590b-04c5-4b72-af47-76b8178386a4', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (64, 179, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '9f2d1855-8eb2-4967-8f1e-b88207a744db', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (65, 180, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', 'e0c40120-9d09-4ae3-8d8e-6cc1580e36df', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (66, 181, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '8d8fb52d-71bf-48ea-87c7-08b858d36087', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (67, 182, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', 'd0be09fa-b352-4a71-a60f-38b6d25d8a7c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (68, 183, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'c25e1c35-484d-4531-8e85-7d5da1e896d5', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (69, 184, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'a68cae28-69bb-4e32-b3a8-c7902310c686', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (70, 185, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '9c60a7c2-987f-45bf-97df-73eb4de4a8e5', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (71, 186, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '9858423f-b719-4592-8b8a-c35ad0c639c6', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (72, 187, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'd36bec88-a839-450b-9928-c1b92c2053bc', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (73, 188, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '56bf1ba6-a843-42ed-be47-28408b362b0a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (74, 189, 1, '2022-09-19 00:35:11', '2022-09-19 00:35:11', '8369fa8b-d3fb-43cb-b04c-dd6a863938f1', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (75, 190, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '4fca513f-3e87-4f63-a8c0-95f634c30c53', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (76, 191, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'db0c25d1-686c-41ea-bf56-ed40c9a27e8c', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (77, 192, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'b527bae2-287d-47b5-b251-86841752100d', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (78, 193, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'a1cf33bc-16bb-4f22-8db0-7591c4858db9', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (79, 194, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'd0d00f7c-474c-4569-bf8b-b512f9671e16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (80, 195, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '89e4b063-50bc-4afe-a11b-4fe0b69783a5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'center', NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (81, 196, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '9fb925d3-79e4-46de-8044-99e1ffc6f2f3', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (82, 197, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'b5ef0eed-c1a4-487f-9aaf-047114d0f4a5', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (83, 198, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'a73c436d-7216-41c4-91ed-a18eaad4d5ba', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (84, 199, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '6d59fbbf-14a3-487f-86b4-2adbee9dd8b1', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (85, 200, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '375e995d-5555-4239-9a61-968513ad0bf3', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (86, 201, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '2f343b12-180c-49d1-91c6-c6f4a95b8802', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (87, 202, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'dfce7e5d-5fdf-4175-b800-9c66b733e9ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'center', '\"Incredible\".', NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (88, 203, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '9b572117-6638-4e42-a081-f917a51d53e7', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (89, 204, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '81e52f2b-528f-4d29-86a8-bb5432c689fd', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (90, 205, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'c2d2b824-25d3-4455-8ebd-003ef457ed06', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (91, 206, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'd0343266-75bb-4251-92ca-f77004c647ba', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (92, 207, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'b043b2e0-821b-4675-9d37-181608347a2a', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (93, 208, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'b6e54b09-330c-40f5-9c61-2ac502ddc59a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (94, 209, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'bad202a5-9057-4f45-bdc6-f25c334f6446', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'center', '\"Incredible\"', 'Brad');
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (95, 211, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '8e1e524a-d48b-435b-87f2-06869401f781', 'Section Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (96, 212, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '4a500de9-e249-4c89-9c41-11a1bd1bc112', NULL, 'Heading 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (97, 213, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', 'a2bc36d7-43bc-48fd-98a8-b11d9739f861', NULL, NULL, '<p>Text 1</p>', 'center', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (98, 214, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '9a2af3ae-e417-406e-b25a-1925584120a5', NULL, NULL, NULL, NULL, '\"Shiny Brad saved my life!\"', 'left', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (99, 215, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', 'c117b3ca-2fa1-48ab-8bd6-30206f6026bc', NULL, NULL, NULL, NULL, NULL, NULL, '<p>That doesn\'t look like Ryan Reynolds.</p>', 'left', NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (100, 216, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', 'dba347b1-2050-4b9e-ad1c-99a8ac69e001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_articlebody` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_newSection_sectionHeading_rlpkpuzy`, `field_heading_heading_uqezzqmi`, `field_text_text_cwwaqfyp`, `field_text_position_dyezfneq`, `field_pullQuote_pullQuote_ftiedmuu`, `field_pullQuote_position_njbygknw`, `field_image_caption_snpssndc`, `field_image_position_ouedvvhm`, `field_quote_position_dlvemyui`, `field_quote_quote_ufnodjav`, `field_quote_attribution_rzxtexda`) VALUES (101, 217, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', 'b225f860-5187-492d-834e-03205881757e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'center', '\"Incredible\"', 'Brad');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xrxavenwezzksbdxctpnrgzmtzgkgvrgdkfd` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 'craft', 'Install', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'f09e6346-0e9f-49ea-8dde-8a8d884bcc6c');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 'craft', 'm210121_145800_asset_indexing_changes', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'cc071c65-f79d-4748-b128-b1f2d5695199');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 'craft', 'm210624_222934_drop_deprecated_tables', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'b7dab578-0862-4833-925d-913b031e8145');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 'craft', 'm210724_180756_rename_source_cols', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '4189000a-1960-4c7e-91b5-9dae53474572');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 'craft', 'm210809_124211_remove_superfluous_uids', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '517a9c6c-7fe5-440b-8030-b2b15e1944d0');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 'craft', 'm210817_014201_universal_users', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '8ee86191-a698-4d73-9fe5-ff7dde0a508e');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 'craft', 'm210904_132612_store_element_source_settings_in_project_config', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'b8cca592-5940-4c27-b4a2-91613421ed97');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, 'craft', 'm211115_135500_image_transformers', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '3309a024-1510-4a87-bc2a-7bab55a365e0');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, 'craft', 'm211201_131000_filesystems', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'dd428bca-ffea-46c2-abc3-6be9ca8c1b53');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 'craft', 'm220103_043103_tab_conditions', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '9e81f41b-33a9-417f-8163-3ddf3359525a');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, 'craft', 'm220104_003433_asset_alt_text', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '91d97ca1-b7bd-4a6b-af79-6baa59efebe5');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, 'craft', 'm220123_213619_update_permissions', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'b71eeb59-7c60-4a58-a468-bd2908ecff97');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (13, 'craft', 'm220126_003432_addresses', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'd4eb92e8-6e92-408d-bd1e-b99dc8291fdf');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, 'craft', 'm220209_095604_add_indexes', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '239f0841-646d-4461-9780-34f4e4df1be7');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (15, 'craft', 'm220213_015220_matrixblocks_owners_table', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '96b06b39-eaed-4b77-86b1-e6783323bbd5');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, 'craft', 'm220214_000000_truncate_sessions', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '80a7a9b7-e229-4226-b07b-cd2b9fdf7339');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (17, 'craft', 'm220222_122159_full_names', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'f1f0c67d-b8ce-4b70-bb30-f1cd28511ff7');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (18, 'craft', 'm220223_180559_nullable_address_owner', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '01fd82d2-0fc9-49b6-996d-1035f7f49ed2');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (19, 'craft', 'm220225_165000_transform_filesystems', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '894d2733-56e0-4061-a24f-0e101342742b');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (20, 'craft', 'm220309_152006_rename_field_layout_elements', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '95f467e6-fff1-4a94-a7cb-bc3a179c9fbe');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (21, 'craft', 'm220314_211928_field_layout_element_uids', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', 'c702951f-45be-4606-8be8-c6baa5190731');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (22, 'craft', 'm220316_123800_transform_fs_subpath', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '68d9b158-8b20-4de2-888e-9e256d2a18e7');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (23, 'craft', 'm220317_174250_release_all_jobs', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '86d414f9-8aeb-4fde-b24a-093bb490d08b');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (24, 'craft', 'm220330_150000_add_site_gql_schema_components', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '9dbabc81-01f8-4baf-bdaa-48e2e0678c96');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (25, 'craft', 'm220413_024536_site_enabled_string', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-16 01:42:56', '8b528c4e-de18-42d0-a115-802adff291c2');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (26, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2022-09-16 03:41:12', '2022-09-16 03:41:12', '2022-09-16 03:41:12', '138b25ce-2752-4c13-98da-77de48484af9');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (27, 'plugin:redactor', 'Install', '2022-09-16 03:41:12', '2022-09-16 03:41:12', '2022-09-16 03:41:12', '10539e40-207b-4eb3-a6f5-9767f6a917c3');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (28, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2022-09-16 03:41:12', '2022-09-16 03:41:12', '2022-09-16 03:41:12', 'ce3cc59f-c38a-4a1b-a4ff-2b062d2c1b12');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (29, 'plugin:apple-news', 'Install', '2022-09-18 22:01:37', '2022-09-18 22:01:37', '2022-09-18 22:01:37', '07ee6e8d-186b-41ff-a0fd-1aa3c1265e9a');
INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES (30, 'plugin:apple-news', 'm190917_173453_v2_upgrade', '2022-09-18 22:01:37', '2022-09-18 22:01:37', '2022-09-18 22:01:37', '0795913d-e67c-4469-bac5-84ab3ddf16d8');
COMMIT;

-- ----------------------------
-- Table structure for plugins
-- ----------------------------
DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ejpqnjbuohbpxezdfukwbvnwqehpmepwlolc` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plugins
-- ----------------------------
BEGIN;
INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 'redactor', '3.0.2', '2.3.0', 'unknown', NULL, '2022-09-16 03:41:12', '2022-09-16 03:41:12', '2022-09-20 00:28:27', '0072eb97-89be-4957-bff4-9ba8808419f4');
INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 'apple-news', 'dev-master', '1.0.0', 'unknown', NULL, '2022-09-18 22:01:37', '2022-09-18 22:01:37', '2022-09-20 00:28:27', 'c0a3f581-9162-4873-ab37-c8117a6b3884');
COMMIT;

-- ----------------------------
-- Table structure for projectconfig
-- ----------------------------
DROP TABLE IF EXISTS `projectconfig`;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectconfig
-- ----------------------------
BEGIN;
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('dateModified', '1663547074');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('email.fromEmail', '\"tim@craftcms.com\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('email.fromName', '\"Automation Workshop\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.autocapitalize', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.autocomplete', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.autocorrect', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.class', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.disabled', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.id', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.max', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.min', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.name', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.orientation', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.readonly', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.requirable', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.size', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.step', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.title', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.uid', '\"dae142cb-0098-455f-a25f-d4f72c0d24cf\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.fieldUid', '\"76d19faa-e79e-4b31-96fb-8b8cfdd6813a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.uid', '\"6334718f-cbdb-4429-abd4-1e1bc5197588\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.fieldUid', '\"d933902b-f4fa-4ad5-8f8d-ae7007c2f35c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.uid', '\"5012d5ab-ef53-438b-98c3-7d34bf27eccc\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.2.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.fieldUid', '\"ef56cbc5-4025-4527-b5e0-738658d937a0\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.uid', '\"342a4445-e3ed-4039-bcf1-6732df1b6d57\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.3.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.fieldUid', '\"e56edffe-2920-4056-9e5d-87c5b13fc4c2\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.uid', '\"095e54ef-bcdc-401a-a03b-2120f01d3702\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.4.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.fieldUid', '\"13f97339-0c1c-414a-94ea-0927daa24137\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.uid', '\"47846779-5fa3-401e-a371-b35f76aea647\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.5.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.fieldUid', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.uid', '\"3044fea3-33de-4f52-b582-abca78cbfff9\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.elements.6.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.uid', '\"5aef19ea-cff3-450d-80fb-485d9febf11b\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.fieldLayouts.cbebb587-8212-43f1-824b-d86bcf4e6ae7.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.handle', '\"article\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.hasTitleField', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.name', '\"Article\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.section', '\"00d304c0-b07e-4f56-bc31-76975a06ecb3\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.sortOrder', '1');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.titleFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.titleTranslationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.7a39f5f8-8818-478a-8784-d69d59fd58c4.titleTranslationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.autocapitalize', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.autocomplete', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.autocorrect', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.class', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.disabled', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.id', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.max', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.min', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.name', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.orientation', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.readonly', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.requirable', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.size', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.step', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.title', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.uid', '\"3de4b4df-5589-429c-933b-1a2c12e7bcdd\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.fieldUid', '\"ef56cbc5-4025-4527-b5e0-738658d937a0\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.uid', '\"45ba2da5-4dd1-4446-b5e7-37cfd79cee00\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.fieldUid', '\"d933902b-f4fa-4ad5-8f8d-ae7007c2f35c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.uid', '\"4a052e8b-dd2a-402c-b667-52e2fcfe646f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.2.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.fieldUid', '\"e957f5b5-7e61-4328-a8c4-c28bd224ec3b\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.uid', '\"27cff30d-92ff-4dac-93d8-b08395b1dba2\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.elements.3.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.uid', '\"d591728c-0aa0-4911-aee2-2bfe6f649847\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.fieldLayouts.be2cf232-c499-4179-bd32-f7dfad9feeb6.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.handle', '\"link\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.hasTitleField', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.name', '\"Link\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.section', '\"00d304c0-b07e-4f56-bc31-76975a06ecb3\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.sortOrder', '2');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.titleFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.titleTranslationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('entryTypes.abc2b959-7a28-4878-b81d-08ac81f3362d.titleTranslationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fieldGroups.d527ecd7-601c-4525-9238-9d4b0c7d299c.name', '\"Common\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.columnSuffix', '\"fihbeuel\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.contentColumnType', '\"string(1020)\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.handle', '\"subheading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.name', '\"Subheading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.charLimit', '255');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.13f97339-0c1c-414a-94ea-0927daa24137.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.columnSuffix', '\"kauxckir\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.contentColumnType', '\"boolean\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.handle', '\"featuredEntry\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.instructions', '\"Should this entry be featured on the listing page?\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.name', '\"Featured?\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.settings.default', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.settings.offLabel', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.settings.onLabel', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.76d19faa-e79e-4b31-96fb-8b8cfdd6813a.type', '\"craft\\\\fields\\\\Lightswitch\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.columnSuffix', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.handle', '\"articleBody\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.name', '\"Article Body\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.settings.contentTable', '\"{{%matrixcontent_articlebody}}\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.settings.maxBlocks', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.settings.minBlocks', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.settings.propagationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.settings.propagationMethod', '\"all\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.translationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.8fee31db-d190-4758-b1e3-f9a7420aa68a.type', '\"craft\\\\fields\\\\Matrix\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.columnSuffix', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.handle', '\"featuredImage\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.name', '\"Featured Image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.allowedKinds.0', '\"image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.allowSubfolders', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.allowUploads', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.defaultUploadLocationSource', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.defaultUploadLocationSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.localizeRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.maxRelations', '2');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.minRelations', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.previewMode', '\"full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.restrictedDefaultUploadSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.restrictedLocationSource', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.restrictedLocationSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.restrictFiles', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.restrictLocation', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionCondition.__assoc__.0.0', '\"elementType\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionCondition.__assoc__.0.1', '\"craft\\\\elements\\\\Asset\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionCondition.__assoc__.1.0', '\"fieldContext\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionCondition.__assoc__.1.1', '\"global\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionCondition.__assoc__.2.0', '\"class\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionCondition.__assoc__.2.1', '\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.selectionLabel', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.showSiteMenu', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.source', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.sources.0', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.validateRelatedElements', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.settings.viewMode', '\"list\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.translationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c.type', '\"craft\\\\fields\\\\Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.columnSuffix', '\"osfcbmcs\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.contentColumnType', '\"string(1020)\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.handle', '\"heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.name', '\"Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.charLimit', '255');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e56edffe-2920-4056-9e5d-87c5b13fc4c2.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.columnSuffix', '\"urvisobw\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.contentColumnType', '\"string(1020)\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.handle', '\"linkUrl\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.name', '\"Link URL\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.charLimit', '255');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.placeholder', '\"e.g. http://example.com\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.e957f5b5-7e61-4328-a8c4-c28bd224ec3b.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.columnSuffix', '\"skftcfss\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.fieldGroup', '\"d527ecd7-601c-4525-9238-9d4b0c7d299c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.handle', '\"shortDescription\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.instructions', '\"Short description for use in index regions.\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.name', '\"Short Description\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.availableTransforms', '\"*\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.availableVolumes', '\"*\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.columnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.configSelectionMode', '\"choose\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.defaultTransform', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.manualConfig', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.purifierConfig', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.purifyHtml', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.redactorConfig', '\"Simple.json\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.removeEmptyTags', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.removeInlineStyles', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.removeNbsp', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.showHtmlButtonForNonAdmins', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.settings.uiMode', '\"enlarged\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fields.ef56cbc5-4025-4527-b5e0-738658d937a0.type', '\"craft\\\\redactor\\\\Field\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fs.assets.hasUrls', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fs.assets.name', '\"Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fs.assets.settings.path', '\"$ASSET_BASE_PATH\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fs.assets.type', '\"craft\\\\fs\\\\Local\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('fs.assets.url', '\"$ASSET_BASE_URL\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.fieldUid', '\"1943ce5d-58b3-45ca-b9c3-aae2a6d73130\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.uid', '\"9039417c-c093-4a85-af41-eb6a0c9d9dc2\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.uid', '\"ce938455-0bbc-4f7b-ba37-788c322396c0\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fieldLayouts.0bd133c6-8a5c-4da2-a689-124cd4f35b1a.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.columnSuffix', '\"uqezzqmi\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.contentColumnType', '\"string(1020)\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.handle', '\"heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.name', '\"Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.charLimit', '255');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.fields.1943ce5d-58b3-45ca-b9c3-aae2a6d73130.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.handle', '\"heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.name', '\"Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.1c1599e0-d8b9-4998-ba29-325ca9a07706.sortOrder', '2');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.fieldUid', '\"f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.uid', '\"70fec59d-1c31-4fcd-8ef2-75f926458097\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.uid', '\"de1b1c1a-f6fc-46db-9c44-340c03dc7891\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fieldLayouts.4686de90-ac4b-4e03-a140-f2a876425a66.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.columnSuffix', '\"rlpkpuzy\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.contentColumnType', '\"string(1020)\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.handle', '\"sectionHeading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.name', '\"Section Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.charLimit', '255');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.fields.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.handle', '\"newSection\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.name', '\"New Section\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.28edd4e2-705d-42cd-a7ef-4335ee740396.sortOrder', '1');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.fieldUid', '\"54074c51-7ba2-4505-82f3-b87fe64290e6\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.uid', '\"0f622dd3-3d3f-43c1-a273-8fc274aae7b8\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.fieldUid', '\"c7558099-aeb6-4dae-acad-adea485ea6df\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.uid', '\"2bf39068-5cf6-4695-9109-412e6a88171f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.uid', '\"336284b0-c5cb-4ec6-a157-eb0f35a7d838\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fieldLayouts.4dda3694-1544-44fd-bd77-5fb9cc27e607.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.columnSuffix', '\"cwwaqfyp\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.handle', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.name', '\"Text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.availableTransforms', '\"*\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.availableVolumes', '\"*\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.columnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.configSelectionMode', '\"choose\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.defaultTransform', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.manualConfig', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.purifierConfig', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.purifyHtml', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.redactorConfig', '\"Simple.json\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.removeEmptyTags', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.removeInlineStyles', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.removeNbsp', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.showHtmlButtonForNonAdmins', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.settings.uiMode', '\"enlarged\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.54074c51-7ba2-4505-82f3-b87fe64290e6.type', '\"craft\\\\redactor\\\\Field\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.columnSuffix', '\"dyezfneq\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.handle', '\"position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.name', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.0.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.0.__assoc__.0.1', '\"Left\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.0.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.0.__assoc__.1.1', '\"left\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.0.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.0.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.1.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.1.__assoc__.0.1', '\"Center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.1.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.1.__assoc__.1.1', '\"center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.1.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.1.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.2.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.2.__assoc__.0.1', '\"Right\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.2.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.2.__assoc__.1.1', '\"right\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.2.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.settings.options.2.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.fields.c7558099-aeb6-4dae-acad-adea485ea6df.type', '\"craft\\\\fields\\\\Dropdown\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.handle', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.name', '\"Text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.4340da97-d0fe-4316-81e1-e36d87af24d6.sortOrder', '3');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.fieldUid', '\"5a236b1b-00c7-4038-9264-b4e97830be5f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.uid', '\"53a72f01-7639-44a1-a7c0-d54c3ec153b0\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.fieldUid', '\"1ee0eb29-ceaf-45d6-b31d-d4335d7d001c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.uid', '\"f491488e-41a5-42f6-81e5-86682f34ff99\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.fieldUid', '\"942f10b8-e7c1-4108-9fc2-c0b240787526\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.uid', '\"50a3a363-0652-4d56-8bde-f13a08e5ed49\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.elements.2.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.uid', '\"a9cda519-3ae0-44c1-92a6-680dde1e5027\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fieldLayouts.ad9f2509-36fe-49a0-a45d-7cb1d9e90c81.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.columnSuffix', '\"snpssndc\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.handle', '\"caption\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.name', '\"Caption\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.availableTransforms', '\"*\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.availableVolumes', '\"*\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.columnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.configSelectionMode', '\"choose\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.defaultTransform', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.manualConfig', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.purifierConfig', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.purifyHtml', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.redactorConfig', '\"Simple.json\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.removeEmptyTags', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.removeInlineStyles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.removeNbsp', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.showHtmlButtonForNonAdmins', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.settings.uiMode', '\"enlarged\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c.type', '\"craft\\\\redactor\\\\Field\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.columnSuffix', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.handle', '\"image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.name', '\"Image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.allowedKinds.0', '\"image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.allowSubfolders', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.allowUploads', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.defaultUploadLocationSource', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.defaultUploadLocationSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.localizeRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.maxRelations', '1');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.minRelations', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.previewMode', '\"full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.restrictedDefaultUploadSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.restrictedLocationSource', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.restrictedLocationSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.restrictFiles', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.restrictLocation', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionCondition.__assoc__.0.0', '\"elementType\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionCondition.__assoc__.0.1', '\"craft\\\\elements\\\\Asset\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionCondition.__assoc__.1.0', '\"fieldContext\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionCondition.__assoc__.1.1', '\"global\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionCondition.__assoc__.2.0', '\"class\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionCondition.__assoc__.2.1', '\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.selectionLabel', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.showSiteMenu', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.source', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.sources.0', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.validateRelatedElements', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.settings.viewMode', '\"list\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.translationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.5a236b1b-00c7-4038-9264-b4e97830be5f.type', '\"craft\\\\fields\\\\Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.columnSuffix', '\"ouedvvhm\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.handle', '\"position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.name', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.0.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.0.__assoc__.0.1', '\"Left\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.0.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.0.__assoc__.1.1', '\"left\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.0.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.0.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.1.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.1.__assoc__.0.1', '\"Center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.1.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.1.__assoc__.1.1', '\"center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.1.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.1.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.2.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.2.__assoc__.0.1', '\"Right\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.2.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.2.__assoc__.1.1', '\"right\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.2.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.2.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.3.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.3.__assoc__.0.1', '\"Full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.3.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.3.__assoc__.1.1', '\"full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.3.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.settings.options.3.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.fields.942f10b8-e7c1-4108-9fc2-c0b240787526.type', '\"craft\\\\fields\\\\Dropdown\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.handle', '\"image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.name', '\"Image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.627b9203-93fb-4981-b7fb-f7079c41a453.sortOrder', '5');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.fieldUid', '\"5f7e4f6d-4c20-402f-b540-19a74d527a52\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.uid', '\"91ccbdd8-f32c-4e2c-9422-6ffe09db1c1b\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.uid', '\"de22f21d-3285-433e-88a8-b880930fa943\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fieldLayouts.6090dcd3-6dbb-444a-8a05-4fd3392a0c2f.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.columnSuffix', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.handle', '\"images\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.name', '\"Images\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.allowedKinds', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.allowSubfolders', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.allowUploads', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.defaultUploadLocationSource', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.defaultUploadLocationSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.localizeRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.maxRelations', '3');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.minRelations', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.previewMode', '\"full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.restrictedDefaultUploadSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.restrictedLocationSource', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.restrictedLocationSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.restrictFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.restrictLocation', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionCondition.__assoc__.0.0', '\"elementType\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionCondition.__assoc__.0.1', '\"craft\\\\elements\\\\Asset\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionCondition.__assoc__.1.0', '\"fieldContext\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionCondition.__assoc__.1.1', '\"global\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionCondition.__assoc__.2.0', '\"class\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionCondition.__assoc__.2.1', '\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.selectionLabel', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.showSiteMenu', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.showUnpermittedFiles', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.showUnpermittedVolumes', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.source', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.sources.0', '\"volume:2c6e9955-32e0-4310-bb8b-8bddb9d83e2f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.validateRelatedElements', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.settings.viewMode', '\"list\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.translationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.fields.5f7e4f6d-4c20-402f-b540-19a74d527a52.type', '\"craft\\\\fields\\\\Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.handle', '\"gallery\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.name', '\"Gallery\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.6a978d79-1a76-491f-9a71-7f0ca9e43efd.sortOrder', '6');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.fieldUid', '\"4edc15d6-7d35-4fb9-af0e-0dd07d4176ba\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.uid', '\"43de91a6-79a4-4234-819d-de832f53b8eb\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.fieldUid', '\"cfda19f6-1110-4779-a1f3-eb3139f6d55b\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.uid', '\"a3128bc7-cc24-43f7-b607-850b23f05814\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.uid', '\"d656d5ca-370c-4a7c-8798-054029865f16\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fieldLayouts.d3b775eb-0988-4710-9911-ed24789059e4.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.columnSuffix', '\"ftiedmuu\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.handle', '\"pullQuote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.name', '\"Pull Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.charLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.columnSuffix', '\"njbygknw\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.handle', '\"position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.name', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.0.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.0.__assoc__.0.1', '\"Left\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.0.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.0.__assoc__.1.1', '\"left\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.0.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.0.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.1.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.1.__assoc__.0.1', '\"Center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.1.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.1.__assoc__.1.1', '\"center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.1.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.1.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.2.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.2.__assoc__.0.1', '\"Right\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.2.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.2.__assoc__.1.1', '\"right\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.2.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.settings.options.2.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.fields.cfda19f6-1110-4779-a1f3-eb3139f6d55b.type', '\"craft\\\\fields\\\\Dropdown\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.handle', '\"pullQuote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.name', '\"Pull Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.9dea68d8-b4a3-4f50-b66d-d77ca664129d.sortOrder', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.field', '\"8fee31db-d190-4758-b1e3-f9a7420aa68a\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.fieldUid', '\"60d2ec68-884d-4556-93c7-059ae103830c\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.uid', '\"40b3bb4e-5fed-4c5e-9069-d413bddaa9a1\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.fieldUid', '\"789299f8-0aeb-4555-8ceb-6b8f9a027268\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.uid', '\"f1b9aa8c-4b6a-47c5-b910-404351c22dd2\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.1.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.fieldUid', '\"4bf0c4ac-93f4-4124-a602-acf797318279\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.required', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.uid', '\"4c7d5aca-267c-4dd6-853f-d48019a8dff1\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.elements.2.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.uid', '\"9a41b5ff-afe8-40b9-b21d-aef10758533f\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fieldLayouts.f4f2f9b7-260d-4fc5-9a82-1fcacbfc512f.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.columnSuffix', '\"dlvemyui\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.contentColumnType', '\"string\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.handle', '\"position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.name', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.0.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.0.__assoc__.0.1', '\"Center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.0.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.0.__assoc__.1.1', '\"center\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.0.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.0.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.1.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.1.__assoc__.0.1', '\"Full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.1.__assoc__.1.0', '\"value\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.1.__assoc__.1.1', '\"full\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.1.__assoc__.2.0', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.settings.options.1.__assoc__.2.1', '\"\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.4bf0c4ac-93f4-4124-a602-acf797318279.type', '\"craft\\\\fields\\\\Dropdown\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.columnSuffix', '\"ufnodjav\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.handle', '\"quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.name', '\"Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.charLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.60d2ec68-884d-4556-93c7-059ae103830c.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.columnSuffix', '\"rzxtexda\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.contentColumnType', '\"text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.fieldGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.handle', '\"attribution\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.name', '\"Attribution\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.searchable', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.byteLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.charLimit', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.code', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.columnType', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.initialRows', '4');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.multiline', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.settings.uiMode', '\"normal\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.translationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.translationMethod', '\"none\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.fields.789299f8-0aeb-4555-8ceb-6b8f9a027268.type', '\"craft\\\\fields\\\\PlainText\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.handle', '\"quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.name', '\"Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('matrixBlockTypes.cbf2ad31-610c-490c-b71e-c9bcf86a0919.sortOrder', '7');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.00d304c0-b07e-4f56-bc31-76975a06ecb3', '\"News\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.13f97339-0c1c-414a-94ea-0927daa24137', '\"Subheading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.1943ce5d-58b3-45ca-b9c3-aae2a6d73130', '\"Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.1c1599e0-d8b9-4998-ba29-325ca9a07706', '\"Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.1ee0eb29-ceaf-45d6-b31d-d4335d7d001c', '\"Caption\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.28edd4e2-705d-42cd-a7ef-4335ee740396', '\"New Section\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f', '\"Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.4340da97-d0fe-4316-81e1-e36d87af24d6', '\"Text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.4bf0c4ac-93f4-4124-a602-acf797318279', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.4edc15d6-7d35-4fb9-af0e-0dd07d4176ba', '\"Pull Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.54074c51-7ba2-4505-82f3-b87fe64290e6', '\"Text\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.5a236b1b-00c7-4038-9264-b4e97830be5f', '\"Image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.5f7e4f6d-4c20-402f-b540-19a74d527a52', '\"Images\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.60d2ec68-884d-4556-93c7-059ae103830c', '\"Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.627b9203-93fb-4981-b7fb-f7079c41a453', '\"Image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.6a978d79-1a76-491f-9a71-7f0ca9e43efd', '\"Gallery\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.76d19faa-e79e-4b31-96fb-8b8cfdd6813a', '\"Featured?\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.789299f8-0aeb-4555-8ceb-6b8f9a027268', '\"Attribution\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.7a39f5f8-8818-478a-8784-d69d59fd58c4', '\"Article\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.8fee31db-d190-4758-b1e3-f9a7420aa68a', '\"Article Body\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.942f10b8-e7c1-4108-9fc2-c0b240787526', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.9dea68d8-b4a3-4f50-b66d-d77ca664129d', '\"Pull Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.aaa1af88-a5c1-45ef-a972-c05e41148eb2', '\"Automation Workshop\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.abc2b959-7a28-4878-b81d-08ac81f3362d', '\"Link\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.c7558099-aeb6-4dae-acad-adea485ea6df', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.cbf2ad31-610c-490c-b71e-c9bcf86a0919', '\"Quote\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.cfda19f6-1110-4779-a1f3-eb3139f6d55b', '\"Position\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.d527ecd7-601c-4525-9238-9d4b0c7d299c', '\"Common\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.d933902b-f4fa-4ad5-8f8d-ae7007c2f35c', '\"Featured Image\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.e56edffe-2920-4056-9e5d-87c5b13fc4c2', '\"Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.e6ad8d12-8c8d-46c2-be29-d724d6ef468a', '\"Apple Fake News\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.e957f5b5-7e61-4328-a8c4-c28bd224ec3b', '\"Link URL\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.ef56cbc5-4025-4527-b5e0-738658d937a0', '\"Short Description\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('meta.__names__.f9a53aa4-5b6c-4939-964e-49e7bb6d9dd8', '\"Section Heading\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('plugins.apple-news.edition', '\"standard\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('plugins.apple-news.enabled', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('plugins.apple-news.schemaVersion', '\"1.0.0\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('plugins.redactor.edition', '\"standard\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('plugins.redactor.enabled', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('plugins.redactor.schemaVersion', '\"2.3.0\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.defaultPlacement', '\"end\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.enableVersioning', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.handle', '\"news\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.name', '\"News\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.previewTargets.0.__assoc__.0.0', '\"label\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.previewTargets.0.__assoc__.1.0', '\"urlFormat\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.previewTargets.0.__assoc__.1.1', '\"{url}\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.previewTargets.0.__assoc__.2.0', '\"refresh\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.previewTargets.0.__assoc__.2.1', '\"1\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.propagationMethod', '\"all\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.siteSettings.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.enabledByDefault', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.siteSettings.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.hasUrls', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.siteSettings.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.template', '\"news/_entry\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.siteSettings.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.uriFormat', '\"news/{slug}\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sections.00d304c0-b07e-4f56-bc31-76975a06ecb3.type', '\"channel\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('siteGroups.aaa1af88-a5c1-45ef-a972-c05e41148eb2.name', '\"Automation Workshop\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.baseUrl', '\"@web/\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.enabled', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.handle', '\"default\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.hasUrls', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.language', '\"en-US\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.name', '\"Apple Fake News\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.primary', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.siteGroup', '\"aaa1af88-a5c1-45ef-a972-c05e41148eb2\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('sites.e6ad8d12-8c8d-46c2-be29-d724d6ef468a.sortOrder', '1');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('system.edition', '\"pro\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('system.live', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('system.name', '\"Automation Workshop\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('system.schemaVersion', '\"4.0.0.9\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('system.timeZone', '\"America/Los_Angeles\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('users.allowPublicRegistration', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('users.defaultGroup', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('users.photoSubpath', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('users.photoVolumeUid', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('users.requireEmailVerification', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.autocapitalize', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.autocomplete', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.autocorrect', 'true');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.class', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.disabled', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.elementCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.id', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.instructions', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.max', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.min', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.name', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.orientation', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.placeholder', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.readonly', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.requirable', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.size', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.step', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.tip', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.title', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.uid', '\"508fa209-e1e5-4130-90cf-bfaab8290f6d\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.elements.0.width', '100');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.name', '\"Content\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.uid', '\"65b71133-c775-443f-a596-5eb3f5b0c8ec\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fieldLayouts.bc57fee0-8843-4327-8dbc-68030f642d20.tabs.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.fs', '\"assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.handle', '\"Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.name', '\"Assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.sortOrder', '1');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.titleTranslationKeyFormat', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.titleTranslationMethod', '\"site\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.transformFs', '\"assets\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES ('volumes.2c6e9955-32e0-4310-bb8b-8bddb9d83e2f.transformSubpath', '\"\"');
COMMIT;

-- ----------------------------
-- Table structure for queue
-- ----------------------------
DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vhleogxjwwvvnclevvopwhhlsgfrkvjzffbf` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_igctjbjthbalgfpowuxqugxbccevipgycdfc` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of queue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for relations
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hyblbfahxeuzobchnvmcowfdznbvuoqjaboi` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_gatwykbkxgqbhovfiawizbvolwbojgjjvrez` (`sourceId`),
  KEY `idx_liitsnenkifdmqxxwxcjspvgynrqgnvzpdir` (`targetId`),
  KEY `idx_uyitpyqwwrmphxzfubehlushbehkpblyfxpa` (`sourceSiteId`),
  CONSTRAINT `fk_ldjhqacwshcktnwkmtsnscaqfozrfkiuqujt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzoimupsmabxebpcvxkgmpxyxfgwtfumdlvj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qyyyoaflgbyqqeeixwybduyskusautlioqtt` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zodjntxngehjagbsldvwlutvdmcmthzehkcp` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relations
-- ----------------------------
BEGIN;
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 2, 68, NULL, 105, 1, '2022-09-19 00:32:52', '2022-09-19 00:32:52', '98a171d6-a3db-4261-b55e-729aab0e3ccb');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 14, 156, NULL, 103, 1, '2022-09-19 00:34:42', '2022-09-19 00:34:42', '8429c552-259a-48f4-bd6b-00be27518fdd');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 14, 161, NULL, 103, 1, '2022-09-19 00:34:46', '2022-09-19 00:34:46', '743739fb-1f37-40f5-8b99-b7f1babc077c');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 14, 166, NULL, 103, 1, '2022-09-19 00:34:48', '2022-09-19 00:34:48', '51e7a54c-6ede-4bb6-9981-b84d4589e075');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 14, 171, NULL, 103, 1, '2022-09-19 00:34:52', '2022-09-19 00:34:52', '62b4b63a-4e27-4bf5-9e4a-3875dddf797d');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (6, 14, 176, NULL, 103, 1, '2022-09-19 00:34:57', '2022-09-19 00:34:57', '71e3e6ee-c2b8-427d-9af7-b49c8cadbd80');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (7, 14, 181, NULL, 103, 1, '2022-09-19 00:35:00', '2022-09-19 00:35:00', '7f0b4edb-38b6-4312-b618-05c4388dab23');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (8, 14, 187, NULL, 103, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'eb2c98af-8ade-4960-9938-5342f82e67c0');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (9, 16, 188, NULL, 107, 1, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'ca6f7cf1-66d8-4680-817f-44016fc84bfa');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 16, 188, NULL, 108, 2, '2022-09-19 00:35:08', '2022-09-19 00:35:08', 'd6b74511-e523-4bcc-bee5-49a727767ac2');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (11, 16, 188, NULL, 109, 3, '2022-09-19 00:35:08', '2022-09-19 00:35:08', '304c0b1a-a694-4ed4-96bf-3f59efcdd071');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (12, 14, 193, NULL, 103, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '4a5fa360-1246-43bd-a5b4-bf2be8220791');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (13, 16, 194, NULL, 107, 1, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '5729861c-bf74-4e84-b0e3-cc003571b88e');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (14, 16, 194, NULL, 108, 2, '2022-09-19 00:35:12', '2022-09-19 00:35:12', '23e26481-5dff-4afa-9637-38e82e21b7b1');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (15, 16, 194, NULL, 109, 3, '2022-09-19 00:35:12', '2022-09-19 00:35:12', 'e467eb1c-80c4-46d7-a913-9be374ff180f');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (16, 14, 200, NULL, 103, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '83a1fb75-a7a8-461b-8b89-0d48c0c34ee5');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (17, 16, 201, NULL, 107, 1, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '951d1834-ea9b-4bdb-b2ac-fdde006fe3a6');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (18, 16, 201, NULL, 108, 2, '2022-09-19 00:35:19', '2022-09-19 00:35:19', '305b8417-4f61-4cc3-8939-f45e4ab8ed54');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (19, 16, 201, NULL, 109, 3, '2022-09-19 00:35:19', '2022-09-19 00:35:19', 'aeada4f6-19b8-48ae-b1d0-1c6db83317d3');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (20, 14, 207, NULL, 103, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'bbad5664-0692-47bc-ad54-dbcbd2b6ef58');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (21, 16, 208, NULL, 107, 1, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'cfab48d5-b302-4e1f-99eb-9587c3bd2b64');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (22, 16, 208, NULL, 108, 2, '2022-09-19 00:35:21', '2022-09-19 00:35:21', '5bf52e1d-7579-4eb4-b8ae-225d9f23a010');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (23, 16, 208, NULL, 109, 3, '2022-09-19 00:35:21', '2022-09-19 00:35:21', 'fd46f24e-5d8f-44f5-b9ac-7cd772148f4e');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (24, 2, 210, NULL, 105, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', 'd99763e7-d982-45c1-802c-8307476d6841');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (25, 14, 215, NULL, 103, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '2e06be5b-b039-49d0-9865-8e46f9918d78');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (26, 16, 216, NULL, 107, 1, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '49dac287-575c-48a0-af47-d73c5719b856');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (27, 16, 216, NULL, 108, 2, '2022-09-19 00:35:25', '2022-09-19 00:35:25', 'a669a017-4260-4cad-b48c-b6a784f57a98');
INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES (28, 16, 216, NULL, 109, 3, '2022-09-19 00:35:25', '2022-09-19 00:35:25', '551477c2-8afb-459f-8163-b8c04ed6d3be');
COMMIT;

-- ----------------------------
-- Table structure for resourcepaths
-- ----------------------------
DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resourcepaths
-- ----------------------------
BEGIN;
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('126f1820', '@bower/jquery/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('178f07c8', '@craft/web/assets/elementresizedetector/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('18888836', '@craft/web/assets/jqueryui/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('23c69af2', '@craft/web/assets/htmx/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('28dafb11', '@craft/web/assets/matrixsettings/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('3710187d', '@craft/web/assets/dashboard/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('4156b15f', '@craft/web/assets/velocity/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('44926c8a', '@craft/web/assets/jquerytouchevents/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('44c1b3e8', '@craft/web/assets/jquerypayment/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('4e533eb6', '@craft/web/assets/feed/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('4ef5b448', '@craft/web/assets/assetindexes/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('552e995b', '@craft/web/assets/editsection/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('55766904', '@craft/web/assets/vue/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('6f35e9d', '@craft/web/assets/fileupload/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('714603f2', '@craft/web/assets/craftsupport/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('7322d436', '@craft/web/assets/xregexp/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('74cbe2b0', '@craft/redactor/assets/field/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('789a6936', '@craft/web/assets/picturefill/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('864c829e', '@craft/web/assets/fabric/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('9185ee80', '@craft/web/assets/queuemanager/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('966614a0', '@craft/web/assets/utilities/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('aefeb589', '@craft/web/assets/garnish/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('c0dc8e22', '@craft/web/assets/selectize/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('c5ef1c17', '@craft/web/assets/pluginstore/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('c7c93400', '@craft/web/assets/tailwindreset/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('cc942c6a', '@craft/web/assets/cp/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('ce6f9ff1', '@craft/web/assets/focusvisible/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('d6a10a23', '@craft/web/assets/d3/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('d6eaf5fb', '@craft/web/assets/updateswidget/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('d7b7df4', '@craft/web/assets/prismjs/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('dba9d6a2', '@craft/web/assets/fieldsettings/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('ddc00394', '@craft/web/assets/iframeresizer/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('e193f1ca', '@craft/web/assets/updater/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('e1c7c929', '@craft/redactor/assets/redactor/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('e850b795', '@craft/web/assets/recententries/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('ebd7dfc1', '@craft/web/assets/conditionbuilder/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('ec1472b', '@craft/web/assets/updates/dist');
INSERT INTO `resourcepaths` (`hash`, `path`) VALUES ('f0a522cc', '@craft/web/assets/axios/dist');
COMMIT;

-- ----------------------------
-- Table structure for revisions
-- ----------------------------
DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xialitgohcuyhopqxroxphvibmjzcgwccttr` (`canonicalId`,`num`),
  KEY `fk_hjmpbwazjyehkrusgqhihxgqoxvkqdrvidvh` (`creatorId`),
  CONSTRAINT `fk_hjmpbwazjyehkrusgqhihxgqoxvkqdrvidvh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zxovoqcusxwddijwqkntpbzisjumckqrnygy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of revisions
-- ----------------------------
BEGIN;
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (1, 2, 1, 1, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (2, 4, 1, 1, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (3, 4, 1, 2, 'Applied “Draft 1”');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (4, 4, 1, 3, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (5, 4, 1, 4, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (6, 4, 1, 5, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (7, 11, 1, 1, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (8, 11, 1, 2, 'Applied “Draft 1”');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (9, 11, 1, 3, 'Applied “Draft 1”');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (10, 17, 1, 1, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (11, 19, 1, 1, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (12, 68, 1, 1, '');
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (13, 203, 1, 1, NULL);
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (14, 204, 1, 1, NULL);
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (15, 205, 1, 1, NULL);
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (16, 206, 1, 1, NULL);
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (17, 207, 1, 1, NULL);
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (18, 208, 1, 1, NULL);
INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES (19, 209, 1, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for searchindex
-- ----------------------------
DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_nofoinjpzoyixjdafcrbggayvffzsltixaay` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of searchindex
-- ----------------------------
BEGIN;
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (1, 'email', 0, 1, ' fakenews apple com ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (1, 'firstname', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (1, 'fullname', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (1, 'lastname', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (1, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (1, 'username', 0, 1, ' admin ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (2, 'field', 20, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (2, 'slug', 0, 1, ' test ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (2, 'title', 0, 1, ' test ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'field', 1, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'field', 2, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'field', 3, 1, ' aoeuaoeuaoeufds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'field', 4, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'field', 5, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'field', 6, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'slug', 0, 1, ' fdssdf ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (4, 'title', 0, 1, ' fdssdf ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'field', 1, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'field', 2, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'field', 3, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'field', 4, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'field', 5, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'field', 6, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'slug', 0, 1, ' fds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (11, 'title', 0, 1, ' fds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (17, 'field', 3, 1, ' fds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (17, 'slug', 0, 1, ' fds 2 ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (17, 'title', 0, 1, ' fds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (19, 'slug', 0, 1, ' fdsfsd ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (19, 'title', 0, 1, ' fdsfsd ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'field', 1, 1, ' 1 ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'field', 2, 1, ' shinybrad ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'field', 3, 1, ' youve got to see this news post ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'field', 4, 1, ' you wont believe these 10 tricks to lose weight while still drinking ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'field', 6, 1, ' section heading 1 heading 1 center center text 1 left left shiny brad saved my life that doesnt look like ryan reynolds ryan reynolds left left skis sports r us thumb sportsrus bigfeature brad center center incredible ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'slug', 0, 1, ' this is an important fake news post ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (68, 'title', 0, 1, ' this is an important fake news post ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (69, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (69, 'filename', 0, 1, ' app development jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (69, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (69, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (69, 'title', 0, 1, ' app development ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (70, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (70, 'filename', 0, 1, ' augmented reality icons png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (70, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (70, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (70, 'title', 0, 1, ' augmented reality icons ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (71, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (71, 'filename', 0, 1, ' augmented reality jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (71, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (71, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (71, 'title', 0, 1, ' augmented reality ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (72, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (72, 'filename', 0, 1, ' awesome cities jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (72, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (72, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (72, 'title', 0, 1, ' awesome cities ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (73, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (73, 'filename', 0, 1, ' bar jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (73, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (73, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (73, 'title', 0, 1, ' bar ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (74, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (74, 'filename', 0, 1, ' bike jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (74, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (74, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (74, 'title', 0, 1, ' bike ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (75, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (75, 'filename', 0, 1, ' bob guff png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (75, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (75, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (75, 'title', 0, 1, ' bob guff ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (76, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (76, 'filename', 0, 1, ' chicago office jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (76, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (76, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (76, 'title', 0, 1, ' chicago office ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (77, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (77, 'filename', 0, 1, ' coffee shop jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (77, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (77, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (77, 'title', 0, 1, ' coffee shop ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (78, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (78, 'filename', 0, 1, ' create genius jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (78, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (78, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (78, 'title', 0, 1, ' create genius ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (79, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (79, 'filename', 0, 1, ' development jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (79, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (79, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (79, 'title', 0, 1, ' development ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (80, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (80, 'filename', 0, 1, ' discover jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (80, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (80, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (80, 'title', 0, 1, ' discover ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (81, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (81, 'filename', 0, 1, ' diva bigimage jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (81, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (81, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (81, 'title', 0, 1, ' diva bigimage ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (82, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (82, 'filename', 0, 1, ' diva cover jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (82, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (82, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (82, 'title', 0, 1, ' diva cover ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (83, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (83, 'filename', 0, 1, ' diva interface detail png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (83, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (83, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (83, 'title', 0, 1, ' diva interface detail ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (84, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (84, 'filename', 0, 1, ' diva interface work jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (84, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (84, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (84, 'title', 0, 1, ' diva interface work ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (85, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (85, 'filename', 0, 1, ' diva mobile detail png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (85, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (85, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (85, 'title', 0, 1, ' diva mobile detail ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (86, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (86, 'filename', 0, 1, ' email marketing jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (86, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (86, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (86, 'title', 0, 1, ' email marketing ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (87, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (87, 'filename', 0, 1, ' explore jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (87, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (87, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (87, 'title', 0, 1, ' explore ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (88, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (88, 'filename', 0, 1, ' fist jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (88, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (88, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (88, 'title', 0, 1, ' fist ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (89, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (89, 'filename', 0, 1, ' gallery png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (89, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (89, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (89, 'title', 0, 1, ' gallery ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (90, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (90, 'filename', 0, 1, ' glasses jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (90, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (90, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (90, 'title', 0, 1, ' glasses ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (91, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (91, 'filename', 0, 1, ' hero image jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (91, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (91, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (91, 'title', 0, 1, ' hero image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (92, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (92, 'filename', 0, 1, ' laptop desk jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (92, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (92, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (92, 'title', 0, 1, ' laptop desk ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (93, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (93, 'filename', 0, 1, ' larry page png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (93, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (93, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (93, 'title', 0, 1, ' larry page ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (94, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (94, 'filename', 0, 1, ' macbook table jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (94, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (94, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (94, 'title', 0, 1, ' macbook table ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (95, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (95, 'filename', 0, 1, ' macbook jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (95, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (95, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (95, 'title', 0, 1, ' macbook ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (96, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (96, 'filename', 0, 1, ' moosic app ui jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (96, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (96, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (96, 'title', 0, 1, ' moosic app ui ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (97, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (97, 'filename', 0, 1, ' news entry 1 image jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (97, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (97, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (97, 'title', 0, 1, ' news entry 1 image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (98, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (98, 'filename', 0, 1, ' news link 1 image jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (98, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (98, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (98, 'title', 0, 1, ' news link 1 image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (99, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (99, 'filename', 0, 1, ' news link 2 image jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (99, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (99, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (99, 'title', 0, 1, ' news link 2 image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (100, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (100, 'filename', 0, 1, ' on track thumb jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (100, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (100, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (100, 'title', 0, 1, ' on track thumb ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (101, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (101, 'filename', 0, 1, ' ontrack bigimage jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (101, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (101, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (101, 'title', 0, 1, ' ontrack bigimage ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (102, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (102, 'filename', 0, 1, ' pong png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (102, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (102, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (102, 'title', 0, 1, ' pong ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (103, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (103, 'filename', 0, 1, ' ryan reynolds png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (103, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (103, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (103, 'title', 0, 1, ' ryan reynolds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (104, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (104, 'filename', 0, 1, ' seo jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (104, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (104, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (104, 'title', 0, 1, ' seo ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (105, 'extension', 0, 1, ' png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (105, 'filename', 0, 1, ' shinybrad png ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (105, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (105, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (105, 'title', 0, 1, ' shinybrad ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (106, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (106, 'filename', 0, 1, ' skateboard jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (106, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (106, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (106, 'title', 0, 1, ' skateboard ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (107, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (107, 'filename', 0, 1, ' skis jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (107, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (107, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (107, 'title', 0, 1, ' skis ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (108, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (108, 'filename', 0, 1, ' sports r us thumb jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (108, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (108, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (108, 'title', 0, 1, ' sports r us thumb ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (109, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (109, 'filename', 0, 1, ' sportsrus bigfeature jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (109, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (109, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (109, 'title', 0, 1, ' sportsrus bigfeature ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (110, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (110, 'filename', 0, 1, ' crystal jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (110, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (110, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (110, 'title', 0, 1, ' crystal ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (111, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (111, 'filename', 0, 1, ' liz jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (111, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (111, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (111, 'title', 0, 1, ' liz ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (112, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (112, 'filename', 0, 1, ' travis jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (112, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (112, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (112, 'title', 0, 1, ' travis ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (113, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (113, 'filename', 0, 1, ' strategy jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (113, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (113, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (113, 'title', 0, 1, ' strategy ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (114, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (114, 'filename', 0, 1, ' video jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (114, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (114, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (114, 'title', 0, 1, ' video ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (115, 'extension', 0, 1, ' jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (115, 'filename', 0, 1, ' water barley hops jpg ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (115, 'kind', 0, 1, ' image ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (115, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (115, 'title', 0, 1, ' water barley hops ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (203, 'field', 7, 1, ' section heading 1 ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (203, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (204, 'field', 8, 1, ' heading 1 ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (204, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (205, 'field', 9, 1, ' text 1 ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (205, 'field', 10, 1, ' center center ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (205, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (206, 'field', 11, 1, ' shiny brad saved my life ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (206, 'field', 12, 1, ' left left ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (206, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (207, 'field', 13, 1, ' that doesnt look like ryan reynolds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (207, 'field', 14, 1, ' ryan reynolds ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (207, 'field', 15, 1, ' left left ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (207, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (208, 'field', 16, 1, ' skis sports r us thumb sportsrus bigfeature ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (208, 'slug', 0, 1, '');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (209, 'field', 17, 1, ' center center ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (209, 'field', 18, 1, ' incredible ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (209, 'field', 19, 1, ' brad ');
INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES (209, 'slug', 0, 1, '');
COMMIT;

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pkfbbbzqugqvinhbrsvmnnsfkfzwtfodebuf` (`handle`),
  KEY `idx_ogkrjskqllenmwmzvzrtzaaswlrefvesmzup` (`name`),
  KEY `idx_wgvjtndmikonnewwecmypxjwkxmoyeyqpewy` (`structureId`),
  KEY `idx_qwjelasnprdxojmeyqxphdwtaexsdaexeclb` (`dateDeleted`),
  CONSTRAINT `fk_szhrrjodziuikwgihkuorwnlwiklwvuzbgns` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sections
-- ----------------------------
BEGIN;
INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, NULL, 'News', 'news', 'channel', 1, 'all', 'end', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2022-09-16 01:52:02', '2022-09-16 01:52:02', NULL, '00d304c0-b07e-4f56-bc31-76975a06ecb3');
COMMIT;

-- ----------------------------
-- Table structure for sections_sites
-- ----------------------------
DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kqzngjlmhxruuvhexxjjwgvyskeszipnvspr` (`sectionId`,`siteId`),
  KEY `idx_pkdgxrfqqburkaxpbjdhmhrvqbhagkgksvqs` (`siteId`),
  CONSTRAINT `fk_efbkknybhxubysuojrzayrokcdrsbqannlqa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kpzhivoiyecwlxcqflshyyysxcqgrwwpenxa` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sections_sites
-- ----------------------------
BEGIN;
INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 1, 1, 1, 'news/{slug}', 'news/_entry', 1, '2022-09-16 01:52:02', '2022-09-16 01:52:02', 'e54e3ace-3bf0-4fb8-86d6-23c8536a80be');
COMMIT;

-- ----------------------------
-- Table structure for sequences
-- ----------------------------
DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sequences
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vhclzopkujpbwnxowsferiypwnlgtswalazx` (`uid`),
  KEY `idx_qckjqhhlfbxbworimknkdktateeesqzkjgkr` (`token`),
  KEY `idx_gkzrdxlsaeuanesschhzenflfwhffmngejzh` (`dateUpdated`),
  KEY `idx_acfzojcnijzbkzqntrobzydtvsnfbwxykegh` (`userId`),
  CONSTRAINT `fk_axbviffvmlxdxrxiwfhpvpmofrenykqcjcpy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 1, 'NqGxs1CtmIGsRFTrGjh29JXRDFbFav-MW7Iv5ieNpkNi2j1YmUkrSpuGrEaSopSeY3V6pAnLZvQDeIWLt-GPhN5Xzkk_8aBDvcr8', '2022-09-18 20:28:34', '2022-09-18 21:02:53', '7ec90262-0f7c-43e4-943a-08c99ff162e4');
INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES (5, 1, 'dfSWwL04UKmn1cXuxoZ5cfaG_R-3EaAo98xr6cAJSJGBI1UfJy8eoIM-KGuAGHQJUdf7zDhTZYFjLxujMq6TINnEXmkCbFWZhB9c', '2022-09-20 00:28:20', '2022-09-20 00:28:27', 'b384c098-18ae-4679-9765-856ecccec7fe');
COMMIT;

-- ----------------------------
-- Table structure for shunnedmessages
-- ----------------------------
DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iuvyyifiancyrtchxvepikhqievvqlddsqoq` (`userId`,`message`),
  CONSTRAINT `fk_sralzibuuabjhjuwfwmhjxhhpmczghjdjrbs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shunnedmessages
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sitegroups
-- ----------------------------
DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nqveoiqrdzgcausckabrouqicdxsobxceoxy` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sitegroups
-- ----------------------------
BEGIN;
INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, 'Automation Workshop', '2022-09-16 01:42:56', '2022-09-16 01:42:56', NULL, 'aaa1af88-a5c1-45ef-a972-c05e41148eb2');
COMMIT;

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kbhxkszbpxstjrpeuizljbjhydzjjiayuqne` (`dateDeleted`),
  KEY `idx_haxtcvtazuubapxwmzlwboazgjntqgyxeseo` (`handle`),
  KEY `idx_ymlkasdboaoyfvugbocxlczytwsflrqdpljn` (`sortOrder`),
  KEY `fk_syyswxkmgtwzfgmypzomhsuxpybvwypxzezt` (`groupId`),
  CONSTRAINT `fk_syyswxkmgtwzfgmypzomhsuxpybvwypxzezt` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sites
-- ----------------------------
BEGIN;
INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, 1, 1, '1', 'Apple Fake News', 'default', 'en-US', 1, '@web/', 1, '2022-09-16 01:42:56', '2022-09-16 01:42:56', NULL, 'e6ad8d12-8c8d-46c2-be29-d724d6ef468a');
COMMIT;

-- ----------------------------
-- Table structure for structureelements
-- ----------------------------
DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rkwebladpmttimlogdkxiptnfjpxajoyettr` (`structureId`,`elementId`),
  KEY `idx_kmblatpyknwtijblbxcwqhcvfpxonstjnnlu` (`root`),
  KEY `idx_brjxpluyogjmnvrkxnubmqvpvooyfjakqxjr` (`lft`),
  KEY `idx_hyhsgmssygdzpffkhmwqorrmipdavxfolxfx` (`rgt`),
  KEY `idx_bxbvjescxtfolilmlvftyioxtxvjglzpcjwz` (`level`),
  KEY `idx_ajxtzyyhxiqvfrmhqwbrgtneskwhevjxnihc` (`elementId`),
  CONSTRAINT `fk_qurutvovwfjxzwbwyjaruavkbcrnwiyteqzz` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txubvobmnezzazmwnliuzdijwsuyvsykruan` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of structureelements
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for structures
-- ----------------------------
DROP TABLE IF EXISTS `structures`;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kxibnhjfwxvulslyllixmtvviplcnvckuypy` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of structures
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for systemmessages
-- ----------------------------
DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ubolvyqdhfqiojjpdrkwkucrelsqnvhnpxqw` (`key`,`language`),
  KEY `idx_jhycllawaqczfnvzzsgswnanpqysvthdfjjo` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemmessages
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for taggroups
-- ----------------------------
DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nwtrzuzhrzptdvfnzkkjphjvoyefuifguxxi` (`name`),
  KEY `idx_xoevyqjgljkzcopsebyhbujtfsgebuxezymk` (`handle`),
  KEY `idx_xwxttnyibikwjkjpjkrdxwglffbvfinrpuyb` (`dateDeleted`),
  KEY `fk_hheukwjzvqjymregzrfkpcxqbskibsqxqygi` (`fieldLayoutId`),
  CONSTRAINT `fk_hheukwjzvqjymregzrfkpcxqbskibsqxqygi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taggroups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_quukfvvtqpqkaidatptxjwomxrqfookvbqtj` (`groupId`),
  CONSTRAINT `fk_uhncdfoamjeryhiomvsuhyqubtcmtiuauiri` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ztbfnjxxyuzdjivpxqqaovhlxbsceqbofqwf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_carsfjrqxmrbfpcefjwmeowfcpghbjgbvyhm` (`token`),
  KEY `idx_ooetuclvkvkfetullqtlwnyrvatqktagjsgd` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usergroups
-- ----------------------------
DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oxarcjkemqjxzxzstdzbwxjrsbwzwngoyqix` (`handle`),
  KEY `idx_zwjndvxzmdqqloxnvwzbfwublfmukjnceltl` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usergroups_users
-- ----------------------------
DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vnllfzbrqzciictjnnfkrurkqhwdayahnjml` (`groupId`,`userId`),
  KEY `idx_uhvvxxbhtmrrygsccmccbagekyjepuruakoo` (`userId`),
  CONSTRAINT `fk_gsqmfwrjkwcgamaameuegxykejuzwoclxhvw` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hfocmpnhfnbolkjwwpqbpnptperuhglihyjh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroups_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userpermissions
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nerahdkyjbabovsbmleuxtttbrmspabnljoe` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userpermissions_usergroups
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_homjkhtodherpdcnrwabcybuxxytqvxmdwkq` (`permissionId`,`groupId`),
  KEY `idx_fdngedsfyagnagjacsrvnnjibiueofbjcpqq` (`groupId`),
  CONSTRAINT `fk_djazgctfpeihcmyqvbigmsctteelyeebnsbg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wlhsxmqbkxrafhssknkubpolxcrgocgexrzk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions_usergroups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userpermissions_users
-- ----------------------------
DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rsyxarxkqvbmacsvyfxtxphemndmtevyudtz` (`permissionId`,`userId`),
  KEY `idx_homtmareqwirdfuxfkfgnsnvawizjawqvwwk` (`userId`),
  CONSTRAINT `fk_emvqbqqtktywsyjjhsvekkhitnrfjjfzrkla` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iwrvjngqjmzdmuomwbjvuydasmqzlvoixley` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpermissions_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userpreferences
-- ----------------------------
DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_uqitzlxcjcvkfxzlmraabpwieutyznwalckb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpreferences
-- ----------------------------
BEGIN;
INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES (1, '{\"language\":\"en-US\"}');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uspyqekogvubmgtjksmsqgwfxolnycgnayuj` (`active`),
  KEY `idx_mjnfhytrnxwmqrykffskwunapvppkbgdmadf` (`locked`),
  KEY `idx_oplawdiajpjiwwjeectvqeetbxrrohqdmoqa` (`pending`),
  KEY `idx_mlbhnkiwsljuwtzgpyqgbxpzsolrhkomklky` (`suspended`),
  KEY `idx_wnpsaildutdcktygpsakxqhgdxqnajoyjxer` (`verificationCode`),
  KEY `idx_zpzjxidtrmycvmscblkshfcaejevefmebrpf` (`email`),
  KEY `idx_vqicwlzkeyhznquqgofuxlwpinkwunjvhmrz` (`username`),
  KEY `fk_ukopzwjgqohytdnhrlzhycuawchiybikrdzs` (`photoId`),
  CONSTRAINT `fk_ifvikfzkxmuadgxbviunhqrwaevmftrpuktb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ukopzwjgqohytdnhrlzhycuawchiybikrdzs` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES (1, NULL, 1, 0, 0, 0, 1, 'admin', NULL, NULL, NULL, 'fakenews@apple.com', '$2y$13$Piju65.OEwVhFOjQGDfQwumkgQ6.e7XdbzlvMjIsYyhBL57DAoucC', '2022-09-20 00:28:20', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2022-09-16 01:42:56', '2022-09-16 01:42:56', '2022-09-20 00:28:20');
COMMIT;

-- ----------------------------
-- Table structure for volumefolders
-- ----------------------------
DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bazhjnlxvvvyvpmnirhcnqevduhzckafbtjq` (`name`,`parentId`,`volumeId`),
  KEY `idx_piimomasrqkxfujeawbbcefvzqbiulfipcte` (`parentId`),
  KEY `idx_bnkdzcdrcvwivmwyoujnzfzfyfdfdbdzmuaz` (`volumeId`),
  CONSTRAINT `fk_plivuqcmmckzkovaftmebxfkvxgipoiambth` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbsougqwqaemydjtpoltkxgczossxhqgktfx` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volumefolders
-- ----------------------------
BEGIN;
INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, NULL, 1, 'Assets', NULL, '2022-09-16 03:21:39', '2022-09-19 00:23:00', '79be39eb-d929-4fef-ba2d-094ea4f47c4a');
INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, NULL, NULL, 'Temporary filesystem', NULL, '2022-09-19 00:23:52', '2022-09-19 00:23:52', '87db4689-3884-4e3a-91b8-040bec2b5720');
INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 2, NULL, 'user_1', 'user_1/', '2022-09-19 00:23:52', '2022-09-19 00:23:52', '482b3cfb-1df6-42c2-a1e7-12978a6af1e0');
INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES (10, 1, 1, 'staff', 'staff/', '2022-09-19 00:32:23', '2022-09-19 00:32:23', 'cf89183c-e9a6-4c27-8315-16951261b219');
COMMIT;

-- ----------------------------
-- Table structure for volumes
-- ----------------------------
DROP TABLE IF EXISTS `volumes`;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xdsgdmbluoxkugameqqzzngzkakiwqszenbf` (`name`),
  KEY `idx_wqmouwnznyiaxwfblstmqgeroknyyxntidkp` (`handle`),
  KEY `idx_ljkpftduoijxkwqoeyofvjzjkywwtrhcwshv` (`fieldLayoutId`),
  KEY `idx_cniiaytnpbkdqnhzyhfyouhnnzlrkaxhdkxu` (`dateDeleted`),
  CONSTRAINT `fk_ibrckmdjjwtpgonzcdrapcqyuhlydvswuiod` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volumes
-- ----------------------------
BEGIN;
INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES (1, 3, 'Assets', 'Assets', 'assets', 'assets', '', 'site', NULL, 1, '2022-09-16 03:21:39', '2022-09-19 00:23:00', NULL, '2c6e9955-32e0-4310-bb8b-8bddb9d83e2f');
COMMIT;

-- ----------------------------
-- Table structure for widgets
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qglklumwhyysnmrpkauyjjfkqpkxpxdhdkif` (`userId`),
  CONSTRAINT `fk_tbygplbwhifzfektzhiqghgdfdkefkncxfka` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of widgets
-- ----------------------------
BEGIN;
INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2022-09-16 01:43:33', '2022-09-16 01:43:33', '14de1d1d-af69-4734-9cbf-4531362642b0');
INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2022-09-16 01:43:33', '2022-09-16 01:43:33', 'e6e7887c-be91-4e47-8872-2b3e0d612f5b');
INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2022-09-16 01:43:33', '2022-09-16 01:43:33', 'e5352dda-9de3-4b8e-bd37-fff721c0756d');
INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES (4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2022-09-16 01:43:33', '2022-09-16 01:43:33', '4df86154-9ec5-4ef3-913b-69cdbd673f3a');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

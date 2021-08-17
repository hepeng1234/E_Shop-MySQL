/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : e_shop

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 17/08/2021 20:59:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brand_info
-- ----------------------------
DROP TABLE IF EXISTS `brand_info`;
CREATE TABLE `brand_info`  (
  `Id` int(0) NOT NULL,
  `Brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brand_product
-- ----------------------------
DROP TABLE IF EXISTS `brand_product`;
CREATE TABLE `brand_product`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `BrandId` int(0) NULL DEFAULT NULL COMMENT '店铺id',
  `ProductId` int(0) NULL DEFAULT NULL COMMENT '产品id',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ProductId`(`ProductId`) USING BTREE,
  INDEX `BrandId`(`BrandId`) USING BTREE,
  CONSTRAINT `brand_product_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `product_info` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `brand_product_ibfk_2` FOREIGN KEY (`BrandId`) REFERENCES `brand_info` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carousel_picture
-- ----------------------------
DROP TABLE IF EXISTS `carousel_picture`;
CREATE TABLE `carousel_picture`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel_picture
-- ----------------------------
INSERT INTO `carousel_picture` VALUES (1, 'https://tva2.sinaimg.cn/large/0072Vf1pgy1fodqowkp8sj31fy10hhdt.jpg');
INSERT INTO `carousel_picture` VALUES (2, 'https://tva4.sinaimg.cn/large/0072Vf1pgy1foxloc9lg4j31hc0u0k8p.jpg');
INSERT INTO `carousel_picture` VALUES (3, 'https://tva1.sinaimg.cn/large/0072Vf1pgy1foxk3gtfinj31hc0u0k6t.jpg');
INSERT INTO `carousel_picture` VALUES (4, 'https://tva1.sinaimg.cn/large/a15b4afegy1fmvjhu7kbgj21hc0u0qns.jpg');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `ProductInfoId` int(0) NULL DEFAULT NULL COMMENT '商品Id   对应product_info表的id',
  `Count` int(0) NULL DEFAULT NULL COMMENT '个数',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ProductId`(`ProductInfoId`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`ProductInfoId`) REFERENCES `product_info` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, 2, 2);
INSERT INTO `cart` VALUES (3, 3, 3);
INSERT INTO `cart` VALUES (4, 4, 4);

-- ----------------------------
-- Table structure for navbar_left
-- ----------------------------
DROP TABLE IF EXISTS `navbar_left`;
CREATE TABLE `navbar_left`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of navbar_left
-- ----------------------------
INSERT INTO `navbar_left` VALUES (1, '家具生活');
INSERT INTO `navbar_left` VALUES (2, '摄影设计');
INSERT INTO `navbar_left` VALUES (3, '明星美女');
INSERT INTO `navbar_left` VALUES (4, '空间设计');
INSERT INTO `navbar_left` VALUES (5, '户型装饰');
INSERT INTO `navbar_left` VALUES (6, '广告摄影');
INSERT INTO `navbar_left` VALUES (7, '摄影学习');
INSERT INTO `navbar_left` VALUES (8, '明星写真');
INSERT INTO `navbar_left` VALUES (9, '古典美女');
INSERT INTO `navbar_left` VALUES (10, '清纯甜美');
INSERT INTO `navbar_left` VALUES (11, '动漫动画');

-- ----------------------------
-- Table structure for navbar_right
-- ----------------------------
DROP TABLE IF EXISTS `navbar_right`;
CREATE TABLE `navbar_right`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `NavbarLeftId` int(0) NULL DEFAULT NULL COMMENT '对应的navbar模块',
  `PictureUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片Url',
  `Msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '信息',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `NavbarLeftId`(`NavbarLeftId`) USING BTREE,
  CONSTRAINT `navbar_right_ibfk_1` FOREIGN KEY (`NavbarLeftId`) REFERENCES `navbar_left` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of navbar_right
-- ----------------------------
INSERT INTO `navbar_right` VALUES (1, 1, 'https://tva2.sinaimg.cn/large/0072Vf1pgy1fodqowkp8sj31fy10hhdt.jpg', NULL);
INSERT INTO `navbar_right` VALUES (2, 1, 'https://tva4.sinaimg.cn/large/0072Vf1pgy1foxloc9lg4j31hc0u0k8p.jpg', NULL);
INSERT INTO `navbar_right` VALUES (3, 1, 'https://tva1.sinaimg.cn/large/0072Vf1pgy1foxk3gtfinj31hc0u0k6t.jpg', NULL);
INSERT INTO `navbar_right` VALUES (4, 1, 'https://tva1.sinaimg.cn/large/a15b4afegy1fmvjhu7kbgj21hc0u0qns.jpg', NULL);
INSERT INTO `navbar_right` VALUES (5, 2, 'https://tva4.sinaimg.cn/large/0072Vf1pgy1foxloc9lg4j31hc0u0k8p.jpg', NULL);
INSERT INTO `navbar_right` VALUES (6, 2, 'http://www.tibet.cn/cn/index/ecology/202009/W020200927359053344146.jpg', '可可西里藏羚羊大规模迁徙产仔结束_生态_中国西藏网');
INSERT INTO `navbar_right` VALUES (7, 3, 'https://th.bing.com/th/id/Re75777e5084b595ee0071f9431ee022b?rik=4wx4MTjXvm3%2f1g&riu=http%3a%2f%2fsc.68design.net%2fphotofiles%2f201601%2ftoVVmJ34MX.jpg&ehk=yA8DHGAXZz75ca1fYxVhUcnrFGDn%2bmcnavTgjq86UwQ%3d&risl=&pid=ImgRaw', '蓝色星球_星球图片 - 电影天堂');
INSERT INTO `navbar_right` VALUES (8, 3, 'https://th.bing.com/th/id/Rdc4392cc0c5bd2543f5a2acd10675978?rik=i%2bgBD9iERplP%2bA&riu=http%3a%2f%2fwww.zgqxb.com.cn%2fzx%2fyw%2f202003%2fW020200323531309141468.jpg&ehk=1girlrRyUr%2fpij4pqJbQgP07daK48b80mRvjRcO9Y8k%3d&risl=&pid=ImgRaw', '新华时评：世界气象日守护我们的蓝色星球');
INSERT INTO `navbar_right` VALUES (9, 4, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', '厦门星空魔幻城攻略,厦门星空魔幻城门票/游玩攻略/地址/图片 ...');
INSERT INTO `navbar_right` VALUES (10, 5, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);
INSERT INTO `navbar_right` VALUES (11, 6, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);
INSERT INTO `navbar_right` VALUES (12, 7, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);
INSERT INTO `navbar_right` VALUES (13, 8, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);
INSERT INTO `navbar_right` VALUES (14, 9, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);
INSERT INTO `navbar_right` VALUES (15, 10, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);
INSERT INTO `navbar_right` VALUES (16, 11, 'https://youimg1.c-ctrip.com/target/10021f000001gxe0lFC15.jpg', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `Time` datetime(0) NULL DEFAULT NULL COMMENT '发表时间',
  `ContentId` int(0) NULL DEFAULT NULL COMMENT '文本内容id  news_detailed表',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ContentId`(`ContentId`) USING BTREE,
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`ContentId`) REFERENCES `news_detailed` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '快评丨大妈持“秋名山老司机资格证”逆行上路，不能仅当笑话看', 'https://static-global-s-msn-com.akamaized.net/img-resizer/tenant/amp/entityid/BB1ahCbr.img?h=515&w=871&m=6&q=60&u=t&o=t&l=f&f=jpg', '2021-03-05 00:00:00', 1);
INSERT INTO `news` VALUES (2, '国家基本公共服务标准坚持应有尽有、承诺必达原则 每五年调整一次', 'http://inews.gtimg.com/newsapp_ls/0/13457874833_640330/0', '2021-04-22 23:19:00', 2);
INSERT INTO `news` VALUES (3, '不得故意安排学生单独坐最后一排！教育部明确！', 'http://inews.gtimg.com/newsapp_ls/0/13457863632_640330/0', '2021-04-23 08:41:00', 3);
INSERT INTO `news` VALUES (4, '踏浪蹈海向党旗报告——写在人民海军成立72周年之际', '//inews.gtimg.com/newsapp_ls/0/13457977348_485350/0', '2021-04-22 21:17:00', 4);
INSERT INTO `news` VALUES (5, '红星观察｜《猫和老鼠》票房“扑街”，《寻龙传说》能否创造奇迹？ - 由 红星新闻 提供', 'https://static-global-s-msn-com.akamaized.net/img-resizer/tenant/amp/entityid/BB1egiZF.img?h=515&w=871&m=6&q=60&u=t&o=t&l=f&f=jpg', '2021-03-07 00:00:00', NULL);
INSERT INTO `news` VALUES (6, '爱音乐之人的伯乐 森海塞尔MOMENTUM二代蓝牙耳机评测', '//inews.gtimg.com/newsapp_ls/0/13456760063_485350/0', '2021-03-08 00:00:00', NULL);

-- ----------------------------
-- Table structure for news_detailed
-- ----------------------------
DROP TABLE IF EXISTS `news_detailed`;
CREATE TABLE `news_detailed`  (
  `Id` int(0) NOT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文本内容',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_detailed
-- ----------------------------
INSERT INTO `news_detailed` VALUES (1, '近日，广西贺州交警铁骑在巡逻时发现，一位大妈骑着两轮电动车，多次在机动车道上逆行。铁骑队员立马赶上前将大妈拦停，并要求她出示驾驶证、行驶证。万万没想到，这位大妈竟掏出一份盖有印章的“老司机资格证”。<br>交警查看发现，该证出自“秋名山车神协会”，证书上一本正经地写着：兹证明杨某经秋名山车神协会认证通过。其驾驶技术娴熟，完成所需认定标准，特此认证。请妥善保管该证，并于适当场合、适当对象、适当时机出示此证，终生有效。<br>大妈告诉交警，自己花了5000元办得此证，但当交警进一步询问时，大妈话语凌乱，说不清楚来历。对此，贺州交警通报称，铁骑队员对该大妈进行教育批评后，没收了所谓的“老司机资格证”，让其走回右边的行车道。当地交警部门还在平台上普法，提醒大家通过正规驾校报名，通过考试获取正规证件，以免造成损失。<br>或许多数人看到大妈的迷惑行为，都会被“逗笑”。但笑过之后，又不免泛起一阵辛酸。报道里有提到一个细节，从大妈的神情可以看出，在遇到交警之前，她并不知道该证是无效证件。“当真”与“搞笑”之间，有着一个大妈的距离。人们可以据此批评大妈“很傻很天真”，缺乏常识和辨别能力。但不能仅仅流连于此。<br>对于90后、00后等年轻群体而言，老司机资格证实则与帅哥证、美女证、好老师证、好老公证、光棍证、吃货证、二货青年证、富二代证等一样，都是用于恶搞的趣味证件，一看就明白。在一些网购平台，花上一两元钱就可以买到一本，没有人会拿它当真，只是纯粹出于好玩。但将这种认知，推之于更大范围的人群，则不一定成立。骗子之所以能骗人，就是利用了人们各种各样的认知盲区。<br>不同于年轻人恶搞“光棍认证”“帅哥认证”只图好玩，当盖有“某某协会”印章的“老司机资格证”在市面上高价买卖流通，就不是“好玩”的事了，它足以表明存在作假骗财链条的可能性。即使“市场”很小众，也勿因“市”小而不查。相关部门顺藤摸瓜，查清楚弄明白，才是打开“老司机资格证”假证疑云的正确方式。');
INSERT INTO `news_detailed` VALUES (2, '央广网北京4月21日消息（记者吕红桥）据中央广播电视总台经济之声《天下财经》报道，《国家基本公共服务标准（2021年版）》最近发布。这个标准由国家发改委联合20个部门印发，明确了基本民生重点要保什么、保到什么程度。国务院新闻办21日举行发布会，围绕标准制定和贯彻落实，多部门对公众关心的问题进行了解读。<br/>基本公共服务是指由政府兜底保障的公共服务。《国家基本公共服务标准（2021年版）》涵盖了幼有所育、学有所教、劳有所得、病有所医、老有所养、住有所居、弱有所扶等“七有”，以及优军服务保障、文化服务保障“两个保障”，共9个方面、22个大类、80个服务项目。每个项目都明确了服务对象、服务内容、服务标准、支出责任和牵头负责单位。');
INSERT INTO `news_detailed` VALUES (3, '问题：《中小学教育惩戒规则（试行）》第12条规定了“刻意孤立”的禁止性行为。而在实践中，对“刻意孤立”的内涵存在不同的理解，有着很大差别。请问应如何界定“刻意孤立”的内涵？<br/>答复：《中小学教育惩戒规则（试行）》第十二条规定的“刻意孤立”，首先主观上是故意而且针对特定学生，具有相对性、持续性，非因疏忽而没有关注到学生的需求；行为表现上，可以是对学生正常需求故意不予回应、指使其他学生孤立特定学生或者物理上隔离（比如单独坐在最后一排）等；后果上，导致学生得不到老师的关注和正常的同伴关系，产生心理上的压力。');
INSERT INTO `news_detailed` VALUES (4, '新华社照片，北京，2021年4月22日 踏浪蹈海向党旗报告——写在人民海军成立72周年之际 海军潜艇圆满完成训练任务后返航（资料照片）。 （配本社同题文字稿） 新华社发（茆琳 摄）');

-- ----------------------------
-- Table structure for product_carousel
-- ----------------------------
DROP TABLE IF EXISTS `product_carousel`;
CREATE TABLE `product_carousel`  (
  `Id` int(0) NOT NULL,
  `ProductCarousel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品详细信息轮播图',
  INDEX `Id`(`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_carousel
-- ----------------------------
INSERT INTO `product_carousel` VALUES (1, '//img14.360buyimg.com/n1/s450x450_jfs/t1/170953/11/2746/112131/60006f35E57c188ad/f29ae922b25c4f91.jpg');
INSERT INTO `product_carousel` VALUES (1, '//img14.360buyimg.com/n1/s450x450_jfs/t1/163366/22/1923/98720/5ffabc63E3994c60f/893c0e37c49d97ce.jpg');
INSERT INTO `product_carousel` VALUES (1, '//img14.360buyimg.com/n1/s450x450_jfs/t1/162660/9/1360/29375/5ffabc63E3996f7c3/436ef24c39b199ba.jpg');
INSERT INTO `product_carousel` VALUES (2, '//img10.360buyimg.com/n1/s450x450_jfs/t1/97062/37/18673/150018/5e95e558E852685b4/d86fc2025388e55a.jpg');
INSERT INTO `product_carousel` VALUES (2, '//img10.360buyimg.com/n1/s450x450_jfs/t1/117090/7/1279/105959/5e95e55cE76214071/f4b0cb6bfe76f048.jpg');
INSERT INTO `product_carousel` VALUES (2, '//img10.360buyimg.com/n1/s450x450_jfs/t1/85641/14/18486/65546/5e95e560E368b2da1/4e14cbb7fc9eb7f2.jpg');
INSERT INTO `product_carousel` VALUES (3, '//img10.360buyimg.com/n1/s450x450_jfs/t1/158777/40/16173/61080/6063eacdE896b9608/3f2bdc2000386cc1.jpg');
INSERT INTO `product_carousel` VALUES (3, '//img10.360buyimg.com/n1/s450x450_jfs/t1/167132/2/15610/107381/6063eaceE1dcb6566/32c8aabaad5bfe15.jpg');
INSERT INTO `product_carousel` VALUES (3, '//img10.360buyimg.com/n1/s450x450_jfs/t1/156360/38/7104/68131/60097fcbEc9fbd159/a464adfe1fb2d13d.jpg');
INSERT INTO `product_carousel` VALUES (4, '//img10.360buyimg.com/n1/s450x450_jfs/t1/147229/7/16565/163320/5fc76cc4E3f6b0eaa/8ba76baa2d5c52d7.jpg');
INSERT INTO `product_carousel` VALUES (4, '//img10.360buyimg.com/n1/s450x450_jfs/t1/131746/22/18129/63383/5fc76cc3Eb4ac3c26/5e7a6be69bce2cef.jpg');
INSERT INTO `product_carousel` VALUES (4, '//img10.360buyimg.com/n1/s450x450_jfs/t1/139670/36/16607/87758/5fc76cc3E264ba7aa/d849bb000dcbc24a.jpg');

-- ----------------------------
-- Table structure for product_detailed
-- ----------------------------
DROP TABLE IF EXISTS `product_detailed`;
CREATE TABLE `product_detailed`  (
  `Id` int(0) NOT NULL,
  `InfoSrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细信息',
  `CarouselUrlId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细信息轮播图id',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_detailed
-- ----------------------------
INSERT INTO `product_detailed` VALUES (1, '//m.360buyimg.com/babel/s751x1064_jfs/t1/155395/32/20759/335247/603ca403Ee02d2e49/bedf68dd4504ee88.jpg!q70.dpg', '1');
INSERT INTO `product_detailed` VALUES (2, '//img30.360buyimg.com/sku/jfs/t1/133211/20/441/293450/5ecdc505Ef45569ba/dbc52aebc5c09318.jpg', '2');
INSERT INTO `product_detailed` VALUES (3, '//img30.360buyimg.com/sku/jfs/t1/160539/40/3747/306633/60094d33Eaecac4ae/390cc6b6f8cf04c8.jpg', '3');
INSERT INTO `product_detailed` VALUES (4, '//img30.360buyimg.com/sku/jfs/t1/149190/33/19743/655232/5fe1c297Eb5174488/2c83c54e688bfc07.jpg', '4');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `Msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品描述',
  `PictureUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品首页图',
  `NewPrice` float(10, 2) NULL DEFAULT NULL COMMENT '产品最新价格',
  `OldPrice` float(10, 0) NULL DEFAULT NULL COMMENT '产品以前的价格',
  `ProDetailsId` int(0) NULL DEFAULT NULL COMMENT '商品详细信息Id',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ProDetailsId`(`ProDetailsId`) USING BTREE,
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`ProDetailsId`) REFERENCES `product_detailed` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, '三星 Galaxy S21 Ultra 5G（SM-G9980）双模5G 骁龙888 1.08亿像素 120Hz护目屏 支持Spen 12G+256G 幽夜黑', '//img12.360buyimg.com/babel/s320x320_jfs/t1/165958/37/8066/92796/6039c1aeE4605cb3a/0050a6adbb620db5.jpg!cc_320x320', 9699.00, 10299, 1);
INSERT INTO `product_info` VALUES (2, '荣耀30 Pro 50倍远摄 麒麟990 5G 4000万超感光摄影 3200W美颜自拍 游戏手机 全网通版8GB+128GB 绿野仙踪', '//img12.360buyimg.com/babel/s320x320_jfs/t1/97062/37/18673/150018/5e95e558E852685b4/d86fc2025388e55a.jpg!cc_320x320', 8699.00, 9999, 2);
INSERT INTO `product_info` VALUES (3, '荣耀V40 5G 超级快充 5000万超感光影像 8GB+128GB幻夜黑 移动联通电信5G 双卡双待', '//img12.360buyimg.com/babel/s320x320_jfs/t1/155037/22/15547/65194/6009377aE8ebd6b65/a91d58b1b57c1a71.jpg!cc_320x320', 7699.00, 8299, 3);
INSERT INTO `product_info` VALUES (4, '华为 HUAWEI Mate 30E Pro 5G麒麟990E SoC芯片 双4000万徕卡电影影像 8GB+128GB丹霞橙全网通手机', '//img10.360buyimg.com/babel/s320x320_jfs/t1/125814/19/15791/157840/5f917cf9Ef1c964bf/d0075003177cb729.jpg!cc_320x320', 9699.00, 10599, 4);
INSERT INTO `product_info` VALUES (5, '荣耀V40 5G 双超级快充 5000万超感光影像 8GB+256GB钛空银 移动联通电信5G 双卡双待', '//img11.360buyimg.com/babel/s320x320_jfs/t1/152902/36/15076/68131/600945dcEb052e82b/30a68df9bf2a5ba6.jpg!cc_320x320', 9299.00, 10999, 3);
INSERT INTO `product_info` VALUES (6, '三星 Galaxy S21 Ultra 5G（SM-G9980）双模5G 骁龙888 1.08亿像素 120Hz护目屏 支持Spen 12G+256G 幽夜黑', '//img12.360buyimg.com/babel/s320x320_jfs/t1/165958/37/8066/92796/6039c1aeE4605cb3a/0050a6adbb620db5.jpg!cc_320x320', 9699.00, 10299, 1);
INSERT INTO `product_info` VALUES (7, '荣耀30 Pro 50倍远摄 麒麟990 5G 4000万超感光摄影 3200W美颜自拍 游戏手机 全网通版8GB+128GB 绿野仙踪', '//img12.360buyimg.com/babel/s320x320_jfs/t1/97062/37/18673/150018/5e95e558E852685b4/d86fc2025388e55a.jpg!cc_320x320', 8699.00, 9999, 2);
INSERT INTO `product_info` VALUES (8, '荣耀V40 5G 超级快充 5000万超感光影像 8GB+128GB幻夜黑 移动联通电信5G 双卡双待', '//img12.360buyimg.com/babel/s320x320_jfs/t1/155037/22/15547/65194/6009377aE8ebd6b65/a91d58b1b57c1a71.jpg!cc_320x320', 7699.00, 8299, 3);
INSERT INTO `product_info` VALUES (9, '华为 HUAWEI Mate 30E Pro 5G麒麟990E SoC芯片 双4000万徕卡电影影像 8GB+128GB丹霞橙全网通手机', '//img10.360buyimg.com/babel/s320x320_jfs/t1/125814/19/15791/157840/5f917cf9Ef1c964bf/d0075003177cb729.jpg!cc_320x320', 9699.00, 10599, 4);
INSERT INTO `product_info` VALUES (10, '荣耀V40 5G 双超级快充 5000万超感光影像 8GB+256GB钛空银 移动联通电信5G 双卡双待', '//img11.360buyimg.com/babel/s320x320_jfs/t1/152902/36/15076/68131/600945dcEb052e82b/30a68df9bf2a5ba6.jpg!cc_320x320', 9299.00, 10099, 3);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Account` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `Pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `UserPicture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '../../static/member/user.png',
  PRIMARY KEY (`Account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '123456', '管理员', 'https://tva2.sinaimg.cn/large/0072Vf1pgy1fodqowkp8sj31fy10hhdt.jpg');
INSERT INTO `users` VALUES ('dwa', 'dadwa', 'dwa', '../../static/member/user.png');
INSERT INTO `users` VALUES ('dwada', '123', 'dwa', '../../static/member/user.png');
INSERT INTO `users` VALUES ('hepeng', '123', '何鹏', '../../static/member/user.png');

SET FOREIGN_KEY_CHECKS = 1;

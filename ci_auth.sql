/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : ci_auth

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-07-20 17:43:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `esc_article`
-- ----------------------------
DROP TABLE IF EXISTS `esc_article`;
CREATE TABLE `esc_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `views` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '0隐藏 1显示',
  `is_del` int(11) DEFAULT '0' COMMENT '0未删除 1已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_article
-- ----------------------------
INSERT INTO `esc_article` VALUES ('1', '1', '企业网站建设的重要性', '在一个网络时代，企业网上的形象即网站的形象，是十分重要的。它的定位与网页设计直接影响着企业在网络电子商务应用推广中的成败，试想如果一家知名公司（企业）的网站设计定位很差，这不仅会严重损坏这个企业原本在人们心中的形象，而且对于其在网上扩大知名度和推广都是相当不利的。纵观国内外知名企业的网站，我们不难发现这样的规律：企业的知名度和实力往往与其企业网站的设计制作水平成正比。<br />\r\n<br />\r\n第一、利用企业网页，宣传企业自身<br />\r\n在企业的互联网服务系统上，企业可向外宣传企业的文化、企业的概况、产品、服务品质以及新闻等方面的内容。 发布在互联网上的信息可以制作得较为祥尽，包括产品的各种性能参数，使用说明等；利用图文声像并茂的网页形象宣传企业，以利于企业更科学地进行市场开拓。&nbsp;<br />\r\n<br />\r\n第二、推广提高产品品牌<br />\r\n在通过企业网页宣传企业的同时，更加宣传了企业的产品，使其网页上的产品信息更加方便地传达到全球的目标客户群，建立网站前的企业，产品销售渠道受到了很大的限制，建立网站后，获得了更大的受众群体，为企业的产品走向国际打下了坚实的基础，从而不断提高产品的品牌形象。&nbsp;<br />\r\n<br />\r\n第三、利用网上电子商务，降低企业销售成本及原材料采购成本，提高产品竞争力<br />\r\n在电子商务方式下，企业的商业机会得到有效扩大，可通过专业公司为您提供网上策划，将信息传递给需求群体。利用电子商务通过互联网与客户建立方便的联络方式进行业务洽谈。大幅度减少了人员出差的时间和费用，降低通信、传真、邮寄费用，并省去了许多中间环节，提高了产品直销率，降低了经营成本。 通过在自己网页的BBS公告牌上发布商品需求信息，同时主动在网上查询所城原材料及配件的相关生产厂家的信息，并与其直接联系采购，从而有效降低了采购成本。&nbsp;<br />\r\n<br />\r\n第四、通过互联网寻求合资，合作伙伴.<br />\r\n企业在寻求合资、合作伙伴中，可利用自身的网上形象以及在相关知名的BBS上发布信息，以求目标对象获得您的信息。另外也可主动在互联网上寻找目标对象。利用互联网寻求商贸合资、合作伙伴具有很大的优越性，并可有效地减少寻求目标对象的盲目性，因为您可以在网上详细查看对方的简介、产品介绍等情况之后，再进行下一步的实施考察和技术交流活动，从而大大减少不必要的费用支出，做到有的放矢。&nbsp;<br />\r\n<br />\r\n第五、进行行业信息收集及日常电子邮件传输，促进了信息的交流<br />\r\n互联网在行业信息收集方面是任何媒体所无法比拟的。借助互联网的强大优势，可在网上随时随地查找您所要获得的行业宏观信息、同行竞争对手的发展及产品信息，还可在企业的网站上建立起自己的专门栏目，收集用户的反馈信息，保证了在较短时间内获得最新的信息。 在与客户的交流中，可充分利用E-mail的费用低（其通讯费用只有传统通讯方式的1/5-1/20）、速度快、一信多发等优点。而且距离越远相对费用就越低。更为重要的是，可以很方便地对信件进行二次编辑，避免了文件的重复输入，几乎可以不用传真机，将电子邮件的优越性能发挥得淋漓尽致。&nbsp;<br />\r\n<br />\r\n第六、加强了对目标对象的售前服务，提升了企业的服务品质<br />\r\n“品质就是硬道理”企业可以通过因特网，对目标客户进行在线产品信息查询、技术支持等服务、为客户提供了一个便于查询的服务系统，并且可以把常见的客户反馈信息，经过处理后，发布在网上，供更多的客户查阅，通过不断地为客户进行网上的在线咨询、技术支持等方式，达到渐渐提升企业服务品质之目的。 网上信息可供不同需求的用户24小时查询，而且通过电子邮件的形式，大大摆脱了传统业务活动过程的诸多不方便行为。从而加强了对客户的各方面服务。<br />\r\n<br />', '', '企业网站建设,为什么要建企业网站,企业网站的重要性', '1372261194', '0', '', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('2', '9', '如何利用电子商务提升企业竞争力', '&lt;p&gt;电子商务是在计算机网络的平台上，按照一定通信标准和协议开展的商务活动。它不仅是一种互联网的在线销售模式，更重要的是，企业与企业之间、企业与消费者之间、消费者与消费者之间、企业与政府行政部门之间的信息交流实现了数据化的处理过程。电子商务包括各种有商业能力的实体及所涉及到的金融、税务、教育、社会的其它层面之间会相互影响，相互作用。尽管目前许多企业并未全部实现交易的电子化和商务过程的网络数字化，但是伴随着信息技术、互联网的发展及其商业应用水平的不断提高，电子商务的发展必将逐渐打破企业、行业界限，使不同企业、行业共同参与到某一商务交易活动中，成市场为一个复杂、多变的竞争体系。&lt;br/&gt;&lt;br/&gt;电子商务源于传统的商务活动，但又不同于传统商务形式。它是在计算机网络和传统商务基础上的一种突破时空和地域界限的新的商务形式。一般认为电子商的特征应包括一下几个方面：首先是全球化市场定位，透过互联网机制，可迅速且容易的扩大市场及供应链，使之涵盖全世界上下游潜在的客户与供货商。同时市场开放透明的价格和低进入障碍及全天候运转，使得市场蓬勃发展，势头强劲。其次，个性化需求的交互式管理及快速有效响应，加之交易的迅捷，使得网上购物更具吸引力。最后，市场交易信息存储、整理、完善，为企业管理决策提供了及时可靠的依据。&lt;br/&gt;&lt;br/&gt;“企业竞争力”是由企业的一系列特殊资源的组合而形成的占领市场、获得长期利润的能力。一般认为它包括企业的人力资本、核心技术、企业声誉、营销技术管理能力、管理者的能力、经营者驾驭财务杠杆的能力、企业文化等等。在网络环境下，企业无论大小，企业形象、声誉都将通过网站或页面表现出来，企业面对的将是相同的开放的市场，处于相同的平等的竞争条件下，与消费者的距离也并遥远，一些语言障碍也可以被轻易扫除。因此，无论哪种类型的电子商务，都会对企业的竞争力产生不可忽视的影响。&lt;br/&gt;&lt;br/&gt;首先，电子商务将改变企业的竞争领域。电子商务扩大了企业的竞争领域，使企业从常规的广告竞争、促销手段、产品设计与市场细分等领域的竞争扩大到无形的虚拟的竞争空间。同时电子商务可以在组织间和组织内部进行，因此电子商务加强了企业内部信息资源的迅速沟通，增强了产业链之间的合作，改善上下游企业之间的成本结构，这使得电子商务模式下的竞争不再是单个企业和单个企业之间的竞争，而是产业链内部和产业链之间的竞争。&lt;br/&gt;&lt;br/&gt;其次，电子商务将改变企业的竞争基础。电子商务和网络技术的发展，使传统意义上的商务活动发生了根本性的变革，从而改变企业的竞争基础。在电子商务条件下，网络成为真正的世界市场，企业营销管理人员通过网络可以让整个世界市场呈现于眼底，轻松便捷的点击、互访便能获得更多的商业机会。同时网络打破了时空的限制，使企业获得用销售人员、经济情报人员和各种广告所不能得到的新客户和新市场。应用电子商务也大大节省了企业营运资金，网络信息传递使企业的产品成本和交易成本大大降低，通过虚拟站点和虚拟商店节省了硬件营销场所、人力和营销店面的维护等方面的巨大投资，全面而极大地节省了企业的营运资金。另外，企业还可迅速地了解市场供求状况，使企业的决策更趋于准确化，极大地降低了企业资金投入的风险。&lt;br/&gt;&lt;br/&gt;最后，电子商务将改变企业竞争的手段。电子商务的出现，人们可以直接从网络上采购、批零。传统方式的营销方式将被网络代替，传统的人员广告宣传将逐渐也为适应新的营销环境而改变。企业对目标市场的选择和定位，将更加依赖于上网者的资料以及对网络的充分利用。企业的市场调研、产品组合和分销等一系列营销管理活动将会因电子商务而发生改变。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'article/1468893064.JPG', '电子商务,企业竞争力', '1468893067', '0', 'www', '50', '1', '0');
INSERT INTO `esc_article` VALUES ('3', '1', '网络营销之该如何打造吸引性的软文营销', '软文是什么，到底起什么作用。我记得在SEO研究中心网络营销公开课时候问过大家，大家都回答的很模糊。那么到底什么是软文。软文营销主要体现的价值是什么，如果才能做吸引力的软文营销。而且可以让软文产生很大的用户访问量。还能够起到营销作用……<br />\r\n<br />\r\n那么我们就不得不去了解一下什么是软文营销<br />\r\n<br />\r\n所谓”软文”，就是指通过特定的概念书写、以摆事实讲道理的方式吸引消费者和我们的目标用户，。比如：新闻，第三方评论，访谈，采访，口碑。软文是基于特定产品的概念诉求与问题分析，对消费者进行针对性心理引导的一种文字模式，从本质上来说，它是企业软性渗透的商业策略在广告形式上的实现，通常借助文字表达与舆论传播使消费者认同某种概念、观点和分析思路，从而达到企业品牌宣传、产品销售、活动推广、服务推广等的目的。<br />\r\n<br />\r\n软文营销可以发挥的作用是什么？<br />\r\n<br />\r\n1、软文营销给网络营销带来的价值以及发挥的作用<br />\r\n<br />\r\n那么软文营销既然可以达到宣传产品、宣传活动、企业推广以及服务推广。那就说明我们可以应用的领域可以是做网络营销的平台营销，做企业的品牌塑造，可以去通过新闻源、论坛等等树立公司的权威和信任度。可以通过产品和企业进行关联。加深用户对产品印象以及公司产品营销。还有就是进行一个企业活动的营销策划。这是对于我们做网络营销的人可以应用到的。当然互联网也存在很多的成功案例。例如做伟哥系列的产品利用情感、两性来进行做软文营销可以达到很高的一个宣传量。例如上海世博会时候运用到软文营销带来很大的用户认知。<br />\r\n<br />\r\n<br />\r\n例：世博会，通过腾讯，百度、新浪等很多平台进行做博客，做文章，来做这次活动宣传，说明了软文的重要性<br />\r\n<br />\r\n2、软文营销对于网站运营起到的价值和作用<br />\r\n<br />\r\n网站运营顾名思义，一个网站需要大力的发展。开始前期的过程就是SEO优化。当我们在优化同时在很多品牌词、目标词都有很好排名表现之后，需要做什么。当然是营销。营销可以辅助进行给我们的网站引导流量。让我们的网站提升流量。<br />\r\n<br />\r\n当然我们同样可以通过软文写作投放到新闻源网站、以及权威网站打造网站知名度以及配合很多的社交网站做品牌的塑造力。当然做品牌塑造力有很多内容。但是其中软文占得比例是非常高的。<br />\r\n<br />\r\n软文写作还有一定就是引导用户到我们特定的一个页面，例如活动页面、促销页面、产品销售页面增加我们网站页面的转化率。当然这一方面做营销比较好的。例如淘宝天猫2012年的双十一，他们通过软文营销做邮件群发、新闻源以及百度系列等投放吸引用户去关注。<br />\r\n<br />\r\n<br />\r\n<br />\r\n例如：2012年淘宝双十一的营销方案，主要是大量的流量引导到网站上面形式。<br />\r\n<br />\r\n在写软文时候我们需要准备什么？<br />\r\n<br />\r\n1、要熟悉我们做的行业，了解我们的产品、以及品牌文化。<br />\r\n<br />\r\n2、要去在互联网上熟悉我们的行业，在互联网上呈现的状况。然后分析看那些市场没有满足，那些需求不够完善。（然后去分析出来针对性做营销方案，吸引用户达到营销目的）<br />\r\n<br />\r\n3、去挖掘和你们产品（目标词）相关的词汇，出现的长尾词。然后进行分类，每天规划去写一部分内容。<br />\r\n<br />\r\n如何书写一篇有营销价值的文章。<br />\r\n<br />\r\n&nbsp;1、挖掘我们的关键词之后，我们首先是需要了解我们的行业。知道我们做的长尾词需要的内容要点。自己形成思路然后进行书写。<br />\r\n<br />\r\n在书写过程中存在这样两种现象，一种就是对于我们的行业非常了解的。二者就是不了解行业形势的。<br />\r\n<br />\r\n（1）如果你了解我们的行业。那我们就可以去观察同行业在论坛或者资讯网站投放的文章。看看，然后分析出他们没有到位的。或者是存在的一些需求没有满足。这就是有基础的形式编辑，可以写出一些差异化。而且用户比较关注的内容。但是这个是要基于用户的了解。<br />\r\n<br />\r\n（2）当我们对于自己行业不太了解，或者我们需要做大量的文章。又没有大量时间去做原创文章去引导流量。那么我们该怎么办。就需要发现优质文章，进行加工修改，加上我们的品牌词形式这样就会凸显出价值了。当然这些在针对性有些平台是要求原创的。就无法投稿了。<br />\r\n<br />\r\n&nbsp;2、我们在写软文时候要注意的一些细节问题<br />\r\n<br />\r\n标题：拟定要够吸引力，如果你的标题不够吸引力。就很难去吸引人关注<br />\r\n<br />\r\n概况，这个针对我们很多网站都有概况。当然在搜索引擎中。也会去抓取一段内容。那么这段话吸引不够吸引也是很关键的。<br />\r\n<br />\r\n内容：要写好一个软文。是否可以让吸引用户，让用户感受到价值。而且起到营销目的。那么在前面我也讲到。网络营销的价值。<br />\r\n<br />\r\n针对内容，我就得多说几点，如何让我们的广告在软文中发挥价值。从而文章被大量转载时候还带着营销效果。这个就需要掌握以下三个知识点：<br />\r\n<br />\r\n#1、这里出现一展现品牌词、目标词为核心。而不是以链接为核心。我们很多人前期一直在做外链推广。所以就带着这样的思维。真正的软文营销在SEO中发挥价值是，吸引用户通过观看软文后，引发二次搜索你的品牌词。所以这个是需要注意的<br />\r\n<br />\r\n#2、在写软文的时候出现品牌词、目标词主要是展现这为核心，那怎么保证这个信息不会被删除那。所以主要是在写软文时候要把这些词汇当做必然要出现的，而不是很不和谐的出现。这样就容易被删除，例如你写一篇文章叫做SEO培训系列文章，那么你加上SEO研究中心就是需要有必然因素出现，如果缺少了或者被替换了就不通顺的感觉。这样价值意义就大了。<br />\r\n<br />\r\n#3、要找对平台，针对性投放。我们要找对平台投放软文的技巧和方式以及规律。发现那些发布成功的文章具备的优势。首先我们先解决软文投稿通过率问题。因为开始掌握了这些写作技巧，懂得你这个行业也不一定能够进行去投稿成功。重点是要观察平台。然后进行投稿。<br />\r\n<br />\r\n软文写作的升华篇：提升流量和转化效果<br />\r\n<br />\r\n1、首先我给大家说说，怎么去做好软文写作的思维。<br />\r\n<br />\r\n例如：我们写的是产品类型文章，那么我们重点是写出我们的产品属性以及品牌和提供的价值和服务。然后我们进行要转化的一个关键。就是在用户读完这篇文章，然后进行直观的推荐。因为当用户通过这个页面了解了你的产品，心理产生了兴趣就应该给他引导了。但是注意不能出现在中间或者头部，因为当用户都没有了解产品。你都在推荐。这样是无法让用户信服和相信。要有流程化。<br />\r\n<br />\r\n例如：我们写技术类型文章，那么我们重点是在说明一个观点或者说明一个事实。那其中难免会出现一些词汇导致用户不理解。所以这些就需要去加上链接进行解释说明，或者（）进行说明形式，而且在这个链接插入记住一定是新窗口打开。这样两个或者几个页面可以对照去看。便于理解。<br />\r\n<br />\r\n2、软文写作如何提升流量。<br />\r\n<br />\r\n我们一般投放软文都是在平台形式的，那么我们在写作时候都要注意。首先要去观察搜索引擎你的目标词中那些长尾是吸引用户关注的，你要投放软文的平台首页大多数都是编辑推荐的。了解这些文字的特性和主题。<br />\r\n<br />\r\n然后去找和这些内容比较相关的，以及这段时间比较关注的热点。会倾向于那个方面。这样进行编辑内容。然后加上优质的标题和内容概括，就会通过搜索引擎带来很大流量。同时也会被推荐到这个平台的网站栏目页或者首页。<br />', '', '网络营销,软文营销', '1372261508', '0', '', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('4', '1', '一个新手要如何着手来做好网站运营？', '网络营销里面一个很重要的名词就是网站运营，一个没有网站运营经验的人要如何来展开这项工作呢？<br />\r\n<br />\r\n站长个人觉得首先你应该要懂得什么叫网站运营，了解它需要做的工作，然后制定相关的工作计划，最后分配给下面的人分工合作。<br />\r\n<br />\r\n网站运营的范畴通常包括网站内容的更新与维护、网站流程的优化、数据挖掘的分析、用户研究的管理以及网站营销的策划等等。这里面PV、IP、注册用户、在线用户、付费用户、在线时长、购买频次‘ARPU值等等都是很重要的因素。<br />\r\n<br />\r\n什么样的网站运营才算是成功的运营呢？这就要从网站运营的一些必要因素上面去衡量了，比如专业性、互动性、用户体验、域名注册查询等等，用一个简单的公示来表示就是：专业+互动+用户体验+两点=盈利<br />\r\n<br />\r\n一个企业网站的运营包括了很多的内容，比如网站的宣传推广、网络营销的管理、网站的完善变化、网站的后期维护与更新，网站的企业化操作等等。网站的维护和推广是其中最重要的。<br />\r\n<br />\r\n到底该如何来成功维护一个网站呢？一个网站成功运营起来还有很多工作要做，运营是包括了很多的方向的，必须要瞄准这些方向我们才有可能有机会获得运营的成功。<br />\r\n<br />\r\n我们需要瞄准的第一个方向是客户的方向。简单来说就是站在客户的角度去想问题，我们很多站长觉得这是一个很简单的事，但是事实上能站在客户角度去想问题的又有几个呢？真正做到为客户想的人不是把自己的产品如何做好，而是产品能为客户带来什么，客户能得到一些实质性的东西这才是最实在的，所以在产品设计上要和运营一起完成一次又一次不可能的任务解决好一些问题才能使得网站运营的成功的可能性提高。<br />\r\n<br />\r\n第二就是网站的运营离不开市场的发展。所以市场的运营需要考虑的一个重要的因素就是选择什么样的人群来作为目标市场，这一直是个很高的学问。寻找市场运营的要素包括：网站市场的渠道，网站在不同时期所适合的运营方式，以及什么样的资源可以整合起来运用，网站能否运营好这些都是很重要的方向。<br />\r\n<br />\r\n第三就是合作和共赢。一个没有合作的网站是很难生存的，这就包括了公司上下之间的合作以及公司和外界的合作。网站的信息合作能增加网站资源的丰富程度，这样带来的流量也就比较多，网站运营的成功机会才会大大的增加。细节决定成败，做网站运营同样需要注重细节，每一个细节都不能放过。<br />', '', '网站运营', '1372261551', '0', '', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('5', '1', '网站建设要素之如何制定一份网站策划方案', '要建立一个网站，需要从网站定位，到设计、网站结构、内容准备、内外链的建设等等，是一个复杂繁琐的过程，需要准备一份网站的策划方案。本文将简要描述，从网站的定位到最终的网站建成，整个过程。<br />\r\n<br />\r\n一、网站的定位<br />\r\n<br />\r\n分析：给网站定位，策划一个网站，这是第一步，只有给网站定位好了，才能按照定位的关键词展开。如何给网站定位，如何选择网站的核心关键词。选择核心关键词，需要考虑的因素有：搜索量大、有一定的商业价值、竞争度相对较低。<br />\r\n<br />\r\n这里有个小建议，一般建站前，肯定清楚网站属于哪一个类别，然后根据这个类别的核心关键词，通过百度蜂巢系统，将相关关键词拉出，再根据需要考虑的因素，选择最合适的关键词<br />\r\n<br />\r\n二、确定网站三要素<br />\r\n<br />\r\n分析：建站的三要素，指的是程序、域名和空间，在确定了网站的核心关键词以后，可以由关键词确定网站名称，然后再根据网站名称，选择域名；根据网站主题，选择程序；关于空间，最好是正规空间商提供的服务器，稳定、安全，虽然价格可能比较贵。<br />\r\n<br />\r\n在建立网站需要哪些条件一文中，有详细介绍网站三要素的内容，感兴趣的童鞋可以看看。<br />\r\n<br />\r\n三、确定网站关键词<br />\r\n<br />\r\n分析：这里所说的关键词，是根据已经定位好的核心关键词，再总结所有长尾词的特点，确定一批转化率较高的长尾词，可以作为网站的目录等，分布在首页中<br />\r\n<br />\r\n四、确定网站标题标签<br />\r\n<br />\r\n分析：在网站的定位时，已经确定了网站的关键词，然后再根据网站的关键词，填写网站标题、关键词标签、描述标签。这些都是网站优化的基础，需要注意的是，尽量将内容写的自然，关键词千万不要堆积。标题中，包括三个关键词即可<br />\r\n<br />\r\n五、完善网站布局<br />\r\n<br />\r\n分析：根据前面确定的关键词、长尾词体系，完善网站的子目录及首页的布局，包括核心关键词、近义词、同义词等，增加关键词的密度。下一章，Q猪将从分析robin的广场舞的首页，讲一下网站如何布局。<br />\r\n<br />\r\n六、构建网站结构<br />\r\n<br />\r\n分析：网站的结构尽量以扁平树形结构，具体可以看下，如何制作合理的网站结构。在构建网站结构的同时，注意URL的简单、规范。<br />\r\n<br />\r\n七、编辑网站内容<br />\r\n<br />\r\n分析：网站的内容，尽量以原创和质量较高的微原创为主，注意网站内链的建设，可以建立一份长尾词记录单，记录每一篇文章优化的关键词。<br />\r\n<br />\r\n在编辑文章内容时，注意关键词的四处一词，标题，关键词标签、描述，正文，还有网站其他页面关于帖子的锚文本。<br />\r\n<br />\r\n如果网站的内容编辑，积累到一定程度以后，可以将网站的URL提交给搜索引擎即可。然后就是外链的建设，还有网站内容的，逐步增加。<br />', '', '网站策划', '1372261651', '1', '', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('6', '1', '新手如何选购虚拟主机', '今天给新手朋友带来一篇关于如何选购虚拟主机的文章，其实昨天下班之后就准备写的，然后今天一早发布出来，结果昨天一个新认识的朋友叫去喝酒吃饭唱歌，然后就去了，玩的也比较开心，因为认识了一大批新朋友，也希望多多认识一点在武汉搞网站方面的朋友。好了还是切入正题吧 咱们新手朋友来搞网站，首先肯定选择的是虚拟主机，但是互联网上卖虚拟主机的多余牛毛，可以简单的看下面的这个搜索“虚拟主机”的图：<br />\r\n<br />\r\n<br />\r\n5000多万了，很多SEOER接单子的时候就会根据这个相关搜索的数量来进行明码标价（虽然也不是很准确），在这么多服务商里面如何来进行选择好的，合适自己的，这个问题就会把新手朋友给搞晕，我也是个老新手，对于这个方面还是有一定经验的，今天就写下这个文章：新手如何选择虚拟主机？<br />\r\n<br />\r\n一、虚拟主机速度<br />\r\n<br />\r\n这个是我们最关心的，一般的虚拟主机服务商都有演示的IP或者站点，咱们就可以Ping它，看它的链接速度如何，一般的话国内的60MS，国外的200MS左右的话都算正常的，当然这个只是一个大方面，还需要打开站点测试一下，注意能选择双线空间最好，因为现在国内很多还是在使用网通的哦。<br />\r\n<br />\r\n&nbsp;<br />\r\n<br />\r\n二、空间稳定性<br />\r\n<br />\r\n在前面网站百度收录减少的解决方法里面我就写过网站空间稳定性对于一个网站的重要性，而且一些不良服务商会在故意这样做（这个确实是存在的），如何选择稳定的空间这个我看最好的方法还是找自己熟悉的朋友来问，毕竟使用过的才知道。而且就算同一个服务商，服务器也不同，肯定有的稳定有的也不稳定。<br />\r\n<br />\r\n三、技术服务支持<br />\r\n<br />\r\n已经说了是新手站长，那么肯定在网站方面不是很在行，或多或少出现问题，又或者网站被攻击或者什么的，总之就是会出现一些问题。哪这个时候，一个好的技术服务支持对于咱们新手来说重要性真的是太大了，这个可以选择国内知名的IDC服务商，这样才有保证。前天跟肖俊聊天的时候就谈到了这个方面的问题，因为最近他的博客遭到持续攻击，而且他是找的代理买的空间，不能直接找到万网，所以中间的处理时间就花费了非常多。唯一的好处就是代理便宜非常多，而我也经常找代理买，然后转到主机商那里，出了问题直接在线提交！<br />\r\n<br />\r\n四、主机防护或者安全性能<br />\r\n<br />\r\n最近是电商圈SEO比赛马上要结束了，但是攻击还在持续当中，昨天晚上虎子的空间就被攻击了，是万网的，因为限制流量，一下子就给他唰完了，解决方法只有换空间了，当然你可以买流量，但是攻击还是回持续撒，所以换空间能避免。扯远了，主机有很多是开的软防，也有一些开的硬防，不过就算服务器没漏洞，但是程序有问题的话，是照样会被攻击的。<br />\r\n<br />\r\n五、虚拟主机环境<br />\r\n<br />\r\n大家都知道网站程序有很多，ASP和PHP比较用的多，而数据库也分了几种，所以在程序选择上面，很多新手朋友只知道买，而不知道去选择合适自己的。ZBLOG用ASP环境的空间，而WP用PHP环境的空间（最好选择LINUX服务器），别购买了，然后去装自己程序的时候才知道自己买错了哦（虽然很多IDC服务商会跟您换，但是很麻烦哦）<br />\r\n<br />\r\n六、主机月流量<br />\r\n<br />\r\n很多主机限制了月流量，比如我这款也限制了，我在这里对新手朋友说一个我的经验：你的网站什么访问量就选择对应流量，而不是去追求选择无限制的，无限制的服务器稳定性一般都不好，试想哈，一个服务器下面很多网站，其他网站访问量高了，肯定会影响到你的网站打开速度。<br />', '', '如何选购虚拟主机', '1372261775', '12', '', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('7', '2', '移动互联网发展下的企业网变革', '移动互联网作为桌面互联网的一个延伸和发展，是一个以宽带IP为核心技术，可为智能移动终端提供语音、视频、图像等全媒体资讯以及数据全业务服务的下一代网络。智能手机和平板电脑的快速普及、应用程序的App化互联网交付、虚拟化与云计算等技术的快速发展，促使互联网正在极快地由传统的桌面互联网向移动互联网转变。<br />\r\n<br />\r\n在全新的移动互联网时代，传统的企业IT基础架构也要进行相应变革，以更好地适应业务互联网化、移动化的需求。本文将讨论在移动互联网快速发展的背景下，新一代企业网络相较于传统的企业网络将在如下方面进行的变化：建设新一代云中心(Cloud Center)采用混合云进行业务交付、通过Wi-Fi等技术实现统一稳定的终端连接(Connectivity)，通过Internet对设备进行透明的云管理(Cloud Management)，以支撑移动互联网业务的发展。<br />\r\n　　<br />\r\nNETGEAR亚太区技术总监杨子江<br />\r\n一、移动互联网发展下的企业应用新模式<br />\r\n移动互联网时代，企业将采用虚拟化技术协同，融合公有云和私有云，以强大的混合云方式通过SaaS(软件即服务)的方式，以互联网和企业内部网络基础架构为管道，通过智能移动终端承载企业的业务应用，直面未来需求。<br />\r\n<br />\r\n接入设备<br />\r\n桌面计算机和笔记本电脑是是传统常用的终端，最近这些年来包括如以IOS、 Android、Windows Mobile为系统的各种平板电脑、智能手机以及RFID标签设备及其他移动类设备发展极为迅速。<br />\r\n<br />\r\n接入时间、地点、人物<br />\r\n移动互联网环境下，工作人员摆脱了只有在固定地点、固定时间才能进行业务应用的局限,他们可以随时随地进行移动办公，任何人、任何设备、任何地点安全地运行在任何网络之上，这是以往以PC为基础的桌面互联网时代所未有的简单方便的接入。<br />\r\n<br />\r\n接入方式<br />\r\n移动互联网发展下企业网络常见有三种主流的终端联网方式：Wi-Fi无线接入(无线局域网)、3G/4G移动网络(无线广域网)、有线以太网接入(有线局域网)。<br />\r\n<br />\r\n应用 APP化<br />\r\n企业网的各种业务应用APP化，以互联网和企业内部的局域网络为管道，以移动终端为载体进行业务交付的模式已成为大趋势。<br />', '', '移动互联网发展下的企业网变革', '1372261909', '2', '', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('8', '2', '企业网站文章标题该如何去撰写', '企业网站撰写文章目的是为什么?首先要请我们编辑或者是优化的人员想一想。如果你说只是为了更新，为了网站收录，获得搜索引擎的青睐。其实你错了，你已经走入了一个误区，那就是文章并不是给搜索引擎看的，而是给用户看。下面看单仁资讯先为你列出目前存在的一些误区，之后再提出一些建议。<br />\r\n<br />\r\n误区一：文章标题需要很吸引眼球<br />\r\n<br />\r\n有人就说了，文章标题是一篇文章是否成功的一半，只有文章标题好才能够吸引点击。其实这个说的是没错，但是这对于企业网站并不适合。试想用户到你网站难道就是去看文章的?当然不是。一般用户是有疑问或者需要解决什么问题，所以再去搜索，之后才会进入你的网站。当然你网站首页关键词是有限，所以还是需要靠文章或者产品的长尾词来进行扩充，这部分才是流量的主力军。就如“英特尔手机“农村包围城市”，就等厂商进来”虽然很吸引眼球但这样的标题用户会去搜索吗?反之在企业网站中我们就不应该进入这样的思维误区。<br />\r\n<br />\r\n误区二：标题很学术<br />\r\n<br />\r\n标题很学术，对于企业网站行不通。我们时刻应该要知道的就是企业文章是一种宣传，更是一种获取流量的最大的源泉。除非你的网站很知名，要不别人是不会进入你的网站，这个时候我们就需要通过一些解决用户，给用户提供比较有见解的文章来吸引用户。所以我们的标题也不能很学术，只需要站在一个用户的角度来思考问题即可。<br />\r\n<br />\r\n建议：<br />\r\n<br />\r\n一：企业文章标题是吸引用户点击进来，也是用户搜索进入的第一个接口，我们不能只考虑到吸引，但是没有想到是否有用户去搜索。企业写文章主要应该是站在用户的角度，帮助用户解决问题，这样这篇文章才会被人搜索到，才会有价值的存在。比如“企业如何做好网络营销”这个文章标题不是那么的夺目，但是会给用户解决问题，能够告诉用户怎么去做网络营销，当有不知道的如何去做网络营销的用户，就会有去搜索，当你能够解决他的问题，这样这篇文章才是成功的。<br />\r\n<br />\r\n二：标题需要直白而且用户常搜索，标题写的好，但是没人搜索，也就没人去看你这篇文章。所以我们应该需要直白的标题，还有就是组合用户常搜索的关键词。这样就会当用户搜索的时候搜索引擎就会判断，当你标题中含有用户搜索的关键词，这个时候也就会排名靠前。<br />\r\n<br />\r\n　　所以作为一名编辑，我们不能够只是站在自己的角度来写文章标题，我们应该是站在用户的角度来撰写标题。对于一家企业来说，我们在互联网上要想获得客户，我们就需要从细节出发，就如文章的标题，我们都需要考虑很多。只有全面，够系统，网站才能够真正的成为金牌业务员。<br />', '', '企业网站文章标题该如何去撰写', '1372261997', '0', '', '2', '1', '0');
INSERT INTO `esc_article` VALUES ('9', '2', '详解如何利用RSS进行网络推广', '网络推广方法有很多，RSS推广就是其中的一种，RSS订阅能够为网站增加访问量，这是众人皆知的事实。不过，如何推广RSS，让更多人知道并促使更多人订阅RSS，却是一个很大的问题。下面就有我给大家讲解一下什么事RSS推广，如何利用RSS进行网络推广。<br />\r\n<br />\r\n首先来说说什么是RSS？<br />\r\n<br />\r\nRSS是在线共享内容的一种简单方式（也叫聚合内容，Really Simple Syndication）。通常在时效性比较强的内容上使用RSS订阅能更快速获取信息。网站提供RSS输出，有利于让用户获取网站内容的最新信息。网络用户可以在客户端借助于支持RSS的聚合工具软件（如SharpReader，NwezCrawler，FeedDemon），在不打开网站内容页面的情况下阅读支持RSS输出的网站内容。<br />\r\n<br />\r\n那么RSS有什么用途呢？<br />\r\n<br />\r\n订阅BLOG，可以订阅工作中所需的技术文章，也可以订阅与你有共同爱好的作者的Blog，总之，对什么感兴趣就可以订什么。<br />\r\n<br />\r\n订阅新闻，无论是奇闻怪事、明星消息、体坛风云，只要你想知道的，都可以订阅。<br />\r\n<br />\r\n你再也不用一个网站一个网站，一个网页一个网页去逛了。只要这将你需要的内容订阅在一个RSS阅读器中，这些内容就会自动出现你的阅读器里，你也不必为了一个急切想知道的消息而不断的刷新网页，因为一旦有了更新，RSS阅读器就会自己通知你。<br />\r\n<br />\r\n什么是RSS推广？<br />\r\n<br />\r\nRSS推广即指利用RSS这一互联网工具传递营销信息的网络营销推广模式。RSS推广通常是与EDM（电子邮件营销）配合使用的。因为RSS的特点比EDM具有更多的优势，可以对后者进行替代和补充。且RSS与EDM也有许多相似之处，它们之间的根本区别是向用户传递有价值信息的方式不同。RSS和EDM相比，主要有一下几个有点：<br />\r\n<br />\r\n1、多样性、个性化信息的聚合。RSS是一种基于XML（Extensible Markup Language，扩展性标识语言）标准，是一种互联网上被广泛采用的内容包装和投递协议，任何内容源都可以采用这种方式来发布，包括专业新闻、网络营销、企业、甚至个人等站点。若在用户端安装了RSS阅读器软件，用户就可以按照喜好、有选择性地将感兴趣的内容来源聚合到该软件的界面中，为用户提供多来源信息的“一站式”服务。<br />\r\n<br />\r\n2、信息发布的时效强、成本低廉。由于用户端RSS阅读器中的信息是随着订阅源信息的更新而及时更新的，所以极大地提高了信息的时效性和价值。此外，服务器端信息的RSS包装在技术实现上极为简单，而且是一次性的工作，使长期的信息发布边际成本几乎降为零，这完全是传统的电子邮件、互联网浏览等发布方式所无法比拟的。<br />\r\n<br />\r\n3、无“垃圾”信息和信息量过大的问题。RSS阅读器中的信息是完全由用户订阅的，对于用户没有订阅的内容，以及弹出式广告、垃圾邮件等无关信息则会被完全屏蔽掉。因而不会有令人烦恼的“噪音”干扰。此外，在用户端获取信息并不需要专用的类似电子邮箱那样的“RSS 信箱”来存储，因而不必担心信息内容的过大问题。<br />\r\n<br />\r\n4、没有病毒邮件的影响。在RSS阅读器中保存的只是所订阅信息的摘要，要查看其详细内容与到网站上通过浏览器阅读没有太大差异，因而不必担心病毒邮件的危害。<br />\r\n<br />\r\n5、本地内容管理便利。对下载到RSS阅读器里订阅内容，用户可以进行离线阅读、存档保留、搜索排序及相关分类等多种管理操作，使阅读器软件不仅是一个“阅读”器，而且还是一个用户随身的“资料库”。<br />\r\n<br />\r\n虽然RSS的有点很多，但是缺点也很明显。RSS营销的定位性不如EDM强，我们很难主动选择让谁订阅我们的RSS，因此RSS很难实现个性化营销。同时RSS也不容易做到像EDM那样跟踪营销的效果。<br />\r\n<br />\r\n总之，RSS与EDM相比具有很大的优势，特别是克服了EDM中常出现的垃圾邮件、病毒、信息即时性差等致命缺点，因而将有力地促进RSS的推广应用。所以，网络推广者者一定要加以足够地重视，以增强自己的竞争优势。当然RSS营销模式还有很多的问题要面对，对于如何有效地利用更需深入地研究探讨。<br />\r\n<br />\r\n前面说过RSS推广处于刚起步阶段，是一种新式的网络推广方法，下面我在介绍一下RSS推广实战操作的方法，主要有以下几种简单方法：<br />\r\n<br />\r\n1、提交RSS<br />\r\n<br />\r\n提交到哪里呢？网络上有很多专门针对RSS的搜索引擎和RSS分类目录，我们贺姨将网站的RSS提交给这些站点。这样不仅可以促进搜索引擎收录、增加RSS曝光率，还能为网站增加链接广度；既可以带来流量，又能加快搜索引擎收录与信息的推广。<br />\r\n<br />\r\n2、RSS图标<br />\r\n<br />\r\n有条件的话给你的网站增加RSS订阅吧，并将网站RSS订阅图标放在醒目的位置。<br />\r\n<br />\r\n3、量身定制内容<br />\r\n<br />\r\n针对不同的用户推送不同的内容，让用户愿意去订阅他们想要的内容。<br />\r\n<br />\r\n4、邮件中增加RSS订阅链接<br />\r\n<br />\r\n一种不错的病毒式推广，一方面是EDM的补充，随着网民网龄的增加，使用RSS代替EDM的会越来越多。<br />\r\n<br />\r\n5、多功能应用<br />\r\n<br />\r\n比如让用户通过RSS订阅的方式获取天气预报、订阅感兴趣的分类广告信息，网络商城还可以用它来传递物流跟踪信息、传递商品打折通知、拍卖商品的实时竞价情况等等。<br />', '', '详解如何利用RSS进行网络推广', '1372262040', '8', '', '0', '0', '0');
INSERT INTO `esc_article` VALUES ('10', '1', '移动互联网产品设计的核心要素有哪些？', '移动互联网和传统互联网的设计有很多不同<br />\r\n<br />\r\n移动互联网和传统互联网的设计有很多不同，针对前者有哪些关键的设计重点、考虑要素、交互或体验要特别注意的呢？本文来自知乎网友可风的回答。<br />\r\n<br />\r\n可风<br />\r\n<br />\r\n最近越来越多的圈内人开始随大潮进入移动互联网领域，从传统的web或者桌面端设计开始学习移动互联网产品的设计。在很多人眼里，设计移动互联网产品和传统互联网产品的区别无非就是载体从电脑变成了手机，所以只要熟悉一下各个手机中不同的规范和特性就算是完成了过渡，学习了下ios human guideline，了解了一下拟物化设计和扁平化设计，就以为是了解了移动互联网的设计方法。其实这种思想完全是只看到表现而没看到本质的错误，移动互联网和传统互联网的区别不光是设计标准和设计规范的变化，而应该从整个物理环境的变化来重新全面的认识。那么我们分析一下，移动互联网产品的用户体验和传统互联网产品有什么区别呢？<br />\r\n<br />\r\n一、使用场景的复杂<br />\r\n<br />\r\n用户在使用桌面客户端或者访问web页面的时候，多半是坐在电脑前，固定的盯着屏幕和使用键鼠操作，这个时候对于用户来说，使用场景是简单而固定的。但是在使用手机的时候，用户可能在地铁中，在公交上，在电梯中，无聊等待时或者边走路边用。如此复杂的场景，需要产品的设计者考虑的要素也自然非常的复杂。<br />\r\n<br />\r\n比如在公交车上拥挤和摇晃时，用户如果才能顺畅的单手操作？比如在地铁或者电梯的信号不好的情况下，是否要考虑各种网络情况带来的问题？比如用户在无聊等待玩游戏，或者在床上睡前时，又变成了深入沉浸的体验？不同的场景不同的情况在设计时是否都有考虑清楚？<br />\r\n<br />\r\n二、使用时间碎片化<br />\r\n<br />\r\n用户在使用电脑时，大部分时间还是固定的，无非可能因为工作和同事沟通一下，或者起身上个厕所，一般都有10-20分钟完整的时间片在操作电脑。但是移动端就不一样了，用户既然在移动，使用手机时要随时随地观察周围的情况，随时可能中断现在的操作，锁屏，再继续刚才的操作。所以用户使用移动产品的时间不是连成片的，而是一段一段的，有的时候中断回再回来，有的时候中断就不会回来了。<br />\r\n<br />\r\n三、屏幕尺寸的缩小<br />\r\n<br />\r\n用户使用电脑产品的屏幕尺寸是可以很大的，小则13寸大到27寸，这样使得桌面产品和web产品有充足的区域展现信息，整个界面利用率就可以很高。我们在做交互设计的时候会有一种方法，如果一个次要信息的出现不会影响大部分用户的时候，那么这个次要信息是可以放在界面上的，这就是为什么网站可以加入很多广告banner的原因，因为只要保持到一个度不影响正常的使用就不会破坏整体的用户体验。但是在移动端，这个度是非常的小的，因为屏幕尺寸的限制，本身需要你展现的必要信息都需要有一个合理的规划和抉择，次要的信息再一出来肯定破坏体验。将前2条结合你会发现，用户在使用移动产品是需要非常追求效率的，所以移动端产品的设计难道会大大增加。<br />\r\n<br />\r\n四、无法多任务的处理信息<br />\r\n<br />\r\n用户在使用桌面产品时，是更加容易的进行多任务操作和处理的，比如我正在浏览web查资料，又正在进行文档的整理，还可能开着QQ和朋友聊天。因为大屏幕的关系和系统机制让用户能够高效的同时处理多个信息，当然，还得益于固定的使用场景和完整的时间片。但是因为前面也提到的问题，移动端的产品往往是沉浸式的，用户在同一时期只可能使用一个应用，完成一个流程，然后结束，再去开启另一个应用和另一个流程，所以大部分移动产品设计时往往讲求遵循的是单一的任务流，期间结束和跳转的设计非常的少。<br />\r\n<br />\r\n五、平台的设计规范和特性<br />\r\n<br />\r\n最后才是各自的平台规范和标准，比如什么ios human guideline或者WindowsPhone的metro理念，纵观知乎和各大网站，很多人每天关注的都是这些比如拟物化设计和扁平化设计的风格，返回按钮的逻辑或者隐藏title之类的方法论细节。的确你了解这些信息是可以快速方便的设计出一个可用的移动产品的，但是如果没有了解之前所说的几条移动产品和传统互联网产品在用户体验上的区别，你可能永远也无法参透移动互联网用户体验的规律和本质。<br />', '', '移动互联网', '1372262079', '100', '99', '1', '0', '0');
INSERT INTO `esc_article` VALUES ('11', '10', '222', '&lt;p&gt;　【环球时报综合报道】据《&lt;a href=&quot;http://country.huanqiu.com/philippines&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;菲律宾&quot;&gt;菲律宾&lt;/a&gt;星报》18日报道，菲律宾最高法院法官安东尼奥·卡皮奥近日提议，菲政府应该推动与&lt;a href=&quot;http://country.huanqiu.com/china&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;中国&quot;&gt;中国&lt;/a&gt;等南沙群岛声索国签署和平协议，宣布该地区为“国际海洋公园”和“保护区”。他认为，这是“双赢”的解决办法。&lt;/p&gt;&lt;p&gt;　　报道称，该提议最初是由&lt;a href=&quot;http://country.huanqiu.com/america&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;美国&quot;&gt;美国&lt;/a&gt;海洋生物学教授约翰·麦克马努斯提出的。卡皮奥称，该提议之所以能达到“双赢”，是因为争议将由此搁置50年到100年，每个国家都不会丢面子，而且都能受益。他认为，南海仲裁案的裁决结果解决不了菲中领土争端，特别是黄岩岛问题。&lt;/p&gt;&lt;p&gt;　　卡皮奥是菲律宾政府提起南海仲裁案时的法律小组成员。他认为，上述建议可以让南沙的暗礁重新生长，这样有助于鱼类繁衍。&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n	\r\n	\r\n	\r\n	\r\n\r\n\r\n	&lt;/p&gt;&lt;p&gt;　　与此同时，卡皮奥提到，根据麦克马努斯的提议，应将南沙军事基础设施变成海洋研究和生态旅游基地，而且各国海军不能在该地区巡逻，只有海警可以派船只和人员到此。&lt;/p&gt;&lt;p&gt;　　《菲律宾每日问询者报》18日评论说，菲在仲裁结果出台后的举动“受到中国的欢迎”，中国也给予了“慷慨的回应”。菲ABS-CBN网\r\n站称，杜特尔特处理南海问题表现出实用的一面。《菲律宾星报》18日评论称，虽然在南海仲裁案上“获胜”，但菲律宾渔民在南海依然“孤独”。实际上，仲裁\r\n案对中美菲在南海上的力量对比改变很小。(任重)\r\n &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'article/1468828134.JPG', '333', '1468892332', '0', '333', '50', '1', '0');
INSERT INTO `esc_article` VALUES ('12', '13', '3', '&lt;p&gt;24444&lt;br/&gt;&lt;/p&gt;', 'article/1469005283.JPG', '333', '1469005291', '0', '44', '50', '1', '0');
INSERT INTO `esc_article` VALUES ('13', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', 'article/1468829501.JPG', '33', '0', '0', '55', '0', '1', '0');
INSERT INTO `esc_article` VALUES ('14', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', 'article/1468829501.JPG', '33', '1468829576', '0', '55', '50', '1', '0');
INSERT INTO `esc_article` VALUES ('15', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', 'article/1468829501.JPG', '33,99，88,888', '1468829983', '0', '55', '50', '1', '0');
INSERT INTO `esc_article` VALUES ('16', '10', '111', '&lt;p&gt;　【环球时报综合报道】据《&lt;a href=&quot;http://country.huanqiu.com/philippines&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;菲律宾&quot;&gt;菲律宾&lt;/a&gt;星报》18日报道，菲律宾最高法院法官安东尼奥·卡皮奥近日提议，菲政府应该推动与&lt;a href=&quot;http://country.huanqiu.com/china&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;中国&quot;&gt;中国&lt;/a&gt;等南沙群岛声索国签署和平协议，宣布该地区为“国际海洋公园”和“保护区”。他认为，这是“双赢”的解决办法。&lt;/p&gt;&lt;p&gt;　　报道称，该提议最初是由&lt;a href=&quot;http://country.huanqiu.com/america&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;美国&quot;&gt;美国&lt;/a&gt;海洋生物学教授约翰·麦克马努斯提出的。卡皮奥称，该提议之所以能达到“双赢”，是因为争议将由此搁置50年到100年，每个国家都不会丢面子，而且都能受益。他认为，南海仲裁案的裁决结果解决不了菲中领土争端，特别是黄岩岛问题。&lt;/p&gt;&lt;p&gt;　　卡皮奥是菲律宾政府提起南海仲裁案时的法律小组成员。他认为，上述建议可以让南沙的暗礁重新生长，这样有助于鱼类繁衍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;　　与此同时，卡皮奥提到，根据麦克马努斯的提议，应将南沙军事基础设施变成海洋研究和生态旅游基地，而且各国海军不能在该地区巡逻，只有海警可以派船只和人员到此。&lt;/p&gt;&lt;p&gt;　　《菲律宾每日问询者报》18日评论说，菲在仲裁结果出台后的举动“受到中国的欢迎”，中国也给予了“慷慨的回应”。菲ABS-CBN网\r\n站称，杜特尔特处理南海问题表现出实用的一面。《菲律宾星报》18日评论称，虽然在南海仲裁案上“获胜”，但菲律宾渔民在南海依然“孤独”。实际上，仲裁\r\n案对中美菲在南海上的力量对比改变很小。(任重)\r\n &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'article/1468893077.JPG', '22,999,DDD', '1468893080', '0', 'sda', '50', '1', '0');
INSERT INTO `esc_article` VALUES ('17', '9', '99999', '&lt;p&gt;wqwqwq&lt;br/&gt;&lt;/p&gt;', 'article/1468833233.jpg', '777', '1468833240', '0', '5555', '50', '1', '1');
INSERT INTO `esc_article` VALUES ('18', '11', '3333', '&lt;p&gt;rrrr&lt;br/&gt;&lt;/p&gt;', 'article/1468833266.JPG', '444', '1468833270', '0', '44', '50', '1', '1');
INSERT INTO `esc_article` VALUES ('19', '14', '3', '&lt;p&gt;6&lt;br/&gt;&lt;/p&gt;', 'article/1469004519.png', '4', '1469004521', '0', '5', '50', '1', '0');

-- ----------------------------
-- Table structure for `esc_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `esc_article_category`;
CREATE TABLE `esc_article_category` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_article_category
-- ----------------------------
INSERT INTO `esc_article_category` VALUES ('12', '122333', '2222222222', '222111111', '0', '50');
INSERT INTO `esc_article_category` VALUES ('13', '222', '333', '44', '0', '50');
INSERT INTO `esc_article_category` VALUES ('14', '333', '33', '111', '12', '50');

-- ----------------------------
-- Table structure for `esc_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_group`;
CREATE TABLE `esc_auth_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_group
-- ----------------------------
INSERT INTO `esc_auth_group` VALUES ('2', '编辑组', '1', '1016,1017,1018,1019', '1461319543');
INSERT INTO `esc_auth_group` VALUES ('1', '超级管理员', '1', '3,1003,1006,1007,1008,1004,1009,1010,1011,1005,1012,1013,1014,1016,1017,1018,1019,1031,1033', '1461318997');
INSERT INTO `esc_auth_group` VALUES ('52', '门店管理员', '1', '1016,1017,1018,1019', '1462534101');

-- ----------------------------
-- Table structure for `esc_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_group_access`;
CREATE TABLE `esc_auth_group_access` (
  `uid` smallint(5) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_group_access
-- ----------------------------
INSERT INTO `esc_auth_group_access` VALUES ('1', '1');
INSERT INTO `esc_auth_group_access` VALUES ('8', '2');
INSERT INTO `esc_auth_group_access` VALUES ('9', '52');

-- ----------------------------
-- Table structure for `esc_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `esc_auth_rule`;
CREATE TABLE `esc_auth_rule` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `pid` smallint(5) NOT NULL COMMENT '父级ID',
  `sort` tinyint(4) NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `icon` varchar(30) DEFAULT NULL,
  `isshow` int(11) DEFAULT '1',
  `condition` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_auth_rule
-- ----------------------------
INSERT INTO `esc_auth_rule` VALUES ('3', '管理员设置', 'AuthMenu/adminSeting', '0', '3', '1461304352', 'fa fa-user', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1003', '权限菜单', 'AuthMenu/index', '3', '4', '1462421741', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1004', '管理员列表', 'AuthMenu/adminList', '3', '2', '1462426444', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1005', '用户组', 'AuthMenu/groupList', '3', '3', '1462432238', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1006', '添加菜单', 'AuthMenu/addMenu', '1003', '50', '1462439203', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1007', '删除菜单', 'AuthMenu/delMenu', '1003', '50', '1462439251', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1008', '菜单排序', 'AuthMenu/order', '1003', '50', '1462439284', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1009', '添加用户', 'AuthMenu/addUser', '1004', '127', '1462439315', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1010', '禁用用户', 'AuthMenu/disableUser', '1004', '50', '1462439420', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1011', '删除用户', 'AuthMenu/delUser', '1004', '50', '1462439454', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1012', '添加分组', 'AuthMenu/addGroup', '1005', '50', '1462439568', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1013', '编辑分组', 'AuthMenu/editGroup', '1005', '50', '1462439607', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1014', '删除分组', 'AuthMenu/delGroup', '1005', '50', '1462439637', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1016', '系统主页', 'Main/index', '0', '1', '1462446704', 'fa fa-home', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1017', '修改密码', 'Main/changePassword', '1016', '50', '1462516089', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1018', '修改头像', 'Main/changeAvatar', '1016', '50', '1462517698', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1019', '上传头像', 'Main/shearphoto', '1016', '50', '1462533292', '', '0', null);
INSERT INTO `esc_auth_rule` VALUES ('1031', '站点设置', 'SystemSeting/siteSeting', '0', '2', '1468547346', 'fa fa-gear', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1033', '前台菜单', 'SystemSeting/menus', '0', '50', '1468567408', 'fa fa-sitemap', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1034', '文章管理', 'Article/index', '0', '50', '1468572158', 'fa fa-file-text-o', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1035', '分类管理', 'Article/categoryManage', '1034', '50', '1468572218', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1036', '文章列表', 'Article/articleList', '1034', '50', '1468572245', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1037', '产品管理', 'Product/index', '0', '50', '1468894224', 'fa fa-cubes', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1038', '产品分类', 'Product/categoryManage', '1037', '50', '1468894341', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1039', '产品列表', 'Product/productList', '1037', '50', '1468894709', '', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1040', '单页面管理', 'SinglePage/index', '0', '50', '1468899903', 'fa fa-file-o', '1', null);
INSERT INTO `esc_auth_rule` VALUES ('1041', '友情链接', 'friendLink/index', '0', '50', '1468915135', 'fa fa-code-fork', '1', null);

-- ----------------------------
-- Table structure for `esc_link`
-- ----------------------------
DROP TABLE IF EXISTS `esc_link`;
CREATE TABLE `esc_link` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_pic` int(1) DEFAULT '0' COMMENT '0文字logo 1图片logo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_link
-- ----------------------------
INSERT INTO `esc_link` VALUES ('32', '999', '1468919417', 'link/1468919411.jpg', '111', '1');
INSERT INTO `esc_link` VALUES ('33', '6666', '1468919433', 'link/1468919425.JPG', '9999999', '1');

-- ----------------------------
-- Table structure for `esc_menus`
-- ----------------------------
DROP TABLE IF EXISTS `esc_menus`;
CREATE TABLE `esc_menus` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `route_url` varchar(100) DEFAULT NULL,
  `pid` smallint(5) NOT NULL COMMENT '父级ID',
  `sort` tinyint(4) NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_chain` enum('1','0') DEFAULT '0' COMMENT '是否是外链',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1045 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_menus
-- ----------------------------
INSERT INTO `esc_menus` VALUES ('102', '热门新闻', 'new', null, '0', '2', '1468567408', '0');
INSERT INTO `esc_menus` VALUES ('1031', '222', 'about', null, '0', '1', '1468547346', '1');
INSERT INTO `esc_menus` VALUES ('1033', '前台菜单', 'http://www.baidu.com', null, '0', '3', '1468567408', '1');
INSERT INTO `esc_menus` VALUES ('1037', '111111111111111111', '对对对', null, '0', '50', '1468573608', '0');
INSERT INTO `esc_menus` VALUES ('1038', '111', '3333', null, '0', '50', '1468575751', '0');
INSERT INTO `esc_menus` VALUES ('1039', '1111', '3333', '4444', '0', '50', '1468809098', '1');
INSERT INTO `esc_menus` VALUES ('1040', '22222', '33333', '33333', '0', '50', '1468809112', '1');
INSERT INTO `esc_menus` VALUES ('1041', '1111', '2222', '222', '102', '50', '1468809266', '1');
INSERT INTO `esc_menus` VALUES ('1042', '111111', '222', '333', '1033', '50', '1468809325', '0');
INSERT INTO `esc_menus` VALUES ('1043', 'weewww', '222', '2222', '102', '50', '1469003607', '0');

-- ----------------------------
-- Table structure for `esc_product`
-- ----------------------------
DROP TABLE IF EXISTS `esc_product`;
CREATE TABLE `esc_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `views` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '0隐藏 1显示',
  `is_del` int(11) DEFAULT '0' COMMENT '0未删除 1已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_product
-- ----------------------------
INSERT INTO `esc_product` VALUES ('19', '10', ' 驱蚊器', '&lt;p&gt;撒打算&lt;br/&gt;&lt;/p&gt;', 'product/1468897541.JPG', '是的撒', '1468897556', '0', '是的撒', '50', '1', '0');
INSERT INTO `esc_product` VALUES ('20', '0', '111', '&lt;p&gt;222&lt;br/&gt;&lt;/p&gt;', 'product/1468909429.JPG', '222', '1468909436', '0', '22', '50', '1', '0');
INSERT INTO `esc_product` VALUES ('21', '13', '3', '&lt;p&gt;7&lt;br/&gt;&lt;/p&gt;', 'product/1469005355.JPG', '4', '1469005521', '0', '6', '50', '1', '0');
INSERT INTO `esc_product` VALUES ('12', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', '', '33', '0', '0', '55', '0', '1', '0');
INSERT INTO `esc_product` VALUES ('13', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', 'article/1468829501.JPG', '33', '0', '0', '55', '0', '1', '0');
INSERT INTO `esc_product` VALUES ('14', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', 'article/1468829501.JPG', '33', '1468829576', '0', '55', '50', '1', '0');
INSERT INTO `esc_product` VALUES ('15', '9', '11', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', 'article/1468829501.JPG', '33,99，88,888', '1468829983', '0', '55', '50', '1', '0');
INSERT INTO `esc_product` VALUES ('16', '10', '111', '&lt;p&gt;　【环球时报综合报道】据《&lt;a href=&quot;http://country.huanqiu.com/philippines&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;菲律宾&quot;&gt;菲律宾&lt;/a&gt;星报》18日报道，菲律宾最高法院法官安东尼奥·卡皮奥近日提议，菲政府应该推动与&lt;a href=&quot;http://country.huanqiu.com/china&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;中国&quot;&gt;中国&lt;/a&gt;等南沙群岛声索国签署和平协议，宣布该地区为“国际海洋公园”和“保护区”。他认为，这是“双赢”的解决办法。&lt;/p&gt;&lt;p&gt;　　报道称，该提议最初是由&lt;a href=&quot;http://country.huanqiu.com/america&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;美国&quot;&gt;美国&lt;/a&gt;海洋生物学教授约翰·麦克马努斯提出的。卡皮奥称，该提议之所以能达到“双赢”，是因为争议将由此搁置50年到100年，每个国家都不会丢面子，而且都能受益。他认为，南海仲裁案的裁决结果解决不了菲中领土争端，特别是黄岩岛问题。&lt;/p&gt;&lt;p&gt;　　卡皮奥是菲律宾政府提起南海仲裁案时的法律小组成员。他认为，上述建议可以让南沙的暗礁重新生长，这样有助于鱼类繁衍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;　　与此同时，卡皮奥提到，根据麦克马努斯的提议，应将南沙军事基础设施变成海洋研究和生态旅游基地，而且各国海军不能在该地区巡逻，只有海警可以派船只和人员到此。&lt;/p&gt;&lt;p&gt;　　《菲律宾每日问询者报》18日评论说，菲在仲裁结果出台后的举动“受到中国的欢迎”，中国也给予了“慷慨的回应”。菲ABS-CBN网\r\n站称，杜特尔特处理南海问题表现出实用的一面。《菲律宾星报》18日评论称，虽然在南海仲裁案上“获胜”，但菲律宾渔民在南海依然“孤独”。实际上，仲裁\r\n案对中美菲在南海上的力量对比改变很小。(任重)\r\n &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'article/1468893077.JPG', '22,999,DDD', '1468893080', '0', 'sda', '50', '1', '0');
INSERT INTO `esc_product` VALUES ('17', '9', '99999', '&lt;p&gt;wqwqwq&lt;br/&gt;&lt;/p&gt;', 'article/1468833233.jpg', '777', '1468833240', '0', '5555', '50', '1', '1');
INSERT INTO `esc_product` VALUES ('18', '11', '3333', '&lt;p&gt;rrrr&lt;br/&gt;&lt;/p&gt;', 'article/1468833266.JPG', '444', '1468833270', '0', '44', '50', '1', '1');

-- ----------------------------
-- Table structure for `esc_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `esc_product_category`;
CREATE TABLE `esc_product_category` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_product_category
-- ----------------------------
INSERT INTO `esc_product_category` VALUES ('13', '1', '2', '33', '0', '50');
INSERT INTO `esc_product_category` VALUES ('14', '2', '2', '2', '13', '50');
INSERT INTO `esc_product_category` VALUES ('10', '站内资讯12', 'innernew4', '555,555,6666', '0', '50');

-- ----------------------------
-- Table structure for `esc_single_page`
-- ----------------------------
DROP TABLE IF EXISTS `esc_single_page`;
CREATE TABLE `esc_single_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `content_en` longtext NOT NULL,
  `content` longtext NOT NULL,
  `keywords_en` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `views` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `description_en` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '0隐藏 1显示',
  `is_del` int(11) DEFAULT '0' COMMENT '0未删除 1已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_single_page
-- ----------------------------
INSERT INTO `esc_single_page` VALUES ('19', '十大', ' 驱蚊器111', '', '&lt;p&gt;444444&lt;br/&gt;&lt;/p&gt;', '', '是的撒22', '1469007811', '0', '是的撒', '是的撒33', '1', '0');
INSERT INTO `esc_single_page` VALUES ('12', '222', '11', '&lt;p&gt;3&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', '44', '33', '0', '0', '66', '55', '1', '1');
INSERT INTO `esc_single_page` VALUES ('13', '222', '11', '&lt;p&gt;3&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', '44', '33', '0', '0', '66', '55', '1', '1');
INSERT INTO `esc_single_page` VALUES ('14', '222', '11', '&lt;p&gt;3&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', '44', '33', '1468829576', '0', '66', '55', '1', '1');
INSERT INTO `esc_single_page` VALUES ('15', '222', '11', '&lt;p&gt;3&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;2&lt;br/&gt;&lt;/p&gt;', '44,666,99,qq，88', '33,99，88,888', '1468829983', '0', '66', '55', '1', '1');
INSERT INTO `esc_single_page` VALUES ('16', '21212222', '111', '&lt;p&gt;　【环球时报综合报道】据《&lt;a href=&quot;http://country.huanqiu.com/philippines&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;菲律宾&quot;&gt;菲律宾&lt;/a&gt;星报》18日报道，菲律宾最高法院法官安东尼奥·卡皮奥近日提议，菲政府应该推动与&lt;a href=&quot;http://country.huanqiu.com/china&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;中国&quot;&gt;中国&lt;/a&gt;等南沙群岛声索国签署和平协议，宣布该地区为“国际海洋公园”和“保护区”。他认为，这是“双赢”的解决办法。&lt;/p&gt;&lt;p&gt;　　报道称，该提议最初是由&lt;a href=&quot;http://country.huanqiu.com/america&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;美国&quot;&gt;美国&lt;/a&gt;海洋生物学教授约翰·麦克马努斯提出的。卡皮奥称，该提议之所以能达到“双赢”，是因为争议将由此搁置50年到100年，每个国家都不会丢面子，而且都能受益。他认为，南海仲裁案的裁决结果解决不了菲中领土争端，特别是黄岩岛问题。&lt;/p&gt;&lt;p&gt;　　卡皮奥是菲律宾政府提起南海仲裁案时的法律小组成员。他认为，上述建议可以让南沙的暗礁重新生长，这样有助于鱼类繁衍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;　　与此同时，卡皮奥提到，根据麦克马努斯的提议，应将南沙军事基础设施变成海洋研究和生态旅游基地，而且各国海军不能在该地区巡逻，只有海警可以派船只和人员到此。&lt;/p&gt;&lt;p&gt;　　《菲律宾每日问询者报》18日评论说，菲在仲裁结果出台后的举动“受到中国的欢迎”，中国也给予了“慷慨的回应”。菲ABS-CBN网\r\n站称，杜特尔特处理南海问题表现出实用的一面。《菲律宾星报》18日评论称，虽然在南海仲裁案上“获胜”，但菲律宾渔民在南海依然“孤独”。实际上，仲裁\r\n案对中美菲在南海上的力量对比改变很小。(任重)\r\n &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;　【环球时报综合报道】据《&lt;a href=&quot;http://country.huanqiu.com/philippines&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;菲律宾&quot;&gt;菲律宾&lt;/a&gt;星报》18日报道，菲律宾最高法院法官安东尼奥·卡皮奥近日提议，菲政府应该推动与&lt;a href=&quot;http://country.huanqiu.com/china&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;中国&quot;&gt;中国&lt;/a&gt;等南沙群岛声索国签署和平协议，宣布该地区为“国际海洋公园”和“保护区”。他认为，这是“双赢”的解决办法。&lt;/p&gt;&lt;p&gt;　　报道称，该提议最初是由&lt;a href=&quot;http://country.huanqiu.com/america&quot; class=&quot;linkAbout&quot; target=&quot;_blank&quot; title=&quot;美国&quot;&gt;美国&lt;/a&gt;海洋生物学教授约翰·麦克马努斯提出的。卡皮奥称，该提议之所以能达到“双赢”，是因为争议将由此搁置50年到100年，每个国家都不会丢面子，而且都能受益。他认为，南海仲裁案的裁决结果解决不了菲中领土争端，特别是黄岩岛问题。&lt;/p&gt;&lt;p&gt;　　卡皮奥是菲律宾政府提起南海仲裁案时的法律小组成员。他认为，上述建议可以让南沙的暗礁重新生长，这样有助于鱼类繁衍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;　　与此同时，卡皮奥提到，根据麦克马努斯的提议，应将南沙军事基础设施变成海洋研究和生态旅游基地，而且各国海军不能在该地区巡逻，只有海警可以派船只和人员到此。&lt;/p&gt;&lt;p&gt;　　《菲律宾每日问询者报》18日评论说，菲在仲裁结果出台后的举动“受到中国的欢迎”，中国也给予了“慷慨的回应”。菲ABS-CBN网\r\n站称，杜特尔特处理南海问题表现出实用的一面。《菲律宾星报》18日评论称，虽然在南海仲裁案上“获胜”，但菲律宾渔民在南海依然“孤独”。实际上，仲裁\r\n案对中美菲在南海上的力量对比改变很小。(任重)\r\n &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'SDASDA,999,99,ddd', '22,999,DDD', '1468893080', '0', 'sada', 'sda', '1', '1');
INSERT INTO `esc_single_page` VALUES ('17', '888', '99999', '&lt;p&gt;qweqweqweq&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;wqwqwq&lt;br/&gt;&lt;/p&gt;', '6666', '777', '1468833240', '0', '5555', '5555', '1', '1');
INSERT INTO `esc_single_page` VALUES ('18', '444', '3333', '&lt;p&gt;ttt&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;rrrr&lt;br/&gt;&lt;/p&gt;', '44', '444', '1468833270', '0', '444', '44', '1', '1');
INSERT INTO `esc_single_page` VALUES ('20', '2', '1', '&lt;p&gt;888&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;77&lt;br/&gt;&lt;/p&gt;', '4', '3', '1468910075', '0', '66', '55', '1', '1');
INSERT INTO `esc_single_page` VALUES ('21', '2222', '9999999999', '&lt;p&gt;888&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;777&lt;br/&gt;&lt;/p&gt;', '4444', '3333', '1468910101', '0', '6666', '55555', '1', '1');
INSERT INTO `esc_single_page` VALUES ('22', '2', '1', '&lt;p&gt;8&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;7&lt;br/&gt;&lt;/p&gt;', '4', '3', '1468915483', '0', '6', '5', '1', '1');

-- ----------------------------
-- Table structure for `esc_site_seting`
-- ----------------------------
DROP TABLE IF EXISTS `esc_site_seting`;
CREATE TABLE `esc_site_seting` (
  `sitename` varchar(100) DEFAULT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `statistical_code` varchar(200) DEFAULT NULL COMMENT '统计代码',
  `record_number` varchar(20) DEFAULT NULL COMMENT '备案号',
  `site_status` enum('0','1') DEFAULT '1' COMMENT '0关闭 1开启',
  `close_reason` varchar(200) DEFAULT NULL COMMENT '关闭站点原因'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esc_site_seting
-- ----------------------------
INSERT INTO `esc_site_seting` VALUES ('成都邑动', '广告，seo，Facebook', '这是广告推广网站', '82222', '722', '1', '2222');

-- ----------------------------
-- Table structure for `esc_user`
-- ----------------------------
DROP TABLE IF EXISTS `esc_user`;
CREATE TABLE `esc_user` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(40) NOT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `last_login_time` int(11) DEFAULT NULL,
  `last_login_ip` varchar(40) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `is_manage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`) USING BTREE,
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理员数据表';

-- ----------------------------
-- Records of esc_user
-- ----------------------------
INSERT INTO `esc_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '410202049@qq.com', '', '1', '1469000214', '127.0.0.1', 'avatar578dee632211e_118_name1.jpg', '1');
INSERT INTO `esc_user` VALUES ('8', 'kerry', 'e10adc3949ba59abbe56e057f20f883e', '', '', '1', '1462938785', '127.0.0.1', 'avatar572c7dc97b292_867_name1.jpg', '1');
INSERT INTO `esc_user` VALUES ('9', 'a123456', 'e10adc3949ba59abbe56e057f20f883e', '', '', '1', '1462534136', '127.0.0.1', null, '1');

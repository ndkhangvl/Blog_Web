-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 07:40 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`user_id`, `post_id`) VALUES
(1, 8),
(1, 14),
(3, 8),
(5, 8),
(6, 12),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_dateUp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post_title` varchar(255) NOT NULL,
  `post_content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_dateUp`, `post_title`, `post_content`) VALUES
(8, 5, '2022-11-30 06:06:42', 'Hãy đối xử với chính bản thân bằng lòng trắc ẩn', 'Nhiều người có thể dễ dàng cảm thông và từ bi với người khác nhưng lại khó có thể làm được điều đó với chính mình.\n\nLòng trắc ẩn không phải là chỉ sự tốt bụng, cảm thông, yêu thương. Lòng trắc ẩn kêu gọi chúng ta hành động và giúp đỡ.\n\nChúng ta thường có thể dễ dàng từ bi, vị tha và sẵn sàng giúp đỡ người khác, nhưng lại khó có thể làm điều đó được với chính bản thân mình. Chỉ khi bạn đối xử với bản thân bằng lòng trắc ẩn, bằng tình yêu thương vô điều kiện, thì bạn mới có thể phát triển và trở thành một phiên bản tốt hơn hiện tại.\n\nDưới đây là 4 cách để bạn có thể đối xử với bản thân bằng lòng trắc ẩn.\n\n1. Yêu cầu sự giúp đỡ nếu bạn cần\n\nHầu hết chúng ta đều cảm thấy vui khi giúp đỡ người khác, nhưng khi bản thân mình thực sự cần được giúp đỡ, chúng ta lại ngại mở lời. Đôi khi, một số người cho rằng yêu cầu sự giúp đỡ từ người khác là thể hiện sự yếu đuối, rằng bạn yêu cầu sự giúp đỡ là bạn đang thừa nhận bạn không đủ khả năng theo một cách nào đó, rằng bạn thiếu kiến thức, kỹ năng hoặc kinh nghiệm để tự làm một việc gì đó. Bạn không muốn ai thấy rằng bạn đang gặp khó khăn, bạn muốn mọi người nghĩ rằng bạn đang kiểm soát tốt và có thể giải quyết được mọi việc. \n\nThực tế, yêu cầu sự giúp đỡ là một kỹ năng mà hầu hết chúng ta đều cần phải học. Những người tự tin thường yêu cầu người khác giúp đỡ, vì họ biết rằng cố gắng tự làm mọi thứ không phải lúc nào cũng là cách tốt nhất. Hãy thay đổi niềm tin và kỳ vọng của bạn, bạn không thể nào biết hết tất cả mọi thứ. Yêu cầu sự giúp đỡ là có trách nhiệm với bản thân và những người khác, và bạn có thể hoàn thành tốt mọi việc nếu có sự trợ giúp từ người khác.\n\n2. Ngừng cố gắng sửa chữa bản thân\n\nMục tiêu cuộc sống của bạn không phải là trở nên hoàn hảo. Bạn là một con người, với những ưu điểm và khuyết điểm song song. \n\nBạn có luôn so sánh bản thân mình với người khác và đánh giá thấp chính mình hay không? Và bất chấp những thành tựu đáng kinh ngạc của bản thân, bạn vẫn tự thuyết phục rằng bạn vẫn chưa đủ tốt, chưa đủ giỏi và thậm chí là chưa xứng đáng?\n\nChúng ta nghĩ rằng yêu bản thân là sửa chữa những khuyết điểm hoặc nhào nặn chính mình thành một người khác, chúng ta luôn nghĩ rằng mình cần trở nên tốt hơn, mạnh mẽ hơn, càng gần tới mức \"hoàn hảo\" càng tốt. Và vì vậy mà chúng ta đặt ra những kỳ vọng không thực tế vào bản thân và sau đó tự hỏi tại sao chúng ta không thể hài lòng.\n\nYêu bản thân, chấp nhận bản thân, hoàn thiện bản thân - những điều này là quá trình không bao giờ kết thúc, và điều đó không có nghĩa rằng bạn sẽ không bao giờ đủ tốt. Bạn cần phải ngừng sửa chữa bản thân, ngừng coi bản thân như thể là một món đồ chơi trên kệ hay một chiếc ô tô cũ trong ga-ra. \n\n3. Học cách nói “không”\n\nNhiều người trong chúng ta được nuôi dạy để luôn làm hài lòng người khác và vì vậy mà chúng ta có thể sợ người khác đánh giá bản thân một cách tiêu cực nếu chúng ta nói “không”. \n\nThực tế, đôi khi chúng ta buộc phải nói “có” mặc dù không muốn, ví dụ như khi một người bạn hay một thành viên trong gia đình đang gặp khó khăn. Nhưng thường xuyên hơn, nói “không” là một cách để bạn chăm sóc bản thân và cũng là thực hành lòng trắc ẩn lên bản thân. \n\nHọc cách nói \"không\" là điều quan trọng để có một cuộc sống khỏe mạnh và thành công. Bạn không cần phải tỏ ra thô lỗ khi từ chối yêu cầu của ai đó nhưng hiểu được tầm quan trọng của việc nói \"không\" và tìm ra cách thích hợp để làm điều đó là rất quan trọng. \n\n\n4. Đừng tự trách bản thân khi mọi thứ không diễn ra như bạn muốn\n\nKhi thức dậy vào buổi sáng, hãy lập danh sách những việc bạn định làm trong ngày hôm đó rồi để nó sang một bên. Vào cuối ngày, hãy nhìn lại danh sách của bạn để xem liệu nó có giống như những gì diễn ra trong ngày của bạn hay không. Và bạn biết không, sẽ có nhiều ngày mà bạn thấy mọi chuyện không giống như những gì bạn nghĩ.\n\nJohn Lennon đã từng nói, cuộc sống là những gì xảy ra với bạn trong khi bạn đang bận rộn với những kế hoạch khác nhau. \n\nBạn thực sự kiểm soát cuộc sống của mình ít hơn nhiều so với những gì bạn nghĩ và việc tự trách bản thân khi mọi thứ không diễn ra như bạn đã dự định là không công bằng với chính mình.'),
(10, 1, '2022-11-25 07:06:43', 'My Summer Vacation', 'As a student, I don’t have much free time beside those I love, so my summer vacation is the duration during which I often busy myself with many things at home all day. In the day time,\n\nI often do sundry things for my grandmother and help my parents to do housework. In the evening, I go out with some of my old friends.\n\nWe often chat with each other in a cafe. Usually, when I am free from doing housework, I go and visit close relatives in my neighborhood and ask them about their life and business. In the late evening, I watch films on TV or read novels or books to widen my understanding. I often\n\ngo to bed very late.\n\nIn my mind, I always want my short summer vacations to be not only comfortable for me but also useful for my beloved people.'),
(11, 1, '2022-11-25 10:04:46', 'Sports/Debate', 'Throughout my life, I have tried to be a well-balanced person. Growing up in the South, I had a hard time fighting the stereotypical image of a Chinese person. I was expected to be a math and science genius and nothing more. As it turned out, I defied my detractors by excelling in English and history along with math and science. And over the years, I have continued to maintain my academic standards.\r\n\r\nNevertheless, I have also made sure that I am more than an academic person. I am an active one as well. In middle school, the most popular game during lunch was a basketball game called Salt and Pepper (white vs. black). The first day of school, I stepped onto the basketball courts and was greeted by cries of consternation, \"Who is he? Is he salt or pepper?\" But after the game, I had made a name for myself. From then onward, I would be known as Spice, and the game we played became Salt, Pepper, and Spice. When I moved to California, things were no different. I continued to play an active part both academically and socially. My involvement with Cross-country, Speech and Debate, Ultimate Frisbee and numerous clubs guaranteed that I would not be only known as an Honors student.\r\n\r\nLike myself, Duke is much more than an academic institution; it is a living institution. I feel that I will be given the opportunity to excel both academically and socially. Duke is a university known for its rich history and strong academic program. And, at the same time, it is also known for its innovation and progressiveness. These are qualities which draw me to the college.\r\n\r\nIn addition, Duke and I have a lot in common. The two most important extracurricular activities I have are a major part of Duke University. Duke\'s Speech team is known for its strong Extemp squad. I remember the time when my speech coach asked me what schools I was applying to. When I had listed my top five choices, he frowned at me and said, \"Out of all those schools, I will only respect you if you either join us at Berkeley or go to Duke and extemp.\" I hope I will be given the opportunity to contribute my part in the Duke Speech team.\r\n\r\nEqually important, the Duke University has a well-known Ultimate Frisbee team. I look forward expectantly to becoming a part of the team. Strange as it seems, Ultimate Frisbee is one of my top criteria for choosing my future college. It delights me that Duke places such great emphasis on the two extracurricular activities that mean most to me.\r\n                                                            \r\nMy first year at Duke should be a great one. Majoring in economics at Duke should allow me to both pursue my major studies and allow me time for personal interests in Chinese and the Humanities. Moreover, in my spare time, I plan to join the Speech team and the Ultimate Frisbee team. Hopefully, with my previous experience, I will have an early start in both Speech and Ultimate. Yet, I will never forget why I\'m in college in the first place. As long as I give organic chemistry a wide berth, I should be able to continue my level of academic excellence. Overall, my first year at Duke promises to be exciting, if a bit hectic.'),
(12, 6, '2022-11-30 05:55:20', '7 nguyên tắc \'vàng\' của người phụ nữ thông minh', 'Với phụ nữ, đừng bao giờ vì tình cảm mà tự đánh mất mình.\n\nPhụ nữ thông minh biết cách dùng ba thói quen nhỏ để giữ mối quan hệ ổn định \n\nCó những nguyên tắc trong cuộc sống chúng ta cần biết để khiến cho bản thân mình không gặp sai lầm trong việc cư xử với các mối quan hệ. Nhiều người luôn cho rằng, yêu hay không yêu nó thuộc về mặt cảm xúc. Nếu lí trí quá nhiều thì sẽ ảnh hưởng đến tính chất của tình cảm.\n\nTrên thực tế, phụ nữ thông minh cần nắm trong tay một số nguyên tắc để không khiến mình chịu thiệt thòi hay tỏ ra yếu thế trong quan hệ tình cảm.\n\n1. Cố gắng đừng vướng bận tài chính\n\nMột tình yêu đẹp có lẽ không nên liên quan gì đến tiệc bạc của nhau. Trên thực tế, chúng ta cũng biết tiền nong có ảnh hưởng không nhỏ trong mối quan hệ yêu đương. Phụ nữ khi yêu đừng để đàn ông luôn luôn trả tiền khi đi chơi, đừng dại dột góp tiền mua chung tài sản hay nói quá nhiều đến vấn đề tiền bạc của đối phương. Hãy độc lập về tài chính là bài học đầu tiên.\n2. Đừng coi đối phương là tất cả\n\nMột số người khi nói rằng với phụ nữ thì khi đã yêu, tình yêu sẽ là cả thế giới. Tình yêu rõ ràng rất quan trọng nhưng nó không phải quan trọng nhất. Còn có nhiều điều mà phụ nữ cần phải để ý, lưu tâm. Hãy biết rằng, người đàn ông đó là một phần trong cuộc sống của bạn chứ không bao giờ là cả cuộc sống của bạn được. Nếu như chỉ biết đến tình yêu, chăm chăm với nó thì có thể bạn sẽ tự đánh mất mình.\n\n3. Hãy giữ sự bình tĩnh của trái tim\n\nPhụ nữ khi yêu thì nên giữ vững tâm tư bình thản, đừng quá coi trọng hay xem nhẹ tình cảm của mình. Yêu nghiêm túc nhưng cũng phải thật thực tế. Bạn không biết điều gì sẽ xảy đến trong giây tiếp theo. Bởi vậy, hãy giữ trái tim bình tĩnh, nếu có vấn đề gì xảy đến thì mạnh dạn đối diện và đối mặt, kể cả là khi đối phương đột ngột nói ra lời chia tay.\n\n4. Đừng bao giờ chịu đựng quá nhiều\n\nKhi bước vào mối quan hệ yêu đương, bạn và đối phương ở trên một cái cán cân bằng. Trong tình yêu, chẳng ai nợ ai điều gì cả. Bởi vậy, phụ nữ đừng bao giờ chịu đựng đối phương. Tất cả phải cùng đồng hành, song hành trên nền tảng cân bằng, tôn trọng lẫn nhau. Nếu như bạn cứ chịu đựng có nghĩa bạn đang tự hạ thấp chính bản thân mình, tạo điều kiện cho đối phương \"vượt mặt\". Bởi thế, hãy vững vàng để đừng đánh mất mình trong tình yêu.\n5. Đừng gọi điện thoại cho đối phương quá nhiều\n\nPhụ nữ nên học cách kiềm chế trong tình yêu. Nhiều người chỉ vì tình cảm sâu đậm mà rảnh hay không rảnh đều tìm cách nhắn tin, gọi điện với đối phương. Nó sẽ khiến cho người đàn ông có cảm giác bạn chẳng rời xa anh ta nổi.\n\nPhụ nữ nên học cách tự điều chỉnh hành vi của mình. Để anh ta cũng có cơ hội thể hiện tình cảm dành cho bạn.\n\n6. Đừng bao giờ ép buộc kết hôn\n\nNhiều phụ nữ thích hôn nhân nhưng không phải tất cả đàn ông đều như thế. Bởi vậy, khi gặp kiểu đàn ông này bạn đừng ép buộc việc kết hôn. Không hạnh phúc nào đến bằng sự miễn cưỡng. Nếu tình yêu đã đến độ chín rồi thì cả hai về chung một nhà mới là hạnh phúc nhất.\n\nNgoài ra, đừng bao giờ đưa việc có con ra để trói buộc anh ta. Nếu đối phương không thích cưới, bạn có ép bằng đứa con thì lấy về bạn cũng sẽ là người đau khổ mà thôi. Bởi vậy, phụ nữ thông minh đừng bao giờ ép chuyện kết hôn. Hãy để nó tự nhiên và trở thành điều thiêng liêng trong cuộc đời bạn chứ không phải do ép buộc mới có được.\n7. Đừng rơi quá nhiều nước mắt vì tình yêu\n\nChia tay là đau đớn, là nỗi niềm khổ sở khiến bạn rơi nước mắt. Tuy nhiên, nó chỉ hợp lý khi bạn khóc một lần để phát tiết tất cả rồi sau đó tự an ủi chính mình, không đau đớn vì ai nữa. Đàn ông khiến đàn bà phải khóc thì hãy xem xét lại mối quan hệ ấy bởi rõ ràng anh ta không đủ tốt đâu. Đàn bà đừng làm khổ bản thân vì một người đàn ông không yêu mình. Nếu như cảm thấy vấn đề xuất hiện thì hãy mạnh dạn đối mặt và dứt khoát đưa ra lựa chọn có lợi cho mình.'),
(13, 6, '2022-11-30 06:01:10', 'Khi không có ý chí làm việc kiếm tiền, hãy hỏi bản thân 3 câu', 'Bạn xem công việc là kẻ thù, cả đời không thể tìm thấy thành công. Bạn xem công việc là nấc thang của sự tiến bộ thì chắc chắn thành công nằm trong tầm với..\n\nKỳ nghỉ kết thúc hoặc đến một thời điểm nào đó, hẳn rằng nhiều người làm công ăn lương sẽ có trạng thái thế này: Sáng ngủ dậy không muốn rời giường, nhưng cũng không dám buông xuôi; đi làm mệt mỏi, tan tầm chán chường.\n\nĐiều này cũng giống như nỗi sợ đêm Chủ nhật vì ngày mai là thứ Hai, bắt đầu một tuần với guồng quay công việc mới.\n\nKhông thể phủ nhận rằng đi làm rất mệt mỏi và khó khăn. Nhưng loại tâm lý mâu thuẫn với công việc này chỉ mang lại sự bất lực và hoảng loạn, trăm hại mà không có lợi.\n\nBạn nên nhanh chóng điều chỉnh tâm lý, lấy lại tinh thần để giải quyết vấn đề. Nếu thật sự không muốn đi làm, hãy tự hỏi mình 3 câu sau đây.\n\nBạn xem công việc là kẻ thù, cả đời không thể tìm thấy thành công. Bạn xem công việc là nấc thang của sự tiến bộ thì chắc chắn thành công nằm trong tầm với.\n\nKỳ nghỉ kết thúc hoặc đến một thời điểm nào đó, hẳn rằng nhiều người làm công ăn lương sẽ có trạng thái thế này: Sáng ngủ dậy không muốn rời giường, nhưng cũng không dám buông xuôi; đi làm mệt mỏi, tan tầm chán chường.\n\nĐiều này cũng giống như nỗi sợ đêm Chủ nhật vì ngày mai là thứ Hai, bắt đầu một tuần với guồng quay công việc mới.\n\nKhông thể phủ nhận rằng đi làm rất mệt mỏi và khó khăn. Nhưng loại tâm lý mâu thuẫn với công việc này chỉ mang lại sự bất lực và hoảng loạn, trăm hại mà không có lợi.\n\nBạn nên nhanh chóng điều chỉnh tâm lý, lấy lại tinh thần để giải quyết vấn đề. Nếu thật sự không muốn đi làm, hãy tự hỏi mình 3 câu sau đây.\n\n1. Bạn không muốn ra khỏi nhà đi làm, hay không thích làm việc?\n\nĐi làm có ý nghĩa gì? Thu nhập có lẽ là ý nghĩa duy nhất đối với nhiều người. Theo họ, nếu không phải vì kiếm tiền nuôi gia đình, cho bản thân cuộc sống ổn định thì ai lại thích làm việc?\n\nNhưng cũng vì cách suy nghĩ này mà nhiều người đã vô tình biến việc đi làm thành điều khiến cuộc sống bị mài mòn, giày vò.\n\nTrong cuộc sống, có một kiểu \"người cuồng công việc\", mỗi ngày làm việc chăm chỉ, không biết mệt mỏi. Sau khi tiếp xúc với họ, có lẽ bạn sẽ nhận ra: \"đi làm\" và \"làm việc\" có sự khác nhau.\n\nLắm lúc, chúng ta không phải không muốn làm việc, chỉ là không muốn đi làm mà thôi.\n\nKhông ít người chỉ biết công việc là kiếm tiền, nhưng không biết mình đang làm gì. Nói cách khác, bạn hoàn toàn xem mình là cái máy, không thể thật sự hòa nhập vào công ty, càng không thể hiện được giá trị cá nhân.\n\nKhông có nỗ lực, không thể tìm thấy cảm giác thành tựu, mất giá trị bản thân. Đi làm kiểu như vậy, ai cũng cảm thấy đuối sức.\n\nVậy làm việc là gì?\n\nLàm việc không chỉ duy trì cuộc sống, mà còn là một góc của xã hội, một sự kết nối. Làm việc là quá trình mài giũa chính mình.\n\nTạm bỏ qua vấn đề tiền lương, hãy khám phá những điều có ý nghĩa hơn trong công việc, chẳng hạn như: Nâng cao nhận thức, mở rộng tầm nhìn, làm quen với những người giỏi giang. Khi đó, bạn sẽ không cảm thấy làm việc là quá trình tra tấn mệt mỏi.\n\nNhà tâm lý học người Anh, Frederic Charles Bartlett đưa ra \"lý thuyết hai nhân tố\" nổi tiếng. Ông tin rằng tiền lương và môi trường là những yếu tố cơ bản thúc đẩy một người làm việc. Thứ truyền cảm hứng cho một người là thách thức, sự công nhận, phát triển cá nhân và các \"yếu tố động lực\" khác.\n\nĐi làm chỉ đơn giản là để kiếm tiền, và làm việc là để tìm thấy phiên bản tốt hơn của chính mình.\n\n2. Làm việc hàng ngày vì bản thân hay chỉ vì tiền?\n\nNơi làm việc như một xã hội thu nhỏ, có đủ thứ chuyện xảy ra trên đời. \n\nKhông ít người làm việc mười mấy năm, kết quả phát hiện đãi ngộ của mình còn thấp hơn thực tập sinh mới vào nghề. Trong cơn tức giận vốn định nhảy việc, nhưng xét đến rủi ro quá lớn nên chọn cách bày tỏ thái độ chống đối, buông xuôi. Mỗi ngày làm việc không nghiêm túc, rảnh rỗi thì đi kể chuyện bàn tán với đồng nghiệp.\n\nĐến khi bị công ty đào thải thì lại than thân trách phận, cho rằng công ty đối xử với nhân viên không hợp lý. Thế nhưng họ chưa bao giờ nghĩ lại, chính vì khoảng thời gian buông xuôi đó mới khiến cấp trên đánh giá xấu, từ đó mới đưa ra quyết định cuối cùng.\n\nNhiều người ghét đi làm, nhưng không thể buông hết vì cơm áo gạo tiền, kết quả chỉ làm việc trong tâm thế miễn cưỡng, có lệ, cho xong chuyện. Thế thì những lúc này nên tự hỏi bạn đi làm vì bản thân hay chỉ vì tiền?\n\nKhông chấp nhận buông xuôi, cố gắng làm việc hết sức có thể không phải vì cống hiến cho công ty hay cấp trên, mà là vì trách nhiệm với chính mình.\n\n3. Công việc có thể hoàn toàn biến mất khỏi cuộc sống của bạn được không?\n\nÔng trùm dầu mỏ người Mỹ, John Davison Rockefeller từng nói: “Nếu bạn xem công việc là một niềm vui, cuộc sống là thiên đàng. Nếu bạn coi công việc là nghĩa vụ, cuộc sống là địa ngục”.\n\nMuốn sống tốt, bạn phải có tiền. Mà muốn có tiền, bạn phải làm việc. Vậy thì cuộc sống không thể nào tách rời quá trình tạo ra tiền bạc, của cải.\n\nKhông thể bởi vì ngay từ đầu gian khổ mà thối lui. Cuộc sống không bao giờ dễ dàng, trắc trở là không thể tránh khỏi.\n\nTrên đời này, không có công việc nào không vất vả. Chúng ta sẽ luôn gặp phải đồng nghiệp không hòa hợp, cấp trên không thích mình, nhiệm vụ khó nhằn...\n\nNhưng thái độ làm việc sẽ quyết định số phận của bạn. Bạn xem công việc là kẻ thù, cả đời không thể tìm thấy thành công. Bạn xem công việc là nấc thang của sự tiến bộ thì chắc chắn thành công nằm trong tầm với.'),
(14, 6, '2022-11-30 06:02:18', 'Kiểu đàn ông nào hấp dẫn phụ nữ nhất?', 'Nhiều nam giới tò mò muốn biết, liệu gu của chị em sẽ chọn một người đàn ông thế nào. Nhiều khả năng là họ sẽ chọn người có 6 đặc điểm tính cách này.\n\nĐàn ông và phụ nữ có khí chất giống nhau thường có ấn tượng tốt với nhau, nếu khí chất mâu thuẫn nhau thì dễ sinh ra chán ghét, điều này tương đương với câu nói sức mạnh của khí chất của một người liên quan mật thiết đến ngôn ngữ, hành động, đặc điểm tính cách của người đó.\n\nĐàn ông có 6 đặc điểm tính cách này là điểm hấp dẫn phụ nữ nhất, hãy xem bạn có bao nhiêu trong số này nhé!\n\n1. Người có tràn đầy sự tự tin\n\nKhông còn nghi ngờ gì nữa, đây là điều kiện cần của đàn ông, sẽ rất ít cô gái thích những người đàn ông không có sự tự tin. Người có khí chất tự tin và quyến rũ luôn đủ sức nặng để làm \"tan nát\" trái tim phụ nữ.\n\n2. Người có khiếu hài hước, vui tính\n\nĐây được xem là đặc điểm bắt buộc phải có ở nam giới vì nó phù hợp với hầu hết tất cả phụ nữ. Nếu cô ấy cảm thấy hạnh phúc và vui vẻ khi ở với bạn, thì đương nhiên bạn đã để lại ấn tượng sâu sắc cho cô ấy, thì lần sau khi cô ấy cảm thấy không vui, tự nhiên cô ấy sẽ nghĩ đến bạn.\n\nĐây là một bước tiến lớn trong tình yêu. Đàn ông biết làm phụ nữ vui sẽ dễ dàng chiếm được trái tim của cô ấy.\n\n\n3. Người luôn mang theo niềm tự hào\n\nKhi nam giới có điều gì đó đáng tự hào, họ trở nên vô cùng thu hút đối với phụ nữ. Người có tài năng, có thành tựu, có tố chất vượt trội chính là yếu tố làm cho họ có được sự tự tôn, tự hào. Tuy nhiên, nhiều nam giới không hiểu điểm này, nhưng đặc điểm này nên được sử dụng cùng với sự hài hước, điều này thực sự quan trọng giúp nam giới thể hiện giá trị bên trong của bản thân.\n\n4. Người có kiến ​​thức phong phú và trình độ học vấn cao\n\nMột số phụ nữ thích những người đàn ông thực sự có trình độ học vấn cao. Họ thường nghĩ rằng những người có kiến ​​thức phong phú thì hấp dẫn và thú vị. Đàn ông càng biết nhiều kiến ​​thức, họ sẽ càng khiến phụ nữ cảm thấy hấp dẫn hơn. Vì vậy, hãy cố gắng để bản thân có sự hiểu đa dạng, luôn luôn học hỏi và trau dồi kiến thức, lấp đầy những chỗ khiếm khuyết của bản thân.\n\nKhi nam giới có vốn hiểu biết rộng, họ mặc nhiên sẽ rất có sức hấp dẫn với phụ nữ, đồng thời cũng rất có lợi cho việc phát triển sự nghiệp cũng như thuận lợi trong đường tình duyên.\n\n5. Người có gu, tinh tế\n\nPhẩm giá của một người đến từ thái độ của anh ta đối với cuộc sống. Những người có gu thẩm mỹ tốt thường có nhiều sở thích, niềm vui riêng và phong cách đặc biệt, và phụ nữ sẽ tìm thấy sở thích của bạn, chẳng hạn như phong cách chọn giày và thắt lưng, phối màu quần áo và hiểu biết tốt về thời trang, những phụ nữ thời trang hoặc tinh tế sẽ hay để ý đến chi tiết này.\n\nđàn-ông-thành-đạt \n\n6. Người biết chú ý đến chi tiết\n\nPhụ nữ thường rất thích chú ý đến chi tiết. Có thể bạn chỉ làm một việc nhỏ là bạn sẽ thu hút được cô ấy ngay lập tức, hoặc bạn có thể làm điều gì đó mà bạn nghĩ chẳng có gì to tát nhưng bất ngờ thay, nó lại rất to trong mắt cô ấy. Phụ nữ thường không chỉ để ý đến ngôn ngữ, cử chỉ hay hành vi của người khác và thực tế, họ chú ý nhiều hơn đến những chi tiết nhỏ của bản thân, chẳng hạn như đeo một phụ kiện nhỏ, một thay đổi nhỏ trong kiểu tóc, thì lúc đó, những người đàn ông nếu có thể nhận thấy những chi tiết này có khả năng gây ấn tượng với phụ nữ hơn.\n\nKhi chị em có một cái gì đó thay đổi, dù nhỏ nhất mà được phát hiện, thì họ rất xúc động, giống như họ hiểu rằng bạn đang quan tâm tới họ rất nhiều.\n\nTóm lại, nếu một người đàn ông muốn phát triển những nét tính cách này, trông rất đơn giản, nhưng phải mất nhiều thời gian để biến nó thành bản tính khi thực hiện. Nếu một người phụ nữ không cảm thấy bị thu hút bởi bạn, thì bạn cũng nên tự kiểm tra bản thân và xem cách cải thiện bản thân để có những phẩm chất thu hút cô ấy.\n\nHãy để phụ nữ cảm thấy rằng bạn là người hấp dẫn, nhưng cũng phải có một phong thái tốt, để có thể phát huy tối đa sự quyến rũ của bạn./.'),
(15, 1, '2022-11-30 06:05:24', '\'Chấp nhận bản thân\': Điều đơn giản nhưng chẳng mấy ai làm được', 'Tự nhận thức là vũ khí sắc bén để phá vỡ sương mù lạc lối. Khó khăn ở chỗ chúng ta phải đối mặt với con người thật sự.\n\nTrong cuộc sống, không ít người nói: \"Tôi không biết mình thích gì, cũng không biết bản thân có thể làm được những gì, càng không biết phải làm gì trong tương lai\".\n\nNhiều người lại nói: \"Tôi cảm thấy bản thân thật vô dụng, gì cũng không biết\"...\n\nSong, mỗi người chúng ta sẽ dựa trên cảm xúc của riêng mình và đánh giá của người khác để trả lời câu hỏi \"Tôi là người như thế nào\".\n\nThông qua suy nghĩ sâu sắc và quan sát bản thân, chúng ta phát hiện mình sợ nghe những lời không hay từ người khác và không thể nhìn thấy điểm mạnh của chính mình, do đó rơi vào sự tự nhận thức sai lầm.\n\nTrên thực tế, chúng ta có xu hướng dễ dàng đánh giá thấp và chối bỏ bản thân. Sự tự nhận thức đúng đắn mới có thể giúp chúng ta thoát khỏi vòng lặp \"Tôi không biết tôi...\".\n\n1. Đừng sợ người khác nói mình không tốt\n\nĐối diện với nhận xét của người khác, chúng ta thường có tâm lý mong đợi và lo lắng. Muốn biết mình trong tâm trí người khác như thế nào, song cũng sợ để lại ấn tượng không tốt với họ.\n\nĐôi khi, ngay cả khi đối phương cho chúng ta lời khen tốt đẹp, nhưng bản thân vẫn sẽ nghi ngờ: “Bạn nói thật chứ? Hay chỉ là khách sáo?”.\n\nTuy nhiên, ít ai nhận ra một điều: Con người trời sinh tự yêu bản thân. Chúng ta càng có khuynh hướng cho rằng mình là tốt, một khi người khác nói mình không tốt, loại cảm giác này sẽ bị sụp đổ, sau đó nghĩ cách sửa chữa và bài xích.\n\nTình huống này hầu như ai cũng mắc phải, chỉ là mỗi người có biểu hiện không giống nhau mà thôi.\n\nChúng ta đều biết rằng bản thân đều có ưu điểm và nhược điểm, do đó thử cố gắng chấp nhận chúng, không theo đuổi sự hoàn hảo.\n\nHãy dung dị với nhận xét và đánh giá của người khác, mỉm cười và chấp nhận. Cảm thấy hợp lý thì cố gắng thay đổi, không phù hợp với bản thân thì xem nó như lời đóng góp thiện chí.\n\n2. Thừa nhận cái tốt của bản thân\n\nChúng ta luôn hy vọng được người khác khen mình. Đến khi nhìn nhận lại bản thân, nhiều người không thể tìm thấy ưu điểm, từ đó không dám thừa nhận mình tốt đẹp đến đâu.\n\nNgười xưa nói: \"Tự mãn ắt tổn hại, khiêm tốn tự thu lợi\". Chúng ta vô tình xem khiêm tốn là sự tự phủ định, bất kể đạt được bao nhiêu thành tựu cũng không nỡ khen mình lấy một câu.\n\nĐáng sợ hơn, đôi khi chúng ta mù quáng so sánh với người khác, khi nhìn thấy ai đó tốt hơn lại cho rằng mình chưa đủ cố gắng.\n\nDần dần, chúng ta quen với việc tự chối bỏ chính mình.\n\nLắm lúc, chúng ta không có một tiêu chuẩn chính xác cho \"tốt\", từ đó dễ dàng so bì với những người xuất sắc, nhưng lại bỏ qua quá trình họ phấn đấu từ “không tốt” cho đến “xuất sắc”.\n\nVà thế là chúng ta chỉ biết nhìn thấy những điều không tốt ở bản thân, từ đó hủy hoại chính mình.\n\nKhi đã quen với việc tự chối bỏ, chúng ta sẽ vô thức bỏ qua những điều khiến bản thân tốt đẹp. Thậm chí khi người khác nhận xét mình đang làm tốt, chúng ta cũng không thể tin được, hoặc nghĩ rằng làm tốt là điều tầm thường ai cũng làm được.\n\nTrên thực tế, chỉ khi biết thừa nhận những ưu điểm của chính mình và tin rằng mình có thể làm tốt hơn, mới sinh ra sự can đảm để đối mặt khó khăn lớn hơn.\n\n3. Thừa nhận chính mình\n\nMỗi người đều có ưu điểm xen lẫn khuyết điểm.\n\nPhải biết chấp nhận nhận xét tiêu cực của người khác, cũng như dũng cảm thừa nhận ưu điểm của mình. Như vậy, mới có thể nhận thức khách quan hơn về bản thân.\n\nNhờ đó, chúng ta mới biết mình giỏi làm gì, muốn làm gì, khai thác ra tiềm năng và khát vọng, phá vỡ những lo lắng về \"Tôi không biết tôi...\".\n\nVì vậy, làm thế nào chúng ta có thể nhận thức đúng về bản thân? Đó chính là dám trải nghiệm và đối mặt với những điều xảy ra biết trước.\n\nTự nhận thức là vũ khí sắc bén để phá vỡ sương mù lạc lối. Khó khăn ở chỗ chúng ta phải đối mặt với con người thật sự.\n\nKhi lấy hết can đảm để thực hiện bước đầu tiên, bạn có thể sẽ phát hiện thực tế không tệ như mình nghĩ, vậy mà trước đó bản thân đã vô tình phủ nhận mọi thứ.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_usname` varchar(50) NOT NULL,
  `user_passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_usname`, `user_passwd`) VALUES
(1, 'Ho Xuan Phuong Dong Update', 'hxpdong1', 'hxpdong1'),
(3, 'Dong Update', 'hxpdong2', 'hxpdong2'),
(5, 'Dong 3 Update', 'hxpdong3', 'hxpdong3'),
(6, 'Nguyễn Duy Khang', 'ndkhang', 'ndkhang'),
(8, 'Nguyễn Duy Khang', 'ndkhangvl', 'ndkhangvl');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`user_id`,`post_id`),
  ADD KEY `fk_postidlike` (`post_id`),
  ADD KEY `fk_useridlike` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_userid` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_usname` (`user_usname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_postidlike` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `fk_useridlike` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

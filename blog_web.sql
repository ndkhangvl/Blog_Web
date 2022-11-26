-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2022 at 01:22 PM
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
(3, 8),
(5, 8);

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
(8, 5, '2022-11-21 06:02:00', 'This is test for hxpdong3 update', 'this is the content update'),
(9, 6, '2022-11-25 02:26:57', 'This is test post', 'this is content'),
(10, 1, '2022-11-25 07:06:43', 'My Summer Vacation', 'As a student, I don’t have much free time beside those I love, so my summer vacation is the duration during which I often busy myself with many things at home all day. In the day time,\n\nI often do sundry things for my grandmother and help my parents to do housework. In the evening, I go out with some of my old friends.\n\nWe often chat with each other in a cafe. Usually, when I am free from doing housework, I go and visit close relatives in my neighborhood and ask them about their life and business. In the late evening, I watch films on TV or read novels or books to widen my understanding. I often\n\ngo to bed very late.\n\nIn my mind, I always want my short summer vacations to be not only comfortable for me but also useful for my beloved people.'),
(11, 1, '2022-11-25 10:04:46', 'Sports/Debate', 'Throughout my life, I have tried to be a well-balanced person. Growing up in the South, I had a hard time fighting the stereotypical image of a Chinese person. I was expected to be a math and science genius and nothing more. As it turned out, I defied my detractors by excelling in English and history along with math and science. And over the years, I have continued to maintain my academic standards.\r\n\r\nNevertheless, I have also made sure that I am more than an academic person. I am an active one as well. In middle school, the most popular game during lunch was a basketball game called Salt and Pepper (white vs. black). The first day of school, I stepped onto the basketball courts and was greeted by cries of consternation, \"Who is he? Is he salt or pepper?\" But after the game, I had made a name for myself. From then onward, I would be known as Spice, and the game we played became Salt, Pepper, and Spice. When I moved to California, things were no different. I continued to play an active part both academically and socially. My involvement with Cross-country, Speech and Debate, Ultimate Frisbee and numerous clubs guaranteed that I would not be only known as an Honors student.\r\n\r\nLike myself, Duke is much more than an academic institution; it is a living institution. I feel that I will be given the opportunity to excel both academically and socially. Duke is a university known for its rich history and strong academic program. And, at the same time, it is also known for its innovation and progressiveness. These are qualities which draw me to the college.\r\n\r\nIn addition, Duke and I have a lot in common. The two most important extracurricular activities I have are a major part of Duke University. Duke\'s Speech team is known for its strong Extemp squad. I remember the time when my speech coach asked me what schools I was applying to. When I had listed my top five choices, he frowned at me and said, \"Out of all those schools, I will only respect you if you either join us at Berkeley or go to Duke and extemp.\" I hope I will be given the opportunity to contribute my part in the Duke Speech team.\r\n\r\nEqually important, the Duke University has a well-known Ultimate Frisbee team. I look forward expectantly to becoming a part of the team. Strange as it seems, Ultimate Frisbee is one of my top criteria for choosing my future college. It delights me that Duke places such great emphasis on the two extracurricular activities that mean most to me.\r\n                                                            \r\nMy first year at Duke should be a great one. Majoring in economics at Duke should allow me to both pursue my major studies and allow me time for personal interests in Chinese and the Humanities. Moreover, in my spare time, I plan to join the Speech team and the Ultimate Frisbee team. Hopefully, with my previous experience, I will have an early start in both Speech and Ultimate. Yet, I will never forget why I\'m in college in the first place. As long as I give organic chemistry a wide berth, I should be able to continue my level of academic excellence. Overall, my first year at Duke promises to be exciting, if a bit hectic.');

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
(1, 'Ho Xuan Phuong Dong Update', 'hxpdong1', 'hxpdong1update'),
(3, 'Dong Update', 'hxpdong2', 'hxpdong1update'),
(5, 'Dong 3 Update', 'hxpdong3', 'hxpdong3'),
(6, 'Nguyễn Duy Khang', 'ndkhang', 'ndkhang');

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
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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

-- INSERT:  Admin Accounts
"INSERT INTO admin (id, username, password, created_at) VALUES (1, 'admin', 'admin', '2025-11-26 02:08:33.801794');"
"INSERT INTO admin (id, username, password, created_at) VALUES (2, 'path', 'helpinghand', '2025-12-13 04:45:34.33405');"
"INSERT INTO admin (id, username, password, created_at) VALUES (3, 'dwight', 'finalproj', '2025-12-13 05:14:46.806248');"
"INSERT INTO admin (id, username, password, created_at) VALUES (4, 'janrey', 'database123', '2025-12-13 14:47:39.659447');"

-- INSERT: User Accounts
"INSERT INTO ""user"" (id, username, email, password, first_name, last_name, phone_number, address, city, bio, profile_completed, profile_completed_at, created_at) VALUES (1, 'andrei', 'andreigutierrez10@gmail.com', 'andrei', 'Andrei', 'Gutierrez', '09666858166', 'Mayuro, Rosario', 'Batangas', 'BSIT Student', true, '2025-11-26 02:18:25.896409', '2025-11-26 02:14:56.971063');"
"INSERT INTO ""user"" (id, username, email, password, first_name, last_name, phone_number, address, city, bio, profile_completed, profile_completed_at, created_at) VALUES (2, 'user1', 'user1@gmail.com', 'user1', 'user', '1', '09999999999', '', 'Rosario', '', true, '2025-11-26 02:26:34.030879', '2025-11-26 02:25:57.874005');"
"INSERT INTO ""user"" (id, username, email, password, first_name, last_name, phone_number, address, city, bio, profile_completed, profile_completed_at, created_at) VALUES (3, 'Jhonrhey', 'jhonrheytenorio@gmail.com', 'Jhonrhey131', 'Jhon Rhey', 'Tenorio', '09705747613', '', 'Lipa City', '', true, '2025-12-13 02:57:02.033607', '2025-12-13 02:55:43.742882');"
"INSERT INTO ""user"" (id, username, email, password, first_name, last_name, phone_number, address, city, bio, profile_completed, profile_completed_at, created_at) VALUES (4, 'DWIGHTTYYI', '24-32880@g.batstate-u.edu.ph', '12345', 'Dwight Christian', 'Buno', '09467483898', 'Banaybanay, Lipa City', 'Lipa', 'Student', true, '2025-12-13 03:28:22.960744', '2025-12-13 03:26:06.978558');"
"INSERT INTO ""user"" (id, username, email, password, first_name, last_name, phone_number, address, city, bio, profile_completed, profile_completed_at, created_at) VALUES (5, 'patty', '24-35057@g.batstate-u.edu.ph', 'TitaPatInBSU2425', 'Patricia Rose', 'Gonzales', '09458529442', 'PUROK IV-B NAMUNGA SOUTH, ROSARIO, BATANGAS', 'ROSARIO', '', true, '2025-12-13 03:31:43.32107', '2025-12-13 03:30:23.542895');"
"INSERT INTO ""user"" (id, username, email, password, first_name, last_name, phone_number, address, city, bio, profile_completed, profile_completed_at, created_at) VALUES (6, 'Tenors131', 'jhonrheytenorio300@gmail.com', 'tenorio131', 'rhey', 'tenorio', '09111100099', 'Purok3, Namunga Rosario', 'Rosario', 'Loving youuuu', true, '2025-12-13 03:40:26.982103', '2025-12-13 03:37:16.214779');"

-- INSERT: Listings
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (1, 'Repair', 'Skills & Services', 'Computer and Printer', 'Offering', 'Batangas', 'Repair Computer Printer', '2025-11-26 02:21:39.726364', '2025-11-26 02:21:39.726381', 1);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (2, 'Book', 'Items & Resources', 'Math book for college', 'Requesting', 'Lipa City', '', '2025-11-26 02:56:59.527997', '2025-11-26 02:56:59.52858', 2);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (3, 'Book', 'Items & Resources', 'Science book for college', 'Requesting', 'Lipa City', '', '2025-11-26 02:57:31.54204', '2025-11-26 02:57:31.54206', 2);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (4, 'Shoes', 'Items & Resources', 'Running shoes ', 'Offering', 'Lipa City', 'Shoes, Black, Running', '2025-12-13 02:36:03.410141', '2025-12-13 02:36:03.41016', 2);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (5, 'Free Books', 'Items & Resources', 'Used Books for G12 TVL-ICT', 'Offering', '', 'free', '2025-12-13 03:26:48.434007', '2025-12-13 03:26:48.434026', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (6, 'Repair Bike', 'Skills & Services', 'Patulong po to fix', 'Requesting', 'San Sebastian', 'repair ', '2025-12-13 03:28:41.207763', '2025-12-13 03:28:41.207773', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (7, 'Looking For Math Tutor', 'Skills & Services', 'Help me for my upcoming exam', 'Requesting', '', '', '2025-12-13 03:36:18.879118', '2025-12-13 03:36:18.879127', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (8, 'Tutoring or Homework Help', 'Skills & Services', '', 'Offering', '', '', '2025-12-13 03:38:12.948861', '2025-12-13 03:38:12.948875', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (9, 'Home Renovation', 'Skills & Services', 'Home renovation involves improving, repairing, or upgrading an existing house to enhance its safety, comfort, functionality, and overall appearance. This may include repairing damaged structures, upgrading electrical and plumbing systems, improving ventilation and lighting, and redesigning interior or exterior spaces. Home renovation also focuses on using durable and sustainable materials to create a healthier living environment. Through proper planning and quality workmanship, home renovation helps increase the value of the home while ensuring a safer and more comfortable space for the family.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 03:41:32.840493', '2025-12-13 03:41:32.840501', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (10, 'Free clothes', 'Items & Resources', '', 'Offering', '', '', '2025-12-13 03:48:57.653126', '2025-12-13 03:48:57.653136', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (11, 'CCTV Installation', 'Items & Resources', 'The use of surveillance cameras in public areas to improve safety, prevent crime, and help authorities monitor and respond to incidents quickly.
', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 03:49:15.176746', '2025-12-13 03:49:15.176753', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (12, 'Cleaning Service', 'Skills & Services', 'Clean service includes helping with household chores such as cleaning, cooking, and taking care of family members.', 'Offering', '', '', '2025-12-13 03:50:51.093507', '2025-12-13 03:50:51.093515', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (13, 'Things for Rent (Events / Occasions)', 'Items & Resources', 'Chairs, tents, and sound systems and things that can be rented for events.', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 03:54:45.319224', '2025-12-13 03:54:45.319232', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (14, 'Traffic Convex Mirror', 'Skills & Services', 'We kindly request the installation of a traffic convex mirror at due to banaybanay due to poor visibility at the blind corner. This will help improve safety and prevent accidents.', 'Requesting', 'Banaybanay, Lipa City', '', '2025-12-13 03:55:24.046193', '2025-12-13 03:55:24.046204', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (15, 'Phone for Sale', 'Items & Resources', 'Im selling my Iphone 19 pro max 1 tb with phonecase.
', 'Offering', '', 'Phone for sale', '2025-12-13 03:55:36.143381', '2025-12-13 03:55:36.143389', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (16, 'Gardening Services', 'Skills & Services', 'Gardening is a home service that involves watering plants and keeping the yard clean.', 'Offering', '', '', '2025-12-13 03:57:41.004043', '2025-12-13 03:57:41.004054', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (17, 'Helping with home repairs', 'Skills & Services', 'Helping with home repairs ', 'Offering', '', '', '2025-12-13 03:59:11.748634', '2025-12-13 03:59:11.748645', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (18, 'House For Rent', 'Items & Resources', 'Provide low-cost, safe, and decent homes for low-income families to ensure access to proper shelter.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 03:59:13.281239', '2025-12-13 03:59:13.281251', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (19, 'digicam ', 'Items & Resources', '✧⁠*⁠。CANON IXUS 115 HS

12.1 MP 

♡ ₱5,799
W/ MOVIE DIGEST 

৩ৎIssue: vignette (doesn''t affect the output)
and lens dust when max zoom 

৩ৎ Inclusions: curated box, battery, sd card, charger, camera strap, beaded strap, camera pouch, silica gel, microfiber cloth, lens cleaning pads, stickers', 'Offering', 'Sabang Lipa City', 'Camera For Sale', '2025-12-13 04:00:15.980119', '2025-12-13 04:00:15.980122', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (20, 'Laundry Service', 'Skills & Services', 'Washing, Drying, and Folding Clothes', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:00:51.700274', '2025-12-13 04:00:51.700281', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (21, 'Van For Rent', 'Items & Resources', 'A service where you rent a van (with or without a driver) for transporting people or goods for a certain time or distance.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 04:02:31.710705', '2025-12-13 04:02:31.710714', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (22, 'Tools / Equipment For Rent', 'Items & Resources', 'Power tools, construction tools, cameras, and video equipment are tools and equipment that can be rented.
', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:02:41.070206', '2025-12-13 04:02:41.070212', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (23, 'Air Conditioner Cleaning Services', 'Skills & Services', 'Stay cool, stay comfortable with our AC services. Fresh air is just a click away. 
• Longer Aircon Life
• Affordable Rates 
• Serving Lipa City and surrounding areas. 
📩Message for queries. Book now!
09111779922
09696969696', 'Offering', '', '#LipaAirconFrozen #AirconMaintenance#WowSaLaming', '2025-12-13 04:05:09.308477', '2025-12-13 04:05:42.439156', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (24, 'Eatery', 'Items & Resources', 'Delicious meals, fresh ingredients, and a cozy spot to enjoy great food with family and friends.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 04:05:10.454455', '2025-12-13 04:05:10.454466', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (25, 'Distributing Flyers or Information Materials', 'Skills & Services', '', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:05:22.361432', '2025-12-13 04:05:22.361439', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (26, 'Helping during Emergency Drills', 'Skills & Services', 'Helping during emergency drills is a community service that promotes safety and preparedness.', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:06:49.922497', '2025-12-13 04:06:49.922503', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (27, 'Laptop For Sale', 'Items & Resources', 'Lokking for a laptop that is pwede po for schooling', 'Requesting', 'Bolbok', '#pls_help_me', '2025-12-13 04:07:26.472939', '2025-12-13 04:07:26.472948', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (28, 'Dog Trainer', 'Skills & Services', 'Expert dog training for happy, well-behaved pups.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 04:08:01.71389', '2025-12-13 04:08:01.713896', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (29, 'Discrete Mathematics Notes', 'Items & Resources', 'Discrete Mathematics Free Notes', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:08:06.401557', '2025-12-13 04:08:06.401565', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (30, 'Looking for Buldak', 'Items & Resources', 'buldak yung color pink po sana.thxxx', 'Requesting', '', '', '2025-12-13 04:08:52.702434', '2025-12-13 04:09:07.558933', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (31, 'Proper Waste Segregation and Recycling', 'Skills & Services', 'Proper waste segregation and recycling mean separating trash into biodegradable, non-biodegradable, and recyclable materials to reduce waste.', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:10:05.831556', '2025-12-13 04:10:05.831561', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (32, 'Salon Service', 'Skills & Services', 'Your go-to spot for stylish cuts, pampering treatments, and beauty services that make you look and feel your best.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 04:10:15.302956', '2025-12-13 04:10:15.302963', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (33, 'Spa Massage', 'Skills & Services', 'Relax, rejuvenate, and refresh with our professional massage and wellness treatments.', 'Offering', 'Banaybanay, Lipa City', '', '2025-12-13 04:11:09.532359', '2025-12-13 04:11:09.532366', 4);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (34, 'Tree Planting and Community Gardening', 'Skills & Services', 'Tree planting and community gardening involve planting trees and growing plants together to improve the environment.', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:11:18.384875', '2025-12-13 04:11:18.384884', 5);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (35, 'baby sitter', 'Skills & Services', 'nag hahanap po ako nang magbabantay sa baby ko na 5 yrs old.Mabait po sya and cute.Thank you pooo', 'Requesting', 'San Carlos, Lipa City', 'Help_me', '2025-12-13 04:11:28.636803', '2025-12-13 04:11:28.636813', 3);"
"INSERT INTO listing (id, title, category, description, listing_type, location, tags, created_at, updated_at, user_id) VALUES (36, 'Teaching Skills', 'Skills & Services', '(sewing, crafts, basic computer use)', 'Offering', 'Namunga, Rosario Batangas', '', '2025-12-13 04:13:08.642146', '2025-12-13 04:13:08.64215', 5);"

-- INSERT:  Feedback
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (1, 5, 'Thank you so much pooooo... All good conditon', '2025-12-13 03:45:49.734134', 6, 5);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (2, 4, 'reliable tutor', '2025-12-13 03:47:31.855988', 4, 7);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (3, 5, 'smooth transaction', '2025-12-13 03:48:13.613641', 6, 8);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (4, 5, NULL, '2025-12-13 04:21:59.085559', 5, 35);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (5, 5, NULL, '2025-12-13 04:22:15.909301', 5, 32);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (6, 3, 'magaling mag alaga', '2025-12-13 06:38:32.004739', 4, 35);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (7, 5, 'very nice', '2025-12-13 06:39:24.384851', 3, 26);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (8, 5, 'very helpful', '2025-12-13 06:40:08.209153', 4, 25);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (9, 5, 'grabe ang sarap naman pooo', '2025-12-13 06:40:12.48503', 3, 24);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (10, 1, 'may putok po', '2025-12-13 06:40:47.628989', 3, 10);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (11, 5, 'ang bait po nung may ariii', '2025-12-13 06:41:31.086539', 3, 21);"
"INSERT INTO feedback (id, rating, comment, created_at, reviewer_id, listing_id) VALUES (12, 4, 'makulit po yung aso and and cute', '2025-12-13 06:42:27.89359', 3, 28);"

-- INSERT: Notifications
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (1, '🔔 user 1 (@user1) is interested in your listing: ""Repair""

📧 Contact: user1@gmail.com
📱 Phone: 09999999999', 'interest', true, '2025-11-26 02:28:58.899182', 1, 2, 1);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (2, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Repair Bike""

Message: ""I''m interested""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', true, '2025-12-13 03:36:31.436396', 3, 5, 6);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (3, '🔔 rhey tenorio (@Tenors131) is interested in your listing: ""Free Books""

📧 Contact: jhonrheytenorio300@gmail.com
📱 Phone: 09111100099', 'interest', true, '2025-12-13 03:44:48.194401', 3, 6, 5);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (4, '📝 rhey tenorio (@Tenors131) left a 5-star review on your listing: ""Free Books""

Rating: ⭐⭐⭐⭐⭐
Comment: ""Thank you so much pooooo... All good conditon""', 'feedback', true, '2025-12-13 03:45:49.743817', 3, 6, 5);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (5, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Looking For Math Tutor""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', true, '2025-12-13 03:46:54.021533', 3, 5, 7);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (6, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""Looking For Math Tutor""

Message: ""yes""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', true, '2025-12-13 03:47:12.836432', 3, 4, 7);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (7, '🔔 rhey tenorio (@Tenors131) is interested in your listing: ""Tutoring or Homework Help""

Message: ""i can help pooo""

📧 Contact: jhonrheytenorio300@gmail.com
📱 Phone: 09111100099', 'interest', false, '2025-12-13 03:47:22.255455', 5, 6, 8);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (8, '📝 Dwight Christian Buno (@DWIGHTTYYI) left a 4-star review on your listing: ""Looking For Math Tutor""

Rating: ⭐⭐⭐⭐
Comment: ""reliable tutor""', 'feedback', true, '2025-12-13 03:47:31.857749', 3, 4, 7);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (9, '📝 rhey tenorio (@Tenors131) left a 5-star review on your listing: ""Tutoring or Homework Help""

Rating: ⭐⭐⭐⭐⭐
Comment: ""smooth transaction""', 'feedback', false, '2025-12-13 03:48:13.614752', 5, 6, 8);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (10, '🔔 rhey tenorio (@Tenors131) is interested in your listing: ""Repair Bike""

📧 Contact: jhonrheytenorio300@gmail.com
📱 Phone: 09111100099', 'interest', true, '2025-12-13 03:48:48.361781', 3, 6, 6);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (11, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Phone for Sale""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', true, '2025-12-13 03:57:51.595102', 3, 5, 15);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (12, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""baby sitter""

Message: ""me po""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', true, '2025-12-13 04:14:58.102971', 3, 5, 35);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (13, '📝 Patricia Rose Gonzales (@patty) left a 5-star review on your listing: ""baby sitter""

Rating: ⭐⭐⭐⭐⭐', 'feedback', true, '2025-12-13 04:21:59.086993', 3, 5, 35);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (14, '📝 Patricia Rose Gonzales (@patty) left a 5-star review on your listing: ""Salon Service""

Rating: ⭐⭐⭐⭐⭐', 'feedback', true, '2025-12-13 04:22:15.910756', 4, 5, 32);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (15, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Laptop For Sale""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', true, '2025-12-13 04:22:37.57949', 3, 5, 27);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (16, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Dog Trainer""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', true, '2025-12-13 04:23:20.152612', 4, 5, 28);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (17, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Teaching Skills""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', true, '2025-12-13 04:23:28.856017', 5, 3, 36);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (18, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Spa Massage""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', true, '2025-12-13 04:23:49.18079', 4, 3, 33);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (19, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Home Renovation""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', true, '2025-12-13 04:25:27.634064', 4, 3, 9);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (20, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""Teaching Skills""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', false, '2025-12-13 04:29:13.972588', 5, 4, 36);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (21, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""baby sitter""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', true, '2025-12-13 04:29:21.14621', 3, 4, 35);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (22, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""Tree Planting and Community Gardening""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', false, '2025-12-13 04:29:32.639084', 5, 4, 34);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (23, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""Proper Waste Segregation and Recycling""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', false, '2025-12-13 04:29:44.084392', 5, 4, 31);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (24, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""Helping during Emergency Drills""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', false, '2025-12-13 04:30:28.578569', 5, 4, 26);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (25, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Proper Waste Segregation and Recycling""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:36:32.63658', 5, 3, 31);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (26, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Helping during Emergency Drills""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:36:43.421892', 5, 3, 26);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (27, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Repair""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:36:56.119677', 1, 3, 1);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (28, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Discrete Mathematics Notes""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:37:09.942474', 5, 3, 29);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (29, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Gardening Services""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:37:20.286169', 5, 3, 16);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (30, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Spa Massage""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', false, '2025-12-13 06:37:23.856315', 4, 5, 33);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (31, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""House For Rent""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:37:31.471297', 4, 3, 18);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (32, '🔔 Patricia Rose Gonzales (@patty) is interested in your listing: ""Salon Service""

📧 Contact: 24-35057@g.batstate-u.edu.ph
📱 Phone: 09458529442', 'interest', false, '2025-12-13 06:37:38.610436', 4, 5, 32);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (33, '📝 Dwight Christian Buno (@DWIGHTTYYI) left a 3-star review on your listing: ""baby sitter""

Rating: ⭐⭐⭐
Comment: ""magaling mag alaga""', 'feedback', true, '2025-12-13 06:38:32.009383', 3, 4, 35);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (34, '📝 Jhon Rhey Tenorio (@Jhonrhey) left a 5-star review on your listing: ""Helping during Emergency Drills""

Rating: ⭐⭐⭐⭐⭐
Comment: ""very nice""', 'feedback', false, '2025-12-13 06:39:24.386431', 5, 3, 26);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (35, '🔔 Dwight Christian Buno (@DWIGHTTYYI) is interested in your listing: ""Distributing Flyers or Information Materials""

📧 Contact: 24-32880@g.batstate-u.edu.ph
📱 Phone: 09467483898', 'interest', false, '2025-12-13 06:39:41.086698', 5, 4, 25);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (36, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Eatery""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:39:50.254668', 4, 3, 24);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (37, '📝 Dwight Christian Buno (@DWIGHTTYYI) left a 5-star review on your listing: ""Distributing Flyers or Information Materials""

Rating: ⭐⭐⭐⭐⭐
Comment: ""very helpful""', 'feedback', false, '2025-12-13 06:40:08.211815', 5, 4, 25);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (38, '📝 Jhon Rhey Tenorio (@Jhonrhey) left a 5-star review on your listing: ""Eatery""

Rating: ⭐⭐⭐⭐⭐
Comment: ""grabe ang sarap naman pooo""', 'feedback', false, '2025-12-13 06:40:12.486658', 4, 3, 24);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (39, '📝 Jhon Rhey Tenorio (@Jhonrhey) left a 1-star review on your listing: ""Free clothes""

Rating: ⭐
Comment: ""may putok po""', 'feedback', false, '2025-12-13 06:40:47.63033', 5, 3, 10);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (40, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Van For Rent""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:41:07.165038', 4, 3, 21);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (41, '📝 Jhon Rhey Tenorio (@Jhonrhey) left a 5-star review on your listing: ""Van For Rent""

Rating: ⭐⭐⭐⭐⭐
Comment: ""ang bait po nung may ariii""', 'feedback', false, '2025-12-13 06:41:31.08819', 4, 3, 21);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (42, '🔔 Andrei Gutierrez (@andrei) is interested in your listing: ""Looking for Buldak""

Message: ""❣️❣️❣️""

📧 Contact: andreigutierrez10@gmail.com
📱 Phone: 09666858166', 'interest', true, '2025-12-13 06:42:04.568936', 3, 1, 30);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (43, '🔔 Jhon Rhey Tenorio (@Jhonrhey) is interested in your listing: ""Dog Trainer""

📧 Contact: jhonrheytenorio@gmail.com
📱 Phone: 09705747613', 'interest', false, '2025-12-13 06:42:05.157146', 4, 3, 28);"
"INSERT INTO notification (id, message, notification_type, is_read, created_at, recipient_id, sender_id, listing_id) VALUES (44, '📝 Jhon Rhey Tenorio (@Jhonrhey) left a 4-star review on your listing: ""Dog Trainer""

Rating: ⭐⭐⭐⭐
Comment: ""makulit po yung aso and and cute""', 'feedback', false, '2025-12-13 06:42:27.895027', 4, 3, 28);"

-- INSERT:  Interests
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (1, NULL, '2025-11-26 02:28:58.874278', 2, 1);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (2, 'I''m interested', '2025-12-13 03:36:31.425615', 5, 6);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (3, NULL, '2025-12-13 03:44:48.192729', 6, 5);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (4, NULL, '2025-12-13 03:46:54.019358', 5, 7);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (5, 'yes', '2025-12-13 03:47:12.835436', 4, 7);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (6, 'i can help pooo', '2025-12-13 03:47:22.254265', 6, 8);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (7, NULL, '2025-12-13 03:48:48.36067', 6, 6);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (8, NULL, '2025-12-13 03:57:51.594486', 5, 15);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (9, 'me po', '2025-12-13 04:14:58.101396', 5, 35);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (10, NULL, '2025-12-13 04:22:37.578229', 5, 27);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (11, NULL, '2025-12-13 04:23:20.151833', 5, 28);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (12, NULL, '2025-12-13 04:23:28.855253', 3, 36);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (13, NULL, '2025-12-13 04:23:49.180381', 3, 33);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (14, NULL, '2025-12-13 04:25:27.632653', 3, 9);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (15, NULL, '2025-12-13 04:29:13.971484', 4, 36);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (16, NULL, '2025-12-13 04:29:21.144844', 4, 35);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (17, NULL, '2025-12-13 04:29:32.638647', 4, 34);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (18, NULL, '2025-12-13 04:29:44.083027', 4, 31);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (19, NULL, '2025-12-13 04:30:28.577631', 4, 26);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (20, NULL, '2025-12-13 06:36:32.583601', 3, 31);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (21, NULL, '2025-12-13 06:36:43.419759', 3, 26);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (22, NULL, '2025-12-13 06:36:56.118298', 3, 1);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (23, NULL, '2025-12-13 06:37:09.941121', 3, 29);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (24, NULL, '2025-12-13 06:37:20.284732', 3, 16);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (25, NULL, '2025-12-13 06:37:23.852572', 5, 33);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (26, NULL, '2025-12-13 06:37:31.46747', 3, 18);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (27, NULL, '2025-12-13 06:37:38.608411', 5, 32);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (28, NULL, '2025-12-13 06:39:41.085025', 4, 25);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (29, NULL, '2025-12-13 06:39:50.253411', 3, 24);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (30, NULL, '2025-12-13 06:41:07.163825', 3, 21);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (31, '❣️❣️❣️', '2025-12-13 06:42:04.567722', 1, 30);"
"INSERT INTO interest (id, message, created_at, user_id, listing_id) VALUES (32, NULL, '2025-12-13 06:42:05.156121', 3, 28);"


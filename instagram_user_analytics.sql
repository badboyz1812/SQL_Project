CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);



CREATE TABLE photos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    image_url VARCHAR(355) NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Photos_Users FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Comments_Users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT FK_Comments_Photos FOREIGN KEY (photo_id) REFERENCES photos(id)
);


CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Likes_Users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT FK_Likes_Photos FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Follows_Follower FOREIGN KEY (follower_id) REFERENCES users(id),
    CONSTRAINT FK_Follows_Followee FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE tags (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);


CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    CONSTRAINT FK_PhotoTags_Photos FOREIGN KEY (photo_id) REFERENCES photos(id),
    CONSTRAINT FK_PhotoTags_Tags FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (photo_id, tag_id)
);


INSERT INTO users (username) VALUES 
('arjun_sharma'),
('priya_verma'),
('rahul_gupta'),
('aisha_khan'),
('rohit_mehta'),
('deepika_nair'),
('aman_patel'),
('kritika_malhotra'),
('siddharth_jain'),
('neha_choudhary');

INSERT INTO photos (image_url, user_id) VALUES 
('https://example.com/india_temple.jpg', 1),  -- Arjun's photo
('https://example.com/kerala_backwaters.jpg', 2),  -- Priya's photo
('https://example.com/taj_mahal.jpg', 3),  -- Rahul's photo
('https://example.com/diwali_lights.jpg', 4),  -- Aisha's photo
('https://example.com/ladakh_mountains.jpg', 5),  -- Rohit's photo
('https://example.com/south_indian_food.jpg', 6),  -- Deepika's photo
('https://example.com/kite_festival.jpg', 7),  -- Aman's photo
('https://example.com/holi_celebration.jpg', 8),  -- Kritika's photo
('https://example.com/kolkata_durga_puja.jpg', 9),  -- Siddharth's photo
('https://example.com/goa_beach.jpg', 10);  -- Neha's photo


INSERT INTO comments (comment_text, user_id, photo_id) VALUES 
('Beautiful temple!', 2, 1),  -- Priya commenting on Arjun's photo
('Love the serenity!', 3, 2),  -- Rahul commenting on Priya's photo
('Iconic!', 4, 3),  -- Aisha commenting on Rahul's photo
('Stunning lights!', 5, 4),  -- Rohit commenting on Aisha's photo
('Amazing view!', 6, 5),  -- Deepika commenting on Rohit's photo
('So delicious!', 7, 6),  -- Aman commenting on Deepika's photo
('Perfect celebration!', 8, 7),  -- Kritika commenting on Aman's photo
('Vivid colors!', 9, 8),  -- Siddharth commenting on Kritika's photo
('Divine!', 10, 9),  -- Neha commenting on Siddharth's photo
('Mesmerizing beach!', 1, 10);  -- Arjun commenting on Neha's photo

INSERT INTO likes (user_id, photo_id) VALUES 
(2, 1),  -- Priya likes Arjun's photo
(3, 2),  -- Rahul likes Priya's photo
(4, 3),  -- Aisha likes Rahul's photo
(5, 4),  -- Rohit likes Aisha's photo
(6, 5),  -- Deepika likes Rohit's photo
(7, 6),  -- Aman likes Deepika's photo
(8, 7),  -- Kritika likes Aman's photo
(9, 8),  -- Siddharth likes Kritika's photo
(10, 9),  -- Neha likes Siddharth's photo
(1, 10);  -- Arjun likes Neha's photo

INSERT INTO follows (follower_id, followee_id) VALUES 
(1, 2),  -- Arjun follows Priya
(2, 3),  -- Priya follows Rahul
(3, 4),  -- Rahul follows Aisha
(4, 5),  -- Aisha follows Rohit
(5, 6),  -- Rohit follows Deepika
(6, 7),  -- Deepika follows Aman
(7, 8),  -- Aman follows Kritika
(8, 9),  -- Kritika follows Siddharth
(9, 10),  -- Siddharth follows Neha
(10, 1);  -- Neha follows Arjun


INSERT INTO tags (tag_name) VALUES 
('heritage'),  -- Tag for Indian heritage sites
('nature'),  -- Nature-related tag
('festivals'),  -- Indian festival-themed tag
('food'),  -- Delicious food
('travel');  -- Travel-related photos

INSERT INTO photo_tags (photo_id, tag_id) VALUES 
(1, 1),  -- Arjun's photo tagged as heritage
(2, 2),  -- Priya's photo tagged as nature
(3, 1),  -- Rahul's photo tagged as heritage
(4, 3),  -- Aisha's photo tagged as festivals
(5, 2),  -- Rohit's photo tagged as nature
(6, 4),  -- Deepika's photo tagged as food
(7, 3),  -- Aman's photo tagged as festivals
(8, 3),  -- Kritika's photo tagged as festivals
(9, 3),  -- Siddharth's photo tagged as festivals
(10, 5);  -- Neha's photo tagged as travel



SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;
SELECT * FROM likes;
SELECT * FROM follows;
SELECT * FROM tags;
SELECT * FROM photo_tags;

--Generate top 5 user's in instagram
SELECT TOP 5 id, username, created_at
FROM users
ORDER BY created_at ASC;

-- Insert users (Some users will have photos, some will not)
INSERT INTO users (username) VALUES 
('arjun_sharma'),  -- User 1
('priya_verma'),   -- User 2 (Has no photos)
('rahul_gupta'),   -- User 3
('aisha_khan'),    -- User 4 (Has no photos)
('rohit_mehta');    -- User 5

-- Insert photos for some users (others will have no photos)
INSERT INTO photos (image_url, user_id) VALUES 
('https://example.com/photo1.jpg', 1),  -- Arjun's photo
('https://example.com/photo2.jpg', 3);  -- Rahul's photo

--Generate who never posted a single photo
SELECT u.id, u.username
FROM users u
LEFT JOIN photos p ON u.id = p.user_id
WHERE p.id IS NULL;

--Generate the user with total likes
SELECT TOP 1 u.id, u.username, COUNT(*) AS total_likes
FROM users u
JOIN likes l ON u.id = l.user_id
GROUP BY u.id, u.username
ORDER BY total_likes DESC;


---Identify and suggest the top 5 hastags commmonly used.
SELECT TOP 5 
    t.tag_name, 
    COUNT(pt.tag_id) AS usage_count
FROM photo_tags pt
JOIN tags t ON pt.tag_id = t.id
GROUP BY t.tag_name
ORDER BY usage_count DESC;

---what day on the week most user register on.
SELECT 
    DATENAME(WEEKDAY, u.created_at) AS registration_day,
    COUNT(*) AS users_registered
FROM users u
GROUP BY DATENAME(WEEKDAY, u.created_at)
ORDER BY users_registered DESC;

---Average Number of Posts by a User
SELECT 
    (CAST(COUNT(p.id) AS FLOAT) / COUNT(DISTINCT u.id)) AS avg_posts_per_user
FROM users u
LEFT JOIN photos p ON u.id = p.user_id;

---Total Number of Photos to Total Number of Users
SELECT 
    (CAST(COUNT(p.id) AS FLOAT) / COUNT(DISTINCT u.id)) AS photos_per_user_ratio
FROM users u
LEFT JOIN photos p ON u.id = p.user_id;


---way to find bot account.
WITH TotalPhotos AS (
    SELECT COUNT(*) AS total_photos
    FROM photos
),
UserLikes AS (
    SELECT user_id, COUNT(*) AS likes_count
    FROM likes
    GROUP BY user_id
)
SELECT u.id, u.username
FROM users u
JOIN UserLikes ul ON u.id = ul.user_id
CROSS JOIN TotalPhotos tp
WHERE ul.likes_count = tp.total_photos;


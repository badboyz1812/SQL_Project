# SQL_Project
# Instagram Clone Database

This repository contains SQL scripts to set up and manage a database for an Instagram-like application. The database supports users, photos, comments, likes, follows, and tags, enabling various features like user engagement analysis, hashtag tracking, and bot detection.

---

## 📂 Table of Contents

1. [Database Schema](#database-schema)
2. [Setup Instructions](#setup-instructions)
3. [Features Implemented](#features-implemented)
4. [Sample Data](#sample-data)
5. [Queries](#queries)
6. [Usage Examples](#usage-examples)
7. [Future Improvements](#future-improvements)
8. [License](#license)

---

## 🗂 Database Schema

### Tables:
- **`users`**: Stores user details such as username and registration date.
- **`photos`**: Contains photo details including image URL and the user who posted it.
- **`comments`**: Records comments made by users on photos.
- **`likes`**: Tracks user likes on specific photos.
- **`follows`**: Maintains relationships between followers and followees.
- **`tags`**: Stores unique tags.
- **`photo_tags`**: Links photos to tags.

### Relationships:
- One-to-Many: Users ↔ Photos
- One-to-Many: Users ↔ Comments
- Many-to-Many: Photos ↔ Tags
- Many-to-Many: Users ↔ Users (via Follows)
- Many-to-Many: Users ↔ Photos (via Likes)

---

## 🚀 Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/instagram-clone-db.git
   cd instagram-clone-db
2.Set up the database:

Use an SQL database engine like SQL Server or PostgreSQL.
Execute the SQL script (ig_clone.sql) in your SQL environment.

3.Verify the database:

Ensure tables, relationships, and constraints are created successfully.

4.Insert sample data:

Run the INSERT statements included in the script to populate the database.


🌟 Features Implemented
User Registration: Tracks users and their activity.
Photo Posting: Allows users to upload photos.
Commenting: Supports comments on photos.
Likes: Records user likes on photos.
Follows: Implements follower-followee relationships.
Hashtagging: Associates tags with photos.
Insights:
Top hashtags.
Bot detection based on likes-to-post ratios.
Most active users.
📊 Sample Data
The database includes pre-populated sample data:

Users: 10 accounts.
Photos: 10 sample photos linked to users.
Comments: Sample comments by users on photos.
Likes: Users liking photos.
Follows: Follower-followee connections.
Tags: Example tags for photo categorization.

👨‍💻 Author
Pradeep

Full-Stack Developer
GitHub Profile
LinkedIn Profile
Feel free to fork this project

-- TABLE: admin
CREATE TABLE admin (
    id SERIAL PRIMARY KEY,
    username VARCHAR(80) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE admin IS 'Administrator accounts - can only be created programmatically';
COMMENT ON COLUMN admin.id IS 'Unique identifier for the admin account';
COMMENT ON COLUMN admin.username IS 'Admin username for login';
COMMENT ON COLUMN admin.password IS 'Admin password';
COMMENT ON COLUMN admin.created_at IS 'Timestamp when the admin account was created';


-- TABLE: user
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(80) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Extended Profile Fields (Added in V2)
    first_name VARCHAR(80),
    last_name VARCHAR(80),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(100),
    bio TEXT,
    profile_completed BOOLEAN DEFAULT FALSE,
    profile_completed_at TIMESTAMP
);

COMMENT ON TABLE "user" IS 'Registered user accounts with profile information';
COMMENT ON COLUMN "user".id IS 'Unique identifier for the user';
COMMENT ON COLUMN "user".username IS 'Username for login and display';
COMMENT ON COLUMN "user". email IS 'User email address';
COMMENT ON COLUMN "user".password IS 'User password';
COMMENT ON COLUMN "user".created_at IS 'Registration timestamp';
COMMENT ON COLUMN "user".first_name IS 'User first name';
COMMENT ON COLUMN "user".last_name IS 'User last name';
COMMENT ON COLUMN "user". phone_number IS 'Contact phone number';
COMMENT ON COLUMN "user".address IS 'Street address';
COMMENT ON COLUMN "user".city IS 'City of residence';
COMMENT ON COLUMN "user".bio IS 'User biography';
COMMENT ON COLUMN "user".profile_completed IS 'Whether user has completed their profile';
COMMENT ON COLUMN "user".profile_completed_at IS 'When profile was completed';


-- TABLE: listing
CREATE TABLE listing (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    listing_type VARCHAR(20) NOT NULL,
    location VARCHAR(120),
    tags VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER NOT NULL,
    
    CONSTRAINT fk_listing_user FOREIGN KEY (user_id) 
        REFERENCES "user"(id) ON DELETE CASCADE
);

COMMENT ON TABLE listing IS 'Listings for skills, services, items, and resources';
COMMENT ON COLUMN listing.id IS 'Unique identifier for the listing';
COMMENT ON COLUMN listing. title IS 'Title of the listing';
COMMENT ON COLUMN listing.category IS 'Category:  Skills & Services or Items & Resources';
COMMENT ON COLUMN listing. description IS 'Detailed description';
COMMENT ON COLUMN listing.listing_type IS 'Type:  Offering or Requesting';
COMMENT ON COLUMN listing.location IS 'Location of the listing';
COMMENT ON COLUMN listing.tags IS 'Comma-separated tags';
COMMENT ON COLUMN listing.created_at IS 'Creation timestamp';
COMMENT ON COLUMN listing. updated_at IS 'Last update timestamp';
COMMENT ON COLUMN listing.user_id IS 'Foreign key to the user who created the listing';


-- TABLE: feedback
CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    rating INTEGER NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reviewer_id INTEGER NOT NULL,
    listing_id INTEGER NOT NULL,
    
    CONSTRAINT fk_feedback_reviewer FOREIGN KEY (reviewer_id) 
        REFERENCES "user"(id) ON DELETE NO ACTION,
    CONSTRAINT fk_feedback_listing FOREIGN KEY (listing_id) 
        REFERENCES listing(id) ON DELETE CASCADE,
    CONSTRAINT chk_rating CHECK (rating >= 1 AND rating <= 5)
);

COMMENT ON TABLE feedback IS 'Ratings and reviews for listings';
COMMENT ON COLUMN feedback. id IS 'Unique identifier for the feedback';
COMMENT ON COLUMN feedback.rating IS 'Rating score (1-5)';
COMMENT ON COLUMN feedback.comment IS 'Review comment';
COMMENT ON COLUMN feedback.created_at IS 'Feedback submission timestamp';
COMMENT ON COLUMN feedback. reviewer_id IS 'Foreign key to the reviewer';
COMMENT ON COLUMN feedback. listing_id IS 'Foreign key to the listing';


-- TABLE: notification
CREATE TABLE notification (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    notification_type VARCHAR(50) NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    recipient_id INTEGER NOT NULL,
    sender_id INTEGER,
    listing_id INTEGER,
    
    CONSTRAINT fk_notification_recipient FOREIGN KEY (recipient_id) 
        REFERENCES "user"(id) ON DELETE NO ACTION,
    CONSTRAINT fk_notification_sender FOREIGN KEY (sender_id) 
        REFERENCES "user"(id) ON DELETE NO ACTION,
    CONSTRAINT fk_notification_listing FOREIGN KEY (listing_id) 
        REFERENCES listing(id) ON DELETE NO ACTION
);

COMMENT ON TABLE notification IS 'User notifications about listing activities';
COMMENT ON COLUMN notification.id IS 'Unique identifier for the notification';
COMMENT ON COLUMN notification.message IS 'Notification content';
COMMENT ON COLUMN notification.notification_type IS 'Type:  interest, feedback, message';
COMMENT ON COLUMN notification.is_read IS 'Whether notification has been read';
COMMENT ON COLUMN notification.created_at IS 'Notification creation timestamp';
COMMENT ON COLUMN notification. recipient_id IS 'Foreign key to the recipient user';
COMMENT ON COLUMN notification.sender_id IS 'Foreign key to the sender user (nullable)';
COMMENT ON COLUMN notification. listing_id IS 'Foreign key to the related listing (nullable)';


-- TABLE: interest 
CREATE TABLE interest (
    id SERIAL PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER NOT NULL,
    listing_id INTEGER NOT NULL,
    
    CONSTRAINT fk_interest_user FOREIGN KEY (user_id) 
        REFERENCES "user"(id) ON DELETE NO ACTION,
    CONSTRAINT fk_interest_listing FOREIGN KEY (listing_id) 
        REFERENCES listing(id) ON DELETE CASCADE
);

COMMENT ON TABLE interest IS 'Tracks user expressions of interest in listings';
COMMENT ON COLUMN interest.id IS 'Unique identifier for the interest record';
COMMENT ON COLUMN interest.message IS 'Optional message from interested user';
COMMENT ON COLUMN interest. created_at IS 'Interest expression timestamp';
COMMENT ON COLUMN interest. user_id IS 'Foreign key to the interested user';
COMMENT ON COLUMN interest. listing_id IS 'Foreign key to the target listing';


-- INDEXES
-- User indexes
CREATE INDEX idx_user_username ON "user"(username);
CREATE INDEX idx_user_email ON "user"(email);
CREATE INDEX idx_user_profile_completed ON "user"(profile_completed);

-- Listing indexes
CREATE INDEX idx_listing_user_id ON listing(user_id);
CREATE INDEX idx_listing_category ON listing(category);
CREATE INDEX idx_listing_type ON listing(listing_type);
CREATE INDEX idx_listing_created_at ON listing(created_at DESC);

-- Feedback indexes
CREATE INDEX idx_feedback_listing_id ON feedback(listing_id);
CREATE INDEX idx_feedback_reviewer_id ON feedback(reviewer_id);

-- Notification indexes (NEW in V2)
CREATE INDEX idx_notification_recipient ON notification(recipient_id);
CREATE INDEX idx_notification_is_read ON notification(is_read);
CREATE INDEX idx_notification_created_at ON notification(created_at DESC);

-- Interest indexes (NEW in V2)
CREATE INDEX idx_interest_user ON interest(user_id);
CREATE INDEX idx_interest_listing ON interest(listing_id);

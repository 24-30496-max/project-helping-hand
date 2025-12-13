from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from datetime import datetime
from functools import wraps

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your-secret-key-here'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# PostgreSQL Database Connection
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:andrei@localhost:5432/helping_hand_3'

db = SQLAlchemy(app)
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

# complete profile 

def profile_required(f):
    """Decorator to ensure user has completed their profile."""
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.is_authenticated and not current_user.is_admin:
            if not current_user.is_profile_complete:
                flash('Please complete your profile to continue.', 'error')
                return redirect(url_for('complete_profile'))
        return f(*args, **kwargs)
    return decorated_function


# models/

class Admin(UserMixin, db.Model):
    """Admins can only be created by programmers in the code."""
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def get_id(self):
        return f"admin_{self.id}"
    
    @property
    def is_admin(self):
        return True
    
    @property
    def is_profile_complete(self):
        return True


class User(UserMixin, db.Model):
    """Regular user accounts - created through the registration page."""
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    # Extended Profile Fields (Mandatory after first login)
    first_name = db.Column(db.String(80), nullable=True)
    last_name = db.Column(db.String(80), nullable=True)
    phone_number = db.Column(db.String(20), nullable=True)
    address = db.Column(db.String(200), nullable=True)
    city = db.Column(db.String(100), nullable=True)
    bio = db.Column(db.Text, nullable=True)
    profile_completed = db.Column(db.Boolean, default=False)
    profile_completed_at = db.Column(db.DateTime, nullable=True)
    
    # Relationships
    listings = db.relationship('Listing', backref='author', lazy=True)
    feedbacks_given = db.relationship('Feedback', backref='reviewer', lazy=True, foreign_keys='Feedback.reviewer_id')
    notifications = db.relationship('Notification', backref='recipient', lazy=True, foreign_keys='Notification.recipient_id')
    interests_sent = db.relationship('Interest', backref='interested_user', lazy=True, foreign_keys='Interest.user_id')
    
    def get_id(self):
        return f"user_{self.id}"
    
    @property
    def is_admin(self):
        return False
    
    @property
    def is_profile_complete(self):
        return self.profile_completed
    
    @property
    def full_name(self):
        if self.first_name and self.last_name:
            return f"{self.first_name} {self.last_name}"
        elif self.first_name:
            return self.first_name
        return self.username
    
    @property
    def location(self):
        if self.city and self.address:
            return f"{self.address}, {self.city}"
        elif self.city:
            return self.city
        elif self.address:
            return self.address
        return None
    
    @property
    def services_offered(self):
        return Listing.query.filter_by(
            user_id=self.id,
            category='Skills & Services',
            listing_type='Offering'
        ).all()
    
    @property
    def services_needed(self):
        return Listing.query.filter_by(
            user_id=self.id,
            category='Skills & Services',
            listing_type='Requesting'
        ).all()
    
    @property
    def items_offered(self):
        return Listing.query.filter_by(
            user_id=self.id,
            category='Items & Resources',
            listing_type='Offering'
        ).all()
    
    @property
    def items_needed(self):
        return Listing.query.filter_by(
            user_id=self.id,
            category='Items & Resources',
            listing_type='Requesting'
        ).all()
    
    @property
    def unread_notification_count(self):
        return Notification.query.filter_by(recipient_id=self.id, is_read=False).count()
    
    @property
    def average_rating(self):
        total_ratings = []
        for listing in self.listings:
            for feedback in listing.feedbacks:
                total_ratings.append(feedback.rating)
        if total_ratings:
            return round(sum(total_ratings) / len(total_ratings), 1)
        return None
    
    @property
    def total_feedbacks_received(self):
        count = 0
        for listing in self.listings:
            count += len(listing.feedbacks)
        return count


class Listing(db.Model):
    """Listings for skills, services, items, and resources."""
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    category = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text, nullable=False)
    listing_type = db.Column(db.String(20), nullable=False)
    location = db.Column(db.String(120))
    tags = db.Column(db.String(200))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    feedbacks = db.relationship('Feedback', backref='listing', lazy=True, cascade='all, delete-orphan')
    interests = db.relationship('Interest', backref='listing', lazy=True, cascade='all, delete-orphan')
    
    @property
    def average_rating(self):
        if self.feedbacks:
            ratings = [f.rating for f in self.feedbacks]
            return round(sum(ratings) / len(ratings), 1)
        return None
    
    @property
    def has_feedback(self):
        return len(self.feedbacks) > 0
    
    @property
    def can_edit(self):
        return not self.has_feedback
    
    @property
    def interest_count(self):
        return len(self.interests)


class Feedback(db.Model):
    """Feedback and ratings for listings."""
    id = db.Column(db.Integer, primary_key=True)
    rating = db.Column(db.Integer, nullable=False)
    comment = db.Column(db.Text, nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    reviewer_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    listing_id = db.Column(db.Integer, db.ForeignKey('listing.id'), nullable=False)


class Notification(db.Model):
    """Notifications for users about their listings."""
    id = db.Column(db.Integer, primary_key=True)
    message = db.Column(db.Text, nullable=False)
    notification_type = db.Column(db.String(50), nullable=False)
    is_read = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    recipient_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    sender_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=True)
    sender = db.relationship('User', foreign_keys=[sender_id])
    listing_id = db.Column(db.Integer, db.ForeignKey('listing.id'), nullable=True)
    related_listing = db.relationship('Listing')


class Interest(db.Model):
    """Track user interest in listings."""
    id = db.Column(db.Integer, primary_key=True)
    message = db.Column(db.Text, nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    listing_id = db.Column(db.Integer, db.ForeignKey('listing.id'), nullable=False)

# helper functions
def create_notification(recipient_id, sender_id, listing_id, notification_type, message):
    """Create a notification."""
    notification = Notification(
        recipient_id=recipient_id,
        sender_id=sender_id,
        listing_id=listing_id,
        notification_type=notification_type,
        message=message
    )
    db.session.add(notification)
    db.session.commit()
    return notification


# admin accounts
def create_admin_accounts():
    """Create admin accounts defined by the programmer."""
    ADMIN_ACCOUNTS = [
        {'username': 'admin', 'password': 'admin'},
        {'username': 'path', 'password':'helpinghand'}
    ]
    
    for admin_data in ADMIN_ACCOUNTS:
        existing_admin = Admin.query.filter_by(username=admin_data['username']).first()
        if not existing_admin:
            new_admin = Admin(
                username=admin_data['username'],
                password=admin_data['password']
            )
            db.session.add(new_admin)
            print(f"Admin account created: {admin_data['username']}")
        else:
            print(f"Admin account already exists: {admin_data['username']}")
    
    db.session.commit()


# login manager
@login_manager.user_loader
def load_user(user_id):
    """Load user or admin based on the ID prefix."""
    if user_id.startswith('admin_'):
        admin_id = int(user_id.split('_')[1])
        return Admin.query.get(admin_id)
    elif user_id.startswith('user_'):
        actual_user_id = int(user_id.split('_')[1])
        return User.query.get(actual_user_id)
    return None


# routes
@app.route('/')
def home():
    recent_listings = Listing.query.order_by(Listing.created_at.desc()).limit(6).all()
    return render_template('home.html', listings=recent_listings)


@app.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        
        if User.query.filter_by(username=username).first():
            flash('Username already exists! ', 'error')
            return redirect(url_for('register'))
        
        if Admin.query.filter_by(username=username).first():
            flash('This username is reserved!', 'error')
            return redirect(url_for('register'))
        
        if User.query.filter_by(email=email).first():
            flash('Email already registered!', 'error')
            return redirect(url_for('register'))
        
        new_user = User(username=username, email=email, password=password)
        db.session.add(new_user)
        db.session.commit()
        flash('Registration successful!  Please login.', 'success')
        return redirect(url_for('login'))
    return render_template('register.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        admin = Admin.query.filter_by(username=username).first()
        if admin and admin.password == password:
            login_user(admin)
            flash(f'Welcome back, Admin {admin.username}!', 'success')
            return redirect(url_for('admin_dashboard'))
        
        user = User.query.filter_by(username=username).first()
        if user and user.password == password:
            login_user(user)
            
            if not user.is_profile_complete:
                flash(f'Welcome, {user.username}!  Please complete your profile to continue.', 'success')
                return redirect(url_for('complete_profile'))
            
            flash(f'Welcome back, {user.full_name}!', 'success')
            return redirect(url_for('home'))
        
        flash('Invalid username or password. ', 'error')
    return render_template('login.html')


@app.route('/complete-profile', methods=['GET', 'POST'])
@login_required
def complete_profile():
    if current_user.is_admin:
        return redirect(url_for('admin_dashboard'))
    
    if current_user.is_profile_complete:
        return redirect(url_for('home'))
    
    if request.method == 'POST':
        current_user.first_name = request.form['first_name'].strip()
        current_user.last_name = request.form['last_name'].strip()
        current_user.phone_number = request.form['phone_number'].strip()
        current_user.address = request.form.get('address', '').strip()
        current_user.city = request.form['city'].strip()
        current_user.bio = request.form.get('bio', '').strip()
        current_user.profile_completed = True
        current_user.profile_completed_at = datetime.utcnow()
        
        db.session.commit()
        flash('Profile completed successfully!  Welcome to The Helping Hand! ', 'success')
        return redirect(url_for('home'))
    
    return render_template('complete_profile.html')


@app.route('/edit-profile', methods=['GET', 'POST'])
@login_required
@profile_required
def edit_profile():
    if current_user.is_admin:
        return redirect(url_for('admin_dashboard'))
    
    if request.method == 'POST':
        current_user.first_name = request.form['first_name'].strip()
        current_user.last_name = request.form['last_name'].strip()
        current_user.phone_number = request.form['phone_number'].strip()
        current_user.address = request.form.get('address', '').strip()
        current_user.city = request.form['city'].strip()
        current_user.bio = request.form.get('bio', '').strip()
        
        new_email = request.form['email'].strip()
        if new_email != current_user.email:
            if User.query.filter_by(email=new_email).first():
                flash('This email is already in use.', 'error')
                return redirect(url_for('edit_profile'))
            current_user.email = new_email
        
        db.session.commit()
        flash('Profile updated successfully! ', 'success')
        return redirect(url_for('user_profile', id=current_user.id))
    
    return render_template('edit_profile.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('You have been logged out.', 'success')
    return redirect(url_for('home'))


@app.route('/listings')
@profile_required
def listings():
    category = request.args.get('category')
    listing_type = request.args.get('type')
    search = request.args.get('search')
    
    query = Listing.query
    
    if category:
        query = query.filter_by(category=category)
    if listing_type:
        query = query.filter_by(listing_type=listing_type)
    if search:
        query = query.filter(Listing.title.contains(search) | Listing.description.contains(search))
    
    all_listings = query.order_by(Listing.created_at.desc()).all()
    return render_template('listings.html', listings=all_listings)


@app.route('/listing/<int:id>')
@profile_required
def listing_detail(id):
    listing = Listing.query.get_or_404(id)
    
    user_has_reviewed = False
    user_has_shown_interest = False
    
    if current_user.is_authenticated and not current_user.is_admin:
        existing_feedback = Feedback.query.filter_by(
            listing_id=listing.id,
            reviewer_id=current_user.id
        ).first()
        user_has_reviewed = existing_feedback is not None
        
        existing_interest = Interest.query.filter_by(
            listing_id=listing.id,
            user_id=current_user.id
        ).first()
        user_has_shown_interest = existing_interest is not None
    
    return render_template(
        'listing_detail.html',
        listing=listing,
        user_has_reviewed=user_has_reviewed,
        user_has_shown_interest=user_has_shown_interest
    )


@app.route('/create_listing', methods=['GET', 'POST'])
@login_required
@profile_required
def create_listing():
    if current_user.is_admin:
        flash('Admins cannot create listings.  Please use a regular account.', 'error')
        return redirect(url_for('listings'))
    
    if request.method == 'POST':
        new_listing = Listing(
            title=request.form['title'],
            category=request.form['category'],
            description=request.form['description'],
            listing_type=request.form['listing_type'],
            location=request.form.get('location', ''),
            tags=request.form.get('tags', ''),
            user_id=current_user.id
        )
        db.session.add(new_listing)
        db.session.commit()
        flash('Listing created successfully!  It will now appear on your profile.', 'success')
        return redirect(url_for('listings'))
    return render_template('create_listing.html')


@app.route('/edit_listing/<int:id>', methods=['GET', 'POST'])
@login_required
@profile_required
def edit_listing(id):
    listing = Listing.query.get_or_404(id)
    
    if current_user.is_admin or listing.user_id != current_user.id:
        flash('You cannot edit this listing.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    if listing.has_feedback:
        flash('This listing cannot be edited because it has received feedback.  You can only delete it.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    if request.method == 'POST':
        listing.title = request.form['title']
        listing.category = request.form['category']
        listing.description = request.form['description']
        listing.listing_type = request.form['listing_type']
        listing.location = request.form.get('location', '')
        listing.tags = request.form.get('tags', '')
        listing.updated_at = datetime.utcnow()
        
        db.session.commit()
        flash('Listing updated successfully!', 'success')
        return redirect(url_for('listing_detail', id=id))
    
    return render_template('edit_listing.html', listing=listing)


@app.route('/delete_listing/<int:id>')
@login_required
@profile_required
def delete_listing(id):
    listing = Listing.query.get_or_404(id)
    
    if not current_user.is_admin and listing.user_id != current_user.id:
        flash('You cannot delete this listing.', 'error')
        return redirect(url_for('listings'))
    
    Notification.query.filter_by(listing_id=listing.id).delete()
    
    db.session.delete(listing)
    db.session.commit()
    flash('Listing deleted successfully.', 'success')
    return redirect(url_for('listings'))


@app.route('/my_listings')
@login_required
@profile_required
def my_listings():
    if current_user.is_admin:
        flash('Admins do not have listings.', 'error')
        return redirect(url_for('admin_dashboard'))
    
    user_listings = Listing.query.filter_by(user_id=current_user.id).order_by(Listing.created_at.desc()).all()
    return render_template('my_listings.html', listings=user_listings)


# interest routes

@app.route('/listing/<int:id>/interest', methods=['POST'])
@login_required
@profile_required
def show_interest(id):
    if current_user.is_admin:
        flash('Admins cannot show interest in listings.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    listing = Listing.query.get_or_404(id)
    
    if listing.user_id == current_user.id:
        flash('You cannot show interest in your own listing.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    existing_interest = Interest.query.filter_by(
        listing_id=listing.id,
        user_id=current_user.id
    ).first()
    
    if existing_interest:
        flash('You have already shown interest in this listing.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    message = request.form.get('message', '').strip()
    
    new_interest = Interest(
        user_id=current_user.id,
        listing_id=listing.id,
        message=message if message else None
    )
    db.session.add(new_interest)
    
    notification_message = f"🔔 {current_user.full_name} (@{current_user.username}) is interested in your listing: \"{listing.title}\""
    if message:
        notification_message += f"\n\nMessage: \"{message}\""
    notification_message += f"\n\n📧 Contact: {current_user.email}"
    if current_user.phone_number:
        notification_message += f"\n📱 Phone: {current_user.phone_number}"
    
    create_notification(
        recipient_id=listing.user_id,
        sender_id=current_user.id,
        listing_id=listing.id,
        notification_type='interest',
        message=notification_message
    )
    
    db.session.commit()
    flash('Your interest has been sent to the listing owner!', 'success')
    return redirect(url_for('listing_detail', id=id))


@app.route('/listing/<int:id>/interests')
@login_required
@profile_required
def view_interests(id):
    listing = Listing.query.get_or_404(id)
    
    if not current_user.is_admin and listing.user_id != current_user.id:
        flash('You cannot view interests for this listing.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    interests = Interest.query.filter_by(listing_id=listing.id).order_by(Interest.created_at.desc()).all()
    return render_template('view_interests.html', listing=listing, interests=interests)


# notification routes

@app.route('/notifications')
@login_required
@profile_required
def notifications():
    if current_user.is_admin:
        flash('Admins do not have notifications.', 'error')
        return redirect(url_for('admin_dashboard'))
    
    user_notifications = Notification.query.filter_by(
        recipient_id=current_user.id
    ).order_by(Notification.created_at.desc()).all()
    
    return render_template('notifications.html', notifications=user_notifications)


@app.route('/notifications/read/<int:id>')
@login_required
@profile_required
def mark_notification_read(id):
    notification = Notification.query.get_or_404(id)
    
    if notification.recipient_id != current_user.id:
        flash('Access denied.', 'error')
        return redirect(url_for('notifications'))
    
    notification.is_read = True
    db.session.commit()
    
    if notification.listing_id:
        return redirect(url_for('listing_detail', id=notification.listing_id))
    
    return redirect(url_for('notifications'))


@app.route('/notifications/read_all')
@login_required
@profile_required
def mark_all_notifications_read():
    if current_user.is_admin:
        return redirect(url_for('admin_dashboard'))
    
    Notification.query.filter_by(recipient_id=current_user.id, is_read=False).update({'is_read': True})
    db.session.commit()
    flash('All notifications marked as read.', 'success')
    return redirect(url_for('notifications'))


@app.route('/notifications/delete/<int:id>')
@login_required
@profile_required
def delete_notification(id):
    notification = Notification.query.get_or_404(id)
    
    if notification.recipient_id != current_user.id and not current_user.is_admin:
        flash('Access denied.', 'error')
        return redirect(url_for('notifications'))
    
    db.session.delete(notification)
    db.session.commit()
    flash('Notification deleted.', 'success')
    return redirect(url_for('notifications'))


@app.route('/notifications/clear_all')
@login_required
@profile_required
def clear_all_notifications():
    if current_user.is_admin:
        return redirect(url_for('admin_dashboard'))
    
    Notification.query.filter_by(recipient_id=current_user.id).delete()
    db.session.commit()
    flash('All notifications cleared.', 'success')
    return redirect(url_for('notifications'))


# feedback routes

@app.route('/listing/<int:id>/feedback', methods=['POST'])
@login_required
@profile_required
def add_feedback(id):
    if current_user.is_admin:
        flash('Admins cannot submit feedback.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    listing = Listing.query.get_or_404(id)
    
    if listing.user_id == current_user.id:
        flash('You cannot review your own listing.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    existing_feedback = Feedback.query.filter_by(
        listing_id=listing.id,
        reviewer_id=current_user.id
    ).first()
    
    if existing_feedback:
        flash('You have already submitted feedback for this listing.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    rating = int(request.form['rating'])
    comment = request.form.get('comment', '').strip()
    
    if rating < 1 or rating > 5:
        flash('Invalid rating.  Please select between 1 and 5 stars.', 'error')
        return redirect(url_for('listing_detail', id=id))
    
    new_feedback = Feedback(
        rating=rating,
        comment=comment if comment else None,
        reviewer_id=current_user.id,
        listing_id=listing.id
    )
    db.session.add(new_feedback)
    
    stars = '⭐' * rating
    notification_message = f"📝 {current_user.full_name} (@{current_user.username}) left a {rating}-star review on your listing: \"{listing.title}\"\n\nRating: {stars}"
    if comment:
        notification_message += f"\nComment: \"{comment}\""
    
    create_notification(
        recipient_id=listing.user_id,
        sender_id=current_user.id,
        listing_id=listing.id,
        notification_type='feedback',
        message=notification_message
    )
    
    db.session.commit()
    flash('Thank you for your feedback! ', 'success')
    return redirect(url_for('listing_detail', id=id))


@app.route('/feedback/<int:id>/delete')
@login_required
@profile_required
def delete_feedback(id):
    feedback = Feedback.query.get_or_404(id)
    listing_id = feedback.listing_id
    
    if not current_user.is_admin and feedback.reviewer_id != current_user.id:
        flash('You cannot delete this feedback.', 'error')
        return redirect(url_for('listing_detail', id=listing_id))
    
    db.session.delete(feedback)
    db.session.commit()
    flash('Feedback deleted successfully.', 'success')
    return redirect(url_for('listing_detail', id=listing_id))


# user profile route

@app.route('/profile/<int:id>')
@profile_required
def user_profile(id):
    user = User.query.get_or_404(id)
    return render_template('user_profile.html', user=user)


# admin routes

@app.route('/admin')
@login_required
def admin_dashboard():
    if not current_user.is_admin:
        flash('Access denied. Admin only.', 'error')
        return redirect(url_for('home'))
    
    users = User.query.all()
    all_listings = Listing.query.all()
    admins = Admin.query.all()
    all_feedbacks = Feedback.query.order_by(Feedback.created_at.desc()).all()
    all_interests = Interest.query.order_by(Interest.created_at.desc()).limit(50).all()
    all_notifications = Notification.query.order_by(Notification.created_at.desc()).limit(50).all()
    incomplete_profiles = User.query.filter_by(profile_completed=False).count()
    
    return render_template(
        'admin.html',
        users=users,
        listings=all_listings,
        admins=admins,
        feedbacks=all_feedbacks,
        interests=all_interests,
        notifications=all_notifications,
        incomplete_profiles=incomplete_profiles
    )


@app.route('/admin/delete_user/<int:id>')
@login_required
def delete_user(id):
    if not current_user.is_admin:
        flash('Access denied.', 'error')
        return redirect(url_for('home'))
    
    user = User.query.get_or_404(id)
    
    Notification.query.filter_by(recipient_id=user.id).delete()
    Notification.query.filter_by(sender_id=user.id).delete()
    Interest.query.filter_by(user_id=user.id).delete()
    Feedback.query.filter_by(reviewer_id=user.id).delete()
    Listing.query.filter_by(user_id=user.id).delete()
    
    db.session.delete(user)
    db.session.commit()
    flash(f'User {user.username} has been deleted.', 'success')
    return redirect(url_for('admin_dashboard'))

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        create_admin_accounts()
    app.run(debug=True)
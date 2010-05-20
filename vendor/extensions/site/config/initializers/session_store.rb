# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ppe_session',
  :secret      => '43fc2e4a504407918e4e2349e4c6c4b2b11a1aa1c8b343e1692f31c52a6c882fd9b808e4b5cdcb6e0c296ba9b71ea9295eedcf3097443ddd138110f7c0e1cb48'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
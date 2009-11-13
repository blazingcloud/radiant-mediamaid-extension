# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_upload6_session',
  :secret      => '84b71b1aedc9d24917d26ce539ef02819f6e4ecc099babe2080d49c019931e3d162eb2d3df7164c2ac09f5b5eda9b6ff3be6676900295ec0ea637d1208b695cb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

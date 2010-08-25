# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_toonmax_session',
  :secret      => '96f5cecfb03a0cb966a58d03064f568ea99be36978a1ee31dec184ae01d4d88e0fcbc09b72a8ef88888f80f1e8880d30a10274031ceeeee0f406c522864708f4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

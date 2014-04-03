# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  config.site_name = "Spree Demo Hub included"
end

Spree.user_class = "Spree::User"

Spree::Hub::Config[:hub_store_id] = "5322d47ee3a17ea66e000001"
Spree::Hub::Config[:hub_token] = "d637b36cb45386d998e6d72064b332015fe7aed4af957efd"
Spree::Hub::Config[:enable_hub] = true

Spree::Order.after_commit -> { Spree::Hub::OrderSerializer.push_it self }

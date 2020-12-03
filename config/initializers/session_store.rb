Rails.application.config.session_store(
    :cookie_store,
    # DOTENV MAKE SECURE
    :key => ENV["SESSION_SECRET"],
    :expire_after => 100.minutes,
)
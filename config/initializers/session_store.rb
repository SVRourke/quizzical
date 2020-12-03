Rails.application.config.session_store(
    :cookie_store,
    # DOTENV MAKE SECURE
    :key => '_foo_session',
    :expire_after => 100.minutes,
)
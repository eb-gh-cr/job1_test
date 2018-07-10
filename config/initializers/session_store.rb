# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :redis_session_store, {
  key: '_job1_test_session',
  redis: {
    expire_after: 5.minutes,
    key_prefix: 'job1_test:session:',
    url: 'redis://localhost:6379/0',
  }
}

Geocoder.configure(
  lookup: :google,
  always_raise: [
    Geocoder::OverQueryLimitError,
    Geocoder::RequestDenied,
    Geocoder::InvalidRequest,
    Geocoder::InvalidApiKey
  ],
  api_key:  ENV['DB_MAP'] ,
  use_https: true
)
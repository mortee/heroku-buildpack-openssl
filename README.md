# heroku-buildpack-openssl
Buildpack for OpenSSL (default: 1.1.0g) on Heroku

To use specific version declare ``OPENSSL_VERSION`` environment variable.

This downloads, builds and installs OpenSSL, installing at
/app/.heroku/vendor/

This buildpack should be added *before* any Python install

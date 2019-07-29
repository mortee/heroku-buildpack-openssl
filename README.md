# heroku-buildpack-openssl
Buildpack for OpenSSL (default: 1.1.0g) on Heroku

This downloads, builds and installs OpenSSL, installing at
/app/.heroku/vendor/

This buildpack should be added *before* any Python install

To use specific version declare ``OPENSSL_VERSION`` environment variable.

## Tests

    git clone https://github.com/kward/shunit2
    cd shunit2
    git checkout source
    export SHUNIT_HOME="`pwd`/2.1.6"
    cd ..
    
    git clone https://github.com/heroku/heroku-buildpack-testrunner
    
    ./heroku-buildpack-testrunner/bin/run .

# heroku-buildpack-openssl
Buildpack for OpenSSL (default: 1.1.1m) on Heroku

This version fixes the environment variables in .profile.d/openssl.sh where the long-gone build directories were provided to the running app.

This downloads, builds and installs OpenSSL, installing at
/app/openssl/

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

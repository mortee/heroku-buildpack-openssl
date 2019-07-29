#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testNoCompileSameVersion()
{
  export OPENSSL_VERSION="`openssl version | sed 's/OpenSSL \([^ ]\+\) .\+/\1/'`"

  capture ${BUILDPACK_HOME}/bin/compile "${BUILD_DIR}" "${CACHE_DIR}" "${ENV_DIR}"

  assertEquals 0 ${RETURN}
  assertEquals "" "`cat ${STD_ERR}`"
  assertContains "OpenSSL: requested = ${OPENSSL_VERSION}, found = ${OPENSSL_VERSION}. Exiting..."  "`cat ${STD_OUT}`"
}

testCompilePrevVersion()
{
  ver_line="`openssl version | sed 's/OpenSSL \([0-9]\+\.[0-9]\+\.[0-9]\+\).\+/\1/'`"
  export OPENSSL_VERSION="`curl -s -L https://www.openssl.org/source/old/${ver_line}/ | sed -n \"s/.\+openssl-\(${ver_line}[^.].\+\?\)\.tar\.gz.\+/\1/p\" | tail -n 1`"
  export APP_TARGET_DIR_PREFIX="${BUILD_DIR}"

  capture ${BUILDPACK_HOME}/bin/compile "${BUILD_DIR}" "${CACHE_DIR}" "${ENV_DIR}"

  assertEquals 0 ${RETURN}
  assertContains "Install of OpenSSL ${OPENSSL_VERSION} complete"  "`cat ${STD_OUT}`"
}

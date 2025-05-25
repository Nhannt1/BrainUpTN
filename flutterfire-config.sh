#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=brain-u \
      --out=lib/firebase/firebase_options_dev.dart \
      --ios-bundle-id=com.tmi.brainup.dev \
      --ios-out=ios/flavors/develop/GoogleService-Info.plist \
      --android-package-name=com.tmi.brainup.dev \
      --android-out=android/app/src/develop/google-services.json
    ;;
  stg)
    flutterfire config \
      --project=brain-u \
      --out=lib/firebase/firebase_options_stg.dart \
      --ios-bundle-id=com.tmi.brainup.stg \
      --ios-out=ios/flavors/staging/GoogleService-Info.plist \
      --android-package-name=com.tmi.brainup.stg \
      --android-out=android/app/src/staging/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=brain-u \
      --out=lib/firebase/firebase_options_prod.dart \
      --ios-bundle-id=com.tmi.brainup \
      --ios-out=ios/flavors/production/GoogleService-Info.plist \
      --android-package-name=com.tmi.brainup \
      --android-out=android/app/src/production/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac
# Makefile for Flutter automation

.PHONY: all get build_runner gen clean run ios android fastlane_dev fastlane_stg fastlane_prod clear_config_ios

# Run flutter pub get
get:
	flutter pub get

# Run code generation
code_gen:
	dart run build_runner build --delete-conflicting-outputs

# Run pub get + code generation
build_runner: get code_gen

# Clean the build
clean:
	flutter clean
	flutter pub get

# iOS clear pod
clear_config_ios:
	flutter clean
	flutter pub get
	cd ios && rm -rf Podfile.lock && pod install

# All in one: clean, pub get, code gen
all: clean build_runner

# Fastlane: Build + Distribute dev APK
fastlane_deploy_firebase_android_dev:
	cd android && fastlane android release_to_firebase flavor:develop

# Fastlane: Build _ Distribute dev IAP
fastlane_deploy_firebase_ios_dev:
	cd ios && fastlane ios deploy_firebase flavor:develop
generate:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs

cleanProject:
	flutter clean
	cd ios && pod deintegrate
	cd ios && rm -f Podfile.lock

resetProject:
	flutter clean
	cd ios && pod deintegrate
	cd ios && rm -f Podfile.lock
	flutter pub get
	flutter pub upgrade
	cd ios && pod install --repo-update
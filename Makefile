generate:
	dart run build_runner build --delete-conflicting-outputs
	dart run intl_utils:generate

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

intlGenerate:
	dart run intl_utils:generate
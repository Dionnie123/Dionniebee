

APP_TITLE = Dionnie
APP_ID = dionniestudios.dionniebee

.PHONY: devweb

clean:
	flutter clean 
	flutter pub get 
	flutter pub run build_runner build --delete-conflicting-outputs 
	flutter pub run flutter_launcher_icons
	flutter pub run flutter_native_splash:create

dev:
	flutter run -d chrome --web-port 8000 --web-renderer html

dist:
	flutter build web --release

rename:
	flutter pub global run rename  setAppName --value $(APP_TITLE)
	flutter pub global run rename setBundleId --value com.$(APP_ID)
	@echo "Updated App Title & BundleId"
	flutter pub global run rename getAppName
	flutter pub global run rename getBundleId




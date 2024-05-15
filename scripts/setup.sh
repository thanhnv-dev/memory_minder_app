ROOT_DIR=$(pwd)

function log() {
    local message="$1"
    echo "\x1B[0;32m$message\x1B[0m"
}

log "I18N module"
cd lib/modules/i18n; 
fvm use 3.19.5
fvm flutter pub get; 
fvm flutter pub run easy_localization:generate -S 'lib/langs' -O 'lib/generated' -o 'locale_keys.dart' -f keys;
fvm flutter pub run easy_localization:generate -S 'lib/langs' -O 'lib/generated';
cd "$ROOT_DIR"

log "Local Storage module"
cd lib/modules/local_storage;
fvm use 3.19.5
fvm flutter pub get;
cd "$ROOT_DIR"


log "Main module"
fvm use 3.19.5
fvm flutter pub get;
cd "$ROOT_DIR"

log "Models module"
cd lib/modules/models;
fvm use 3.19.5
fvm flutter pub get;
fvm flutter packages pub run build_runner build --delete-conflicting-outputs;
cd "$ROOT_DIR"


log "Network module"
cd lib/modules/network;
fvm flutter pub get;
cd "$ROOT_DIR"
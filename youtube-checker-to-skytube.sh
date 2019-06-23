#!/usr/bin/env bash

subs=$(readlink -f "$1")
skytube=$(readlink -f "$2")

if [[ ! -f "$subs" || ! -f "$skytube" ]]
then
    echo 'Usage: youtube-checker-to-skytube subs.json skytube.skytube'
    echo 'All the subscriptions in the database file will be replaced with subscriptions from the YouTube Checker.'
    echo 'After running this script, reimport the modified database to replace your subscriptions.'
    echo 'Steps to export YouTube Checker subscriptions:'
    echo '1. Click on Settings'
    echo '2. Go to Import/Export'
    echo '3. Click the Export button'
    echo '4. Copy all of the output into a file (e.g. subs.json)'
    echo 'Steps to export SkyTube subscriptions:'
    echo '1. Go to settings'
    echo '2. Click on Import/Export'
    echo '3. Select Export database (e.g. skytube.skytube).'
    echo 'Steps to reimport SkyTube subscriptions:'
    echo '1. Go to settings'
    echo '2. Click on Import/Export'
    echo '3. Select Import database and select the updated database.'
    exit 1
fi

tmpdir=$(mktemp -d)
pushd "$tmpdir"
jq ".channels | .[].id" < "$subs" > channel-ids.txt
sed -i 's/"//g' channel-ids.txt
awk '{print NR","$0",1552177649746"}' channel-ids.txt > channel-ids.csv
cp "$skytube" skytube.zip
unzip skytube.zip
sqlite3 subs.db '.mode csv' 'delete from Subs;' '.import channel-ids.csv Subs'
zip -qf skytube.zip subs.db
cp skytube.zip "$skytube"
popd
rm -r "$tmpdir"

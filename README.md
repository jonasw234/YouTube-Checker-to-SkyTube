# YouTube-Checker-to-SkyTube
Replaces subscriptions from [SkyTube](https://skytube-app.com/) with those exported by [YouTube Checker](https://github.com/XrXr/YoutubeSubscriptionChecker)

Basically I don’t really care to use an account for watching YouTube, so I use [YouTube Checker](https://github.com/XrXr/YoutubeSubscriptionChecker) as a Firefox addon on my desktop and [SkyTube](https://skytube-app.com/) on my Android.  To synchronize my “subscriptions” between them, I created this little script.

*Warning:* This is a one way synchronization from YouTube Checker to SkyTube.  The current version doesn’t try to merge subscriptions and you cannot synchronize from SkyTube to YouTube Checker.  Maybe I will add this in the future, but right now this is simply not my use case.

## Usage
`./youtube-checker-to-skytube.sh subs.json skytube.skytube`

All the subscriptions in the database file will be replaced with subscriptions from the YouTube Checker.  
After running this script, reimport the modified database to replace your subscriptions.  

### Steps to export YouTube Checker subscriptions
1. Click on Settings  
2. Go to Import/Export  
3. Click the Export button  
4. Copy all of the output into a file (e.g. subs.json)

### Steps to export SkyTube subscriptions
1. Go to settings  
2. Click on Import/Export  
3. Select Export database (e.g. skytube.skytube).

### Steps to reimport SkyTube subscriptions
1. Go to settings  
2. Click on Import/Export  
3. Select Import database and select the updated database.

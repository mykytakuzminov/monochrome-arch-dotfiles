/*********************************************************
 * 01. UI / Minimalism
 *********************************************************/

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

user_pref("browser.toolbars.bookmarks.visibility", "never");

user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.smartshortcutsfeed", false);
user_pref("browser.newtabpage.activity-stream.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

user_pref("browser.firefox-view.virtual-list.enabled", false);
user_pref("browser.newtabpage.disableNewTabAsAddon", true);

user_pref("browser.startup.page", 0);
user_pref("browser.startup.homepage", "about:blank");

/*********************************************************
 * 02. URL Bar / Suggestions
 *********************************************************/

user_pref("browser.urlbar.showSearchSuggestionsFirst", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.search.suggest.enabled", false);

/*********************************************************
 * 03. Downloads
 *********************************************************/

user_pref("browser.download.folderList", 2);
user_pref("browser.download.dir", "/home/mykytakuzminov/downloads");
user_pref("browser.download.useDownloadDir", true);
user_pref("browser.download.alwaysOpenPanel", false);

/*********************************************************
 * 04. Theme
 *********************************************************/

user_pref("ui.systemUsesDarkTheme", 1);
user_pref("layout.css.prefers-color-scheme.content-override", 0);
user_pref("browser.theme.content-theme", 2);
user_pref("browser.theme.toolbar-theme", 2);

/*********************************************************
 * 05. Privacy / Telemetry
 *********************************************************/

user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("browser.ping-centre.telemetry", false);

user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.shield.optoutstudies.enabled", false);

user_pref("browser.discovery.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoveryfeed", false);

/*********************************************************
 * 06. Tracking Protection
 *********************************************************/

user_pref("browser.contentblocking.category", "strict");
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);

user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("network.http.speculative-parallel-limit", 0);

/*********************************************************
 * 07. Fingerprinting
 *********************************************************/

// user_pref("privacy.resistFingerprinting", true);
// user_pref("privacy.firstparty.isolate", true);

/*********************************************************
 * 08. Shutdown cleanup
 *********************************************************/

user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.history", false);


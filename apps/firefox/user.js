/******************************************************************************
 * TELEMETRY — MASTER SWITCHES
 ******************************************************************************/

user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);

/******************************************************************************
 * DATA REPORTING
 ******************************************************************************/

user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.sessions.current.clean", true);

/******************************************************************************
 * TELEMETRY PINGS
 ******************************************************************************/

user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);

/******************************************************************************
 * COVERAGE / EXPERIMENTAL REPORTING
 ******************************************************************************/

user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");

/******************************************************************************
 * CRASH REPORTING (Breakpad)
 ******************************************************************************/

user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

/******************************************************************************
 * NORMANDY / STUDIES / SHIELD
 ******************************************************************************/

user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.shield.optoutstudies.enabled", false);

/******************************************************************************
 * ACTIVITY STREAM / NEW TAB TELEMETRY
 ******************************************************************************/

user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");

/******************************************************************************
 * DISCOVERY / RECOMMENDATIONS
 ******************************************************************************/

user_pref("browser.discovery.enabled", false);

/******************************************************************************
 * FEEDBACK / USER STUDIES
 ******************************************************************************/

user_pref("browser.selfsupport.url", "");

/******************************************************************************
 * OPTIONAL: FIREFOX SYNC
 ******************************************************************************/

user_pref("identity.fxaccounts.enabled", false);

/******************************************************************************
 * CUSTOMIZATION
 ******************************************************************************/

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);


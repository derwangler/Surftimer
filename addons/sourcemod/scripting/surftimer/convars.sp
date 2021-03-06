/*----------  CVars  ----------*/
// Zones
bool g_bZoner[MAXPLAYERS + 1];
int g_ZonerFlag;
ConVar g_hZonerFlag = null;
ConVar g_hZoneDisplayType = null;								// How zones are displayed (lower edge, full)
ConVar g_hZonesToDisplay = null;								// Which zones are displayed
ConVar g_hShowOutlines = null;									// Show outlines
// Zone Colors
int g_iZoneColors[MAX_ZONETYPES+2][4];								// ZONE COLOR TYPES: Stop(0), Start(1), End(2), BonusStart(3), BonusEnd(4), Stage(5),
char g_szZoneColors[MAX_ZONETYPES+2][24];							// Checkpoint(6), Speed(7), TeleToStart(8), Validator(9), Chekcer(10)
ConVar g_hzoneStartColor = null;
ConVar g_hzoneEndColor = null;
ConVar g_hzoneBonusStartColor = null;
ConVar g_hzoneBonusEndColor = null;
ConVar g_hzoneStageColor = null;
ConVar g_hzoneCheckpointColor = null;
ConVar g_hzoneSpeedColor = null;
ConVar g_hzoneTeleToStartColor = null;
ConVar g_hzoneValidatorColor = null;
ConVar g_hzoneCheckerColor = null;
ConVar g_hzoneStopColor = null;
ConVar g_hAnnounceRecord;										// Announce rank type: 0 announce all, 1 announce only PB's, 3 announce only SR's
ConVar g_hCommandToEnd;											// !end Enable / Disable
ConVar g_hWelcomeMsg = null;
ConVar g_hReplayBotPlayerModel = null;
ConVar g_hReplayBotArmModel = null;								// Replay bot arm model
ConVar g_hPlayerModel = null;									// Player models
ConVar g_hArmModel = null;										// Player arm models
ConVar g_hcvarRestore = null;									// Restore player's runs?
ConVar g_hNoClipS = null;										// Allow noclip?
ConVar g_hAllowTP = null;										// Zephyrus' third person plugin
ConVar g_hReplayBot = null;										// Replay bot?
ConVar g_hWrcpBot = null;
ConVar g_hBackupReplays = null;									// Back up replay bots?
ConVar g_hReplaceReplayTime = null;								// Replace replay times, even if not SR
ConVar g_hTeleToStartWhenSettingsLoaded = null;
bool g_bMapReplay[MAX_STYLES];									// Why two bools?
ConVar g_hBonusBot = null;										// Bonus bot?
bool g_bMapBonusReplay[MAX_ZONEGROUPS][MAX_STYLES];
ConVar g_hPauseServerside = null;								// Allow !pause?
ConVar g_hAutoBhopConVar = null;								// Allow autobhop?
bool g_bAutoBhop;
ConVar g_hDynamicTimelimit = null;								// Dynamic timelimit?
ConVar g_hConnectMsg = null;									// Connect message?
ConVar g_hDisconnectMsg = null;									// Disconnect message?
ConVar g_hRadioCommands = null;									// Allow radio commands?
ConVar g_hInfoBot = null;										// Info bot?
ConVar g_hAttackSpamProtection = null;							// Throttle shooting?
int g_AttackCounter[MAXPLAYERS + 1];							// Used to calculate player shots
ConVar g_hGoToServer = null;									// Allow !goto?
ConVar g_hAllowRoundEndCvar = null;								// Allow round ending?
bool g_bRoundEnd;												// Why two bools?
ConVar g_hPlayerSkinChange = null;								// Allow changing player models?
ConVar g_hCountry = null;										// Display countries for players?
ConVar g_hAutoRespawn = null;									// Respawn players automatically?
ConVar g_hCvarNoBlock = null;									// Allow player blocking?
ConVar g_hPointSystem = null;									// Use the point system?
ConVar g_hCleanWeapons = null;									// Clean weapons from ground?
int g_ownerOffset;												// Used to clear weapons from ground
ConVar g_hCvarGodMode = null;									// Enable god mode?
// ConVar g_hAutoTimer = null;
ConVar g_hMapEnd = null;										// Allow map ending?
ConVar g_hAutohealing_Hp = null;								// Automatically heal lost HP?
// Bot Colors & effects:
ConVar g_hReplayBotColor = null;								// Replay bot color
int g_ReplayBotColor[3];
ConVar g_hBonusBotColor = null;									// Bonus bot color
int g_BonusBotColor[3];
ConVar g_hDoubleRestartCommand;									// Double !r restart
// ConVar g_hStartPreSpeed = null;								// Start zone speed cap
// ConVar g_hSpeedPreSpeed = null;								// Speed Start zone speed cap
// ConVar g_hBonusPreSpeed = null;								// Bonus zone speed cap
ConVar g_hSoundEnabled = null;									// Enable timer start sound
ConVar g_hSoundPath = null;										// Define start sound
// char sSoundPath[64];
ConVar g_hSpawnToStartZone = null;								// Teleport on spawn to start zone
ConVar g_hAnnounceRank = null;									// Min rank to announce in chat
ConVar g_hForceCT = null;										// Force players CT
ConVar g_hChatSpamFilter = null;								// Chat spam limiter
float g_fLastChatMessage[MAXPLAYERS + 1];						// Last message time
int g_messages[MAXPLAYERS + 1];									// Spam message count
ConVar g_henableChatProcessing = null;							// Is chat processing enabled
ConVar g_hPrestigeRank = null;									// Rank to limit the server
ConVar g_hServerType = null;									// Set server to surf or bhop mode
ConVar g_hOneJumpLimit = null;									// Only allows players to jump once inside a start or stage zone
ConVar g_hServerID = null;										// Sets the servers id for cross-server announcements
ConVar g_hRecordAnnounce = null;								// Enable/Disable cross-server announcements
ConVar g_hRecordAnnounceDiscord = null;							// Web hook link to announce records to discord
ConVar g_hReportBugsDiscord = null;								// Web hook link to report bugs to discord
ConVar g_hCalladminDiscord = null;								// Web hook link to allow players to call admin to discord
ConVar g_hSidewaysBlockKeys = null;
ConVar g_hWrcpPoints = null;
ConVar g_hPlayReplayVipOnly = null;
ConVar g_hSoundPathWR = null;
char g_szSoundPathWR[PLATFORM_MAX_PATH];
char g_szRelativeSoundPathWR[PLATFORM_MAX_PATH];
ConVar g_hSoundPathTop = null;
char g_szSoundPathTop[PLATFORM_MAX_PATH];
char g_szRelativeSoundPathTop[PLATFORM_MAX_PATH];
ConVar g_hSoundPathPB = null;
char g_szSoundPathPB[PLATFORM_MAX_PATH];
char g_szRelativeSoundPathPB[PLATFORM_MAX_PATH];
ConVar g_hSoundPathWRCP = null;
char g_szSoundPathWRCP[PLATFORM_MAX_PATH];
char g_szRelativeSoundPathWRCP[PLATFORM_MAX_PATH];
ConVar g_hMustPassCheckpoints = null;
ConVar g_hLimitSpeedType = null;

void CreateConVars()
{
	CreateConVar("timer_version", VERSION, "Timer Version.", FCVAR_DONTRECORD | FCVAR_SPONLY | FCVAR_REPLICATED | FCVAR_NOTIFY);

	g_hChatPrefix = CreateConVar("ck_chat_prefix", "{lime}SurfTimer {default}|", "Determines the prefix used for chat messages", FCVAR_NOTIFY);
	g_hConnectMsg = CreateConVar("ck_connect_msg", "1", "on/off - Enables a player connect message with country", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAllowRoundEndCvar = CreateConVar("ck_round_end", "0", "on/off - Allows to end the current round", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hDisconnectMsg = CreateConVar("ck_disconnect_msg", "1", "on/off - Enables a player disconnect message in chat", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hMapEnd = CreateConVar("ck_map_end", "1", "on/off - Allows map changes after the timelimit has run out (mp_timelimit must be greater than 0)", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hNoClipS = CreateConVar("ck_noclip", "1", "on/off - Allows players to use noclip", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hGoToServer = CreateConVar("ck_goto", "1", "on/off - Allows players to use the !goto command", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hCommandToEnd = CreateConVar("ck_end", "1", "on/off - Allows players to use the !end command", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hCvarGodMode = CreateConVar("ck_godmode", "1", "on/off - unlimited hp", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hPauseServerside = CreateConVar("ck_pause", "1", "on/off - Allows players to use the !pause command", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hcvarRestore = CreateConVar("ck_restore", "1", "on/off - Restoring of time and last position after reconnect", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAttackSpamProtection = CreateConVar("ck_attack_spam_protection", "1", "on/off - max 40 shots; +5 new/extra shots per minute; 1 he/flash counts like 9 shots", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hRadioCommands = CreateConVar("ck_use_radio", "0", "on/off - Allows players to use radio commands", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAutohealing_Hp = CreateConVar("ck_autoheal", "50", "Sets HP amount for autohealing (requires ck_godmode 0)", FCVAR_NOTIFY, true, 0.0, true, 100.0);
	g_hDynamicTimelimit = CreateConVar("ck_dynamic_timelimit", "0", "on/off - Sets a suitable timelimit by calculating the average run time (This method requires ck_map_end 1, greater than 5 map times and a default timelimit in your server config for maps with less than 5 times", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hWelcomeMsg = CreateConVar("ck_welcome_msg", "{yellow}>>{default} {grey}Welcome! This server is using {lime}SurfTimer", "Welcome message (supported color tags: {default}, {darkred}, {green}, {lightgreen}, {blue} {olive}, {lime}, {red}, {purple}, {grey}, {yellow}, {bluegrey}, {darkblue}, {pink}, {lightred})", FCVAR_NOTIFY);
	g_hZoneDisplayType = CreateConVar("ck_zone_drawstyle", "1", "0 = Do not display zones, 1 = display the lower edges of zones, 2 = display whole zones", FCVAR_NOTIFY);
	g_hZonesToDisplay = CreateConVar("ck_zone_drawzones", "2", "Which zones are visible for players. 1 = draw start & end zones, 2 = draw start, end, stage and bonus zones, 3 = draw all zones.", FCVAR_NOTIFY);
	g_hShowOutlines = CreateConVar("ck_outlines", "1", "Toggle outline visibility", FCVAR_NOTIFY, true, 0.0, true, 1.0); // @todo: implement

	// g_hStartPreSpeed = CreateConVar("ck_pre_start_speed", "350.0", "The maximum prespeed for start zones. 0.0 = No cap", FCVAR_NOTIFY, true, 0.0, true, 3500.0);
	// g_hSpeedPreSpeed = CreateConVar("ck_pre_speed_speed", "3000.0", "The maximum prespeed for speed start zones. 0.0 = No cap", FCVAR_NOTIFY, true, 0.0, true, 3500.0);
	// g_hBonusPreSpeed = CreateConVar("ck_pre_bonus_speed", "350.0", "The maximum prespeed for bonus start zones. 0.0 = No cap", FCVAR_NOTIFY, true, 0.0, true, 3500.0);
	// g_hStagePreSpeed = CreateConVar("ck_prestage_speed", "0.0", "The maximum prespeed for stage start zones. 0.0 = No cap", FCVAR_NOTIFY, true, 0.0, true, 3500.0);
	g_hSpawnToStartZone = CreateConVar("ck_spawn_to_start_zone", "1.0", "1 = Automatically spawn to the start zone when the client joins the team.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hSoundEnabled = CreateConVar("ck_startzone_sound_enabled", "1.0", "Enable the sound after leaving the start zone.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hSoundPath = CreateConVar("ck_startzone_sound_path", "buttons\\button3.wav", "The path to the sound file that plays after the client leaves the start zone..", FCVAR_NOTIFY);
	g_hAnnounceRank = CreateConVar("ck_min_rank_announce", "0", "Higher ranks than this won't be announced to the everyone on the server. 0 = Announce all records.", FCVAR_NOTIFY, true, 0.0);
	g_hAnnounceRecord = CreateConVar("ck_chat_record_type", "0", "0: Announce all times to chat, 1: Only announce PB's to chat, 2: Only announce SR's to chat", FCVAR_NOTIFY, true, 0.0, true, 2.0);
	g_hForceCT = CreateConVar("ck_force_players_ct", "0", "Forces all players to join the CT team.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hChatSpamFilter = CreateConVar("ck_chat_spamprotection_time", "1.0", "The frequency in seconds that players are allowed to send chat messages. 0.0 = No chat cap.", FCVAR_NOTIFY, true, 0.0);
	g_henableChatProcessing = CreateConVar("ck_chat_enable", "1", "(1 / 0) Enable or disable Surftimers chat processing.", FCVAR_NOTIFY);
	g_hTriggerPushFixEnable = CreateConVar("ck_triggerpushfix_enable", "1", "Enables trigger push fix.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hSlopeFixEnable = CreateConVar("ck_slopefix_enable", "1", "Enables slope fix.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hDoubleRestartCommand = CreateConVar("ck_double_restart_command", "1", "(1 / 0) Requires 2 successive !r commands to restart the player to prevent accidental usage.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hBackupReplays = CreateConVar("ck_replay_backup", "1", "(1 / 0) Back up replay files, when they are being replaced", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hReplaceReplayTime = 	CreateConVar("ck_replay_replace_faster", "1", "(1 / 0) Replace record bots if a players time is faster than the bot, even if the time is not a server record.", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hTeleToStartWhenSettingsLoaded = CreateConVar("ck_teleportclientstostart", "1", "(1 / 0) Teleport players automatically back to the start zone, when their settings have been loaded.", FCVAR_NOTIFY, true, 0.0, true, 1.0);

	g_hPointSystem = CreateConVar("ck_point_system", "1", "on/off - Player point system", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hPointSystem.AddChangeHook(OnSettingChanged);
	g_hPlayerSkinChange = CreateConVar("ck_custom_models", "1", "on/off - Allows Surftimer to change the models of players and bots", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hPlayerSkinChange.AddChangeHook(OnSettingChanged);
	g_hReplayBotPlayerModel = CreateConVar("ck_replay_bot_skin", "models/player/tm_professional_var1.mdl", "Replay pro bot skin", FCVAR_NOTIFY);
	g_hReplayBotPlayerModel.AddChangeHook(OnSettingChanged);
	g_hReplayBotArmModel = CreateConVar("ck_replay_bot_arm_skin", "models/weapons/t_arms_professional.mdl", "Replay pro bot arm skin", FCVAR_NOTIFY);
	g_hReplayBotArmModel.AddChangeHook(OnSettingChanged);
	g_hPlayerModel = CreateConVar("ck_player_skin", "models/player/ctm_sas_varianta.mdl", "Player skin", FCVAR_NOTIFY);
	g_hPlayerModel.AddChangeHook(OnSettingChanged);
	g_hArmModel = CreateConVar("ck_player_arm_skin", "models/weapons/ct_arms_sas.mdl", "Player arm skin", FCVAR_NOTIFY);
	g_hArmModel.AddChangeHook(OnSettingChanged);
	g_hAutoBhopConVar = CreateConVar("ck_auto_bhop", "1", "on/off - AutoBhop on surf_ maps", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAutoBhopConVar.AddChangeHook(OnSettingChanged);
	g_hCleanWeapons = CreateConVar("ck_clean_weapons", "1", "on/off - Removes all weapons on the ground", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hCleanWeapons.AddChangeHook(OnSettingChanged);
	g_hCountry = CreateConVar("ck_country_tag", "1", "on/off - Country clan tag", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hCountry.AddChangeHook(OnSettingChanged);
	g_hAutoRespawn = CreateConVar("ck_autorespawn", "1", "on/off - Auto respawn", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAutoRespawn.AddChangeHook(OnSettingChanged);
	g_hCvarNoBlock = CreateConVar("ck_noblock", "1", "on/off - Player no blocking", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hCvarNoBlock.AddChangeHook(OnSettingChanged);
	g_hReplayBot = CreateConVar("ck_replay_bot", "1", "on/off - Bots mimic the local map record", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hReplayBot.AddChangeHook(OnSettingChanged);
	g_hBonusBot = CreateConVar("ck_bonus_bot", "1", "on/off - Bots mimic the local bonus record", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hBonusBot.AddChangeHook(OnSettingChanged);
	g_hInfoBot = CreateConVar("ck_info_bot", "0", "on/off - provides information about nextmap and timeleft in his player name", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hInfoBot.AddChangeHook(OnSettingChanged);
	g_hWrcpBot = CreateConVar("ck_wrcp_bot", "1", "on/off - Bots mimic the local stage records", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hWrcpBot.AddChangeHook(OnSettingChanged);

	g_hReplayBotColor = CreateConVar("ck_replay_bot_color", "52 91 248", "The default replay bot color - Format: \"red green blue\" from 0 - 255.", FCVAR_NOTIFY);
	g_hReplayBotColor.AddChangeHook(OnSettingChanged);
	char szRBotColor[256];
	g_hReplayBotColor.GetString(szRBotColor, 256);
	GetRGBColor(0, szRBotColor);

	g_hBonusBotColor = CreateConVar("ck_bonus_bot_color", "255 255 20", "The bonus replay bot color - Format: \"red green blue\" from 0 - 255.", FCVAR_NOTIFY);
	g_hBonusBotColor.AddChangeHook(OnSettingChanged);
	szRBotColor = "";
	g_hBonusBotColor.GetString(szRBotColor, 256);
	GetRGBColor(1, szRBotColor);

	g_hzoneStartColor = CreateConVar("ck_zone_startcolor", "000 255 000", "The color of START zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneStartColor.GetString(g_szZoneColors[1], 24);
	StringRGBtoInt(g_szZoneColors[1], g_iZoneColors[1]);
	g_hzoneStartColor.AddChangeHook(OnSettingChanged);

	g_hzoneEndColor = CreateConVar("ck_zone_endcolor", "255 000 000", "The color of END zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneEndColor.GetString(g_szZoneColors[2], 24);
	StringRGBtoInt(g_szZoneColors[2], g_iZoneColors[2]);
	g_hzoneEndColor.AddChangeHook(OnSettingChanged);

	g_hzoneCheckerColor = CreateConVar("ck_zone_checkercolor", "255 255 000", "The color of CHECKER zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneCheckerColor.GetString(g_szZoneColors[10], 24);
	StringRGBtoInt(g_szZoneColors[10], g_iZoneColors[10]);
	g_hzoneCheckerColor.AddChangeHook(OnSettingChanged);

	g_hzoneBonusStartColor = CreateConVar("ck_zone_bonusstartcolor", "000 255 255", "The color of BONUS START zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneBonusStartColor.GetString(g_szZoneColors[3], 24);
	StringRGBtoInt(g_szZoneColors[3], g_iZoneColors[3]);
	g_hzoneBonusStartColor.AddChangeHook(OnSettingChanged);

	g_hzoneBonusEndColor = CreateConVar("ck_zone_bonusendcolor", "255 000 255", "The color of BONUS END zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneBonusEndColor.GetString(g_szZoneColors[4], 24);
	StringRGBtoInt(g_szZoneColors[4], g_iZoneColors[4]);
	g_hzoneBonusEndColor.AddChangeHook(OnSettingChanged);

	g_hzoneStageColor = CreateConVar("ck_zone_stagecolor", "000 000 255", "The color of STAGE zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneStageColor.GetString(g_szZoneColors[5], 24);
	StringRGBtoInt(g_szZoneColors[5], g_iZoneColors[5]);
	g_hzoneStageColor.AddChangeHook(OnSettingChanged);

	g_hzoneCheckpointColor = CreateConVar("ck_zone_checkpointcolor", "000 000 255", "The color of CHECKPOINT zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneCheckpointColor.GetString(g_szZoneColors[6], 24);
	StringRGBtoInt(g_szZoneColors[6], g_iZoneColors[6]);
	g_hzoneCheckpointColor.AddChangeHook(OnSettingChanged);

	g_hzoneSpeedColor = CreateConVar("ck_zone_speedcolor", "255 000 000", "The color of SPEED zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneSpeedColor.GetString(g_szZoneColors[7], 24);
	StringRGBtoInt(g_szZoneColors[7], g_iZoneColors[7]);
	g_hzoneSpeedColor.AddChangeHook(OnSettingChanged);

	g_hzoneTeleToStartColor = CreateConVar("ck_zone_teletostartcolor", "255 255 000", "The color of TELETOSTART zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneTeleToStartColor.GetString(g_szZoneColors[8], 24);
	StringRGBtoInt(g_szZoneColors[8], g_iZoneColors[8]);
	g_hzoneTeleToStartColor.AddChangeHook(OnSettingChanged);

	g_hzoneValidatorColor = CreateConVar("ck_zone_validatorcolor", "255 255 255", "The color of VALIDATOR zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneValidatorColor.GetString(g_szZoneColors[9], 24);
	StringRGBtoInt(g_szZoneColors[9], g_iZoneColors[9]);
	g_hzoneValidatorColor.AddChangeHook(OnSettingChanged);

	g_hzoneStopColor = CreateConVar("ck_zone_stopcolor", "000 000 000", "The color of CHECKER zones \"red green blue\" from 0 - 255", FCVAR_NOTIFY);
	g_hzoneStopColor.GetString(g_szZoneColors[0], 24);
	StringRGBtoInt(g_szZoneColors[0], g_iZoneColors[0]);
	g_hzoneStopColor.AddChangeHook(OnSettingChanged);

	bool validFlag;
	char szFlag[24];
	AdminFlag bufferFlag;
	g_hAdminMenuFlag = CreateConVar("ck_adminmenu_flag", "z", "Admin flag required to open the !ckadmin menu. Invalid or not set, requires flag z. Requires a server restart.", FCVAR_NOTIFY);
	g_hAdminMenuFlag.GetString(szFlag, 24);
	validFlag = FindFlagByChar(szFlag[0], bufferFlag);
	if (!validFlag)
	{
		PrintToServer("Surftimer | Invalid flag for ck_adminmenu_flag.");
		g_AdminMenuFlag = ADMFLAG_ROOT;
	}
	else
		g_AdminMenuFlag = FlagToBit(bufferFlag);
	g_hAdminMenuFlag.AddChangeHook(OnSettingChanged);

	g_hZonerFlag = CreateConVar("ck_zoner_flag", "z", "Zoner status will automatically be granted to players with this flag. If the convar is invalid or not set, z (root) will be used by default.", FCVAR_NOTIFY);
	g_hZonerFlag.GetString(szFlag, 24);
	validFlag = FindFlagByChar(szFlag[0], bufferFlag);
	if (!validFlag)
	{
		LogError("Surftimer | Invalid flag for ck_zoner_flag, using ADMFLAG_ROOT");
		g_ZonerFlag = ADMFLAG_ROOT;
	}
	else
		g_ZonerFlag = FlagToBit(bufferFlag);
	g_hZonerFlag.AddChangeHook(OnSettingChanged);

	// Map Setting ConVars
	g_hGravityFix = CreateConVar("ck_gravityfix_enable", "1", "Enables/Disables trigger_gravity fix", FCVAR_NOTIFY, true, 0.0, true, 1.0);

	// g_hCustomTitlesFlag = CreateConVar("ck_customtitles_flag", "a", "Which flag must players have to use Custom Titles. Invalid or not set, disables Custom Titles.", FCVAR_NOTIFY);
	// g_hCustomTitlesFlag.GetString(szFlag, 24);
	// g_bCustomTitlesFlag = FindFlagByChar(szFlag[0], bufferFlag);
	// g_CustomTitlesFlag = FlagToBit(bufferFlag);
	// g_hCustomTitlesFlag.AddChangeHook(OnSettingChanged);

	// Prestige Server
	g_hPrestigeRank = CreateConVar("ck_prestige_rank", "0", "Rank of players who can join the server, 0 to disable");
	// Surf / Bhop
	g_hServerType = CreateConVar("ck_server_type", "0", "Change the timer to function for Surf or Bhop, 0 = surf, 1 = bhop (Note: Currently does nothing)");
	g_hServerType.AddChangeHook(OnSettingChanged);

	// One Jump Limit
	g_hOneJumpLimit = CreateConVar("ck_one_jump_limit", "1", "Enables/Disables the one jump limit globally for all zones");

	// Cross Server Announcements
	g_hRecordAnnounce = CreateConVar("ck_announce_records", "0", "Enables/Disables cross-server announcements");

	g_hServerID = CreateConVar("ck_server_id", "-1", "Sets the server ID, each server needs a valid id that is UNIQUE");
	g_hServerID.AddChangeHook(OnSettingChanged);

	// Discord
	g_hRecordAnnounceDiscord = CreateConVar("ck_announce_records_discord", "", "Web hook link to announce records to discord, keep empty to disable");

	g_hReportBugsDiscord = CreateConVar("ck_report_discord", "", "Web hook link to report bugs to discord, keep empty to disable");

	g_hCalladminDiscord = CreateConVar("ck_calladmin_discord", "", "Web hook link to allow players to call admin to discord, keep empty to disable");

	g_hSidewaysBlockKeys = CreateConVar("ck_sideways_block_keys", "0", "Changes the functionality of sideways, 1 will block keys, 0 will change the clients style to normal if not surfing sideways");

	// WRCP Points
	g_hWrcpPoints = CreateConVar("ck_wrcp_points", "0", "Sets the amount of points a player should get for a WRCP, 0 to disable");

	// Play Replay
	g_hPlayReplayVipOnly = CreateConVar("ck_play_replay_vip_only", "1", "Sets whether the sm_replay command will be VIP only Disable/Enable");

	// Sound Convars
	g_hSoundPathWR = CreateConVar("ck_sp_wr", "sound/surftimer/wr/2/valve_logo_music.mp3", "Set the sound path for the WR sound");
	g_hSoundPathWR.AddChangeHook(OnSettingChanged);
	g_hSoundPathWR.GetString(g_szSoundPathWR, sizeof(g_szSoundPathWR));
	char sBuffer[2][PLATFORM_MAX_PATH];
	ExplodeString(g_szSoundPathWR, "sound/", sBuffer, 2, PLATFORM_MAX_PATH);
	Format(g_szRelativeSoundPathWR, sizeof(g_szRelativeSoundPathWR), "*%s", sBuffer[1]);

	g_hSoundPathTop = CreateConVar("ck_sp_top", "sound/surftimer/top10/valve_logo_music.mp3", "Set the sound path for the Top 10 sound");
	g_hSoundPathTop.AddChangeHook(OnSettingChanged);
	g_hSoundPathTop.GetString(g_szSoundPathTop, sizeof(g_szSoundPathTop));
	ExplodeString(g_szSoundPathTop, "sound/", sBuffer, 2, PLATFORM_MAX_PATH);
	Format(g_szRelativeSoundPathTop, sizeof(g_szRelativeSoundPathTop), "*%s", sBuffer[1]);

	g_hSoundPathPB = CreateConVar("ck_sp_pb", "sound/surftimer/pr/valve_logo_music.mp3", "Set the sound path for the PB sound");
	g_hSoundPathPB.AddChangeHook(OnSettingChanged);
	g_hSoundPathPB.GetString(g_szSoundPathPB, sizeof(g_szSoundPathPB));
	ExplodeString(g_szSoundPathPB, "sound/", sBuffer, 2, PLATFORM_MAX_PATH);
	Format(g_szRelativeSoundPathPB, sizeof(g_szRelativeSoundPathPB), "*%s", sBuffer[1]);

	g_hSoundPathWRCP = CreateConVar("ck_sp_wrcp", "sound/physics/glass/glass_bottle_break2.wav", "Set the sound path for the WRCP sound");
	g_hSoundPathWRCP.AddChangeHook(OnSettingChanged);
	g_hSoundPathWRCP.GetString(g_szSoundPathWRCP, sizeof(g_szSoundPathWRCP));
	ExplodeString(g_szSoundPathWRCP, "sound/", sBuffer, 2, PLATFORM_MAX_PATH);
	Format(g_szRelativeSoundPathWRCP, sizeof(g_szRelativeSoundPathWRCP), "*%s", sBuffer[1]);

	g_hMustPassCheckpoints = CreateConVar("ck_enforce_checkpoints", "1", "Sets whether a player must pass all checkpoints to finish their run. Enable/Disable");

	g_hLimitSpeedType = CreateConVar("ck_limit_speed_type", "1", "1 Use new style of limiting speed, 0 use old/cksurf way");

	// Server Name
	g_hHostName = FindConVar("hostname");
	g_hHostName.AddChangeHook(OnSettingChanged);
	g_hHostName.GetString(g_sServerName, sizeof(g_sServerName));

	// Chat Prefix
	g_hChatPrefix.GetString(g_szChatPrefix, sizeof(g_szChatPrefix));
	g_hChatPrefix.AddChangeHook(OnSettingChanged);

	// Client side autobhop
	g_hAutoBhop = FindConVar("sv_autobunnyhopping");
	g_hEnableBhop = FindConVar("sv_enablebunnyhopping");
	g_hAllowTP = FindConVar("sv_allow_thirdperson");

	g_hAutoBhop.SetBool(true);
	g_hEnableBhop.BoolValue = true;
	g_hAllowTP.SetInt(1);

	g_cvar_sv_hibernate_when_empty = FindConVar("sv_hibernate_when_empty");

	if (g_cvar_sv_hibernate_when_empty.IntValue == 1)
		g_cvar_sv_hibernate_when_empty.IntValue = 0;

	// Show Triggers
	g_Offset_m_fEffects = FindSendPropInfo("CBaseEntity", "m_fEffects");

	// Server Tickate
	g_Server_Tickrate = RoundFloat(1 / GetTickInterval());

	// Footsteps
	g_hFootsteps = FindConVar("sv_footsteps");
}

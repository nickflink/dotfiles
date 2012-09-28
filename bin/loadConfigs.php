#!/usr/bin/php
<?
$dependentConfigs = array(
	"test.php",
	"config.php",
	"transcodingConfig.php",
	"zendeskConfig.php",
	"virtualPresentConfig.php",
	"tuStoreConfig.php",
	"termsofserviceTextsConfig.php",
	"viximoConfig.php",
	"userDeletionConfig.php",
	"queueConfig.php",
	"trackingExperimentsConfig.php",
	"oldDatabaseConfig.php",
	"tracConfig.php",
	"storageConfig.php",
	"taleoConfig.php",
	"mailDomainGmailConfig.php",
	"mailConfig.php",
	"loggerConfig.php",
	"serviceProvider.php",
	"localConfig.php",
	"globalizedQueueConfig.php",
	"featureConfig.php",
	"corporatePagesConfig.php",
	"smsApiConfig.php",
	"pushNotificationsConfig.php",
	"portalConfig.php",
	"statsConfig.php",
	"mailDomainYahooConfig.php",
	"shareConfig.php",
	"mvnoInterfacesConfig.php",
	"mailDomainOthersConfig.php",
	"siteRunMode.php",
	"searchConfig.php",
	"clientAppsConfig.php",
	"metrogamesConfig.php",
	"mailUpdatesConfig.php",
	"pagesConfig.php",
	"errorRate.php",
	"errorLoggerConfig.php",
	"externalPlacesConfig.php",
	"changeMonitorConfig.php",
	"clientInterfaceConfig.php",
	"friendsImporterConfig.php",
	"internalPromoConfig.php",
	"mobileMessageConfig2.php",
	"dynamicThumbsConfig.php",
	"newZendeskConfig.php",
	"fileStorageConfig.php",
	"photoMigration.php",
	"mobileDevicePageSuggestion.php",
	"databaseServers.php",
	"apiKeyConfig.php",
	"cityCentreConfig.php",
	"mvnoConfig.php",
	"couponConfig.php",
	"apiConfig.php",
	"mailDomainHotmailConfig.php",
	"databaseConfig.php",
);
$findCmd = 'find ~/configuration/ -type f|grep php$';
ob_start();
passthru($findCmd);
$filesOut = ob_get_contents();
ob_end_clean();
$files = explode("\n", trim($filesOut));
$independentConfigs = array();
foreach($files as $fileWithPath){
	$file = basename($fileWithPath);	
	if(!in_array($file, $dependentConfigs)){
		$independentConfigs[$file] = include $fileWithPath;
	}
}
echo "\tGOOD INDEPENDENT LIST(".count(array_keys($independentConfigs))."):\n".implode(", ",array_keys($independentConfigs));
echo "\n\tBAD DEPENDENT LIST(".count($dependentConfigs)."):\n".implode(", ",$dependentConfigs);

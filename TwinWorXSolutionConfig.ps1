
param(
      [string]$iothubname,
      [string]$iothubCompatibleEndpoint,
      [string]$iothubCompatiblePath,
      [string]$iothubs_iotHubSasKey,
      [string]$s_iotHubSasKeyName,
      [string]$ConsumerGroup,
      [string]$eventhubname,
      [string]$eventHubConnectionString,
      [string]$postgreHost,
      [string]$postgreUserName,
      [string]$postgrePassword,
      [string]$postgreDbName,
      [string]$postgrePort,
      [string]$vmIP,
      #-----------------------
      [string]$busConString
      #[string]$iotHubConString
     
  )


#-------------End-------------------------

#-------------------Variable Declare and Initilize----------------------------
$busType='servicebus'
$subscriptionName='twxeventloggersubscription'
$topicName='twxeventlogger'
$postgreconfigDbName='twx_configuration'
#$userEmail='connect@e-magic.ca'
#$userPassword='Connect!@#123'
$iotHubConString='HostName='+$iothubname+'.azure-devices.net;SharedAccessKeyName='+$s_iotHubSasKeyName+';SharedAccessKey='+$iothubs_iotHubSasKey+''
$deviceId='IoTDevice01'
$TwinWorxPortalUrl='http://'+$vmIP+':86'
$ApiGatewayUrl='http://'+$vmIP+':1007'
$TwinWorXServiceRegisteryPath = 'C:\TwinWorX-Solution\Microservices\TwinWorXServiceRegistery\appsettings.json'
$TwinWorXDataResourceMangaerPath = 'C:\TwinWorX-Solution\Microservices\TwinWorXDataResourceManager\appsettings.json'
$TwinWorXDataAccessServicePath = 'C:\TwinWorX-Solution\Microservices\TwinWorXDataAccessService\appsettings.json'
$TwinWorxDataAlarmingServicePath = 'C:\TwinWorX-Solution\Microservices\TwinWorxDataAlarmingService\appsettings.json'
$TwinWorXHistoricalDataAccessServicePath = 'C:\TwinWorX-Solution\Microservices\TwinWorXHistoricalDataAccessService\appsettings.json'
$TwinWorXAlarmingLoggerServicePath = 'C:\TwinWorX-Solution\Microservices\TwinWorXAlarmingLoggerService\appsettings.json'
$TwinWorXApiGatewayPath = 'C:\TwinWorX-Solution\Microservices\TwinWorXApiGateway\appsettings.json'
$TwinWorXDTPath = 'C:\TwinWorX-Solution\Microservices\TwinWorXDT\appsettings.json'
$TwinWorXPFServicePath = 'C:\TwinWorX-Solution\Microservices\TwinWorXPlatformServiceBus\appsettings.json'
$TwinWorXLoggingServicePath = 'C:\TwinWorX-Solution\Microservices\TwinWorXLoggingService\appsettings.json'
$TwinWorXUserManagementPath = 'C:\TwinWorX-Solution\Microservices\TwinWorXUserManagement\appsettings.json'

$TwinWorXExplorerPath = 'C:\TwinWorX-Solution\Portal\wwwroot\ClientApp\assets\config\configuration.json'

#--------------------Change appsetting----------------------
#----------------------------------------------rsmgr----------------------------------
(Get-Content $TwinWorXDataResourceMangaerPath).replace('{eventhubconstring}',$eventHubConnectionString) | Set-Content $TwinWorXDataResourceMangaerPath
(Get-Content $TwinWorXDataResourceMangaerPath).replace('{eventhubname}',$eventhubname) | Set-Content $TwinWorXDataResourceMangaerPath
(Get-Content $TwinWorXDataResourceMangaerPath).replace('{cgp}',$consumerGroup) | Set-Content $TwinWorXDataResourceMangaerPath
#--------------------------------------------DT---------------------------------------------
(Get-Content $TwinWorXDTPath).replace('{iothubcomendpoint}',$iothubCompatibleEndpoint) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{iothubcompath}',$iothubCompatiblePath) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{iothubskey}',$iothubs_iotHubSasKey) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{iothubskname}',$s_iotHubSasKeyName) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{cgp}',$ConsumerGroup) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{eventhubconstring}',$eventHubConnectionString) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{eventhubname}',$eventhubname) | Set-Content $TwinWorXDTPath

#------------------------------------pgsql---------------------------------------------------#
(Get-Content $TwinWorXServiceRegisteryPath).replace('{host}',$postgreHost) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{port}',$postgrePort) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{twx_configurationdb}',$postgreconfigDbName) | Set-Content $TwinWorXServiceRegisteryPath

(Get-Content $TwinWorXDataAccessServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXDataAccessServicePath

(Get-Content $TwinWorxDataAlarmingServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorxDataAlarmingServicePath

(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXHistoricalDataAccessServicePath

(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXAlarmingLoggerServicePath

(Get-Content $TwinWorXDTPath).replace('{host}',$postgreHost) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{port}',$postgrePort) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXDTPath

(Get-Content $TwinWorXLoggingServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXLoggingServicePath

(Get-Content $TwinWorXUserManagementPath).replace('{host}',$postgreHost) | Set-Content $TwinWorXUserManagementPath
(Get-Content $TwinWorXUserManagementPath).replace('{port}',$postgrePort) | Set-Content $TwinWorXUserManagementPath
(Get-Content $TwinWorXUserManagementPath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXUserManagementPath
(Get-Content $TwinWorXUserManagementPath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXUserManagementPath
(Get-Content $TwinWorXUserManagementPath).replace('{database}',$postgreconfigDbName) | Set-Content $TwinWorXUserManagementPath   # twx_config database
#####-----------------------------------Api Gateway---------------------------------------####################
(Get-Content $TwinWorXApiGatewayPath).replace('{host}',$postgreHost) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{port}',$postgrePort) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{twx_configurationdb}',$postgreconfigDbName) | Set-Content $TwinWorXApiGatewayPath

#(Get-Content $TwinWorXApiGatewayPath).replace('{Username}',$userEmail) | Set-Content $TwinWorXApiGatewayPath
#(Get-Content $TwinWorXApiGatewayPath).replace('{Password}',$userPassword) | Set-Content $TwinWorXApiGatewayPath

(Get-Content $TwinWorXApiGatewayPath).replace('{busConString}',$busConString) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{busType}',$busType) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{subscriptionName}',$subscriptionName) | Set-Content $TwinWorXApiGatewayPath
(Get-Content $TwinWorXApiGatewayPath).replace('{topicName}',$topicName) | Set-Content $TwinWorXApiGatewayPath

(Get-Content $TwinWorXApiGatewayPath).replace('{clientUrl}',$TwinWorxPortalUrl) | Set-Content $TwinWorXApiGatewayPath
#---------------------------------------------------------------------------------------------#########
(Get-Content $TwinWorXDataAccessServicePath).replace('{constring}',$iotHubConString) | Set-Content $TwinWorXDataAccessServicePath  # iotHubConString
(Get-Content $TwinWorXDataAccessServicePath).replace('{deviceid}',$deviceId) | Set-Content $TwinWorXDataAccessServicePath
#-----------------------------------End------------------------------------------
#(Get-Content $TwinWorxDataAlarmingServicePath).replace('{Username}',$userEmail) | Set-Content $TwinWorxDataAlarmingServicePath
#(Get-Content $TwinWorxDataAlarmingServicePath).replace('{Password}',$userPassword) | Set-Content $TwinWorxDataAlarmingServicePath
#-----------------------------------End------------------------------------------
(Get-Content $TwinWorXLoggingServicePath).replace('{busConString}',$busConString) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{busType}',$busType) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{subscriptionName}',$subscriptionName) | Set-Content $TwinWorXLoggingServicePath
(Get-Content $TwinWorXLoggingServicePath).replace('{topicName}',$topicName) | Set-Content $TwinWorXLoggingServicePath
#-----------------------------------End----------------------------------------
(Get-Content $TwinWorXPFServicePath).replace('{busConString}',$busConString) | Set-Content $TwinWorXPFServicePath
(Get-Content $TwinWorXPFServicePath).replace('{busType}',$busType) | Set-Content $TwinWorXPFServicePath
(Get-Content $TwinWorXPFServicePath).replace('{subscriptionName}',$subscriptionName) | Set-Content $TwinWorXPFServicePath
(Get-Content $TwinWorXPFServicePath).replace('{topicName}',$topicName) | Set-Content $TwinWorXPFServicePath
#----------------------------------End-----------------------------------------

(Get-Content $TwinWorXExplorerPath).replace('{apigatewayurl}',$ApiGatewayUrl) | Set-Content $TwinWorXExplorerPath
#--------------------End------------------------------------
#------------------Firewall-----------------------------

Import-Module NetSecurity
New-NetFirewallRule -DisplayName "twcustomRule1" -Direction Inbound -LocalPort Any -Protocol TCP -Action Allow
#-----------------------------------end--------------------
#-------------------------------start service using---------------
Start-Service -Name "W3SVC"
Start-Service -Name "WAS"
#-------------------------------

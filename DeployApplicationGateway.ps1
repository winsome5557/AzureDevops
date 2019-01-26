#Login-AzureRmAccount

Param(
[string] $VnetName,
[string] $SubnetName,
[string] $AppGatewaySize,
[string] $SharedResourceGroup,
[string] $ApplicationGatewayName,
[string] $ApimBackendPoolName,
[string] $ApimName,
[string] $ApimResourcegroupName,
[string] $ApimPortNo,
[string] $ApiHostName,
[string] $ApimIPAddress,
[string] $PortalHostName,
[string] $FrontEndPortName,
[string] $ProductID,
[string] $apiPath,
[string] $APICertificateName,
[string] $PortalCertificateName,
[string] $CertificateData,
[string] $AuthCertificateData
)

$DebugPreference="Continue"

# select the subscription
Select-AzureRmSubscription  -Subscription ssp-apim-development


$SharedResourceGroup = "eapim-dev-shd"
$ApplicationGatewayName = "eapim-dev-agw"
$ApimName = "eapim-dev-custeng-apim"
$ApimBackendPoolName = ($ApimName + "-backendpool")
$ApimPortNo = 443

$APIHostName = "dev-api-customerengagement.platform.education.gov.uk"
$PortalHostName = "dev-developers-customerengagement.platform.education.gov.uk"

#$APIHostName = "sdevapi.integration.tfl.gov.uk"
#$PortalHostName = "sdevportal.integration.tfl.gov.uk"

$VnetName = "eapim-dev-vnet"
$SubnetName = "eapim-dev-shd-agwsubnet"
$FrontEndPortName = "eapim-dev-agw-pip"
$ApimIPAddress = "10.172.3.69"
$PortalCertificateName="wildcard-platform-education-gov-uk"
$APICertificateName="wildcard-platform-education-gov-uk"

# select the application gateway instance
try
{
$agw = Get-AzureRmApplicationGateway  -ResourceGroupName $SharedResourceGroup -Name $ApplicationGatewayName

    # cleanup existing resources if any
    # Cleanup Order
    # delete rule first...
    # backend pool
    # httpsettings
    # listeners -F
    try
    {
        Remove-AzureRmApplicationGatewayRequestRoutingRule -Name ($ApimName + "-GatewayRule")  `
            -ApplicationGateway $agw    
        Write-Verbose "Gateway Routing Rule existed. Deleted"
    }
    catch
    {
    }
        Write-Verbose "Gateway Routing Cleanup - Done"
    try
    {
        Remove-AzureRmApplicationGatewayRequestRoutingRule -Name ($ApimName + "-PortalRule")  `
            -ApplicationGateway $agw    
        Write-Verbose "Portal Routing Rule existed. Deleted"
    }
    catch
    {
    }
        Write-Verbose "Portal Routing Cleanup - Done"
    try
    {
        Remove-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $agw `
            -Name $ApimBackendPoolName
        Write-Verbose "Backend Pool existed. Deleted"
    }
    catch
    {
    }
        Write-Verbose "Backend  Pool Cleanup - Done"
    try
    {
        Remove-AzureRmApplicationGatewayBackendHttpSettings `
          -ApplicationGateway $agw -Name ($ApimName + "-GatewayBackendHttpSettings") 
        Write-Verbose "Gateway Backend HttpSettings existed. Deleted"
    }
    catch
    {
    }

    try
    {
        Remove-AzureRmApplicationGatewayBackendHttpSettings `
          -ApplicationGateway $agw -Name ($ApimName + "-PortalBackendHttpSettings") 
        Write-Verbose "Portal Backend HttpSettings existed. Deleted"
    }
    catch
    {
    }
        Write-Verbose "HttpSettings Cleanup - Done"

    try
    {
        Remove-AzureRmApplicationGatewayHttpListener `
          -ApplicationGateway $agw -Name ($ApimName + "-GatewayListener")
            Write-Verbose "Gateway Listener existed. Deleted"
    }
    catch
    {
    }

    try
    {
        Remove-AzureRmApplicationGatewayHttpListener `
          -ApplicationGateway $agw -Name ($ApimName + "-PortalListener")
            Write-Verbose "Portal Listener existed. Deleted"
    }
    catch
    {
    }
        Write-Verbose "Listeners Cleanup - Done"


    
    try
    {
          Remove-AzureRmApplicationGatewaySslCertificate -ApplicationGateway $agw -Name ($ApimName + "-SSLCertificate")   
          Write-Verbose "SSL Certificate existed. Deleted"
    }
    catch
    {
    }
        Write-Verbose "SSL Certificate Cleanup - Done"



    # Update Gateway
    Set-AzureRmApplicationGateway -ApplicationGateway $agw

    # fetch the new instance
    $agw = Get-AzureRmApplicationGateway  -ResourceGroupName $SharedResourceGroup -Name $ApplicationGatewayName

}
catch
{
    # App gateway doesnt exist, create one
     Write-Verbose "No App gateway instance exist, creating one"
  #   $Sku = New-AzureRmApplicationGatewaySku -Name "Standard_Small" -Tier Standard -Capacity 2
  #   $agw = New-AzureRmApplicationGateway -ResourceGroupName $SharedResourceGroup -Name $ApplicationGatewayName -location "West Europe" -Sku $sku
  #   $PublicIP = New-AzureRmPublicIpAddress -ResourceGroupName $SharedResourceGroup -Name ($ApplicationGatewayName + "-pip")  -AllocationMethod Dynamic
  #   Add-AzureRmApplicationGatewayFrontendIPConfig -ApplicationGateway $agw -Name ($ApplicationGatewayName + "-fipcfg")  -PublicIPAddress $PublicIP
}



# add  the Gateway resources now
    Write-Verbose "Deploying Gateway resources"


#try {
#    $apimbackendPool = Get-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $agw -Name $ApimBackendPoolName
#    Write-Verbose "Application Backend Addresspool  already exists"
#} catch {

# get application gateway backend settings pool    
#$apimbackendPool = Get-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $agw -Name $ApimBackendPoolName

# create the #poolsettings
#$poolSettings = New-AzureRmApplicationGatewayBackendHttpSettings `
 # -Name $ApimBackendPoolName `
 # -Port 443 `
 # -Protocol Http `
 # -CookieBasedAffinity Enabled `
 # -RequestTimeout 120 

#}

try
{
# Add apim backend address pool
Add-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $agw `
    -Name $ApimBackendPoolName -BackendIPAddresses $ApimIPAddress


# Add SSL certificates
$tmpFile = New-TemporaryFile
$filePath = "C:\Development\eapim.pfx"
$CertificateData | Out-File $tmpFile -Append 

$secureStringPassword = ConvertTo-SecureString $CertificatePassword -AsPlainText -Force
Add-AzureRmApplicationGatewaySslCertificate -ApplicationGateway $agw -Name ($ApimName + "-SSLCertificate") `
    -CertificateFile $filePath -Password $secureStringPassword
$sslCert = Get-AzureRmApplicationGatewaySslCertificate -ApplicationGateway $agw -Name ($ApimName + "-SSLCertificate") 
    

 Write-Verbose ("Certificate data loaded in Gateway via"+ $tmpFile.FullName)

# Add Authentication certificates
#$tmpFileAuth = New-TemporaryFile
#$AuthCertificateData | Out-File $tmpFileAuth -Append 

Add-AzureRmApplicationGatewayAuthenticationCertificate  -Name ($ApimName + "-AuthCertificate") `
     -ApplicationGateway $agw -CertificateFile C:\Development\eapim.cer 


$authCert = Get-AzureRmApplicationGatewayAuthenticationCertificate -ApplicationGateway $agw -Name ($ApimName + "-AuthCertificate") 
# Write-Verbose ("Auth Certificate data loaded in Gateway via"+ $tmpFileAuth.FullName)
 

# get the front end ip config 
$FrontEndIpConfig = Get-AzureRmApplicationGatewayFrontendIPConfig -ApplicationGateway $agw 

# initialize front end port
 Add-AzureRmApplicationGatewayFrontendPort -ApplicationGateway $agw -Name ($ApimName +"fip") -Port 443
 #TODO for HTTS $Frontendport = Get-AzureRmApplicationGatewayFrontendPort -ApplicationGateway $agw -Name ($ApimName +"fip")

 $Frontendport = Get-AzureRmApplicationGatewayFrontendPort -ApplicationGateway $agw -Name  ($ApimName +"fip") 


#Add-AzureRmApplicationGatewayBackendHttpSettings -ApplicationGateway $agw -Name ($ApimName + "-APIListener")
# create the apim api listener
Add-AzureRmApplicationGatewayHttpListener `
  -ApplicationGateway $agw -Name ($ApimName + "-GatewayListener") `
  -Protocol https `
  -FrontendIPConfiguration $FrontEndIpConfig `
  -FrontendPort $Frontendport `
  -HostName $APiHostName  -SslCertificate  $sslCert

#Remove-AzureRmApplicationGatewayBackendHttpSettings -ApplicationGateway $agw -Name ($ApimName + "-PortalListener")
# create the apim portal listener
Add-AzureRmApplicationGatewayHttpListener `
  -ApplicationGateway $agw -Name ($ApimName + "-PortalListener") `
  -Protocol https `
  -FrontendIPConfiguration $FrontEndIpConfig `
  -FrontendPort $Frontendport `
  -HostName $PortalHostName -SslCertificate $sslCert
  

$httpGatewayListener = Get-AzureRmApplicationGatewayHttpListener `
  -ApplicationGateway $agw -Name ($ApimName + "-GatewayListener") 


 $httpPortalListener  = Get-AzureRmApplicationGatewayHttpListener `
  -ApplicationGateway $agw -Name ($ApimName + "-PortalListener") 
  
#$poolSettings = Get-AzureRmApplicationGatewayBackendHttpSettings `
#  -ApplicationGateway $agw -Name $ApimBackendPoolName 

$backendAddressPool = Get-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $agw -Name $ApimBackendPoolName 


# apim gateway api backend http settings
 Add-AzureRmApplicationGatewayBackendHttpSettings `
  -ApplicationGateway $agw -Name ($ApimName + "-GatewayBackendHttpSettings") `
  -Port 443 `
  -Protocol https `
  -CookieBasedAffinity Enabled `
  -RequestTimeout 120 -AuthenticationCertificates $authCert

  $gatewayBackEndHttpSettings = Get-AzureRmApplicationGatewayBackendHttpSettings `
  -ApplicationGateway $agw -Name ($ApimName + "-GatewayBackendHttpSettings") 

 
# apim gateway portal backend http settings  
 Add-AzureRmApplicationGatewayBackendHttpSettings `
  -ApplicationGateway $agw -Name ($ApimName + "-PortalBackendHttpSettings") `
  -Port 443 `
  -Protocol https `
  -CookieBasedAffinity Enabled `
  -RequestTimeout 120 -AuthenticationCertificates $authCert

   $portalBackEndHttpSettings = Get-AzureRmApplicationGatewayBackendHttpSettings `
  -ApplicationGateway $agw -Name ($ApimName + "-PortalBackendHttpSettings") 


Add-AzureRmApplicationGatewayRequestRoutingRule -Name ($ApimName + "-GatewayRule")  `
   -ApplicationGateway $agw -RuleType basic -BackendHttpSettings $gatewayBackEndHttpSettings   `
   -HttpListener $httpGatewayListener -BackendAddressPool $backendAddressPool 

Add-AzureRmApplicationGatewayRequestRoutingRule -Name ($ApimName + "-PortalRule") `
   -ApplicationGateway $agw -RuleType basic -BackendHttpSettings  $portalBackEndHttpSettings `
   -HttpListener $httpPortalListener -BackendAddressPool $backendAddressPool

  
Remove-Item $tmpFile.FullName -Force


# update all properties
Set-AzureRmApplicationGateway -ApplicationGateway $agw

#cleanup temp

try  
{
        # cleanup any temp resources
        Remove-AzureRmApplicationGatewayRequestRoutingRule -Name "rule1"  `
            -ApplicationGateway $agw    
        Remove-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $agw `
            -Name "dummy"
        Remove-AzureRmApplicationGatewayBackendHttpSettings `
          -ApplicationGateway $agw -Name "dummy"
        Remove-AzureRmApplicationGatewayHttpListener `
          -ApplicationGateway $agw -Name "dummy"
        # update all properties
        Set-AzureRmApplicationGateway -ApplicationGateway $agw

   
}
catch{}

#Get-PfxCertificate -FilePath C:\Development\tcert.pfx | Export-Certificate -FilePath C:\Development/tcert.cer -Type CERT
}
catch
{
}

<<<<<<< HEAD
﻿#requires 
<#
.SYNOPSIS
  The script registers the APIM as an enpoint in the Enterprise APIM Application Gateway hosted in the
  shared subscription. 
.DESCRIPTION
.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
  
.OUTPUTS
  
.NOTES
  Version:        1.0
  Author:         Sarfraz Malik ( Tech Transformation )
  Creation Date:  26 Jan 2019
  Purpose/Change: Initial script development
  
.EXAMPLE
  to add
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------


#Login-AzureRmAccount

Param(
=======
#Login-AzureRmAccount

Param(
[string] $VnetName,
[string] $SubnetName,
>>>>>>> 7beedb845e46b73b873401b90be6908cdf7a0dc5
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

<<<<<<< HEAD
=======

>>>>>>> 7beedb845e46b73b873401b90be6908cdf7a0dc5
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
<<<<<<< HEAD
$CertificateData="MIIX/QIBAzCCF7kGCSqGSIb3DQEHAaCCF6oEghemMIIXojCCBhsGCSqGSIb3DQEHAaCCBgwEggYIMIIGBDCCBgAGCyqGSIb3DQEMCgECoIIE/jCCBPowHAYKKoZIhvcNAQwBAzAOBAhGDqcN/h+w2QICB9AEggTYgjnSLdTaeBrbRUn2W21MYMqybWp4NNQwdatnLbG0v7hR38YYLUV7H0d66zdn0VVTfBGIr3VXQ5cM+PqnZxcRCB+faelW3npEhmNb8ror97r4WtL4G1UOa1LDOZcntjqjtbUaXUGUrd7dw7dLYltI3rBhlEZgsuoDAMBzQI78HP/fhEAd/aWuY2QrXK7VHX4f652vDATzNaMSPtpyQQ3KVOmKrqI3C3i3FKe2oOMiNu7CNRZJqco/twCgTEe8vh4D3k1C61Dpl2kxabqkHF5xFYUZIYkPfyh6i6kEwQ1sPtTCjnWowzzhQgKGDjHhwGDuH4v0UyDL4M41jjLKH1fqAyxiOPdmljrfYAEengDAlBYyg0dVzc1IXiWsprQ7eMIZnds60mTG732LD/zB8D5Y2jIn1VM2/PWm7cJOfq2uX2xuunBFwyNz5KiQ7qnpIyHUH5qPFueqYhm7+L3f+92tMRDq/NVjPV+EutTO33siVJHN6ErP9e60YHEcNKTE02IhKaxLP9M4fwdofncEBAjnIGLUfdRPXP9lwOFPhCxHC4se6Y+qMqe87dSIGW5nKtwjNLAA3NoSn4FfkMSqqiIaOnAYXVjzpeInopDVfo5o/5YZth618ams6JnntMZB+8Xtch1VqcQJuqjygLIsquv39Bz3q6k6wchfFVOAyS3nMfinQzKvC9pPYzDfo5O5iy+Aab35RxoLzfX47HVWszeExDQ4UtaqhuD/lACmG9dw1pFF/atDjccsnV9r10Dio7CeZ8+fcXE1sZmSysHij+lnHspMfVEiksZ18SgGPx8vTe7PobQH9zLyZ64DNLQf0vEQFbZc7pVgh6T/UprejeAQLBfnzxMfpvHs0BoZQEPsPSPG3UvuuMILaZduUmBuTR5r5+aLPH7jBH4Focy8TAvCuZiSX7E253Zk1s4HFFdEvVfd+KD8OogPW9qnuQZrARx/BYCIzpnbPhj3g5t30oPnk+I1SJ799iruRJwZsdvX3WmjCPDTXEN2h79V0jj5MzidAvGzPMukOtKi9HlgqoRc3PwjSSGqMNeHTJ9ypYdOLAvqB0AKn2xfS4Im2ezosBeOMDGxFhcyOYXZDxUWCGp7wXb5+bWl8qnbgVLiTM4ba3c9A1qYWNs1bxM1EMxDiVv3YRTRm6qQa0vpP6O9wqMioHwMU5Y8n4L9byxOEq4gemscyDzmVl3EVtfP0IXEc9mEvoFX36KNO2Ejw3eCytT1sap42EZ+JRTAGoY7i9BTlq8SXVQwZPWSHL76ImBAQ4xhhmBtCRj6W4Pe280qvXvrsE6OQhEnu476OrpFWyf4Ol1i3HeLCtJSjBY67fTTY7EczsInzyQIAeKP2q60b2/d5Ayg3lXAXy8C9sGEMANfy/eW9o1EilRLRubnYXZ+gRgDVNuqxPcbpEeTMk+58jYPi16DIYA4/h+p5CwO0gaFScbGWZkJ7vW0ej4vx3v3d2Ko6VRncRjQctcvOxRhfrHL+ulrnp4gNcnr2lXNKLgJrRQz3vXCeRBz6ai5XzmghgwivNo5zYBH16M/4IVk8XNEI2KPAwHhOAqoeD2EBwiVxeBzyZAksjXMVIYT2xu+PckYyqimmEThz6c0uk2omuqF/v6ei7M9ZxbzkkNV6oXFHRhoXBYYZWVgszGB7jANBgkrBgEEAYI3EQIxADATBgkqhkiG9w0BCRUxBgQEAQAAADBdBgkqhkiG9w0BCRQxUB5OAHQAcQAtADgANgA4ADIANgAxADQAMgAtADcAZgAwAGUALQA0AGYANAA3AC0AYgA5AGMAZAAtADMAYQBmAGEAYwA4ADUAZABiAGIAMABhMGkGCSsGAQQBgjcRATFcHloATQBpAGMAcgBvAHMAbwBmAHQAIABSAFMAQQAgAFMAQwBoAGEAbgBuAGUAbAAgAEMAcgB5AHAAdABvAGcAcgBhAHAAaABpAGMAIABQAHIAbwB2AGkAZABlAHIwghF/BgkqhkiG9w0BBwagghFwMIIRbAIBADCCEWUGCSqGSIb3DQEHATAcBgoqhkiG9w0BDAEDMA4ECKFXYCvxSDygAgIH0ICCEThDN15aPOxIpcE6a9XFNk9/yNbv9lZI2pbLquroygLZWaYjiHjwNlThuh5Bnmov8rVgvEc/GO3FkVuUDRNfdJX+fDvSUGsNjTx4FZTQvZDqLOlZUrCZV3A6UkTpAJPp5U1HkhbTNK1KO1hDHfTRmaO+3MBOuiJHiPjGs3tX3eDHPpIBfezm8qdA3Du++P9yie2KcryEwu+qsztpmhg/t+9teaocOw19KbvzUsqGDVz7yImDpaV8+/pJvEorhB03BMEq+0+47dlteH+Zu31DQ1uCbYSGEwu8eVe8XAV5LQpkIppf3b/12ClkEItuSvXN44zCE5ol8eR5DQm1+bEXMmVbGWhGIHlh7JPrOcq0xhxzYph9y7NVzfD82HuqBAGn1rWNq+6sfMic6+lfiDJ3U+yi2UXq39enowZcZjsByk3axofc4SYFkzMT8pn4t4ZLJox+Jsj7UPyAua3U7bM9kqLXtVeLRvGuAl+R/Gq3DPURrmPJbJdWIMQ98tcsyoEGg1EkJaBTD/iOwGI1qY3FCVwnCG7g2jhXtfTDlOKQiOppnr5N+ZfN7T/KdLIAqxeGC5osDgEDcKLckbfPn7so9iaKw/yKWVFus8hQH2CXvGRqQndpIgPt04UdUQ7gHNTP4gb5D6H6XpceDtBRyZWG6UD2fE/PalChC5fcDQaig3aiFAVuhUwHb4XdUFZD8TJOcG7WyvKNZ5dDjcBMjn4erKavgg7Jj/QjqAjZvz8v2N25PU0uPA1ijH2m8oe3wjasoVKfFqrXAxnlRrVTAx9Rt2t35O3d9seMY1VD1cxvhx8UHDOCLjxigRSsasgBtTxjk9LQ2bM93kJxWwpWF/wkOGs8hSBrXlfnY89GHUQWOtJCXaMD4/g33HUEJcG/vMw5aGKDwk8gdnwYizfaAQg5WnphZXc0jvq+uCALK2F8tb9yS+z8SSzkVHD7LipLlNm7iVKX9E7Qab18F177yWVVLPHF8bOgdKiV4Ho1pzw2IJWMrNCVK6eh9hAlE9Cve0HsJOz9gm0vNkQLrA8otUuZonLzwv0xiwSz7EZfNcu8lpd/j9NZKE07/18vbZsHZTxOz/j3yP7rJ0GFYoe/cwuDVPD7LHsYstDvdpLhTezicUvIX15kv6yXlmxAkqa1OrE48m/lcwQ47kXvLYGD/ywN06smLO9ofsrayurzBu9XD8S1yUg/m9u5/W6Zi3jm2897D86xWczGEfVHrr5EltXJ0oEyM3oHmgNGej11kCO18WuLWlsA9ne+YDUVBJwoJgrNOMKp6bEQm+2gyq1fitCw34uEoxMywrUfAZsodToTSIRFyuBqdju79F6161OvIZT1bfenlAzlgJ3KeOWVs80UuX/tnAD/YkaqJScfRXAAJXN5sNrk22LOY4SEwe++TLPsfjDfVHTwT697C/yqSqj/02lZNhbShwAbDMxpUS18n16CmVXPKOgmyBbA9fghU0R7PjSGS2AkVai3w6DMXfhoegUJkWB7Y0kpbXi6bXoZS40e439xsVUhvcLMtitZDBZ72Nlx8Vh/0NKr478w5TO/f6oGqVejdOZz8+dPc36K/GvglAgDX9OyHnkMDhJ9zQnqMqxqnbNc21fUodA6hYxnnliy6ITATvex/JviOPpZOZ4fHRDhF+WS8ZdQ+eXjDI7uAjNoEJQVmxh+c3Q6Pq9DAA3ePN+sLUQdI9qHZ8miTJIlGicBQyBg7zqVwsG68d25/sGGbGUiYw1T1xjfHELHgpPfOLFKP+1debeuyykyCVJIpSsw77a+gIGfJfaRyYb9hcLC4vvUUlN/jJN3S8xx3JIJS9zLNvcMqobBTXunVNNkGVVYHBGdrTwitDhs87i71lT6Owb8UbXN2QQblSW/2EnVhrC62UH46qzk608E8tKOuzXOu++a/Hg7Ny5IcB0pxvdAKBVQKpCaXI0eaIhpiEB1n1Pk56flQJOVmC1961q4q/YMQ9YjTWTtHOrxWnoTrDkG/mKGIgW/Z8CbJMwifx/Y+xuu6bD6mxDmv0IHWbF/7aN2jKzYht6Fc8gSH8ZvXrKMujbQb6ss5X3k46NMlRiMaUeVFdgF5UX7cye8fTc7nW1HwBIipt6VZyTBy3hh4xpApXf7X4kQ+KRdadGUshxpNO5ObgpM7CmGF3rA62+b0JZ/QkeFGSqzsJG9ZH6hE3ELqUcsj3J9B3TOXOJW5J2RTDlBB8TT6gIz+9RgBouWEn3yEp8QY7ZHIJYBO++TWSJ3SxBcacsGyBsjNmownqtDD/9CooHJA9JpBYMV79STRgS/CUXc+KLwm8GorAS9Y0GQSojSHxHscvVQB9y9xo1cMqj6+MB5S6gteI0/uFVasbVsTu7omKZHBjMCdkTlYBWdpJFshsdU19NFHvgQ4zPscdtcMfJj4qY1u/TN31Bjvg4IWOzBpbVcrJcBkaBgFcNSkP2mJkEL6ljPA+Lkjn2yqs2v/kDM3TXIrLDFsIdBg3UXotVpLuxnnB6apPP2IGcbFeZqEXOs4g0lmW26i3avqePdjAuPEI947/qiPsvoKdRjK1PF6LbTq0hgecqiKm12mfQn51KSWztooIXl7M7w+O0hMuJKhb98+bze7Bor0/E4Fl5V9/cAtMaPvU2dYQMHtpukO/o0bCFH9ZPtlk0twE6oaHEmWze1ACyIYGV7BpxEUVIqhKIo+pHLVVZnCCclIaVxF4NT51x2UwiU3m2lT2BSbOfam79eMLzlqqQk4fFAhve2oPGopzKARiNgWnrhclP5PDt+RDe2cTv4ySFMUsYaUVh2XxJ3wVV8lsdfMAXAc13BwFdGWOjtI0ZzoG1f1WCwGRmHHGudvcRDRgsQwqRH65oJpXaw7I1EON8WspsI7AN75BLRukIomn8cF7vCTnqwDVnFt5CLgYgIp0kuEV24naHSQWhV4biF4F2Vuus/X3FANVdgz+60YLUvsK/77XEIz5fckZ2WATkWa8dFSDpCPMImrpWmHvtQGnG34Z/ZVx257oK99J8bT6t7kuGvzfXb/LCUE7vpmEtff0OkEiGz9o9kw/6jGqbmk3MfL4jOseAX+MV/bWanG3DELrLm0rHl6v4GTy7gZzpZiMZF8Z2bLOzZHQ89MvF4ol8zkKGVK506ifivyJzgQeZ75hw6XL6mqbf7DJSZiyJJ+7awUhwQTyDR1//y4s96xTKqn0xqELHV14SbbP/rTNxQ01oHbo3WRek6AswWReuES6El9rAUgfg9SpYOm+a8Vm1CWNIt1JrVFUTcXTNxvxtFywxT/3At92fRpvr47WNBpbUxTPXrFCeTECkAv9epXPOd1QZHgwvaFcVqzJAqbzfY78mw6l+gT9RItEPPMNBgf8NTnVEk2S5aeWgNzEK/uR0em/f+0O/rCUonGiqxSxB7Jzc6voWo9EjofP1eY05ZpgUPFEH459PvjcufCcrSVQZ+jVaPpl3hBN3Ig2L4/hhgtro1WTYMQ0RvpmX5hC5F7SIPxVYU7jiP3Uyg5kRsdRdMjFytjAV5XPDF8jTq7N2fpHUri6ZSLnECSTchCYexxzaP8uN5WPHOqcKVVp4Q/imXJShFUN+dCbAPIvsovq+Hs6YSE4fRKmnEKL+gu7wZEuMhcV2mKWX1KOqDi9soURz3Pf/7zNkWRWIv+JTBYVk/xCQGXdiSHEnFFWYRL7N62WqCfIpRQELg3gl+27Kg6sG8kWmqdvnpW5GVYz3f0MgBhMNBgSjhE/kZr5h2ELqbbgUA4vJF8mGzCdIlhM8X8sztb3ynZSRZUnNwvY4AUGVqDzQgWJvLvppxKPd/2eyas0b30gh0DJIz+BMR62aN/98epEB9zQPoQf9guI3XAE42I4W0H0c0HtOosBopId/b2gepkyHwjb15gXO9lh2hMMEiVZ+Q8o8xZUg5yWUPlOb+Yv9gnigEcQurLDV8TdkuPlgTmeUkEg92KoQjmStYhGOYHuWu2dE3e/RlW5b0pXkGSqUz9YotYtHLwddi9842LnbYjV4w3tjz3RRKfFjxYtZ/bECGyTRPQyRbyP7/nnDUlkSydvMCeMbWWVk7hbVK6r/ZXrxT+UJGgz2gVGJgStS81V7h9SFImWSETU8EfdTfrCoHVSz/kWfcMi1xHEp3tcJtrzIXMmDBcgpv231Afd/CSP9f3/VifGyc3o/ABw22w6yVNRdDmsuU5Bm73xSqLj0g+hu336MqW15H/G3nbfImLn28HJpiPXi6Y2/nQyLtge3rVGv9rT3QOF7nvyOfGYm+9M6JRViNKxNpM5AIXNu001JZ0XCb43X3uLuPe4nSOQ6SN8SWKAQmjbWy/4iHvzi9PyqR1Ag4FP5P+BFC+wWSMhR+YKTPaEZ43z/LeaH9vP3nYsm+21eox7sRMAUU1W1SW7lqi66AM9YPDuIHydGF75URVGYFrZul/caXqpIumbz2kmxNoxWfmz/eIRnY2LuwKGVKToK6vBnFaa/IL9SGN00Aj+VRZZOMbSPu4NJUdNRik/UCtP5wQsGIEnhfXcmyNbTct44mzqTOs3y4BxL8fd429ZrQLFMCN2/XMIcnkbxYPIIe94NRe/QymbtYYnMafFxDbeZgboHFGBZ1zo/zsDHARmPdRAAGDSERHv/Vl5hh7YLxhP0z7c8+IzHvhTmf3jAqFk1kjnX5APyVLovrLqAcOiLvrcSPp1IIIde+sw7VZqgfd79XCCdBkj0iJiBOTmgQMFbPlA9JXeDRlwuSpAT9VD4YX9ml/02N3LXaNaYCb8qsW0ruePjtVqjHutrVZpZMcbfvLqaDK+EGZhAkCZD+q1B6+uHMOIKEYHLYJf7ufYecUVFAN9+2XXlpv3r/PIq8WsRay3H1jOJUFvakqogu6yBGUNPuu8+2XEIQdhz28DE/aSgvBvCfdoCuMpzwcKf3vI1axsEeKQfMOypBY4PMPJYbe4u9PTSjdDUvAu7Hv4oU3ayzH9PTts0EzFcmW91Vw5rduWxUO/fK4Y7uqjt0+RWFgYLpla5q5MI5xFM+LKBxUoFxOON+f+uIMfzhEcuclzMjF4V08DW5dJxwmcFO5uEleZQ+6aFJP+6XC505JZiDHBPQcL2nBg0rsVsKlSIjKhPpivo/Y4pW+8ev6wlds77ZXbpYNXLIl1jjhbe0QMo+N9cZLCSRfrPqc04UYWGHZ9Gq2RkzSEysPBm4aAd3t2aOj58HpriTyTAFWZccdhwLX3D+wWGgEUL4JhSj2+nIrXbj8DxSDZtjf+DwhyfTEfAHAVdYwfEK3GeAtp5wuwIQjr5NmLnupWhMjUq5x0AoO7oYNA7fHiq/yJ0adDccZNffZIcRPGBVs2TE2xlsYC5rFv/0mUn/PRxyTPAJkNv5ThXWALpGf/ICCQg05p+qNLkJPI9daoOBfWIoM9V/oxZpyb+bHHd+nr+tlT/aTj/Vy0Kennfy8pi7CDQAtf3gsiUo+EoJI3fYd6TXT9hBp/OhfElOpFXayp15vWreHWTAeObRwgREP68LD/4YBM5FEWoJnAXIxZl5O0eTZb0KPn39bmv0hoO2kcbXQztVgZFuQr/+4wRuGJwEJihjDmZVEXypmzgUkBstP5OP76RKPvv7PFtOuQVziqq0AUikluI6/SQ7fpV8CUY3IKvceqxcx8H9eLLYfYCMEneV3p252e7ZWf9kxKEbpyG47JSuKE783aY/4rz51x7JsCVDsvbmHIuuWBctpdO9CRse4oYVEUSia1Y+Ha0M5DOCzHnDCrX2MLEztOOozvheEtxjWUvXzblnzV0PGCOwvdNBIMHDUa4frt3+0gCbOpp/3KQazubtRG4cwRVz/L6mwqsiaxKX67KuhFtFWmTv5iK96TcG1huRWP6MzKHVVI/7/GrGclm+V3X7CqZQCe5zpj846Aeb+b9w9Y+lMDswHzAHBgUrDgMCGgQUkizIOZuPOSlCQQbX6pyRLDmW3MgEFDTy3zfKnUd9kquoBV7SwHW90rbHAgIH0A=="
$CertificatePassword="B2^wIvN8#9gv"
#$CertificatePassword="SAP & MAXIMO CEAMS"
$AuthCertificateData=  "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUduakNDQllhZ0F3SUJBZ0lNQXlmVlVUbXo5dHA2NlZ3Tk1BMEdDU3FHU0liM0RRRUJDd1VBTUdZeEN6QUoKQmdOVkJBWVRBa0pGTVJrd0Z3WURWUVFLRXhCSGJHOWlZV3hUYVdkdUlHNTJMWE5oTVR3d09nWURWUVFERXpOSApiRzlpWVd4VGFXZHVJRTl5WjJGdWFYcGhkR2x2YmlCV1lXeHBaR0YwYVc5dUlFTkJJQzBnVTBoQk1qVTJJQzBnClJ6SXdIaGNOTVRrd01UQXpNVEF5TmpBMFdoY05NakF3TVRBME1UQXlOakEwV2pDQm9ERUxNQWtHQTFVRUJoTUMKUjBJeEZqQVVCZ05WQkFnVERWZGxjM1FnVFdsa2JHRnVaSE14RVRBUEJnTlZCQWNUQ0VOdmRtVnVkSEo1TVJRdwpFZ1lEVlFRTEV3dEpUU0JUWlhKMmFXTmxjekVxTUNnR0ExVUVDZ3doUldSMVkyRjBhVzl1SUNZZ1UydHBiR3h6CklFWjFibVJwYm1jZ1FXZGxibU41TVNRd0lnWURWUVFEREJzcUxuQnNZWFJtYjNKdExtVmtkV05oZEdsdmJpNW4KYjNZdWRXc3dnZ0VpTUEwR0NTcUdTSWIzRFFFQkFRVUFBNElCRHdBd2dnRUtBb0lCQVFEUjlCaFljdUNKZmdZWAo4cjVWWE5BZElmaUZPa1pkZzM3eWRvYnl0dWk0cWFvc0JWajlnUk9jazZlRzFKV3M2Nzk4cWtWV01oVkp5RjB1CnM3M2JwZEpPeUJPSjl6aGxyZEN5WENXMWlPaWNCdW10R1U2Ym9aajZhMHVxWWxLNFFSSmFvZEU3dXdwSUIvdDAKOEkycUhTS2NxTU5wWGRsTkFzbEE1R05XVXljY0o1Rnp1SGFMUVNHMklnZ3VDR1FMQjA4aTRWUkMwVWRFSHN0bgoyWWNEUEZMVW1IZkNoVVVWQWVadlJ3SmJ6bXZsY08wSFJYV2cycDhmSUxTWFd3TlI4azYzSjV4ZU9IOE1GdVRMCkF5N2FlZzZRMEUzQnBCNVlEVk1CZ2dBUkxlNEs3aFY5QzdlT0l2SnY3MytOc1BhQWQ0VGdjQmp3eEFVSGFJSFgKVlpqVGFxUkJBZ01CQUFHamdnTVBNSUlEQ3pBT0JnTlZIUThCQWY4RUJBTUNCYUF3Z2FBR0NDc0dBUVVGQndFQgpCSUdUTUlHUU1FMEdDQ3NHQVFVRkJ6QUNoa0ZvZEhSd09pOHZjMlZqZFhKbExtZHNiMkpoYkhOcFoyNHVZMjl0CkwyTmhZMlZ5ZEM5bmMyOXlaMkZ1YVhwaGRHbHZiblpoYkhOb1lUSm5Nbkl4TG1OeWREQS9CZ2dyQmdFRkJRY3cKQVlZemFIUjBjRG92TDI5amMzQXlMbWRzYjJKaGJITnBaMjR1WTI5dEwyZHpiM0puWVc1cGVtRjBhVzl1ZG1GcwpjMmhoTW1jeU1GWUdBMVVkSUFSUE1FMHdRUVlKS3dZQkJBR2dNZ0VVTURRd01nWUlLd1lCQlFVSEFnRVdKbWgwCmRIQnpPaTh2ZDNkM0xtZHNiMkpoYkhOcFoyNHVZMjl0TDNKbGNHOXphWFJ2Y25rdk1BZ0dCbWVCREFFQ0FqQUoKQmdOVkhSTUVBakFBTUVrR0ExVWRId1JDTUVBd1BxQThvRHFHT0doMGRIQTZMeTlqY213dVoyeHZZbUZzYzJsbgpiaTVqYjIwdlozTXZaM052Y21kaGJtbDZZWFJwYjI1MllXeHphR0V5WnpJdVkzSnNNRUVHQTFVZEVRUTZNRGlDCkd5b3VjR3hoZEdadmNtMHVaV1IxWTJGMGFXOXVMbWR2ZGk1MWE0SVpjR3hoZEdadmNtMHVaV1IxWTJGMGFXOXUKTG1kdmRpNTFhekFkQmdOVkhTVUVGakFVQmdnckJnRUZCUWNEQVFZSUt3WUJCUVVIQXdJd0hRWURWUjBPQkJZRQpGQTV0a01nQVpsejlqOTZVdnNkNUs5QXBTNGpyTUI4R0ExVWRJd1FZTUJhQUZKYmVZZkc5SEJZcFV4ekF6SDA3Cmd3QkE1aHA4TUlJQkJBWUtLd1lCQkFIV2VRSUVBZ1NCOVFTQjhnRHdBSGNBaDNXLzUxbDgrSXhEbVYrOTgyNy8KVm8xSFZqYi9TclZnd2JUcS8xNmdndzhBQUFGb0V6K3VsZ0FBQkFNQVNEQkdBaUVBMUw0Rk5GWTU5aXhPdDdPSwpqa2xJa1RFRkFDdjZFamgveUNLVExlRjZQRVVDSVFENTlaZlZUS0w5V1U5ODhYV1VuYXIveGZ6K2phemFHS1VCCi9POFZQWUw4VlFCMUFMdlozN3dmaW5HMWs1UWpsNnFTZTBjNFY1VUtxMUxvR3BDV1pEYU9IdEdGQUFBQmFCTS8KcTBzQUFBUURBRVl3UkFJZ2NOMWhuTFgwMVd1MnNsd1VUNkRJMnJzbGwwNXdDN3dZc1U3QkRTMmk3OVVDSUErTQpueDF0UkdNYlJSL2FqSUFQSk1KTHl4N2d1Zk52WmNQWFMzdHJQWEdOTUEwR0NTcUdTSWIzRFFFQkN3VUFBNElCCkFRQTR4THU2NnVBRGFwdStFOGJnVU1kUkd2Q2hmTU81V1daUlMvejViV0tBWktKNkJiZ3FkaTJwK2tTeTFuakIKVmd1bitCOVFadUtIcVNpblNlb0twVndUbkVrRXg4VUJ4ZTlrK1ZmTDJHQ0hrZlEzcHByZkg0ZldCRnkyWjhuSApkbHlMYzgwbDBGUXFvZTdFUHdiL0w3V3hmYklTU1JOR2kzdmNGbW1pdmdYV1ZWV2JKOWM5aC9ybTV0VjJLc1NhCkl0Z253UFZDVnNmMlZvUHV4b1RFSnpSMkxSQmdUMWlTcW9DZnVyanRuOGQ3MUlGZkg0MUV0NGljZ3lONVowTWMKWklwR3BqWkIvVEZLSWtlUStYakFJTU9wN2poL0VqVXhaK3dVME96T2k4NzdlaW9QS2RUQWtZbzN4eGhMT3FRdgpJN2FJaXlmaVpoSENaYzdQRVdmaXFGYWQKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
=======
>>>>>>> 7beedb845e46b73b873401b90be6908cdf7a0dc5

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
<<<<<<< HEAD



=======



>>>>>>> 7beedb845e46b73b873401b90be6908cdf7a0dc5
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
<<<<<<< HEAD
#$filePath = "C:\Development\eapim.pfx"
#$DecodedText = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($CertificateData))

#$CertificateData | Out-File $tmpFile -Append 
[IO.File]::WriteAllBytes($tmpFile, [Convert]::FromBase64String($CertificateData))

$secureStringPassword = ConvertTo-SecureString $CertificatePassword -AsPlainText -Force
Add-AzureRmApplicationGatewaySslCertificate -ApplicationGateway $agw -Name ($ApimName + "-SSLCertificate") `
    -CertificateFile $tmpFile -Password $secureStringPassword
$sslCert = Get-AzureRmApplicationGatewaySslCertificate -ApplicationGateway $agw -Name ($ApimName + "-SSLCertificate") 

 Write-Verbose ("SSL Certificate data uploaded in Gateway via"+ $tmpFile.FullName)

# Add Authentication certificates
$tmpFileAuth = New-TemporaryFile
#$AuthCertificateData | Out-File $tmpFileAuth -Append 
[IO.File]::WriteAllBytes($tmpFileAuth, [Convert]::FromBase64String($AuthCertificateData))

Add-AzureRmApplicationGatewayAuthenticationCertificate  -Name ($ApimName + "-AuthCertificate") `
     -ApplicationGateway $agw -CertificateFile $tmpFileAuth 
=======
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
 
>>>>>>> 7beedb845e46b73b873401b90be6908cdf7a0dc5

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
<<<<<<< HEAD
}
=======
}
>>>>>>> 7beedb845e46b73b873401b90be6908cdf7a0dc5

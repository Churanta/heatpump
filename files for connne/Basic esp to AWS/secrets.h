//This is a header file named secrects.h


#include <pgmspace.h>
 
#define SECRET
#define THINGNAME "MQTT"                         //change this
 
const char WIFI_SSID[] = "Churanta";               //change this & give your wifi id 
const char WIFI_PASSWORD[] = "12345678";           //change this & give wifi password
const char AWS_IOT_ENDPOINT[] = "a35x3d81mfdvy6-ats.iot.ap-south-1.amazonaws.com";       //change this
 
// Amazon Root CA 1
static const char AWS_CERT_CA[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----
MIIDQTCCAimgAwIBAgITBmyfz5m/jAo54vB4ikPmljZbyjANBgkqhkiG9w0BAQsF
ADA5MQswCQYDVQQGEwJVUzEPMA0GA1UEChMGQW1hem9uMRkwFwYDVQQDExBBbWF6
b24gUm9vdCBDQSAxMB4XDTE1MDUyNjAwMDAwMFoXDTM4MDExNzAwMDAwMFowOTEL
MAkGA1UEBhMCVVMxDzANBgNVBAoTBkFtYXpvbjEZMBcGA1UEAxMQQW1hem9uIFJv
b3QgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALJ4gHHKeNXj
ca9HgFB0fW7Y14h29Jlo91ghYPl0hAEvrAIthtOgQ3pOsqTQNroBvo3bSMgHFzZM
9O6II8c+6zf1tRn4SWiw3te5djgdYZ6k/oI2peVKVuRF4fn9tBb6dNqcmzU5L/qw
IFAGbHrQgLKm+a/sRxmPUDgH3KKHOVj4utWp+UhnMJbulHheb4mjUcAwhmahRWa6
VOujw5H5SNz/0egwLX0tdHA114gk957EWW67c4cX8jJGKLhD+rcdqsq08p8kDi1L
93FcXmn/6pUCyziKrlA4b9v7LWIbxcceVOF34GfID5yHI9Y/QCB/IIDEgEw+OyQm
jgSubJrIqg0CAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
AYYwHQYDVR0OBBYEFIQYzIU07LwMlJQuCFmcx7IQTgoIMA0GCSqGSIb3DQEBCwUA
A4IBAQCY8jdaQZChGsV2USggNiMOruYou6r4lK5IpDB/G/wkjUu0yKGX9rbxenDI
U5PMCCjjmCXPI6T53iHTfIUJrU6adTrCC2qJeHZERxhlbI1Bjjt/msv0tadQ1wUs
N+gDS63pYaACbvXy8MWy7Vu33PqUXHeeE6V/Uq2V8viTO96LXFvKWlJbYK8U90vv
o/ufQJVtMVT8QtPHRh8jrdkPSHCa2XV4cdFyQzR1bldZwgJcJmApzyMZFo6IQ6XU
5MsI+yMRQ+hDKXJioaldXgjUkK642M4UwtBV8ob2xJNDd2ZhwLnoQdeXeGADbkpy
rqXRfboQnoZsG4q5WTP468SQvvG5
-----END CERTIFICATE-----
)EOF";
 
// Device Certificate                                               //change this
static const char AWS_CERT_CRT[] PROGMEM = R"KEY(
-----BEGIN CERTIFICATE-----
MIIDWTCCAkGgAwIBAgIUULBJzbZ4XtuDL/2TpjcGeNVZrQowDQYJKoZIhvcNAQEL
BQAwTTFLMEkGA1UECwxCQW1hem9uIFdlYiBTZXJ2aWNlcyBPPUFtYXpvbi5jb20g
SW5jLiBMPVNlYXR0bGUgU1Q9V2FzaGluZ3RvbiBDPVVTMB4XDTIyMTAxODEzMzAx
NVoXDTQ5MTIzMTIzNTk1OVowHjEcMBoGA1UEAwwTQVdTIElvVCBDZXJ0aWZpY2F0
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOP/ogf4VYjOB9FJc47M
x40ghOpkCTTdX+lArfn7GjI6tpxLXqkSWQxK2wcF8mcsh0uArkZnRioC0o6JCFft
ai153NPWjnKmAOd/9ldJuOvo6W3yYD7lNlt8mQ58qJxlBvEy+H//x/+ymXnM5mQL
ncx7T37tT7oasMcG/vRGZNk25/e1bvk7UbJfH+HvEfqQfFSot8/L18OnJSTmGTc3
FcbaiB+EyZd6EwRaGeRsVgVycrh2ODgQ4B8JgXr52LEj2VLOZ/GGhJIihWPdPZct
jdgYQd0Kx+ZF3CDPgaAsQ7ZhSIK95C1LcBq3QsT29m500w/Einj6hspd6/1SIdfF
IVMCAwEAAaNgMF4wHwYDVR0jBBgwFoAUic2OFwDYv7qjlvOEkS4Q3xQWhtYwHQYD
VR0OBBYEFEIsuOjJe+6SKYycu2DYqvic4di/MAwGA1UdEwEB/wQCMAAwDgYDVR0P
AQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4IBAQAoBOIbkHgjd0jyMfQpm4TOTV/1
nZeJ80SiExLxBhOea6xB4TvLs3+dlceMc4uemZ+X2iCtcn2EjsVjvWpPOZJHQAmU
JYWoxuUJXbWIvhqFjZRZyWjLweBjgdF8UjiO4FnGKztXG2DWAj695dGUd9lDa7Me
KNRhCXghY0uG+BDMnAx4ujJa7Kgt/rmBYY2AyF8/A61a/7iPa6Eo5dfP74nNLR7m
zsK1kCShQj43dxv3NMAV4fLqGDuV91q7VUtNxzwcQpfBjsFhcDvcNNfqG5hmPTij
4Onqt7PHrxaJb8rSDwwA/jid/ePDOV0sVN7a5RVwCdNRUMi/2GHmay9FC32U
-----END CERTIFICATE-----


 
 
)KEY";
 
// Device Private Key                                               //change this
static const char AWS_CERT_PRIVATE[] PROGMEM = R"KEY(
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEA4/+iB/hViM4H0UlzjszHjSCE6mQJNN1f6UCt+fsaMjq2nEte
qRJZDErbBwXyZyyHS4CuRmdGKgLSjokIV+1qLXnc09aOcqYA53/2V0m46+jpbfJg
PuU2W3yZDnyonGUG8TL4f//H/7KZeczmZAudzHtPfu1Puhqwxwb+9EZk2Tbn97Vu
+TtRsl8f4e8R+pB8VKi3z8vXw6clJOYZNzcVxtqIH4TJl3oTBFoZ5GxWBXJyuHY4
OBDgHwmBevnYsSPZUs5n8YaEkiKFY909ly2N2BhB3QrH5kXcIM+BoCxDtmFIgr3k
LUtwGrdCxPb2bnTTD8SKePqGyl3r/VIh18UhUwIDAQABAoIBAQCytYeiqaMZtSxp
fiJGtvpfAzNLqZeRyUdJRDpZ69lPr7e88FLFQS1tNitR6PZkqoFty/JOGtrjSQ0T
ThOtH9mOxasynEVRVg71ZdaH+rAosYpudIG+Ktmdgh9SPKHI3GNBocsoQSvZn3su
/k1D89r/EVRxT7+jRxJzHmeuvpKDskvole7YgyCwBHiDvuU6mJH2TnsP1i6jctEm
bSEZ2wTmYx3jaNR/TLjhcQtb3rnuJqXXTkboonrEWaJ+cMD91AlO0uVVT2q9BXyp
MH7b2Um976UYHQH1FgQs0fAURW9CRRkE758GBgpkb1/aNtYJ+QjgNauQGfvf54OZ
GhT2oKXxAoGBAPgAXdluz2lt1Cqht0ZKzWGgcx3G1qu39Pcg2xzKPKnW6q4U5wbU
6wrwTkkWACkf3z8vHD0fAKelW2ljCddjADadONNDVvHD7BtXiPYm4cnf846lsp90
WL8wUA+TiUmoL4EH/wfZIVYakgoSQGF+1mjXF+IevUAZgnw33GqGOQoLAoGBAOta
HKWCwcchoyFsiNz6H2gnZuWrM3Gyl8TYwmcp2B236Wle6NBCgVsVYIwGF+ePrj36
MD4XmzHjTe1k4d6d5+CNBvNm17LCAv7dEwyTg5QNJaghBcUDREENEqzPMmVO0wfP
3ISZoT3BUuyXY9Qjat7uECAdA4MNWtvG2Msxw5rZAoGAI+OJsUmD4nHuXi0A5L82
cYZSomB/+GGqpYivrL7ngHyFgaOsuyRczzxvV8xDQbBHElGy+HVgFuKrE9ktN2ow
QbcG3ivEjUAZDuvf+h8uVZR/HomEC+c+YIyRSW/EUlBwb2/EzFHzrQ4zTBnQD0vX
o1xdLG/eW0RVybwbvZ6m6nkCgYEA3wx8/8NnoTDY6RFyuHL4lv5Yv6u8SrImsjF4
NMtsfeXR+cIwRUfyTn95C9uuhhAe47AcToyS0foJ3cXxZskifCdMAhxiqpDCxAaD
SjT3y7WWDbyWOjw5UKlyHIMV0PuedtXhuW3caamxzHZB70hNvc/DSpwUuvxKMuZG
inS0XCkCgYEAoLuHK/kxMlRO9Zl/fDtIhe9fIk3L5HcU/V8r7EDaoqa3Bzi2yCqC
kIsxmf6u5THJN5Is4iblyxcgSBhmuuO0Rdl4NQQiiuyKCMfJCkgc+/Cr7eBetPfq
K83UWsJPtNw0dec1XuA4JyJUlBsATxyDReNkqlg3PuspxMA1+ITZh+g=
-----END RSA PRIVATE KEY-----


 
 
)KEY";
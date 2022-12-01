import time

def customCallback(client,userdata,message):
    print("callback came...")
    print(message.payload)

from AWSIoTPythonSDK.MQTTLib import AWSIoTMQTTClient

myMQTTClient = AWSIoTMQTTClient("MQTT_LISTENER")
myMQTTClient.configureEndpoint("a35x3d81mfdvy6-ats.iot.ap-south-1.amazonaws.com", 8883)
myMQTTClient.configureCredentials(r"C:\Users\Administrator\Desktop\certificates\Root.pem",r"C:\Users\Administrator\Desktop\certificates\Private_Key.key", r"C:\Users\Administrator\Desktop\certificates\Device_Ceryificate.crt")

myMQTTClient.connect()
print("Client Connected")

myMQTTClient.subscribe("esp32/pub", 1, customCallback)
#print('waiting for the callback. Click to conntinue...')
#x = input()

#myMQTTClient.unsubscribe("general/outbound")
#print("Client unsubscribed") 


#myMQTTClient.disconnect()
#print("Client Disconnected")

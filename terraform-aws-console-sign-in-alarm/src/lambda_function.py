import boto3
import json
import logging
import os

from base64 import b64decode
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError

# The base-64 encoded, encrypted key (CiphertextBlob) stored in the kmsEncryptedHookUrl environment variable
#ENCRYPTED_HOOK_URL = os.environ['kmsEncryptedHookUrl']
HOOK_URL = os.environ['HookUrl']
#HOOK_URL = "https://" + boto3.client('kms').decrypt(
#    CiphertextBlob=b64decode(ENCRYPTED_HOOK_URL),
#    EncryptionContext={'LambdaFunctionName': os.environ['AWS_LAMBDA_FUNCTION_NAME']}
#)['Plaintext'].decode('utf-8')

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Event: " + str(event))
    msg = str(event["detail"])
    userarn = str(event["detail"]["userIdentity"]["arn"])
    principalId = str(event["detail"]["userIdentity"]["principalId"])
    eventtype = str(event["detail"]["eventType"])
    sourceIP = str(event["detail"]["sourceIPAddress"])
    mfa = str(event["detail"]["additionalEventData"]["MFAUsed"])
    usr = principalId.split(":")
    USER = usr[1]
    iam = boto3.client('iam')
    # List account alias
    aliaslist = iam.list_account_aliases()
    print(aliaslist['AccountAliases'][0])
    alias = aliaslist['AccountAliases'][0]
    cloudwatch = boto3.client('cloudwatch')
    if 'AdministratorRole' in userarn:
        print ('User signed in with AdminRole!')
        cloudwatch.put_metric_data(
          MetricData=[
          {
            'MetricName': 'NumberOfSignIn',
            'Dimensions': [
                {
                    'Name': 'Username',
                    'Value': USER
                },
            ],
            'Unit': 'Count',
            'Value': 1
          },
          ],
          Namespace='CUSTOME/SignIn'
        )
        slack_message = {
            'text': "AccountAlias: %s \n PrincipleId: %s \n Arn: %s \n EventType: %s \n SourceIP: %s \n MFAUsed: %s" % (alias, principalId, userarn, eventtype, sourceIP, mfa)
        }
        req = Request(HOOK_URL, json.dumps(slack_message).encode('utf-8'))
        try:
          response = urlopen(req)
          response.read()
          logger.info("Message posted to the Slack")
        except HTTPError as e:
          logger.error("Request failed: %d %s", e.code, e.reason)
        except URLError as e:
          logger.error("Server connection failed: %s", e.reason)
    else:
        print ('No Admin role!')

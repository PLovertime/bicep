HOOK='https://arrowelectronics.webhook.office.com/webhookb2/9cfeef04-2f29-45f3-8b64-7182a2586bec@0beb0c35-9cbb-4feb-99e5-589e415c7944/IncomingWebhook/89c71f1ed8b944139bd79ee63c1e6752/b63d9226-97d3-40ff-be2d-88b4d98d08a9'
USERNAME=$(az ad signed-in-user show --query [displayName] -o tsv)
DATEANDTIME=$(date +%Y%m%d'-'%H%M)
JDEPPIGT="az deployment group create and a command that actually does stuff"
DEPLOY="Deployment:"
TITLE="echo RG"

cat manifestStart.json | sed "s/DEPLOY/$JDEPPIGT/;s/SYSTEMNAME/$TITLE/;s/USERNAME/$USERNAME/;s/DATEANDTIME/$DATEANDTIME/" > manifestStart-tmp.json
curl -H "Content-Type: application/json" -d @manifestStart-tmp.json $HOOK

#!/usr/bin/env bash

kubectl create namespace log-generator


# Create secret for log-generator to use
kubectl -n log-generator create secret generic dt-details \
  --from-literal=DT_ENDPOINT=$DT_URL \
  --from-literal=DT_API_TOKEN=$DT_OPERATOR_TOKEN \
  --from-literal=DT_LOG_INGEST_TOKEN=$DT_LOG_INGEST_TOKEN


kubectl apply -f deployment/LogGenerator.yaml -n log-generator

echo "Deployment complete!" 
echo "you can run..." 
echo "kubectl logs -f -n log-generator -l  app=log-generator"
echo "... to see logs shipped to your tenant API"

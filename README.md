# microservice-lab-tf
Terraform project that deploys an API gateway directing requests to a Lambda function running nodeJS in AWS. 

Modeled after a tutorial provided by Amazon: 

https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-dynamo-db.html#http-api-dynamo-db-create-function

## Requirements
- AWS Account + way to connect credentials to terraform 
- ARN of a role that can deploy and manage API gateways, lambda functions (see below)

## Variables
- credentials: - ARN mentioned above
- njs_runtime: - nodejs runtime 
- file_name: - name of a zip containing nodejs code to deploy 
- table_name: - name of DynamoDB table, referenced in nodejs code and should be changed accordingly 

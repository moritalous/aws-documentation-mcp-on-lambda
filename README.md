# AWS Documentation MCP on Lambda

This project is a serverless application that implements the AWS Documentation Model Context Protocol (MCP) server on AWS Lambda with response streaming capabilities.

## Project Overview

This application deploys a Lambda function that supports response streaming using AWS SAM (Serverless Application Model). The main features include:

- AWS Documentation search and retrieval functionality using the Model Context Protocol (MCP)
- Real-time responses utilizing Lambda Response Streaming
- Python-based implementation of the MCP server

## About the Libraries Used

This project uses a fork of the AWS Documentation MCP server with experimental support for streamable HTTP:

- **Repository**: [github.com/moritalous/mcp](https://github.com/moritalous/mcp/tree/experimental_support_streamable_http/src/aws-documentation-mcp-server)

## Architecture

This application consists of the following components:

- **MCPStreamableFunction**: Lambda function using Python 3.12 runtime
- **Lambda Adapter Layer**: Layer to support response streaming
- **Function URL**: Endpoint for direct access to the Lambda function without authentication

## Prerequisites

To use this project, you need:

- [AWS CLI](https://aws.amazon.com/cli/)
- [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)
- [Python 3.12](https://www.python.org/downloads/)
- [Docker](https://www.docker.com/products/docker-desktop)

## Setup and Deployment

### Setting up the Local Development Environment

```bash
# Clone the repository
git clone https://github.com/moritalous/aws-documentation-mcp-on-lambda.git
# Navigate to the project directory
cd aws-documentation-mcp-on-lambda
```

### Build and Deploy

```bash
# Build the application
sam build

# Deploy the application (interactive for the first time)
sam deploy --guided
```

During deployment, you will be prompted to enter the following information:

- **Stack Name**: Name of the CloudFormation stack (e.g., aws-documentation-mcp-on-lambda)
- **AWS Region**: Region to deploy to
- **Confirm changes before deploy**: Whether to confirm changes
- **Allow SAM CLI IAM role creation**: Whether to allow IAM role creation
- **Save arguments to samconfig.toml**: Whether to save the configuration

After deployment completes, the Lambda Function URL will be output. You can use this URL to access the API.

## Features and Endpoints

This application provides the following endpoints:

- **POST /mcp/**: Initialize and send MCP requests
- **GET /mcp/**: Health check endpoint

## Implemented Tools

This MCP server implements AWS Documentation tools:

1. **search_documentation**: Search AWS documentation
   - Parameter: `search_phrase` (string)
   - Parameter: `limit` (integer, optional)

2. **read_documentation**: Read AWS documentation page
   - Parameter: `url` (string)
   - Parameter: `max_length` (integer, optional)
   - Parameter: `start_index` (integer, optional)

3. **recommend**: Get content recommendations for an AWS documentation page
   - Parameter: `url` (string)

## Testing Connection from Local to Lambda

You can test the connection to your deployed Lambda function using an MCP client that supports the Model Context Protocol.

## Resource Cleanup

To remove resources when no longer needed:

```bash
sam delete --stack-name <your-stack-name>
```

## Additional Information

- [AWS SAM Developer Guide](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html)
- [Lambda Response Streaming](https://docs.aws.amazon.com/lambda/latest/dg/configuration-response-streaming.html)
- [Model Context Protocol](https://github.com/anthropics/model-context-protocol)

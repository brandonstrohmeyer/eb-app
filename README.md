# lemony
Automatically deploys a web app in AWS.

Requires:
- Terraform
- Packer
- NodeJS
- Express (via NPM)
- PM2 (via NPM)
- Python 3

This app does not assume a default VPC is available and constructs a 'build' environment for use by Packer.

Packer builds the AMI, using NodeJS and Express to handle incoming web requests. PM2 manages the Express server and starts it on boot.

The 'production' environment hosts an ALB which balances incoming HTTP requests to a backend ec2 instance listening on port tcp/8080.

All AWS infrastructure is built via Terraform.

# Output Sample
https://gist.github.com/brandonstrohmeyer/dd11f19c64fb2e4e64b2461802aa79ee


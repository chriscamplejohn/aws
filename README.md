# AWS
Useful things for working with AWS

# AWS Assume Role
The aws-assume-role script is a python script that has been tested on mac and windows and deals with logging in and assuming a role via the AWS CLI.

## Prerequisites
- AWS CLI Version 2. Links: [Windows MSI](https://awscli.amazonaws.com/AWSCLIV2.msi) | [macOS Package](https://awscli.amazonaws.com/AWSCLIV2.pkg) | macOS Homebrew ```brew install awscli```
- Python Version 3. Links: [Windows](https://www.python.org/downloads/windows/) (NOTE: You can also install via Windows Store) | [macOS](https://www.python.org/downloads/mac-osx/) | macOS Homebrew ```brew install python```
- Configured AWS CLI - you should have a default profile with ```config``` and ```credentials``` files at ```%USERPROFILE%\.aws``` on Windows and ```~/.aws``` on macOS

## Configuration
In your AWS config file (```%USERPROFILE%\.aws\config``` on Windows and ```~/.aws/config``` on macOS), setup the details for the AWS account you want to assume a role in. It should look something like this for a profile named test

```
[profile test]
account = 111111111111
role = my_role
region = my_region
output = json
```

Replace the following as appropriate
- account 111111111111 with the account you are assuming the role in
- my_role with the rolw you are assuming in the target account
- my_region with the default region you want to use e.g. eu-west-2 for London

You can also change the default output from json if you prefer.

In your AWS credentials file (```%USERPROFILE%\.aws\credentials``` on Windows and ```~/.aws/credentials``` on macOS), setup your MFA details by addding the following to your default profile

```
aws_mfa_secret = my_mfa_secret
aws_arn_mfa = arn:aws:iam::my_iam_account:mfa/my_username
```

Replace the following as appropriate
- my_mfa_secret with the secret that is used to generate your MFA (you will need to re-setup your MFA if you do not have this)
- my_iam_account with the AWS account ID for the account your IAM user is in (the account you use to initially login to the AWS console)
- my_username with your IAM username

## Running
To login to your default AWS account using MFA, then assume the role in the account for the profile named test that we setup above you can run

Windows:
```
python aws-assume-role --profile test
```

macOS:

```
./aws-assume-role --profile test
```
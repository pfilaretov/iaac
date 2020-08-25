# Infrastructure as a code example

Simple example on how to create AWS infrastructure and run the app in a single command with Terraform.

It will create 
- AWS EC2 instance with EBS volume
- AWS security groups for SSH and HTTP access

## How to run

1) Install AWS CLI
1) Configure it:
    ```
    aws configure --profile pf
    ```
1) Make sure the configuration is saved to `%userprofile%/.aws/credentials`
1) Create AWS Key Pair (via AWS Console) with the following name: `iaac_key_pair`
1) Save private key as `%userprofile%/.aws/iaac_key_pair.ppk`
1) Run terraform which will show the plan and ask for confirmation:
    ```
    terraform apply
    ```
1) Confirm execution
1) Wait for about 5 mins after terraform script is done, so that all the scripts on EC2 instance are finished
1) Open the link provided by terraform output

## Things to keep in mind

- Make sure `start.sh` script uses Linux line endings (`LF`), not Windows ones (`CRLF`)

- Each run of `terraform apply` terminates and creates a new EC2 instance, but it does NOT terminate EBS volume! 
And a new volume is created with every new EC2 instance. Thus, you may get out of the free tier limit.

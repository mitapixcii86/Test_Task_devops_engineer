
#### Getting started

####  What are we building ?
Automate Infra Provising Terraform & Ansible in AWS
    ### Application Stack
    
    ○ Load Balancer
    ○ 3 Web Servers
        ■ Docker app:
            nginx, php-cgi 
    ○ Postgres Server

    ### Tech/framework used
        AWS CLI
        Terraform
        Ansible


### Prerequisites
    ## Installation
        AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
        Terraform (v3.10.0 used for development this project ) - https://learn.hashicorp.com/tutorials/terraform/install-cli 
        Ansible (2.9.2 used for development of this project) -  https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html 


## Execution steps

To run : ansible-playbook ansible/cicd.yml

To destroy : ansible-playbook ansible/destroy.yml

## Expected results 

Applying this Terraform configuration returns the load balancer's public URL on the last line of output.  This URL can be used to view the default webapplication website page. Also, the ouput provids rds address. So, the output should look like this:

postgress-address = address: db.cw005b9fmtrd.us-east-1.rds.amazonaws.com
url = http://docker-test-devops-alb-1424055070.us-east-1.elb.amazonaws.com/

#### common faq's/ tips

### Access credentials
AWS access credentials must be supplied on the command line (see example below).  This Terraform script was tested in my own AWS account with a user that has the `AmazonEC2FullAccess` and `AmazonVPCFullAccess` policies.  It was also tested in the Splice-supplied AWS account with a user that has the `AdministratorAccess` policy.

### EC2 Keypair 
The EC2 keypair name and ey gets generated automatically within the code. However if you wish to use your own generated key you can make modification (In var.tf-> Uncomment line24 & In ec2.tf-> Uncomment #16 & Comment #17)

### AWS user and secret key
Please make sure your terraform , aws cli and ansible has the aws_access_key and aws_secret_key setup. If it is not setup, uncomment the section in var.tf and provider.tf and provide the key as default value. 








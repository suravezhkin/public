Terraform VPC, RDS, ec2 - EDUCATIONAL

Impossible to use without changing the variable.tf!!! ("your ssh key name here" field must be appropriate!)

Warning! For educational purpose only! Not recommended to use for real projects.
This is not a best practice example!
It only shows you the principled approach!
And how to retrieve info from outputs.tf )))

Prerequisites: you must understand how to use Terraform (init, plan, apply) and how to change "your ssh key name here" at lest )))

This Terraform module will create in AWS:
- Virtual Private Cloud (VPC).
- 3 subnets: public, private, DB in 2 Availability Zones
- 1 ec2 instance in public zone, 1 ec2 instance in private zone (with appropriate security groups; ec2 instances are Ubuntu Server 20.04 LTS (HVM), (ami-06148e0e81e5187c8))
- RDS with Postgres (and appropriate security group, db.t3.micro)
- Public ec2 instance takes a bastion host role
- outputs.tf will show you some basic information

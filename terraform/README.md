# Problem

Terraform Script for App Server, Load Balancer, and Database:
Compose a Terraform script to deploy an app server integrated with a load balancer and database. Design the configuration to handle external traffic efficiently. Prioritize flexibility and reusability in the Terraform script

# Implementation

The code has been divided into modules for reusability. In an ideal scenario packaging those modules and uploading to the repository manager, will allow those to be used oustide of this code to build the repective infrastructure.
Moreover, for it to be production ready all properties supported for each aws resource by the provider can be made available and certain standards can be set for everyone using to conform to it.
Like even tags can converted into a module where it can be standardised what tags are mandatory for every service.
As a lot of it can automated on the organization level based off of tags also can be used for things like cost showback.

Security group rules are designed in a way to allow all https traffic to the loadblancer. Then load balancer to the app servers and from app server to the database.


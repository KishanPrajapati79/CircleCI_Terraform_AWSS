Introduction:
This project leverages Terraform, GitHub, and CircleCI to provision AWS resources, including EC2 servers, KeyPairs for secure access, VPCs, Subnets, security groups and Route tables. By employing Infrastructure as Code (IaC) and CI/CD principles, it simplifies resource management and change tracking. The project also automates infrastructure deployments through version control systems (VCS) and CircleCI workflows. It is particularly useful for organizations aiming to manage complex and large-scale cloud infrastructures efficiently

Features:
Utilizes Terraform for defining and provisioning infrastructure.
Ensures consistent and repeatable infrastructure setup.
Provides a clear audit trail of changes and deployments.
Uses S3 as a backend for securely storing the state file.
Handling sensitive data securely.
Reduces manual intervention and potential for errors.
Flexible to adapt to changing project requirements.

Project Flow:
Adding infrastructrue code to our terraform file.
Pushing the changes to GitHub.
Automatic Trigger of CircleCI pipeline
Step to manual approval before applying the final changes to our Cloud Platform. (As per the requirement of project)
Resources provisioned on the cloud platform.
To update resources, modify the Terraform files and push changes to GitHub for automatic updates.
The provisioned resources can be destroyed locally if needed.
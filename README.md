Introduction:
This project leverages Terraform, GitHub, and CircleCI to provision AWS resources, including EC2 servers, KeyPairs for secure access, VPCs, Subnets, security groups and Route tables. By employing Infrastructure as Code (IaC) and CI/CD principles, it simplifies resource management and change tracking. The project also automates infrastructure deployments through version control systems (VCS) and CircleCI workflows. It is particularly useful for organizations aiming to manage complex and large-scale cloud infrastructures efficiently

Features:
- Utilizes Terraform for defining and provisioning infrastructure. <br>
- Ensures consistent and repeatable infrastructure setup. <br>
- Provides a clear audit trail of changes and deployments. <br>
- Uses S3 as a backend for securely storing the state file. <br>
- Handling sensitive data securely. <br>
- Reduces manual intervention and potential for errors. <br>
- Flexible to adapt to changing project requirements. <br>

Project Flow:
- Adding infrastructrue code to our terraform file. <br>
- Pushing the changes to GitHub. <br>
- Automatic Trigger of CircleCI pipeline <br>
- Step to manual approval before applying the final changes to our Cloud Platform. (As per the requirement of project) <br>
- Resources provisioned on the cloud platform. <br>
- To update resources, modify the Terraform files and push changes to GitHub for automatic updates. <br>
- The provisioned resources can be destroyed locally if needed.
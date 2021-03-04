## terraform-aws-trafficinfo

This template is a starting point for creating terraform modules.

Terraform modules should be in a state that they can be published to the Terraform Module Registry. Guidelines can be 
found here https://www.terraform.io/docs/registry/modules/publish.html

To use a module in your terraform code include the following:

```
module "ecs-microservice" {
  source = "github.com/nsbno/terraform-aws-trafficinfo?ref=XXXXXX/ecs-microservice"

  .....
}
```

Where XXXXXX should be replaced with a commit in this repo you wish to refer to (typically the latest commit on master).

Note that your terraform version needs to be 0.12.0 or later to use these modules.

module "asg" {
  source  = "git::https://github.com/tmiklu/terraform-modules.git//terraform-aws-autoscaling-9.0.2?ref=main"
}

module "kms" {
  source  = "git::https://github.com/tmiklu/terraform-modules.git//terraform-aws-kms-4.1.1?ref=main"
}
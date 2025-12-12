module "asg" {
  for_each                = var.asg
  source                  = "git::https://github.com/tmiklu/terraform-modules.git//terraform-aws-autoscaling-9.0.2?ref=main"
  name                    = each.value.name
  min_size                = each.value.min_size
  desired_capacity        = each.value.desired_capacity
  max_size                = each.value.max_size
  image_id                = each.value.image_id != null ? each.value.image_id : "ami-07be7092831897fd6"
  instance_market_options = lookup(each.value, "instance_market_options", null)
  tags                    = merge(local.tags, var.tags)

  #availability_zones = var.availability_zones
}
asg = {
  data = {
    name             = "data"
    min_size         = 2
    desired_capacity = 0
    max_size         = 6
    instance_type    = "r6a.large"
    instance_market_options = {
      market_type = "spot"
      spot_options = {
        max_price = 0.3
      }
    }
    block_device_mappings = [
      {
        # Root volume
        device_name = "/dev/xvda"
        no_device   = 0
        ebs = {
          delete_on_termination = true
          encrypted             = true
          volume_size           = 30
          volume_type           = "gp3"
        }
      }
    ]
  }
  workers = {
    name             = "worker"
    min_size         = 0
    desired_capacity = 1
    max_size         = 10
    instance_type    = "t3.xlarge"
    instance_market_options = {
      market_type = "spot"
      spot_options = {
        max_price = 2
      }
    }
    block_device_mappings = [
      {
        # Root volume
        device_name = "/dev/xvda"
        no_device   = 0
        ebs = {
          delete_on_termination = true
          encrypted             = true
          volume_size           = 40
          volume_type           = "gp3"
        }
      }
    ]
  }
  monitoring = {
    name             = "monitoring"
    min_size         = 1
    desired_capacity = 1
    max_size         = 1
    instance_type    = "m6a.2xlarge"
    block_device_mappings = [
      {
        # Root volume
        device_name = "/dev/xvda"
        no_device   = 0
        ebs = {
          delete_on_termination = true
          encrypted             = true
          volume_size           = 20
          volume_type           = "gp3"
        }
      }
    ]
  }
}

tags = {
  namespace   = "fedramp"
  environment = "dev"
  owner       = "devops"
  managed_by  = "terraform"
}
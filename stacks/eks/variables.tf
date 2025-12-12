variable "asg" {
  type = map(object({
    name             = string
    min_size         = number
    desired_capacity = number
    max_size         = number
    instance_type    = string
    image_id         = optional(string)
    instance_market_options = optional(object({
      market_type = string
      spot_options = object({
        max_price = number
      })
    }))
  }))
  description = "Auto Scaling Group configurations"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to resources"
  default     = {}
}
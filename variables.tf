variable "name" {}

variable "type" {}

variable "settings" {
  type = object({
    bucket    = optional(string)
    base_path = optional(string)
    readonly  = optional(string)
    container = optional(string)
  })
}

variable "lifecycle_policies" {
  type = map(object({
    snapshot_name        = optional(string, "<daily-snap-{now/d}>")
    schedule             = optional(string, "0 0 0 * * ?")
    indices              = optional(set(string), ["*"])
    ignore_unavailable   = optional(bool, false)
    include_global_state = optional(bool, false)
    expire_after         = optional(string, "90d")
  }))
  default  = {}
  nullable = true
}
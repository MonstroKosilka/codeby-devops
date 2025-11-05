variable "default_zone" {
  description = "Default availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "selected_network" {
  description = "Выбранная сеть для задания"
  type = string
  default = "lesson15-network-2"
}

variable "selected_zone" {
    description = "Выбранная зона для создания VM"
    type = string
    default = "ru-central1-a"
}


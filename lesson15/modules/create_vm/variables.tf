variable "default_zone" {
  description = "Default availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "zone" {
    description = "Зона для создания ВМ"
    type = string
}

variable "subnet" {
    description = "Подсети"
    type = list(string)
}

variable "VPC" {
    description = "Имя VPC"
    type = string
}
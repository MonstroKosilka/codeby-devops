variable "vpc_name" {
  description = "Имя VPC для работы в моделу получения данных"
  type = string
}

variable "default_zone" {
  description = "Default availability zone"
  type        = string
  default     = "ru-central1-a"
}


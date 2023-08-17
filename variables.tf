variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}

variable "image_id" {
  description = "The AWS EC2 instance image ID"
  type = string
  default = "ami-09420243907777c4a"
}
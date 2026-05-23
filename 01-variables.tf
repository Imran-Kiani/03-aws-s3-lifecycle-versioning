variable "aws_region" {
  default = "eu-north-1"
}

variable "bucket_name" {
  default = "imran-kiani-portfolio-786" # یہاں اپنا پسندیدہ یونیک نام لکھیں
}

variable "iam_user_name" {
  default = "s3-portfolio-deployer"
}
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "saffron-spider-portfolio" # یہاں آپ کوئی بھی نام دے سکتے ہیں
}
variable "index_document" {
  description = "The name of the index document"
  type        = string
  default     = "index.html"
}
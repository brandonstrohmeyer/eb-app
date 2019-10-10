# Variables required for Terraform to build the required infrastructure

variable "public_key" {
    description = "Public key of keypair to be created, passed as TF_VAR_public_key environment variable in GitLab"
    default = ""
}

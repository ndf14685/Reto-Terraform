terraform {
  backend "s3" {
    bucket                      = "space-dev1"
    key                         = "terraform-k8s-digitalocean/terraform.tfstate"
    region                      = "nyc3"
    endpoint                    = "nyc3.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
    skip_region_validation      = true
    access_key      = "${DIG_OC_ACCESSKEY}"
    secret_key      = "${DIG_OC_SECRETKEY}"
#    token           = "${TF_VAR_do_token}"
  }
}


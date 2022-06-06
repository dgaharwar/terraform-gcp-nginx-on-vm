terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.36.0"
    }
  }
}

provider "google" {
  credentials = file(var.credential)

  project = var.project
  region  = "aus-central1"
  zone    = "us-central1-b"
}

module "vm" {
  source     = "../"
  project    = "Project2"
  app_name   = "use-modules"
  credential = "../../credential.json"
  tpl_file   = "apache.tpl"
}

output "ip" {
    value = module.vm.webserver_ip
}

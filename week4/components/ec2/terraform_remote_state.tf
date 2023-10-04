data "terraform_remote_state" "networking" {
    backend = "s3"
    config = {
      region = var.region
      bucket = var.s3-state-bucket
      key = "state/kpa-jack-2023-state-s3-tfstate-networking.tfstate"
    }
  
}
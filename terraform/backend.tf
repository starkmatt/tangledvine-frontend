terraform {
    backend "s3" {
        bucket = "tangledvine-tfstate"
        key    = "tangledvine-tfstate/tf-state/terraform.tfstate"
        region = "ap-southeast-2"
    }
}
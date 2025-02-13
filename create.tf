terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.0.34"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
}

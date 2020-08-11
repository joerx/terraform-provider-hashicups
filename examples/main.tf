terraform {
  required_providers {
    cheesecake = {
      versions = ["0.2"]
      source   = "example.com/joerx/cheesecake"
    }
  }
}

provider "cheesecake" {}

module "psl" {
  source = "./coffee"

  coffee_name = "Packer Spiced Latte"
}

output "psl" {
  value = module.psl.coffee
}

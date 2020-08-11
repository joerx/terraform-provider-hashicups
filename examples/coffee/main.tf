terraform {
  required_providers {
    cheesecake = {
      versions = ["0.2"]
      source   = "example.com/joerx/cheesecake"
    }
  }
}

variable "coffee_name" {
  type    = string
  default = "Vagrante espresso"
}

data "cheesecake_coffees" "all" {}

# Returns all coffees
output "all_coffees" {
  value = data.cheesecake_coffees.all.coffees
}

# Only returns packer spiced latte
output "coffee" {
  value = {
    for coffee in data.cheesecake_coffees.all.coffees :
    coffee.id => coffee
    if coffee.name == var.coffee_name
  }
}

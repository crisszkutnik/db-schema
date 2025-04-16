variable "db_dev_url" {
  type    = string
  default = "postgresql://testuser:testpassword@localhost:5432/testdb?sslmode=disable"
}

variable "db_prod_url" {
  type    = string
  default = getenv("DB_PROD_URL")
}

env "dev" {
  src = "file://schema"

  url = var.db_dev_url
  dev = var.db_dev_url

  migration {
    dir = "file://migrations"
  }

  format {
    migrate {
      diff = "{{ sql . \"    \" }}"
    }
  }
}

env "prod" {
  url = var.db_prod_url

  migration {
    revisions_schema = "public"
  }
}
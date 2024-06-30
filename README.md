##Step by Step implementation of Snowflake CI-CD (Continious Integration & Continious Deployment) as Github Actions & Infrastructure automation tool as Terraform 
#Step:-1
First let's walk through the terraform configuration files as follows .Snowflake configuration setup from scratch by Infratructure provisioning tool to reduce manual intervention 

Create main.tf


#Step2 :-

Create the Terraform main configuration file as "main.tf"

#Step3 :-

Create a seperate variables.tf file to provide all values which will call to main.tf 

#Step4 :-

Create a non-sensitive configuration file as "terraform.tfvars" to ensure the reusebaility across multiple environments by just applying the value of Snowflake account & region .

#Step5 :- 
We will kept all of the sensitive configuration information in Github secrets by the following steps :-

In your GitHub repository, go to Settings > Secrets and create new secrets for SNOWFLAKE_USERNAME, SNOWFLAKE_PASSWORD, SNOWFLAKE_ACCOUNT, and SNOWFLAKE_REGION.

#Step6 :-
Create a .github/workflows directory in your repository. Inside this directory, create a YAML file for your GitHub Actions workflow such github/workflows/CI-CD.yml

This a pipeline configuration file which trigerrs CI & CD whenever any changes made into the respective DB & Schema .


#Step7 :-
Now, below is the Tree structure of this project 

Snowflake-CI-CD-Terraform
├── .github/
│   └── workflows/
│       └── CICD.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── terraform.tfvars
├── .gitignore
└── README.md



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





resource "snowflake_database" "Demo-testing-DB" {
  name = "FDB_MNG_TRANSFORM_LYR "
}

resource "snowflake_schema" "Demo-testing-schema" {
  database = snowflake_database.Demo-testing-DB.name
  name     = "SCH_MNG_TL"
}

resource "snowflake_table" "Demo-testing-table" {
  database = snowflake_database.Demo-testing-DB.name
  schema   = snowflake_schema.Demo-testing-schema.name
  name     = "METRICS_T"

  column {
    name = "ACTION"
    type = "Boolean(38,0)"
  }

  column {
    name = "END_TIMESTAMP"
    type = "Timestamp_NTZ"
  }
  column {
    name = "INPUT_FILE_PATH"
    type = "Varchar"
  }
}

# Snowflake resource Incremental Data Change:-

resource "snowflake_table_column" "new_columns" {
  table  = snowflake_table.FDB_Table.name
  schema = snowflake_schema.SCH_Devops_2024.name
  database = snowflake_database.FDB_Devops_2024.name

  column {
    name     = "OWNER_FIRST_NAME"
    type     = "VARCHAR(255)"
    nullable = true
  }

  column {
    name     = "OWNER_LAST_NAME"
    type     = "VARCHAR(255)"
    nullable = true
  }

  column {
    name     = "OWNER_PINCODE"
    type     = "NUMBER(38,0)"
    nullable = true
  }
}
  

# Terraform-Snowflake-GithubActions new resource creation :-

name: Snowflake Terraform Demo Workflow

on:
  push:
    branches:
    - main

jobs:
  snowflake-terraform-demo:
    name: Snowflake Terraform Demo Job
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v1

    - name: Terraform Format Check
      id: fmt
      run: terraform fmt -check
      continue-on-error: true

    - name: Set Formatting Output
      if: failure()
      run: echo "terraform_fmt_check=failed" >> $GITHUB_ENV

    - name: Terraform Init
      id: init
      run: terraform init

    - name: Terraform Validate
      id: validate
      run: terraform validate

    - name: Terraform Plan
      run: terraform plan -out=tfplan -parallelism=20 -var="snowflake_account=${{ secrets.SNOWFLAKE_ACCOUNT }}" -var="snowflake_user=${{ secrets.SNOWFLAKE_USER }}" -var="snowflake_password=${{ secrets.SNOWFLAKE_PASSWORD }}"

    - name: Terraform Apply
      if: github.ref == 'refs/heads/main'
      run: terraform apply -auto-approve tfplan


# Terraform-Snowflake-Github-Actions 

Incremental data changes CI-CD yaml script :-

name: Snowflake Terraform Demo Workflow

on:
  push:
    branches:
      - main

jobs:
  snowflake-terraform-demo:
    name: Snowflake Terraform Demo Job
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1

      - name: Terraform Format Check
        id: fmt
        run: terraform fmt -check
        continue-on-error: true

      - name: Set Formatting Output
        if: failure()
        run: echo "terraform_fmt_check=failed" >> $GITHUB_ENV

      - name: Terraform Init
        id: init
        run: terraform init

      - name: Terraform Validate
        id: validate
        run: terraform validate

      - name: Import Snowflake Database
        run: terraform import snowflake_database.FDB_Devops_2024 FDB_Devops_2024
        env:
          SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
          SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_USER }}
          SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}

      - name: Import Snowflake Schema
        run: terraform import snowflake_schema.SCH_Devops_2024 FDB_Devops_2024.FDB_SCH_Devops_2024
        env:
          SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
          SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_USER }}
          SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}

      - name: Import Snowflake Table
        run: terraform import snowflake_table.FDB_Table FDB_Devops_2024.FDB_SCH_Devops_2024.FDB_Table
        env:
          SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
          SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_USER }}
          SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}

      - name: Terraform Plan
        run: terraform plan -out=tfplan -parallelism=20 -var="snowflake_account=${{ secrets.SNOWFLAKE_ACCOUNT }}" -var="snowflake_user=${{ secrets.SNOWFLAKE_USER }}" -var="snowflake_password=${{ secrets.SNOWFLAKE_PASSWORD }}"

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main'
        run: terraform apply -auto-approve tfplan
        env:
          SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
          SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_USER }}
          SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}

      - name: Terraform Destroy
        if: github.event_name == 'workflow_dispatch'
        run: terraform destroy -auto-approve -var="snowflake_account=${{ secrets.SNOWFLAKE_ACCOUNT }}" -var="snowflake_user=${{ secrets.SNOWFLAKE_USER }}" -var="snowflake_password=${{ secrets.SNOWFLAKE_PASSWORD }}"
        env:
          SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
          SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_USER }}
          SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}


# New Snowflake resources creation :-

name: Snowflake Terraform Demo Workflow

on:
  push:
    branches:
    - main

jobs:
  snowflake-terraform-demo:
    name: Snowflake Terraform Demo Job
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v1

    - name: Terraform Format Check
      id: fmt
      run: terraform fmt -check
      continue-on-error: true

    - name: Set Formatting Output
      if: failure()
      run: echo "terraform_fmt_check=failed" >> $GITHUB_ENV

    - name: Terraform Init
      id: init
      run: terraform init

    - name: Terraform Validate
      id: validate
      run: terraform validate

    - name: Terraform Plan
      run: terraform plan -out=tfplan -parallelism=20 -var="snowflake_account=${{ secrets.SNOWFLAKE_ACCOUNT }}" -var="snowflake_user=${{ secrets.SNOWFLAKE_USER }}" -var="snowflake_password=${{ secrets.SNOWFLAKE_PASSWORD }}"

    - name: Terraform Apply
      if: github.ref == 'refs/heads/main'
      run: terraform apply -auto-approve tfplan




============================================================================================================

# Main.tf :-

provider "snowflake" {
       account  = var.snowflake_account
       user     = var.snowflake_user
       password = var.snowflake_password
     }

     resource "snowflake_database" "FDB_Devops_2024" {
       name                        = "FDB_Devops_2024"
       comment                     = "New DB creation"
       data_retention_time_in_days = 3
     }

# Schema.tf :-
resource "snowflake_schema" "SCH_Devops_2024" {
       database = snowflake_database.FDB_Devops_2024.name
       name     = "FDB_SCH_Devops_2024"
       comment  = "A schema."
       is_transient        = false
       is_managed          = false
       data_retention_days = 3
     }

# table.tf :-
resource "snowflake_table" "FDB_Table" {
       database                    = snowflake_database.FDB_Devops_2024.name
       schema                      = snowflake_schema.SCH_Devops_2024.name
       name                        = "FDB_Table"
       comment                     = "A table."
       data_retention_time_in_days = 3
       change_tracking             = false

       column {
         name     = "VEHICLE_NAME"
         type     = "VARCHAR"
         nullable = true
       }
       column {
         name     = "VEHICLE_IDENTITY"
         type     = "NUMBER(38,0)"
         nullable = true
       }
       column {
         name     = "VEHICLE_MODEL"
         type     = "VARCHAR"
         nullable = true
       }
       column {
         name     = "LAST_NAME"
         type     = "VARCHAR(255)"
         nullable = true
       }
     }

 # Columns.tf :-
 resource "snowflake_table" "FDB_Table" {
       database = snowflake_database.FDB_Devops_2024.name
       schema   = snowflake_schema.SCH_Devops_2024.name
       name     = "FDB_Table"

       column {
         name = "OWNER_FIRST_NAME"
         type = "VARCHAR(255)"
       }

       column {
         name = "OWNER_LAST_NAME"
         type = "VARCHAR(255)"
       }

       column {
         name = "OWNER_PINCODE"
         type = "NUMBER(38,0)"
       }
     }

# Updated YAML :-
name: Snowflake Terraform Demo Workflow

   on:
     push:
       branches:
         - main

   jobs:
     snowflake-terraform-demo:
       name: Snowflake Terraform Demo Job
       runs-on: self-hosted
       steps:
         - name: Checkout
           uses: actions/checkout@v2

         - name: Setup Terraform
           uses: hashicorp/setup-terraform@v2

         - name: Terraform Init
           id: init
           run: terraform init

         - name: Terraform Import
           run: |
             terraform import snowflake_database.FDB_Devops_2024 FDB_Devops_2024 || true
             terraform import snowflake_schema.SCH_Devops_2024 FDB_Devops_2024.FDB_SCH_Devops_2024 || true
             terraform import snowflake_table.FDB_Table FDB_Devops_2024.FDB_SCH_Devops_2024.FDB_Table || true

         - name: Terraform Validate
           id: validate
           run: terraform validate

         - name: Terraform Plan
           run: terraform plan -out=tfplan -parallelism=20 -var="snowflake_account=${{ secrets.SNOWFLAKE_ACCOUNT }}" -var="snowflake_user=${{ secrets.SNOWFLAKE_USER }}" -var="snowflake_password=${{ secrets.SNOWFLAKE_PASSWORD }}"

         - name: Terraform Apply
           if: github.ref == 'refs/heads/main'
           run: terraform apply -auto-approve tfplan


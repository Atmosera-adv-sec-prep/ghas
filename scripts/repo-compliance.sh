#!/bin/bash

# Security Policy Compliance Checker for a Single Repository
# Purpose: Verify if a specific repository adheres to the organization's security policy (e.g., LICENSE, SECURITY.md, CONTRIBUTING.md files present).

# Define organization and required files
read -p "Enter the organization name [Atmosera-adv-sec-prep]: " ORG
ORG=${ORG:-Atmosera-adv-sec-prep}
read -p "Enter the repository name [ghas]: " REPO
REPO=${REPO:-ghas}

REQUIRED_FILES=("README.md" "LICENSE" "SECURITY.md" "CONTRIBUTING.md" "CODE_OF_CONDUCT.md")

# Function to check and auto-generate missing files
check_and_generate_files() {
    repo=$(echo "$1" | tr -d '\r') # Remove carriage return from repo name
    for file in "${REQUIRED_FILES[@]}"; do
        file=$(echo "$file" | tr -d '\r') # Remove carriage return from file name
        # Check if file exists
        if ! gh api "repos/$ORG/$repo/contents/$file" --silent > /dev/null 2>&1; then
            echo "$file is missing in $repo. Auto-generating..."
            # Auto-generate file (example: echo "Content" > $file)
            # Note: Customize the generation of each file as needed
            echo "This is an auto-generated $file." > "$file"
            # Prepare the content for uploading
            content=$(base64 < "$file" | tr -d '\n')
            # Commit the file to the repository
            gh api --method PUT "repos/$ORG/$repo/contents/$file" \
                -f message="Auto-generate missing $file" \
                -f content="$content" \
                -f branch="main" # Adjust branch name as necessary
            echo "$file auto-generated and committed to $repo."
        else
            echo "$file exists in $repo."
        fi
    done
}

# Check the specified repository for required files
echo "Checking $REPO..."
check_and_generate_files $REPO
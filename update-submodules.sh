#!/usr/bin/env bash

# Update all git submodules script
# This script updates all submodules to their latest versions

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Main script
main() {
    print_info "Starting submodule update process..."

    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Not in a git repository!"
        exit 1
    fi

    # Save current directory
    REPO_ROOT=$(git rev-parse --show-toplevel)
    cd "$REPO_ROOT"

    print_info "Working in repository: $REPO_ROOT"

    # Initialize all submodules first (with error handling)
    print_info "Initializing submodules..."
    if ! git submodule init 2>/dev/null; then
        print_warning "Some submodules could not be initialized, continuing..."
    fi

    # Update all submodules (with error handling)
    print_info "Updating all submodules to latest versions..."
    if ! git submodule update --init --recursive 2>/dev/null; then
        print_warning "Some submodules could not be updated, continuing with available ones..."
    fi

    # Get list of properly initialized submodules
    SUBMODULES=$(git submodule status 2>/dev/null | grep -v "^-" | awk '{print $2}' || true)

    if [ -z "$SUBMODULES" ]; then
        print_warning "No active submodules found"
    else
        # Fetch latest changes for each submodule
        print_info "Fetching latest changes for each submodule..."
        for submodule in $SUBMODULES; do
            if [ -d "$submodule/.git" ]; then
                print_info "Processing $submodule..."
                if ! (cd "$submodule" && git fetch origin 2>/dev/null); then
                    print_warning "Could not fetch $submodule"
                fi
            fi
        done

        # Update each submodule to latest master/main branch
        print_info "Updating each submodule to latest commit..."
        for submodule in $SUBMODULES; do
            if [ -d "$submodule/.git" ]; then
                if ! (cd "$submodule" && {
                    BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed "s@^refs/remotes/origin/@@" || echo "master")
                    echo "Updating $submodule to latest $BRANCH..."
                    git checkout "$BRANCH" 2>/dev/null || git checkout master 2>/dev/null || git checkout main 2>/dev/null
                    git pull origin "$BRANCH" 2>/dev/null || git pull origin master 2>/dev/null || git pull origin main 2>/dev/null
                }); then
                    print_warning "Could not update $submodule"
                fi
            fi
        done
    fi

    # Show status of all submodules
    print_info "Current submodule status:"
    git submodule status

    # Check if there are any changes
    if git diff --quiet --exit-code; then
        print_success "All submodules are up to date!"
    else
        print_warning "Submodules have been updated. You may want to commit these changes:"
        echo ""
        git status --short
        echo ""
        print_info "To commit these changes, run:"
        echo "  git add ."
        echo "  git commit -m \"chore: update submodules to latest versions\""
    fi
}

# Run main function
main "$@"
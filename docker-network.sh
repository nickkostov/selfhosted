#!/bin/bash

# Function to check if a Docker network is in use
check_network_usage() {
  local network_name=$1

  if [ -z "$network_name" ]; then
    echo "Usage: $0 <network-name>"
    exit 1
  fi

  # Check if the network exists
  echo "Checking Network Existence" 
  if ! docker network inspect "$network_name" >/dev/null 2>&1; then
    echo "Network '$network_name' does not exist."
    exit 1
  else
    echo "Network "$network_name" exists"
  fi

  # Get the list of containers attached to the network
  attached_containers=$(docker network inspect "$network_name" -f '{{range .Containers}}{{.Name}}{{"\n"}}{{end}}')

  if [ -z "$attached_containers" ]; then
    echo "Network '$network_name' exists but is not in use (no containers attached)."
  else
    echo "Network '$network_name' is in use by the following containers:"
    echo "$attached_containers"
  fi
}

# Run the function with the first argument as the network name
check_network_usage "$1"

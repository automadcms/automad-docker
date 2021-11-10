#!/bin/bash

# Exit script with an exit code larger than 0 in case the latest release is more than one day ago.
exit $(curl -s https://api.github.com/repos/marcantondahmen/automad/releases/latest | jq -r "((now - (.published_at | fromdateiso8601)) / (60 * 60 * 24) | trunc)")

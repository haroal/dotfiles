function get_containers_ips
docker network inspect {$argv}_default | jq -r '[.[].Containers[]] | map("\(.Name)=\(.IPv4Address)") | .[]' | sed -E "s/^$argv-(.+)-1=(.*)\/[0-9]+\$/\1=\2/g"
end

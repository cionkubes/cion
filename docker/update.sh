services=$(docker service ls --format "{{.Name}}" | grep ${1:-cion})
images=$(docker images --format "{{.CreatedAt}} | {{.ID}} {{.Repository}}:{{.Tag}}" | sort -r)

for scv in $services; do
    image=$(docker service inspect $scv | jq '.[].Spec.Labels."com.docker.stack.image"' --raw-output)
    match=$(printf '%s\n' "${images[@]}" | grep $image | head -1 | cut -c33-45)
    [ "$match" ] && image_id=$(docker image inspect $match | jq '.[].Id' --raw-output)
    [ "$match" ] && echo docker service update $scv --image $image_id --force && docker service update $scv --image $image_id --force --detach=true
    [ "$match" ] && echo
done

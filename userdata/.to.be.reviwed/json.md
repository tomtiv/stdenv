    ands

JSON
Pretty print
$ echo '{"name": "Linux"}' |  fx .
copy
$ echo '{"name": "Linux"}' |  dasel -r json
copy
$ echo '{"name": "Linux"}' |  jq "."
copy
$ echo '{"name": "Linux"}' |  jshon
copy
$ echo '{"name": "Linux"}' |  jql '.'
copy
$ echo '{"name": "Linux"}' |  emuto
copy
Select
$ echo '{"name": "Linux"}' |  dasel -r json '.name'
copy
$ echo '{"name": "Linux"}' |  fx .name
copy
$ echo '{"name": "Linux"}' |  jq ".name"
copy
$ echo '{"name": "Linux"}' |  jshon -e name
copy
$ echo '{"name": "Linux"}' |  jql '.name'
copy
$ echo '{"name": "Linux"}' |  emuto "$.name"
copy
Put
$ echo '{"name": "Linux"}' |  dasel put string -r json '.year' '1991'
copy
$ echo '{"name": "Linux"}' |  jshon -s 1991 -i year
copy
$ echo '{"name": "Linux"}' |  emuto "{'name': $.name,'year':1991}"
copy
Delete
$ echo '{"name": "Linux", "year": 1991}' |  dasel delete -r json '.year'
copy
$ echo '{"name": "Linux", "year": 1991}' |  jshon -d year
copy
$ echo '{"name": "Linux", "year": 1991}' |  emuto "{'name': $.name}"
copy
Create
$ jo -p name=Linux year=1991
copy

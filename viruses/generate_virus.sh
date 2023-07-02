#!/usr/bin/sh
wget -O viruses.csv "https://docs.google.com/spreadsheets/d/1p9SII_sEwtJMgT0F86ZadNENNoGZGsdRjmjYOwEcFEI/gviz/tq?tqx=out:csv&sheet=Viruses"

JS_OUT=`sqlite3 < generate_virus.sql`
rm -rf dist/
mkdir -p dist/json/
mkdir -p dist/yaml/

IFS='
'
for item in $JS_OUT
do
    my_fbase=`echo $item | jq .kind -r`
    my_fname="dist/json/$my_fbase.json"
    IFS=' '
    echo $item | jq > $my_fname
    my_fname="dist/yaml/$my_fbase.yaml"
    echo $item | jq | yq -y > $my_fname
    IFS='
    '
done
rm viruses.csv
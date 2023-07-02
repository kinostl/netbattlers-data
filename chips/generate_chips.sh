#!/usr/bin/sh
wget -O chips.csv "https://docs.google.com/spreadsheets/d/1p9SII_sEwtJMgT0F86ZadNENNoGZGsdRjmjYOwEcFEI/gviz/tq?tqx=out:csv&sheet=ChipsU"

JS_OUT=`sqlite3 < generate_chips.sql`
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
rm chips.csv
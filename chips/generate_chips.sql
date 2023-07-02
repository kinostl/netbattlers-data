.mode csv
.import './chips.csv' chips
.mode list

SELECT json_object(
    'kind', "Chip",
    'dmg', cast("Dmg" as int),
    'range', "Range",
    'effect', "Effect",
    'category', Category,
    'tags', json(format('["%s"]',replace(replace(Tags, ' ',''),',','","'))),
    'first_publication', "From?"
) from chips;
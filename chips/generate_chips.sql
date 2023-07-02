.mode csv
.import './chips.csv' chips
.mode list

SELECT json_object(
    'kind', "Chip",
    'dmg', "Dmg",
    'range', "Range",
    'effect', "Effect",
    'category', Category,
    'tags', json(format('["%s"]',replace(replace(Tags, ' ',''),',','","'))),
    'first_publication', "From?"
) from chips;
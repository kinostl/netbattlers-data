.mode csv
.import './powers.csv' powers
.mode list

SELECT json_object(
    'kind', "Power/NCP",
    'skill', "Skill",
    'resolve', "Type",
    'effect', "Effect",
    'eb', cast("EB" as int),
    'sort', "Sort",
    'first_publication', "From?"
) from powers;
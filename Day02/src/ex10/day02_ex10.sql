SELECT  person.name AS person_name1, 
        p2.name AS person_name2, 
        person.address AS common_address 
FROM person
    JOIN person p2 ON p2.address = person.address
WHERE person.id > p2.id
ORDER BY person_name1, person_name2, common_address;
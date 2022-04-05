#!/bin/bash
#
# Starting API
python2 flask_api.py 8000 &
sleep 2
#
# POST method predict
curl -d '[
    {"Age": 85, "Sex": "male", "Embarked": "S"},
    {"Age": 24, "Sex": "female", "Embarked": "C"},
    {"Age": 3, "Sex": "male", "Embarked": "C"},
    {"Age": 21, "Sex": "male", "Embarked": "S"}
]' -H "Content-Type: application/json" \
     -X POST http://localhost:8000/predict && \
    echo -e "\n -> predict OK"

# GET method wipe
curl -X GET http://localhost:8000/wipe && \
    echo -e "\n -> wipe OK" 

# GET method train
curl -X GET http://localhost:8000/train && \
    echo -e "\n -> train OK"

# kill runing API
for i in $(ps -elf | grep "python2 flask_api.py 8000" | grep -v grep | cut -d " " -f 4); do
    kill -9 $i
done

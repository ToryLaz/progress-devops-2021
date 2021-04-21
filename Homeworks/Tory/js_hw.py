import json

js = """{
    "_id": "5f8f0e3cd00931579ab05201",
    "index": 1,
    "guid": "e560f9dd-c3f5-4d35-8554-10fdc701bcb6",
    "isActive": true,
    "balance": "$3,927.05",
    "picture": "http://placehold.it/32x32",
    "age": 20,
    "eyeColor": "blue",
    "name": "Jenny Bailey",
    "gender": "female",
    "company": "ECSTASIA",
    "email": "jennybailey@ecstasia.com",
    "phone": "+1 (836) 436-3687",
    "address": "787 Troy Avenue, Harleigh, Hawaii, 6761",
    "tags": [
        "labore",
        "amet",
        "eiusmod",
        "do",
        "ipsum",
        "ipsum",
        "ut"
    ],
    "friends": [
        {
            "id": 1,
            "name": "Deleon Dillard"
        },
        {
            "id": 2,
            "name": "Johnson Curtis"
        }
    ]
}"""

info_js = json.loads(js)
# print(info_js)
print(info_js["friends"][1]["name"])

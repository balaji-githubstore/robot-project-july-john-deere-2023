import requests


response=requests.get(url="https://petstore.swagger.io/v2/pet/5")

print(response.text)
print(response.status_code)
print(response.json())
print(response.headers)
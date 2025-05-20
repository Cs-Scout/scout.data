import requests
from bs4 import BeautifulSoup

#
url = f"https://open.faceit.com/data/v4/championships?game=cs2&limit=10&offset=10&type=ongoing"

# Send HTTP GET request
headers = {
    "User-Agent": "Mozilla/5.0",
    
    
}
response = requests.get(url, headers=headers)

offset = 0

while offset < 100000000:
    print(f"Offset: {offset}")
    url = f"https://open.faceit.com/data/v4/championships?game=cs2&limit=10&offset={offset}&type=ongoing"
    offset += 10
    response = requests.get(url, headers=headers)


    if response.status_code == 200:
        data = response.json()
        for championship in data.get("items", []):
            
            
            name = championship.get("name", "")
            print(f"Name: {name}")
            if "s53" in name.lower():
                print("Found ESEA Championship:")
                print(championship)
                exit()
    else:
        print(f"Error: {response.status_code}")
        break
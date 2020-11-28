# Orielly Downloader
A CLI to download O'Rielly books as epub, packaged via docker

Wrapper around [safaribooks](https://github.com/lorenzodifuccia/safaribooks) for simpler 
usage, documentation and distribution. (Due to python being extremely complicated)

# Requisite 
- Docker
- O'Reilly Subscription

# Username/password login
For users who has accounts with `username` and `password`.

First, find a book in O'Reilly Learning. Here I picked the famous `Art of Computer Programming` by Knuth, 
you can find it at [https://learning.oreilly.com/library/view/art-of-computer/9780321635754/](https://learning.oreilly.com/library/view/art-of-computer/9780321635754/).

Copy the ID of the book (in this case `9780321635754`). 

Run the docker command:
```sh
(docker run kirinnee/orly:latest login <book id> <email:password>) > "<name of your file>.epub" 
```
|argument | explanation | example |
|---|---|---|---|
| `book id` | the ID of the book | `9780321635754` |
|` email:password` | your login credentials, by concatenating the with the `:` delimiter | `kirin@gmail.com:kirin1234` |
| `name of your file` | The name of the file you want to save to, it can be anything | `Art of Computer Programming` |

The full command will look like:
```sh
(docker run kirinnee/orly:latest login 9780321635754 kirin@gmail.com:kirin1234) > "Art of Computer Programming.epub" 
```

> Note that it will take a long time to download. Output is only buffered every 4k bytes (so you might not see any console output for awhile)



# SSO Login
SSO Login is much more complex. In SSO Login, we will need to extract your request cookie and add it to a file.

### Extracting Request Cookie
This is done using `Firefox` Browser. Other browsers do not have `Copy All` feature in the network tab. (Need to manually copy each field and convert it to `json`)

1. Login as usual to [https://learning.oreilly.com/](https://learning.oreilly.com/)
2. Open the developer tools with `F12`
3. Go to `Network` tab in the developer tools
4. Access the profile page in the browser: [https://learning.oreilly.com/profile/](https://learning.oreilly.com/)
5. In the `Network` tab, click on the request to `/profile/`. (should be the first few)
6. Click on the `Cookies` tab in the request information
7. Right-click on any values under `Request Cookies` text and choose `Copy All`
8. Paste this into any file. For this demo, we will assume you paste it into `cookie.json`.

Here is an example of how a `cookie.json` looks like. You do not need every field, this is just to show the syntax:
```json
{
	"_dd_s": "rum=100&expire=123123123123",
	"_ga": "SB6.2.123123123.123123123",
	"_ga_092EL089CH": "AB2.2.1231231231.2.1.1231231231.12",
	"_ga_4WZYL59WMV": "AB2.2.1231231231.2.0.1231231321.12",
	"_gat_UA-112091926-1": "1",
	"_gat_UA-112091926-16": "1",
	"_gcl_au": "1.7.12312312.213",
	"_gid": "BA5.7.123123.123123123",
	"_mkto_trk": "id:123-FMS-070&token:_mch-oreilly.com-7675575757-123123123",
	"_uetsid": "89102927bf71273127ab6f772bc88de8",
	"_uetvid": "89102927bf7127abcdeab6f772bc8d665",
	"_vwo_uuid_v2": "A5ABEEEEADF7716273818982492424|89102927bf7127abcdeab6f772bc8d665",
	"BrowserCookie": "asdasd-asdasda-asd-asd-asdasd",
	"cd_user_id": "asdadasd-asdasd-asdad-asd-asdasdasd",
	"csrfsafari": "asdasdadasdasdadsasdadasdasd",
	"groot_sessionid": "asdadasdasdasda",
	"kampyle_userid": "1231-1231-1231-adsasd-1312-asdasd-123132-asdasd",
	"kampyleSessionPageCounter": "1123123",
	"kampyleUserSession": "1231231231241231",
	"kampyleUserSessionsCount": "1",
	"logged_in": "y",
	"mkt_test_20201029": "test",
	"orm-jwt": "some-jwt",
	"orm-rt": "89102927bf7127abcdeab6f772bc8d665",
	"salesforce_id": "89102927bf7127abcdeab6f772bc8d665",
	"sessionid": "asdfghjkllqweuiowpetow"
}
```
Now, assuming this file is `cookie.json`, we can proceed to pick a book in O'Reilly Learning. 

Here I picked the famous `Art of Computer Programming` by Knuth, 
you can find it at [https://learning.oreilly.com/library/view/art-of-computer/9780321635754/](https://learning.oreilly.com/library/view/art-of-computer/9780321635754/).

Copy the ID of the book (in this case `9780321635754`). 

We can now download the book with the command:

```sh
(cat <cookie json file> | docker run -i kirinnee/orly:latest sso <book id>) > "<name of your file>.epub"
```

|argument | explanation | example |
|---|---|---|---|
| `book id` | the ID of the book | `9780321635754` |
|` cookie json file` | the `json` file containing your request cookie details | `cookie.json` |
| `name of your file` | The name of the file you want to save to, it can be anything | `Art of Computer Programming` |


```sh
(cat cookie.json | docker run -i kirinnee/orly:latest sso 9780321635754) > "Art of Computer Programming.epub"
```

> Note that it will take a long time to download. Output is only buffered every 4k bytes (so you might not see any console output for awhile)
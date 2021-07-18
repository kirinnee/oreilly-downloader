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

| argument            | explanation                                                         | example                       |
| ------------------- | ------------------------------------------------------------------- | ----------------------------- |
| `book id`           | the ID of the book                                                  | `9780321635754`               |
| ` email:password`   | your login credentials, by concatenating the with the `:` delimiter | `kirin@gmail.com:kirin1234`   |
| `name of your file` | The name of the file you want to save to, it can be anything        | `Art of Computer Programming` |

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
	"BrowserCookie": "a3207952-2f4b-4a07-86d5-58df735a14d0",
	"csrfsafari": "rCJPYf19rQuPjvgkRovuYEwttDJy3T2rEADPdOVqdjk0SamNjfXFB2t1DkC5OnLg
9PljJrzh4v9Ju4yKMf5YpOsM7V3Sf0RWEq809izBkfEpbBQo4lqMYrRuJFAuGiQD",
	"groot_sessionid": "abcdefdghijkjlmnopqrstuvwxyz123456",
	"logged_in": "y",
	"orm-jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJlaWRzIjp7ImV4YWN0dGFyZ2V0IjoiaGVyb25fcHJvZF8xMjMxMjMxMjMxMjMxIiwiaGVyb24iOiJhYWFhYWFhYS1hYWFhLWFhYWEtYWFhYS1jY2NjY2NjY2FhMjIifSwiZW52IjoiZGV2ZWxvcG1lbnQiLCJleHAiOjE1MTU1NjYxMTEsImluZGl2aWR1YWwiOmZhbHNlLCJwZXJtcyI6eyJhY2FkbSI6InYiLCJhcGlkYyI6InYiLCJhc2lnbiI6InYiLCJjbmZyYyI6InYiLCJjc3N0ZCI6InYiLCJlcHVicyI6InYiLCJscnB0aCI6InYiLCJvcmlvbCI6InYiLCJwbHlscyI6InYiLCJ1c2FnZSI6InYiLCJ1c3JwZiI6InYiLCJ2aWRlbyI6InYifX0.E8VGI1i-pvrKMoJA36dC6tnIgw-bPJmfjexrU07BlNs",
	"orm-rt": "5f18b2d1267a3c81513cb10510bd7206",
	"salesforce_id": "e15031a5d19279e201c1eabf057b173a",
	"sessionid": "abcdefdghijkjlmnopqrstuvwxyz123456"
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

| argument            | explanation                                                  | example                       |
| ------------------- | ------------------------------------------------------------ | ----------------------------- |
| `book id`           | the ID of the book                                           | `9780321635754`               |
| ` cookie json file` | the `json` file containing your request cookie details       | `cookie.json`                 |
| `name of your file` | The name of the file you want to save to, it can be anything | `Art of Computer Programming` |

```sh
(cat cookie.json | docker run -i kirinnee/orly:latest sso 9780321635754) > "Art of Computer Programming.epub"
```

> Note that it will take a long time to download. Output is only buffered every 4k bytes (so you might not see any console output for awhile)

# Authors
[kirinnee](mailto:kirinnee97@gmail.com)

# Contributing
See [contributing](./CONTRIBUTING.MD) for information on developing, its easy!
